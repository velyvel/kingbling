package com.imbling.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.imbling.dto.CategoryDto;
import com.imbling.dto.AdminProductDto;
import com.imbling.dto.PropertyDto;
import com.imbling.entity.CategoryEntity;
import com.imbling.entity.ProductEntity;
import com.imbling.entity.PropertyEntity;
import com.imbling.repository.CategoryRepository;
import com.imbling.repository.ProductRepository;
import com.imbling.repository.PropertyRepository;

@Service("adminProductService")
public class AdminProductServiceImpl implements AdminProductService {
	
	@Autowired
	private ProductRepository productRepository;
	
	@Autowired 
	private CategoryRepository categoryRepository;

	@Autowired
	private PropertyRepository propertyRepository;
	
	@Override
	public void saveCategoryInfo(CategoryDto category) {
		CategoryEntity categoryEntity = CategoryEntity.builder()
													  .categoryName(category.getCategoryName())
													  .build();
		
		categoryRepository.save(categoryEntity);
	}
	
	@Override
	public List<CategoryDto> findAllCategories() {
		List<CategoryEntity> categories = categoryRepository.findAllByOrderByCategoryNo();
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
	public CategoryDto findAdminProductListByCategory(int categoryNo) {
		
		CategoryEntity categoryEntity = categoryRepository.findByCategoryNo(categoryNo);
		CategoryDto category = categoryEntityToDto(categoryEntity);
		
		ArrayList<AdminProductDto> products = new ArrayList<>();
		for (ProductEntity productEntity : categoryEntity.getProducts()) {
			AdminProductDto productDto = new AdminProductDto();
			productDto.setAdminProductNo(productEntity.getProductNo());
			productDto.setAdminProductName(productEntity.getProductName());
			productDto.setAdminProductImage(productEntity.getProductImage());
			productDto.setAdminProductPrice(productEntity.getProductPrice());
			productDto.setAdminProductRegdate(productEntity.getProductRegdate());
			
			products.add(productDto);
		}
//		category.setProducts(products);
		
		return category;
	}
	
	// 카테고리별 상품리스트 조회 
	@Override
	public List<AdminProductDto> findAdminProductListByCategory2(int categoryNo) {
		
		CategoryEntity categoryEntity = categoryRepository.findByCategoryNo(categoryNo);
		
		ArrayList<AdminProductDto> products = new ArrayList<>();
		for (ProductEntity productEntity : categoryEntity.getProducts()) {
			AdminProductDto productDto = new AdminProductDto();
			productDto.setAdminProductNo(productEntity.getProductNo());
			productDto.setAdminProductName(productEntity.getProductName());
			productDto.setAdminProductImage(productEntity.getProductImage());
			productDto.setAdminProductPrice(productEntity.getProductPrice());
			productDto.setAdminProductRegdate(productEntity.getProductRegdate());
			
			products.add(productDto);
		}
		
		return products;
	}
	
	// 상품상세페이지 조회 
	public AdminProductDto showAdminProductDetail(int productNo) {
		
		ProductEntity productEntity = productRepository.findByProductNo(productNo);
		AdminProductDto product = AdminProductEntityToDto(productEntity);
		
		ArrayList<PropertyDto> properties = new ArrayList<>();
		for (PropertyEntity propertyEntity : productEntity.getProperties()) {
			PropertyDto propertyDto = new PropertyDto();
			propertyDto.setPropertyNo(propertyEntity.getPropertyNo());
			propertyDto.setProductColor(propertyEntity.getProductColor());
			propertyDto.setProductSize(propertyEntity.getProductSize());
			propertyDto.setProductEA(propertyEntity.getProductEA());
			
			properties.add(propertyDto);
		}
		product.setProperties(properties);
		
		return product;
	}

	@Override
	public void saveAdminProductInfo(AdminProductDto AdminProduct) {
		// TODO Auto-generated method stub
		
	}







}
