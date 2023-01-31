package com.imbling.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.imbling.common.Util;
import com.imbling.dto.AccountDocImgDto;
import com.imbling.dto.AccountDto;
import com.imbling.service.AccountService;

@Controller
public class AccountController {

	@Autowired
	@Qualifier("accountService")
	private AccountService accountService;

	@GetMapping(path = { "/member/login" })
	public String showLoginForm() {

		return "member/login";
	}

	@PostMapping(path = { "/member/login" })
	public String Login(String userId, String userPassword, HttpSession session) {

		System.out.print("Login" + userId + "Loginpw" + userPassword);

		if (userId == "" || userPassword == "") {
//			session.setAttribute("loginuser", account);
			System.out.print("Login");

			return "redirect:login";

		} else {
			AccountDto loginUser = accountService.findByUserIdAndUserPassword(userId, userPassword);

			session.setAttribute("loginuser", loginUser);

		}

		// System.out.print(loginUser);
		return "redirect:/home"; // return "redirect:/home.action";
	}

	@GetMapping(path = { "/member/register" })
	public String showRegisterForm() {

		return "member/register";
	}

	@PostMapping(path = { "/member/register" })
	public String registe(AccountDto account, MultipartHttpServletRequest req) {

		// 1. 요청 데이터 읽기 (전달인자로 대체)
		MultipartFile attach = req.getFile("attach");

		if (attach != null) { // 내용이 있는 경우
			// 2. 데이터 처리
			ServletContext application = req.getServletContext();
			String path = application.getRealPath("/account-attachments");
			String fileName = attach.getOriginalFilename(); // 파일 이름 가져오기
			if (fileName != null && fileName.length() > 0) {
				String uniqueFileName = Util.makeUniqueFileName(fileName);

				try {
					attach.transferTo(new File(path, uniqueFileName));// 파일 저장

					// 첨부파일 정보를 객체에 저장
					ArrayList<AccountDocImgDto> attachments = new ArrayList<>(); // 첨부파일 정보를 저장하는 DTO 객체

					AccountDocImgDto attachment = new AccountDocImgDto();
					attachment.setDocName(fileName);

					attachments.add(attachment);

					account.setAttachments(attachments);

				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}

		accountService.registerMember(account);
		// 3. View에서 읽을 수 있도록 데이터 저장
		// 4. View 또는 Controller로 이동

		return "redirect:login";
	}

	@ResponseBody
	@GetMapping(path = { "/member/checkId" })
	public String checkId(String userId) {

		// AccountDto checkedMember=;
		// System.out.print("checkedMember"+checkedMember);
		if (accountService.findByUserId(userId) == null) {
			return "success";

		} else {
			return "noId";

		}
	}

	@GetMapping(path = { "/member/logout" })
	public String logout(HttpSession session) {
		session.setAttribute("loginuser", null);

		return "/home";
	}

	@PostMapping(path = { "/member/identifyCorpNo" })
	@ResponseBody
	public String identifyCorpNo(@RequestParam("attach") MultipartFile attach) {

		System.out.println("identifyCorpNo==============");

		try {
			String boundary = UUID.randomUUID().toString();
			HashMap<String, String> properties = new HashMap<>();
			properties.put("User-Agent",
					"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 Edg/109.0.1518.52");

			// 1. 연결 설정
			HttpURLConnection conn = makeFileUploadConnection("http://127.0.0.1:5000/ocr", boundary, properties);

			// 2. 전송 준비
			OutputStream os = conn.getOutputStream();
			PrintWriter writer = new PrintWriter(os, true, Charset.forName("utf-8"));

			// 3-1. 전송
			writeFileData(attach, boundary, os, writer);

			// 4. 전송 종료
			writer.append("--").append(boundary).append("--").append("\r\n"); // --boundary-- : 전송 끝
			writer.close();
			System.out.println("getResponseCode==============");

			// 5. 응답 수신
			if (conn.getResponseCode() == HttpURLConnection.HTTP_OK) {
				// do nothing
				InputStream is = conn.getInputStream();
				InputStreamReader isr = new InputStreamReader(is, "utf-8");
				BufferedReader br = new BufferedReader(isr);
				String message = "";
				while (true) {
					String line = br.readLine();
					if (line == null) {
						break;
					}
					message += line;
				}

				return message;
			} else {
				return "fail 1";
			}

		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return null;

	}
	
	@GetMapping(path = { "/member/searchByCorpNo" })
	@ResponseBody
	public String searchByCorpNo( String docNo) {

		System.out.println("searchByCorpNo==============");

		try {
			String path = "http://127.0.0.1:5000/searchByCorpNo" + ( docNo != null ? "?docNo=" + URLEncoder.encode(docNo, "utf-8") : "");
			URL url = new URL(path);
			HttpURLConnection conn = (HttpURLConnection)url.openConnection();
			
			int respCode = conn.getResponseCode();
			if (respCode == HttpURLConnection.HTTP_OK) {
				InputStream is = conn.getInputStream();
				InputStreamReader isr = new InputStreamReader(is, "utf-8");
				BufferedReader br = new BufferedReader(isr);
				String message = "";
				while (true) {
					String line = br.readLine();
					if (line == null) {
						break;
					}
					message += line;
				}
		
				return  message;
			} else {
				return "fail to receive data 1";
			}
		} catch (Exception ex) {
			return "fail to receive data 2";
		}

	}
	
	

	private void writeFileData(MultipartFile file, String boundary, OutputStream os, PrintWriter writer)
			throws IOException {
		writer.append("--").append(boundary).append("\r\n");
		writer.append("Content-Disposition: form-data; name=\"" + file.getName() + "\"; filename=\""
				+ file.getOriginalFilename() + "\"").append("\r\n");
		writer.append("Content-Type: " + URLConnection.guessContentTypeFromName(file.getOriginalFilename()))
				.append("\r\n");
		writer.append("Content-Transfer-Encoding: binary").append("\r\n");
		writer.append("\r\n");
		writer.flush();

		// 3-2. 전송2 (데이터)
		InputStream is = file.getInputStream();
		byte[] buffer = new byte[4096];
		while (true) {
			int count = is.read(buffer, 0, buffer.length);
			if (count == -1) { // End of File
				break;
			}
			os.write(buffer, 0, count); // 읽은 갯수만큼 쓰기
		}
		os.flush();
		is.close();
		writer.append("\r\n");
		writer.flush();
	}

	private HttpURLConnection makeFileUploadConnection(String path, String boundary,
			HashMap<String, String> properties) {

		HttpURLConnection conn = null;
		try {
			URL url = new URL(path);
			conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("POST");
			conn.setDoOutput(true); // POST
			conn.setDoInput(true);
			conn.setUseCaches(false);
			conn.setRequestProperty("Content-Type", "multipart/form-data; boundary=" + boundary);
			for (String key : properties.keySet()) {
				conn.setRequestProperty(key, properties.get(key));
			}
		} catch (Exception ex) {
			ex.printStackTrace();
			conn = null;
		}
		return conn;
	}
}
