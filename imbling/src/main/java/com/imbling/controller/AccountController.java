package com.imbling.controller;

import java.io.File;
import java.util.ArrayList;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
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

	@GetMapping(path = { "/member/register" })
	public String showRegisterForm() {

		return "member/register";
	}
	
	@PostMapping(path = { "/member/register" })
	public String registe(AccountDto account, MultipartHttpServletRequest req) {

		// 1. 요청 데이터 읽기 (전달인자로 대체)
		MultipartFile attach = req.getFile("attach");

		if (attach != null) { //내용이 있는 경우
			// 2. 데이터 처리
			ServletContext application = req.getServletContext();
			String path = application.getRealPath("/account-attachments");
			String fileName = attach.getOriginalFilename(); //파일 이름 가져오기
			if (fileName != null && fileName.length() > 0) {
				String uniqueFileName = Util.makeUniqueFileName(fileName);
				
				try {				
					attach.transferTo(new File(path, uniqueFileName));//파일 저장
					
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

}

