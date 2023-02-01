package com.imbling.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.imbling.entity.CategoryEntity;
import com.imbling.entity.ProductEntity;

public interface ProductRepository extends JpaRepository<ProductEntity, Long>{

	ProductEntity findByProductNo(int productNo);

	List<ProductEntity> findByCategoryCategoryNoOrderByProductPrice(int categoryNo);
	List<ProductEntity> findByCategoryCategoryNoOrderByProductPriceDesc(int categoryNo);

}
