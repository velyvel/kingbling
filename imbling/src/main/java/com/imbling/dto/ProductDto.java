package com.imbling.dto;

import java.util.Date;

import lombok.Data;

@Data
public class ProductDto {

	private int productNo;
	private String productName;
	private String productContent;
	private String productImage;
	private int productPrice;
	private int productEA;
	private Date productRegdate;
	private int productCount;
}
