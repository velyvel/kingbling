package com.imbling.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.imbling.entity.HeartEntity;

public interface HeartRepository extends JpaRepository<HeartEntity, Integer>{

	@Query(value = "select * from imb_heart where userId = :userId order by heartRegDate desc", nativeQuery = true)
	List<HeartEntity> findAllByUserId(@Param("userId") String userId);
	
}
