package com.imbling.service;

import org.springframework.stereotype.Service;

import com.imbling.dto.ProductDto;
import com.imbling.entity.ProductEntity;
import com.imbling.repository.ProductRepository;

@Service("productService")
public class ProductServiceImpl implements ProductService {
	
	private ProductRepository productRepository;

	// 네이버 쇼핑 API 데이터 저장
	@Override
	public void saveProductInfo(ProductDto product) {
		ProductEntity productEntity = ProductEntity.builder()
				.productName(product.getProductName())
				.productImage(product.getProductImage())
				.productPrice(product.getProductPrice())
				.productEA(product.getProductEA())
				.build();
		productRepository.save(productEntity);
	}

}
