package com.imbling.service;

import java.util.List;

import com.imbling.dto.CartDto;
import com.imbling.dto.OrderDetailDto;
import com.imbling.dto.OrderDto;
import com.imbling.dto.ProductDto;
import com.imbling.dto.PropertyDto;
import com.imbling.entity.AccountDtoEntity;
import com.imbling.entity.CartEntity;
import com.imbling.entity.OrderDetailEntity;
import com.imbling.entity.OrderEntity;
import com.imbling.entity.ProductEntity;
import com.imbling.entity.PropertyEntity;

public interface UserOrderService {
	
	public default ProductDto productEntityToDto(ProductEntity productEntity) {
		ProductDto productDto = new ProductDto();
		productDto.setProductNo(productEntity.getProductNo());
		productDto.setProductName(productEntity.getProductName());
		productDto.setProductContent(productEntity.getProductContent());
		productDto.setProductImage(productEntity.getProductImage());
		productDto.setProductPrice(productEntity.getProductPrice());
		productDto.setProductRegdate(productEntity.getProductRegdate());
		productDto.setProductCount(productEntity.getProductCount());
		
		return productDto;
	}
	
	public default ProductEntity productDtoToEntity(ProductDto productDto) {
		ProductEntity productEntity = ProductEntity.builder()
												   .productNo(productDto.getProductNo())
												   .productName(productDto.getProductName())
												   .productContent(productDto.getProductContent())
												   .productImage(productDto.getProductImage())
												   .productPrice(productDto.getProductPrice())
												   .productRegdate(productDto.getProductRegdate())
												   .productCount(productDto.getProductCount())
												   .build();
		
		return productEntity;
	}
	
	public default PropertyDto propertyEntityToDto(PropertyEntity propertyEntity) {
		PropertyDto propertyDto = new PropertyDto();
		propertyDto.setProductColor(propertyEntity.getProductColor());
		propertyDto.setProductEA(propertyEntity.getProductEA());
		propertyDto.setProductSize(propertyEntity.getProductSize());
		propertyDto.setPropertyNo(propertyEntity.getPropertyNo());
		
		return propertyDto;
	}
	
	public default PropertyEntity propertyDtoToEntity(PropertyDto propertyDto) {
		PropertyEntity propertyEntity = PropertyEntity.builder()
												   .propertyNo(propertyDto.getPropertyNo())
												   .productColor(propertyDto.getProductColor())
												   .productEA(propertyDto.getProductEA())
												   .productSize(propertyDto.getProductSize())
												   .build();
		
		return propertyEntity;
	}
	
	public default CartDto cartEntityToDto(CartEntity cartEntity) {
		CartDto cartDto = new CartDto();
		cartDto.setCartEA(cartEntity.getCartEA());
		cartDto.setCartTotalPrice(cartEntity.getCartTotalPrice());
		cartDto.setPropertyNo(cartEntity.getProperty().getPropertyNo());
		cartDto.setUserId(cartEntity.getUser().getUserId());
		cartDto.setCartChk(cartEntity.isCartChk());
		cartDto.setCartRegDate(cartEntity.getCartRegDate());
		
		return cartDto;
	}
	
	public default CartEntity cartDtoToEntity(CartDto cartDto) {
		
		
		AccountDtoEntity userEntity = AccountDtoEntity.builder().userId(cartDto.getUserId()).build();
		PropertyEntity propertyEntity = PropertyEntity.builder().propertyNo(cartDto.getPropertyNo()).build();
		
		CartEntity cartEntity = CartEntity.builder().cartEA(cartDto.getCartEA()).cartTotalPrice(cartDto.getCartTotalPrice())
								.cartRegDate(cartDto.getCartRegDate()).cartChk(cartDto.isCartChk()).user(userEntity).property(propertyEntity).build();
		return cartEntity;
	}
	
	public default OrderDto orderEntityToDto(OrderEntity orderEntity) {
		OrderDto orderDto = new OrderDto();
		orderDto.setOrderNo(orderEntity.getOrderNo());
		orderDto.setOrderState(orderEntity.getOrderState());
		orderDto.setOrderDate(orderEntity.getOrderDate());
		orderDto.setOrderDeliveryRequire(orderEntity.getOrderDeliveryRequire());
		orderDto.setOrderPay(orderEntity.getOrderPay());
		orderDto.setUserId(orderEntity.getUserId());
		orderDto.setOrderAddr(orderEntity.getOrderAddr());
		
		return orderDto;
	}
	
	public default OrderEntity orderDtoToEntity(OrderDto orderDto) {
		
		OrderEntity orderEntity = OrderEntity.builder().orderNo(orderDto.getOrderNo()).orderState(orderDto.getOrderState()).orderDate(orderDto.getOrderDate())
								.orderDeliveryRequire(orderDto.getOrderDeliveryRequire()).orderPay(orderDto.getOrderPay())
								.userId(orderDto.getUserId()).orderAddr(orderDto.getOrderAddr())
								.build();
		
		return orderEntity;
	}
	
	public default OrderDetailDto orderDetailEntityToDto(OrderDetailEntity orderDetailEntity) {
		OrderDetailDto orderDetailDto = new OrderDetailDto();
		orderDetailDto.setOrderDetailEA(orderDetailEntity.getOrderDetailEA());
		orderDetailDto.setOrderDetailTotalPrice(orderDetailEntity.getOrderDetailTotalPrice());
		orderDetailDto.setOrderNo(orderDetailEntity.getOrder().getOrderNo());
		orderDetailDto.setPropertyNo(orderDetailEntity.getProperty().getPropertyNo());
		
		return orderDetailDto;
	}
	
	public default OrderDetailEntity orderDetailDtoToEntity(OrderDetailDto orderDetailDto) {
		
		OrderDetailEntity orderDetailEntity = OrderDetailEntity.builder().orderDetailEA(orderDetailDto.getOrderDetailEA())
								.orderDetailTotalPrice(orderDetailDto.getOrderDetailTotalPrice())
								.build();
		
		return orderDetailEntity;
	}
	
	
	ProductDto getProductInfo(int productNo);

	int getPropertyNo(int productNo);

	void addProductToCart(CartDto cart);

	void deleteFromCart(String userId, int propertyNo);

	void updateCartInfo(CartDto cart);

	void insertCartOrderInfo(OrderDto order);

	void updateCartChk(CartDto cart);

	List<CartDto> getCheckedCartInfo(String userId);

	void deleteCheckedFromCart(String userId);

	void insertcheckedCartOrderInfo(OrderDto order);

	List<OrderDto> getUserOrderList(String userId);

	OrderDto getOrderInfo(int orderNo);

	void cancelOrder(int orderNo);

	void updateOrderInfo(OrderDto order);

	PropertyDto getPropertyInfoByProductNo(int productNo,String productSize,String productColor);


}
