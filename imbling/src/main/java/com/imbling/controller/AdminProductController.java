package com.imbling.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.imbling.common.Util;
import com.imbling.dto.AdminProductDto;
import com.imbling.dto.PropertyDto;
import com.imbling.service.AdminProductService;

@Controller @RequestMapping(path="/admin")
public class AdminProductController {

	@Autowired
	@Qualifier("adminProductService")
	private AdminProductService adminProductService;
	
	// 상품리스트
	@GetMapping(path= {"list"})
	public String showAdminProductList(AdminProductDto adminProductDto , Model model) {
			
			int productNo = adminProductDto.getAdminProductNo();
			
			List<AdminProductDto> products = adminProductService.findAdminProductListByCategory2(productNo);
			model.addAttribute("products", products);

			model.addAttribute("productNo", productNo);
		return "admin/product/list";
	}

	// 상품삭제
	@GetMapping(path = { "/{productNo}/delete" })
	public String deleteAdminProduct1å(@PathVariable("productNo")int productNo) {
		adminProductService.deleteAdminProduct(productNo);

		return "redirect:admin/product/list";
	}
	
	// 상품삭제
	@GetMapping(path = { "/delete-product" })
	@ResponseBody
	public String deleteAdminProduct(int productNo) {
		adminProductService.deleteAdminProduct(productNo);

		return "success";
	}
	
	//상품 등록 페이지 보여주기
	@GetMapping(path = {"/detail"})
	public String showAddProduct(@RequestParam(defaultValue = "1") int categoryNo, Model model){

		model.addAttribute("categoryNo", categoryNo);
		return "admin/product/addProduct";
	}

//	@PostMapping(path = {"/uploadNoticeImageFile"})
//	@ResponseBody
//	public HashMap<String, Object> uploadNoticeImage(MultipartHttpServletRequest req){
//
//		HashMap<String, Object> response = new HashMap<>();
//
//		MultipartFile attach = req.getFile("file");
//
//		if(attach != null){
//			ServletContext application = req.getServletContext();
//			String path = application.getRealPath("/board-attachments");
//			String fileName = attach.getOriginalFilename();
//			response.put("attachName", fileName);
//
//			if(fileName != null && fileName.length()>0){
//				String uniqueFileName = Util.makeUniqueFileName(fileName); //파일 저장하는 코드입니다
//				response.put("savedFileName", uniqueFileName);
//
//				try {
//					attach.transferTo(new File(path, uniqueFileName));
//					response.put("url", "/board-attachments/"+uniqueFileName);
//				}catch (Exception ex){
//					ex.printStackTrace();
//				}
//			}
//		}
//
//		return response;
//
//	}
//	//공지사항 작성(카테고리별로 나눔)//
//	@PostMapping(path = {"/detail"})
//	public String writeNotice(BoardDto board){
//
//		int boardCategory = board.getBoardCategory();
//		boardService.writeBoardNotice(board);
//		//System.out.println(board);
//
//		if(boardCategory == 1) {
//			board.setBoardCategory(board.getBoardCategory());
//			return "redirect:event";
//		}else if(boardCategory == 2) {
//			board.setBoardCategory(board.getBoardCategory());
//			return "redirect:notice";
//		} else {
//			return "admin/product/detail";
//		}
//
//	}
//
//	@GetMapping(path = {"/noticeDetail"})
//	public String showNoticeDetail(@RequestParam(defaultValue = "-1") int boardNo, @RequestParam(defaultValue = "-1") int pageNo, @RequestParam(defaultValue = "1") int boardCategory, Model model){
//
//		boardService.increaseBoardCount(boardNo);
//
//		BoardDto board = boardService.findBoardByBoardNo(boardNo, boardCategory);
//		model.addAttribute("board",board);
//		model.addAttribute("pageNo", pageNo);
//
//		return "board/noticeDetail";
//	}
//
//	// 공지사항 수정화면 보여주기
//	@GetMapping(path = {"/noticeEdit"})
//	public String showNoticeEdit(@RequestParam(defaultValue = "-1") int boardNo, @RequestParam(defaultValue = "-1") int pageNo, @RequestParam(defaultValue = "1") int boardCategory, Model model){
//		BoardDto board = boardService.findBoardByBoardNo(boardNo, boardCategory);
//		model.addAttribute("board", board);
//		model.addAttribute("boardNo", boardNo);
//		model.addAttribute("pageNo", pageNo);
//		model.addAttribute("boardCategory", boardCategory);
//
//		return "board/noticeEdit";
//	}
//	// 공지사항 서머노트로 편집(첨부파일도 같이 편집)
//	@PostMapping(path = {"/editNoticeImageFile"})
//	@ResponseBody
//	public HashMap<String, Object> editNoticeImage(MultipartHttpServletRequest req){
//
//		HashMap<String, Object> response = new HashMap<>();
//
//		MultipartFile attach = req.getFile("file");
//
//		if(attach != null){
//			ServletContext application = req.getServletContext();
//			String path = application.getRealPath("/board-attachments");
//			String fileName = attach.getOriginalFilename();
//			response.put("attachName", fileName);
//
//			if(fileName != null && fileName.length()>0){
//				String uniqueFileName = Util.makeUniqueFileName(fileName); //파일 저장하는 코드입니다
//				response.put("savedFileName", uniqueFileName);
//
//				try {
//					attach.transferTo(new File(path, uniqueFileName));
//					response.put("url", "/board-attachments/"+uniqueFileName);
//				}catch (Exception ex){
//					ex.printStackTrace();
//				}
//			}
//		}
//
//		return response;
//
//	}
//
//
//	//공지사항 수정(기능)
//	@PostMapping(path = {"/noticeEdit"})
//	public String noticeEdit(@RequestParam(defaultValue = "-1") int pageNo,@RequestParam(defaultValue = "1") int boardCategory, BoardDto board){
//
//		boardService.modifiedNoticeBoard(board);
//		//System.out.println(board);
//
//		return "redirect:noticeDetail?boardNo=" + board.getBoardNo() + "&pageNo=" + pageNo + "&boardCategory=" + board.getBoardCategory() ;
//	}
//
//	//게시글삭제
//	@GetMapping(path = {"/{boardNo}/delete"})
//	public String deleteBoard(@PathVariable("boardNo") int boardNo, @RequestParam(defaultValue = "-1")int pageNo, BoardDto board){
//		int boardCategory = board.getBoardCategory();
//		boardService.deleteBoard(boardNo);
//
//		if(boardCategory == 1) {
//			board.setBoardCategory(board.getBoardCategory());
//			return "redirect:/board/event?pageNo=" + pageNo;
//		}else if(boardCategory == 2) {
//			board.setBoardCategory(board.getBoardCategory());
//		}
//		return "redirect:/board/notice?pageNo=" + pageNo;
//	}
	
	@RequestMapping(path = { "/productRegister" })
	public String addNewProduct(AdminProductDto product, int categoryNo, String[] colors, String[] sizes,
			MultipartHttpServletRequest req,RedirectAttributes rttr) {
		System.out.println(colors);
		System.out.println(sizes);
		List<PropertyDto> property = new ArrayList<>();
		for(int i=0;i<colors.length;i++) {
			PropertyDto p = new PropertyDto();
			p.setProductColor(colors[i]);
			p.setProductSize(sizes[i]);
			property.add(p);
		}
		
		MultipartFile productImage = req.getFile("productAttach");

		if (productImage != null) {
			ServletContext application = req.getServletContext();
			String path = application.getRealPath("/product-attachments");
			String fileName = productImage.getOriginalFilename();
			if (fileName != null && fileName.length() > 0) {
				String uniqueFileName = Util.makeUniqueFileName(fileName);
				try {
					productImage.transferTo(new File(path, uniqueFileName));
					product.setAdminProductImage("/product-attachments/"+uniqueFileName);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		adminProductService.addNewProduct(product,property,categoryNo);
		return "redirect:/admin/detail?categoryNo="+categoryNo;
	}


}
