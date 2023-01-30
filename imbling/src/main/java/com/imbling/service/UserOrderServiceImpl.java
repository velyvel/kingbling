package com.imbling.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.imbling.dto.ProductDto;
import com.imbling.entity.ProductEntity;
import com.imbling.repository.UserOrderRepository;

@Service("userOrderService")
public class UserOrderServiceImpl implements UserOrderService{
	
	@Autowired
	private UserOrderRepository userOrderRepository;

	@Override
	public ProductDto getProductInfo(int productNo) {
		
		ProductEntity product = userOrderRepository.findByProductNo(productNo);
		return productEntityToDto(product);
	}

	@Override
	public int getPropertyNo(int productNo) {
		int propertyNo = userOrderRepository.findPropertyNo(productNo);
		return propertyNo;
	}

		
	
	
	
	
	
	
	
	

}
