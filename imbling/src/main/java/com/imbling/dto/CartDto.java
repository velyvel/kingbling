package com.imbling.dto;

import java.util.List;

import lombok.Data;

@Data
public class CartDto {
	
	private int cartNo;
	private String userId;
	private int cartEA;
	
	private List<CartDetailDto> carts;
	
}
