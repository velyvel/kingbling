package com.imbling.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.imbling.dto.CartDto;
import com.imbling.dto.ProductDto;
import com.imbling.entity.AccountDtoEntity;
import com.imbling.entity.CartEntity;
import com.imbling.entity.ProductEntity;
import com.imbling.entity.PropertyEntity;
import com.imbling.repository.AccountRepository;
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
	private AccountRepository accountRepository;
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
		System.out.println(cart);
		
		AccountDtoEntity userEntity = accountRepository.findByUserId(cart.getUserId());
		PropertyEntity propertyEntity = propertyRepository.findById(cart.getPropertyNo()).orElse(null);		
		
		CartEntity cartEntity = CartEntity.builder().cartEA(cart.getCartEA()).cartTotalPrice(cart.getCartTotalPrice())
								.user(userEntity).property(propertyEntity).build();
		
		userCartRepository.save(cartEntity);
		
	}

		
	
	
	
	
	
	
	
	

}
