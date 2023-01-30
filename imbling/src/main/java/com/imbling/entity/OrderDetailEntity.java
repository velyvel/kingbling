package com.imbling.entity;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
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
	
	@Column(nullable = false)
	private int orderDetailEA;
	
	@Column(nullable = false)
	private int orderDetailTotalPrice;
	
	@Embedded @Id
	private OrderDetailId orderDetailId;
	
	@SuppressWarnings("serial")
	@Embeddable
	public class OrderDetailId implements Serializable {
		
		@ManyToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
		@JoinColumn(name = "orderNo")
	    private OrderEntity orderNo;

		@ManyToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
		@JoinColumn(name = "propertyNo")
		private PropertyEntity propertyNo;

	    public OrderDetailId(OrderEntity orderNo, PropertyEntity propertyNo) {
	        this.orderNo = orderNo;
	        this.propertyNo = propertyNo;
	    }

	}

}
