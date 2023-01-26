package com.imbling.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.imbling.entity.AccountDtoEntity;
import com.imbling.entity.BoardEntity;

public interface MypageRepository extends JpaRepository<BoardEntity, Long> {
	
	List<BoardEntity> findAll();





	
}
