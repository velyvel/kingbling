package com.imbling.service;

import com.imbling.dto.CartDto;
import com.imbling.dto.ProductDto;
import com.imbling.entity.AccountDtoEntity;
import com.imbling.entity.CartEntity;
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
	
	public default CartDto cartEntityToDto(CartEntity cartEntity) {
		CartDto cartDto = new CartDto();
		cartDto.setCartEA(cartEntity.getCartEA());
		cartDto.setCartTotalPrice(cartEntity.getCartTotalPrice());
		cartDto.setPropertyNo(cartEntity.getProperty().getPropertyNo());
		cartDto.setUserId(cartEntity.getUser().getUserId());
		
		return cartDto;
	}
	
	public default CartEntity cartDtoToEntity(CartDto cartDto) {
		
		AccountDtoEntity userEntity = AccountDtoEntity.builder().userId(cartDto.getUserId()).build();
		PropertyEntity propertyEntity = PropertyEntity.builder().propertyNo(cartDto.getPropertyNo()).build();
		
		CartEntity cartEntity = CartEntity.builder().cartEA(cartDto.getCartEA()).cartTotalPrice(cartDto.getCartTotalPrice())
								.user(userEntity).property(propertyEntity).build();
		return cartEntity;
	}
	
	ProductDto getProductInfo(int productNo);

	int getPropertyNo(int productNo);

	void addProductToCart(CartDto cart);


}
