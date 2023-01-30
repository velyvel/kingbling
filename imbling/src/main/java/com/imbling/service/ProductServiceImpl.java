package com.imbling.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.imbling.dto.CategoryDto;
import com.imbling.dto.ProductDto;
import com.imbling.dto.PropertyDto;
import com.imbling.entity.CategoryEntity;
import com.imbling.entity.ProductEntity;
import com.imbling.entity.PropertyEntity;
import com.imbling.repository.CategoryRepository;
import com.imbling.repository.ProductRepository;
import com.imbling.repository.PropertyRepository;

@Service("productService")
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	private ProductRepository productRepository;
	
	@Autowired 
	private CategoryRepository categoryRepository;

	@Autowired
	private PropertyRepository propertyRepository;
	
	// 네이버 쇼핑 API 데이터 저장
	@Override
	public void saveProductInfo(ProductDto product) {
		
		CategoryEntity category = categoryRepository.findByCategoryName(product.getCategory().getCategoryName());
		ProductEntity productEntity = ProductEntity.builder()
												   .productName(product.getProductName())
												   .productImage(product.getProductImage())
												   .productPrice(product.getProductPrice())
												   .category(category)
												   .build();
		
		ArrayList<PropertyEntity> properties = new ArrayList<>();
		for (PropertyDto property : product.getProperties()) {
			properties.add(PropertyEntity.builder()
										 .productColor(property.getProductColor())
										 .productSize(property.getProductSize())
										 .productEA(property.getProductEA())
										 .product(productEntity)
										 .build());
		}
		productEntity.setProperties(properties);
		
		productRepository.save(productEntity);
	}
	
	@Override
	public void saveCategoryInfo(CategoryDto category) {
		CategoryEntity categoryEntity = CategoryEntity.builder()
													  .categoryName(category.getCategoryName())
													  .build();
		
		categoryRepository.save(categoryEntity);
	}
	
	@Override
	public List<CategoryDto> findAllCategories() {
		List<CategoryEntity> categories = categoryRepository.findAll();
		ArrayList<CategoryDto> categoryDtos = new ArrayList<>();
		for (CategoryEntity category : categories) {
			CategoryDto categoryDto = new CategoryDto();
			categoryDto.setCategoryNo(category.getCategoryNo());
			categoryDto.setCategoryName(category.getCategoryName());
			categoryDtos.add(categoryDto);
		}
		
		return categoryDtos;
	}

	// 상품리스트 ////////////////////////////////////////////////////////////
	
	@Override
	public CategoryDto findProductList(int categoryNo) {
		
		CategoryEntity categoryEntity = categoryRepository.findByCategoryNo(categoryNo);
		CategoryDto category = categoryEntityToDto(categoryEntity);
		
		ArrayList<ProductDto> products = new ArrayList<>();
		for (ProductEntity productEntity : categoryEntity.getProducts()) {
			ProductDto productDto = new ProductDto();
			productDto.setProductNo(productEntity.getProductNo());
			productDto.setProductName(productEntity.getProductName());
			productDto.setProductImage(productEntity.getProductImage());
			productDto.setProductPrice(productEntity.getProductPrice());
			productDto.setProductRegdate(productEntity.getProductRegdate());
			
			products.add(productDto);
		}
		category.setProducts(products);
		
		return category;
	}

}
