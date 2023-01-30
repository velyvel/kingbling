package com.imbling.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.imbling.entity.CategoryEntity;
import com.imbling.entity.ProductEntity;

public interface CategoryRepository extends JpaRepository<CategoryEntity, Integer> {
	
	CategoryEntity findByCategoryName(String categoryName);

	CategoryEntity findByCategoryNo(int categoryNo);

}
