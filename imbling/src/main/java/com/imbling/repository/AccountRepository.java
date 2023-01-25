package com.imbling.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.imbling.entity.AccountDtoEntity;

public interface AccountRepository extends JpaRepository<AccountDtoEntity, String> {

	
}
