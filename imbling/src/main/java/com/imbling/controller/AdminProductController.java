package com.imbling.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller @RequestMapping(path="/admin")
public class AdminProductController {
	
	@GetMapping(path= {"product-list"})
	public String showAdminProductList() {
		
		return "admin/product/product-list";
	}


}
