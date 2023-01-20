package com.imbling.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping (path = { "/product" })
public class ProductController {

	@GetMapping(path = { "/list" })
	public String productList() {
		
		return "product/list";
	}

	@GetMapping(path = { "/detail" })
	public String showDetail() {

		return "product/detail";
	}
	

}

