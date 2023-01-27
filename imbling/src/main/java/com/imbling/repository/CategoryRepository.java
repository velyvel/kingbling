package com.imbling.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.imbling.entity.CategoryEntity;

public interface CategoryRepository extends JpaRepository<CategoryEntity, Integer> {
	
	CategoryEntity findByCategoryName(String categoryName);

}
