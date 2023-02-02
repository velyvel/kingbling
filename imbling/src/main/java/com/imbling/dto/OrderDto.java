package com.imbling.dto;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class OrderDto {
	
	private int orderNo;
	private String orderState = "주문완료";
	private Date orderDate = new Date();
	private String orderDeliveryRequire;
	private String orderPay;
	private String userId;
	private String orderAddr;
	
	private List<OrderDetailDto> orders;

}
