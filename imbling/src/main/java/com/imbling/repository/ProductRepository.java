package com.imbling.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.imbling.entity.CategoryEntity;
import com.imbling.entity.ProductEntity;

public interface ProductRepository extends JpaRepository<ProductEntity, Long>{

	ProductEntity findByProductNo(int productNo);

	// 인기상품순
	List<ProductEntity> findByCategoryCategoryNoOrderByProductCount(int categoryNo);
	// 신상품순 
	List<ProductEntity> findByCategoryCategoryNoOrderByProductRegdateDesc(int categoryNo);
	// 낮은가격순 
	List<ProductEntity> findByCategoryCategoryNoOrderByProductPrice(int categoryNo);
	// 높은가격순
	List<ProductEntity> findByCategoryCategoryNoOrderByProductPriceDesc(int categoryNo);

}
