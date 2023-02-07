package com.imbling.repository;


import com.imbling.entity.ReviewEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface ReviewRepository extends JpaRepository<ReviewEntity, Integer> {

    @Query(value = "SELECT * FROM imb_review", nativeQuery = true)
    List<ReviewEntity> findAllByReviewNo();
}
