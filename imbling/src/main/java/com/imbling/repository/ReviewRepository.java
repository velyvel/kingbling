package com.imbling.repository;


import com.imbling.entity.ReviewEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import javax.transaction.Transactional;
import java.util.List;

public interface ReviewRepository extends JpaRepository<ReviewEntity, Integer> {

    List<ReviewEntity> findAll();

    ReviewEntity findByReviewNo(int reviewNo);

    @Transactional
    @Modifying
    @Query(value = "UPDATE imb_review r set r. reviewCount = r.reviewCount + 1 WHERE r.reviewNo = :reviewNo", nativeQuery = true)
    void increaseReviewCount(int reviewNo);
    
	@Query(value = "SELECT * FROM imb_review WHERE (userId= :userId AND ROWNUM<6 ) ORDER BY reviewRegDate DESC", nativeQuery = true)
	List<ReviewEntity> findSomeById(@Param("userId") String userId);

	@Query(value = "SELECT * FROM imb_review WHERE userId= :userId ORDER BY reviewRegDate DESC", nativeQuery = true)
	List<ReviewEntity> findAllById(@Param("userId") String userId);

}
