package com.imbling.dto;

import lombok.Data;

@Data
public class OrderDetailDto {

	private int orderNo;
	private int propertyNo;
	private int orderDetailEA;
	private int orderDetailTotalPrice;
	
	private String productName;
	
	private PropertyDto propertyDto;
	
}
