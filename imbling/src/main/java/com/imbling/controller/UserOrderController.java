package com.imbling.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserOrderController {
	
	@GetMapping(path= {"/userOrder/sample"})
	public String ShowjusoPage() {
		
		return "/userOrder/Sample";
	}
	
	@RequestMapping(path= {"/userOrder/jusoPopup"})
	public String showJusoPopup() {
		
		return "/userOrder/jusoPopup";
	}
	
	

}
