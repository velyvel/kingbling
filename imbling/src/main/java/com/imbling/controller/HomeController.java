package com.imbling.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

	@GetMapping(path = { "/", "/home" })
	public String home() {
		
		return "home";
	}
	
	@GetMapping(path= {"admin-home"})
	public String adminHome() {
		return "admin-home";
	}
	

}

