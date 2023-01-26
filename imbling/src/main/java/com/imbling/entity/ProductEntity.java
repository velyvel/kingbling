package com.imbling.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
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
@Table(name = "imb_product")
public class ProductEntity {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(nullable = false)
	private int productNo; // 상품 식별자

	@Column(length = 50, nullable = false)
	private String productName; // 상품명 

	@Column(length = 5000)
	private String productContent; // 상품 설명

	@Column(length = 200, nullable = false)
	private String productImage; // 상품 이미지

	@Column(nullable = false)
	private int productPrice; // 상품 가격

	@Column(nullable = false)
	private int productEA; // 상품 수량

	@Builder.Default
	@Column(nullable = false)
	private Date productRegdate = new Date(); // 상품 등록일자

	@Builder.Default
	@Column(nullable = false)
	private int productCount = 0; // 상품 조회수 
}
