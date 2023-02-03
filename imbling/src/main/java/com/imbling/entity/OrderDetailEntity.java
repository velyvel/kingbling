package com.imbling.entity;

import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MapsId;
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
@Table(name = "imb_orderDetail")
public class OrderDetailEntity {
	
	@EmbeddedId
	@Builder.Default
	private OrderDetailId orderDetailId = new OrderDetailId();
	
	@Column(nullable = false)
	private int orderDetailEA;
	
	@Column(nullable = false)
	private int orderDetailTotalPrice;
	
	@ManyToOne
	@MapsId("orderNo")
	@JoinColumn(name = "orderNo")
	private OrderEntity order;
	
	@ManyToOne
	@MapsId("propertyNo")
	@JoinColumn(name = "propertyNo")
	private PropertyEntity property;
	
	

}
