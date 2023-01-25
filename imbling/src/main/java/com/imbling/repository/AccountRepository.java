package com.imbling.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.imbling.entity.AccountDtoEntity;

public interface AccountRepository extends JpaRepository<AccountDtoEntity, String> {

//	@Query(value = "SELECT user FROM imb_user user  WHERE user.userId = :userId and user.userPassword= :userPassword")
	AccountDtoEntity findByUserIdAndUserPassword(String userId, String userPassword);

}
