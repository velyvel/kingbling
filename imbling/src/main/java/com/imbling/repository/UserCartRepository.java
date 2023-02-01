package com.imbling.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.imbling.entity.CartEntity;

public interface UserCartRepository extends JpaRepository<CartEntity, Integer> {

}
