package com.imbling.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.imbling.dto.CategoryDto;
import com.imbling.service.ProductService;

@Controller
@RequestMapping (path = { "/product" })
public class ProductController {

	@Autowired
	@Qualifier("productService")
	private ProductService productService;
	
	// 상품리스트 조회 
	@GetMapping(path = { "/list" })
	public String productList(@RequestParam(defaultValue = "1641")int categoryNo, Model model) {
		
		CategoryDto category = productService.findProductList(categoryNo);
		model.addAttribute("category", category);
		
		return "product/list";
	}
	
	@GetMapping(path = { "/detail" })
	public String showDetail(int productNo, Model model) {
		model.addAttribute("productNo", productNo);

		return "product/detail";
	}
	

}

