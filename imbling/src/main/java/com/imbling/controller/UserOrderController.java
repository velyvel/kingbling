package com.imbling.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.imbling.dto.AccountDto;
import com.imbling.dto.CartDetailDto;
import com.imbling.dto.CartDto;
import com.imbling.dto.ProductDto;
import com.imbling.dto.PropertyDto;
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
	
	@GetMapping(path= {"/detail"})//////////////나중에 상품쪽으로 옮기고 지우장
	public String showDetail(int productNo, Model model) {
		
		ProductDto product = userOrderService.getProductInfo(productNo);
		
		model.addAttribute("product", product);
		return "/userOrder/productDetail";
	}
	
	@PostMapping(path= {"/addToCart"}) @ResponseBody
	public String addToCart(int productNo,int productPrice,PropertyDto property, HttpSession session) {
		AccountDto loginUser = (AccountDto) session.getAttribute("loginuser");
		
		List<CartDetailDto> carts = new ArrayList<>();
		CartDetailDto cartDetail = new CartDetailDto();
		cartDetail.setCartDetailEA(property.getProductEA());
		cartDetail.setCartDetailTotalPrice(productPrice*property.getProductEA());
		cartDetail.setPropertyNo(userOrderService.getPropertyNo(productNo));
		carts.add(cartDetail);
		
		CartDto cart = new CartDto();
		cart.setUserId(loginUser.getUserId());
		cart.setCarts(carts);
		
		System.out.println(cart);
		
		return "success";
	}
	
	
	
	

}
