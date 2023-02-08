package com.imbling.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.imbling.dto.OrderDto;
import com.imbling.service.UserOrderService;

@Controller @RequestMapping(path="/admin")
public class OrderController {
	

    @Autowired
    @Qualifier("userOrderService")
    private UserOrderService userOrderService;
	
	
	@GetMapping(path= {"order-list"})
	public String showAdminOrderList(Model model) {
		List<OrderDto> orders=userOrderService.findAll();
		for(OrderDto order:orders ) {
			System.out.println(order);

		}
		
		model.addAttribute("orders", orders);

		return "admin/order/order-list";
	}


}
