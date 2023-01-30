package com.imbling.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserOrderController {
	
	@GetMapping(path= {"/userOrder/doOrder"})
	public String ShowOrderPage() {
		
		return "/userOrder/order";
	}
	
	@RequestMapping(path= {"/userOrder/jusoPopup"})
	public String showJusoPopup() {
		
		return "/modules/jusoPopup";
	}
	
	

}
