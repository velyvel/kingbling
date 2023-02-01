package com.imbling.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.imbling.entity.ProductEntity;

public interface ProductRepository extends JpaRepository<ProductEntity, Long>{

	ProductEntity findByProductNo(int productNo);

	@Query(value="select * from imb_product where productNo=( select productNo from imb_property where propertyNo=:propertyNo ) ", nativeQuery = true)
	ProductEntity findByPropertyNo(@Param("propertyNo") int propertyNo);

}
