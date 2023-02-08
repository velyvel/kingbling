package com.imbling.repository;


import com.imbling.entity.ReviewEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface ReviewRepository extends JpaRepository<ReviewEntity, Integer> {

    @Query(value = "SELECT * FROM imb_review", nativeQuery = true)
    List<ReviewEntity> findAllByReviewNo();
    
	@Query(value = "SELECT * FROM imb_review WHERE (userId= :userId AND ROWNUM<6 ) ORDER BY reviewRegDate DESC", nativeQuery = true)
	List<ReviewEntity> findSomeById(@Param("userId") String userId);

	@Query(value = "SELECT * FROM imb_review WHERE userId= :userId ORDER BY reviewRegDate DESC", nativeQuery = true)
	List<ReviewEntity> findAllById(@Param("userId") String userId);
}
