//package com.imbling.entity;
//
//import java.io.Serializable;
//import java.util.Collection;
//import java.util.Date;
//
//import javax.persistence.CascadeType;
//import javax.persistence.Column;
//import javax.persistence.Embeddable;
//import javax.persistence.Embedded;
//import javax.persistence.Entity;
//import javax.persistence.FetchType;
//import javax.persistence.GeneratedValue;
//import javax.persistence.GenerationType;
//import javax.persistence.Id;
//import javax.persistence.JoinColumn;
//import javax.persistence.ManyToOne;
//import javax.persistence.OneToMany;
//import javax.persistence.Table;
//
//import lombok.AllArgsConstructor;
//import lombok.Builder;
//import lombok.Data;
//import lombok.NoArgsConstructor;
//
//@Data
//@NoArgsConstructor
//@AllArgsConstructor
//@Builder
//@Entity
//@Table(name = "imb_cartDetail")
//public class CartDetailEntity {
//	
////	@ManyToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
////	@JoinColumn(name = "productNo")
////	private ProductEntity productNo;
//	
//	@Column(nullable = false)
//	private int cartDetailEA;
//	
//	@Column(nullable = false)
//	private int cartDetailTotalPrice;
//	
//
//	@Embedded
//	private CartDetailId cartDetailId;
//	
//	
//	@Embeddable
//	public class CartDetailId implements Serializable {
//		
//		@ManyToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
//		@JoinColumn(name = "cartNo")
//	    private CartEntity cartNo;
//
//		@ManyToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
//		@JoinColumn(name = "productNo")
//		private ProductEntity productNo;
//
//	    public CartDetailId(CartEntity cartNo, ProductEntity productNo) {
//	        this.cartNo = cartNo;
//	        this.productNo = productNo;
//	    }
//
//	}
//	
//	
//
//}
