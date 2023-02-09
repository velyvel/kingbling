package com.imbling.repository;


import com.imbling.entity.ReviewEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import javax.transaction.Transactional;
import java.util.List;

public interface ReviewRepository extends JpaRepository<ReviewEntity, Integer> {

    @Query(value = "select * from imb_review order By reviewregDate desc", nativeQuery = true)
    List<ReviewEntity> findAll();

    ReviewEntity findByReviewNo(int reviewNo);

    @Transactional
    @Modifying
    @Query(value = "UPDATE imb_review r set r. reviewCount = r.reviewCount + 1 WHERE r.reviewNo = :reviewNo", nativeQuery = true)
    void increaseReviewCount(@Param("reviewNo") int reviewNo);
    
	@Query(value = "SELECT * FROM imb_review WHERE (userId= :userId AND ROWNUM<6 ) ORDER BY reviewRegDate DESC", nativeQuery = true)
	List<ReviewEntity> findSomeById(@Param("userId") String userId);

	@Query(value = "SELECT * FROM imb_review WHERE userId= :userId ORDER BY reviewRegDate DESC", nativeQuery = true)
	List<ReviewEntity> findAllById(@Param("userId") String userId);

    @Query(value = "SELECT * FROM imb_review WHERE productNo= :productNo ORDER BY reviewRegDate DESC", nativeQuery = true)
    List<ReviewEntity> findReviewByProductNo(@Param("productNo") int productNo);

    @Query(value = "SELECT reviewNo FROM imb_review WHERE orderNo= :orderNo AND propertyNo= :propertyNo", nativeQuery = true)
	int findOneReview(@Param("orderNo") int orderNo,@Param("propertyNo") int propertyNo);

//	@Query(value = "SELECT * FROM imb_review WHERE productNo= :productNo ORDER BY reviewRegDate DESC", nativeQuery = true)
//    ReviewEntity findReviewByProductNo(int productNo);
}
