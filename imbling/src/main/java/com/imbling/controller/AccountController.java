package com.imbling.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AccountController {

	@GetMapping(path = { "/member/login" })
	public String showLoginForm() {
		
		return "member/login";
	}
	

}

