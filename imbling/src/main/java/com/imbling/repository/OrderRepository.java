package com.imbling.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.imbling.entity.OrderEntity;

public interface OrderRepository extends JpaRepository<OrderEntity, Integer	>{

	@Query(value="select hibernate_sequence.currval from dual", nativeQuery = true)
	int findRecentOrderNo();

	List<OrderEntity> findAllByUserId(String userId);

}
