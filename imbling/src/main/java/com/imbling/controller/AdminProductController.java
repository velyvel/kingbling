package com.imbling.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

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

import com.imbling.dto.CategoryDto;
import com.imbling.common.Util;
import com.imbling.dto.AccountDto;
import com.imbling.dto.AdminProductDto;
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
	
	//공지사항 작성 페이지 보여주기
	@GetMapping(path = {"/detail"})
	public String showWriteNotice(@RequestParam(defaultValue = "1") int boardCategory, Model model){

//		model.addAttribute("boardCategory", boardCategory);
		return "admin/product/detail";
	}




}
