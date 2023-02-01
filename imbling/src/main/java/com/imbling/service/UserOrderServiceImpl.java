package com.imbling.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.imbling.dto.CartDto;
import com.imbling.dto.ProductDto;
import com.imbling.entity.CartId;
import com.imbling.entity.AccountDtoEntity;
import com.imbling.entity.CartEntity;
import com.imbling.entity.ProductEntity;
import com.imbling.entity.PropertyEntity;
import com.imbling.repository.PropertyRepository;
import com.imbling.repository.UserCartRepository;
import com.imbling.repository.UserProductRepository;

@Service("userOrderService")
public class UserOrderServiceImpl implements UserOrderService{
	
	@Autowired
	private UserCartRepository userCartRepository;
	
	@Autowired
	private UserProductRepository userProductRepository;
	
	@Autowired
	private PropertyRepository propertyRepository;

	@Override
	public ProductDto getProductInfo(int productNo) {
		
		ProductEntity product = userProductRepository.findByProductNo(productNo);
		return productEntityToDto(product);
	}

	@Override
	public int getPropertyNo(int productNo) {
		int propertyNo = userProductRepository.findPropertyNo(productNo);
		return propertyNo;
	}
	
	@Override
	public void addProductToCart(CartDto cart) {
		
		userCartRepository.save(cartDtoToEntity(cart));
		
	}

		
	
	
	
	
	
	
	
	

}
