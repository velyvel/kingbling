package com.imbling.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.imbling.dto.CartDto;
import com.imbling.dto.OrderDto;
import com.imbling.dto.ProductDto;
import com.imbling.entity.AccountDtoEntity;
import com.imbling.entity.CartEntity;
import com.imbling.entity.OrderDetailEntity;
import com.imbling.entity.OrderEntity;
import com.imbling.entity.ProductEntity;
import com.imbling.entity.PropertyEntity;
import com.imbling.repository.AccountRepository;
import com.imbling.repository.CartRepository;
import com.imbling.repository.OrderRepository;
import com.imbling.repository.PropertyRepository;
import com.imbling.repository.UserProductRepository;

@Service("userOrderService")
public class UserOrderServiceImpl implements UserOrderService{
	
	@Autowired
	private CartRepository cartRepository;
	
	@Autowired
	private UserProductRepository userProductRepository;
	
	@Autowired
	private AccountRepository accountRepository;
	
	@Autowired
	private PropertyRepository propertyRepository;
	
	@Autowired
	private OrderRepository orderRepository;
	
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
		
		AccountDtoEntity userEntity = accountRepository.findByUserId(cart.getUserId());
		PropertyEntity propertyEntity = propertyRepository.findById(cart.getPropertyNo()).orElse(null);
		
		CartEntity cartEntity = CartEntity.builder().cartEA(cart.getCartEA()).cartTotalPrice(cart.getCartTotalPrice())
								.user(userEntity).property(propertyEntity).build();
		
		cartRepository.save(cartEntity);
		
	}

	@Override
	public void deleteFromCart(String userId, int propertyNo) {
		cartRepository.deleteById(userId,propertyNo);
	}

	@Override
	public void updateCartInfo(CartDto cart) {
		
		CartEntity updatedCart=cartRepository.findByKeys(cart.getUserId(),cart.getPropertyNo());
		updatedCart.setCartEA(cart.getCartEA());
		updatedCart.setCartTotalPrice(cart.getCartTotalPrice());
		
		cartRepository.save(updatedCart);
		
	}

	@Override
	public void insertCartOrderInfo(OrderDto order) {
		
		OrderEntity orderEntity = orderDtoToEntity(order);
		
		List<CartEntity> cartEntity = cartRepository.findAllByUserId(order.getUserId());
		List<OrderDetailEntity> orderDetailEntity = new ArrayList<>();
		for(CartEntity cart : cartEntity ) {
			PropertyEntity propertyEntity = propertyRepository.findById(cart.getProperty().getPropertyNo()).orElse(null);
			OrderDetailEntity orderDetail = new OrderDetailEntity();
			orderDetail.setOrderDetailEA(cart.getCartEA());
			orderDetail.setOrderDetailTotalPrice(cart.getCartTotalPrice());
			orderDetail.setOrder(orderEntity);
			orderDetail.setProperty(propertyEntity);
			orderDetailEntity.add(orderDetail);
		}
		orderEntity.setOrderDetails(orderDetailEntity);
		
		for(OrderDetailEntity od : orderDetailEntity) {
			PropertyEntity property = propertyRepository.findById(od.getProperty().getPropertyNo()).orElse(null);
			property.setProductEA(property.getProductEA()-od.getOrderDetailEA());
			propertyRepository.save(property);
		}
		orderRepository.save(orderEntity);
		cartRepository.deleteAllById(order.getUserId());
	}

		
	
	
	
	
	
	
	
	

}
