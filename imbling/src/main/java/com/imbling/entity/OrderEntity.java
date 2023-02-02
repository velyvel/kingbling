package com.imbling.entity;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
@Table(name = "imb_order")
public class OrderEntity {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(nullable = false)
	private int orderNo;
	
	@Column(nullable = false) 
	@Builder.Default
	private String orderState ="주문완료";
	
	@Column(nullable = false) 
	@Builder.Default
	private Date orderDate = new Date();
	
	@Column(nullable = true)
	private String orderDeliveryRequire;
	
	@Column(nullable = false)
	private String orderPay;
	
	@Column(nullable = false)
	private String userId;
	
	@Column(nullable = false)
	private String orderAddr;
	
	@OneToMany(mappedBy = "order", fetch = FetchType.LAZY)	
	private List<OrderDetailEntity> orderDetails;

}
