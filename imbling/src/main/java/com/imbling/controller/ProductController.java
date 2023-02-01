package com.imbling.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.imbling.dto.CategoryDto;
import com.imbling.dto.ProductDto;
import com.imbling.service.ProductService;

@Controller
@RequestMapping (path = { "/product" })
public class ProductController {

	@Autowired
	@Qualifier("productService")
	private ProductService productService;
	
	// 상품리스트
	@GetMapping(path = { "/list" })
	public String productList(ProductDto productDto, @RequestParam(defaultValue = "-1") int categoryNo, Model model) {
		
		List<CategoryDto> categories = productService.findAllCategories();;
		model.addAttribute("categories", categories);
		model.addAttribute("categoryNo", categoryNo);
		
		return "product/list";
	}
	
	// 카테고리별 상품리스트 조회 
	@GetMapping(path= {"/product-list"})
	// @ResponseBody
	public String showProductListByCategory(CategoryDto categoryDto, Model model) {
		
		List<ProductDto> products = productService.findProductListByCategory2(categoryDto.getCategoryNo());
		model.addAttribute("products", products);
		model.addAttribute("categoryNo", categoryDto.getCategoryNo());
		
		return "product/product-list";
	}
	
	// 상품상세페이지 
	@GetMapping(path = { "/detail" })
	public String showDetail(int categoryNo, int productNo, Model model) {
		
		ProductDto product = productService.showProductDetail(productNo);
		model.addAttribute("product", product);
		model.addAttribute("categoryNo", categoryNo);

		return "product/detail";
	}
	

}

