package com.imbling.repository;


import com.imbling.entity.ReviewEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import javax.transaction.Transactional;
import java.util.List;

public interface ReviewRepository extends JpaRepository<ReviewEntity, Integer> {

    List<ReviewEntity> findAll();

    ReviewEntity findByReviewNo(int reviewNo);

    @Transactional
    @Modifying
    @Query(value = "UPDATE imb_review r set r. reviewCount = r.reviewCount + 1 WHERE r.reviewNo = :reviewNo", nativeQuery = true)
    void increaseReviewCount(int reviewNo);
}
