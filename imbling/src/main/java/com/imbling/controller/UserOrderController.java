package com.imbling.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.imbling.service.MypageService;
import com.imbling.service.UserOrderService;

@Controller @RequestMapping(path= {"/userOrder"})
public class UserOrderController {
	
	@Autowired
	@Qualifier("userOrderService")
	private UserOrderService userOrderService;
	
	@GetMapping(path= {"/doOrder"})
	public String ShowOrderPage() {
		
		return "/userOrder/order";
	}
	
	@RequestMapping(path= {"/jusoPopup"})
	public String showJusoPopup() {
		
		return "/modules/jusoPopup";
	}
	
	@PostMapping(path= {"/addToCart"}) @ResponseBody
	public String addToCart(String productNo) {
		int productCode=Integer.parseInt(productNo);
		
		
		
		return "success";
	}
	
	
	
	

}
