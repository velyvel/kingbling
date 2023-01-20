package com.imbling.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MyPageController {

	@GetMapping(path = { "/mypage/myInfo", })
	public String showMyInfo() {
		
		return "mypage/myInfo";
	}
	@GetMapping(path = { "/mypage/cart", })
	public String showCart() {

		return "mypage/cart";
	}
	@GetMapping(path = { "/mypage/orderList", })
	public String showOrderList() {

		return "mypage/orderList";
	}

	

}

