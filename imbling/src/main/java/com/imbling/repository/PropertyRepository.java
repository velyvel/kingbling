package com.imbling.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.imbling.entity.PropertyEntity;


public interface PropertyRepository extends JpaRepository<PropertyEntity, Integer> {

	//List<PropertyEntity> findAllByProductNo(int productNo);
	
}
