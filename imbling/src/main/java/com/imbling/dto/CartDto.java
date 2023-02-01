package com.imbling.dto;

import java.util.Date;

import lombok.Data;

@Data
public class CartDto {
	
	private String userId;
	private int propertyNo;
	private int cartEA;
	private int cartTotalPrice;
	private Date cartRegDate; 
	
}
