package com.imbling.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.imbling.entity.PropertyEntity;


public interface PropertyRepository extends JpaRepository<PropertyEntity, Integer> {

	@Query(value="select * from imb_property where ( productNo=:productNo and productSize=:productSize and productColor=:productColor ) ", nativeQuery = true)
	PropertyEntity findPropertyByOptions(@Param("productNo") int productNo,@Param("productSize") String productSize,@Param("productColor") String productColor);

	//List<PropertyEntity> findAllByProductNo(int productNo);
	
}
