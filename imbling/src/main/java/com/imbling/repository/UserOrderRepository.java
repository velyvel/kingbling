package com.imbling.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.imbling.entity.CartEntity;
import com.imbling.entity.OrderEntity;

public interface UserOrderRepository extends JpaRepository<OrderEntity, CartEntity>{

}
