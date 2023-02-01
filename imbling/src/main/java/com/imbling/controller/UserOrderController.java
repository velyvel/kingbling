package com.imbling.controller;

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
import com.imbling.dto.CartDto;
import com.imbling.dto.ProductDto;
import com.imbling.dto.PropertyDto;
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
	public String addToCart(int productNo,int productPrice, PropertyDto property, HttpSession session) {
		AccountDto loginUser = (AccountDto) session.getAttribute("loginuser");
		
		CartDto cart = new CartDto();
		cart.setCartEA(property.getProductEA());
		cart.setCartTotalPrice(productPrice*property.getProductEA());
		cart.setPropertyNo(userOrderService.getPropertyNo(productNo));
		cart.setUserId(loginUser.getUserId());
		
		userOrderService.addProductToCart(cart);
		
		return "success";
	}
	
	@PostMapping(path= {"/deleteFromCart"}) @ResponseBody
	public String deleteFromCart(int propertyNo, HttpSession session) {
		AccountDto loginUser = (AccountDto) session.getAttribute("loginuser");
		
		userOrderService.deleteFromCart(loginUser.getUserId(), propertyNo);
		
		return "success";
	}
	
	
	

}
