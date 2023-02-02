package com.imbling.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.imbling.entity.OrderDetailEntity;
import com.imbling.entity.OrderEntity;

public interface OrderRepository extends JpaRepository<OrderEntity, OrderDetailEntity>{

}
