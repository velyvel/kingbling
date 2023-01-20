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
	@GetMapping(path = { "/mypage/heart", })
	public String showHeart() {

		return "mypage/heart";
	}
	@GetMapping(path = { "/mypage/orderList", })
	public String showOrderList() {

		return "mypage/orderList";
	}
	@GetMapping(path = { "/mypage/myboard", })
	public String showByboard() {

		return "mypage/myboard";
	}

	

}

