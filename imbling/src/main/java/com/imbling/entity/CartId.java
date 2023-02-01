package com.imbling.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embeddable;

import lombok.Data;

@Embeddable
@Data
public class CartId implements Serializable {
	
	@Column(name="userId",nullable = false)
	private String userId;
	
	@Column(name="propertyNo",nullable = false)
	private int prpertyNo;

}
