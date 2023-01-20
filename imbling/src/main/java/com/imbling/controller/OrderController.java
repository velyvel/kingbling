package com.imbling.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller @RequestMapping(path="/admin")
public class OrderController {
	
	@GetMapping(path= {"order-list"})
	public String showAdminOrderList() {
		
		return "admin/order/order-list";
	}


}
