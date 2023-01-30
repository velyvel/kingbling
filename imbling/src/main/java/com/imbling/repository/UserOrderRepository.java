package com.imbling.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.imbling.entity.OrderEntity;
import com.imbling.entity.ProductEntity;

public interface UserOrderRepository extends JpaRepository<ProductEntity, OrderEntity>{

	ProductEntity findByProductNo(int productNo);

	@Query(value = "SELECT * FROM imb_property WHERE productNo= :productNo", nativeQuery = true)
	int findPropertyNo(@Param("productNo") int productNo);

}
