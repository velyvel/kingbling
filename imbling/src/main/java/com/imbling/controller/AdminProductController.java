package com.imbling.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.imbling.dto.CategoryDto;
import com.imbling.dto.AdminProductDto;
import com.imbling.service.AdminProductService;

@Controller @RequestMapping(path="/admin")
public class AdminProductController {

	@Autowired
	@Qualifier("adminProductService")
	private AdminProductService adminProductService;
	
	// 상품리스트
	@GetMapping(path= {"list"})
	public String showAdminProductList(AdminProductDto adminProductDto, Model model) {
			
			List<CategoryDto> categories = adminProductService.findAllCategories();
			model.addAttribute("categories", categories);
	
			int productNo = adminProductDto.getAdminProductNo();
			
			List<AdminProductDto> products = adminProductService.findAdminProductListByCategory2(1643);
			System.out.println(products);
			model.addAttribute("products", products);
			model.addAttribute("productNo", productNo);
		return "admin/product/list";
	}
	

	// 카테고리별 상품리스트 조회 
//	@GetMapping(path= {"/product-list"})
//	// @ResponseBody
//	public String showProductListByCategory(CategoryDto categoryDto, Model model) {
//		
//		List<AdminProductDto> products = adminProductService.findAdminProductListByCategory2(categoryDto.getCategoryNo());
//		model.addAttribute("products", products);
//		model.addAttribute("categoryNo", categoryDto.getCategoryNo());
//		
//		return "admin/product/product-list";
//	}
//	
//	// 상품상세페이지 
//	@GetMapping(path = { "/detail" })
//	public String showDetail(int categoryNo, int productNo, Model model) {
//		
//		AdminProductDto product = adminProductService.showAdminProductDetail(productNo);
//		model.addAttribute("product", product);
//		model.addAttribute("categoryNo", categoryNo);
//
//		return "admin/product/detail";
//	}

}
