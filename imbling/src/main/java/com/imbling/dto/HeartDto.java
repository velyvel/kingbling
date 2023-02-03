package com.imbling.dto;

import java.util.Date;

import lombok.Data;

@Data
public class HeartDto {

	private String userId;
	private int productNo;
	private Date heartRegdate;

	private ProductDto products;
}
