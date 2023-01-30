package com.imbling.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.imbling.entity.AccountDtoEntity;
import com.imbling.entity.BoardEntity;
import com.imbling.entity.ReviewEntity;

public interface MypageRepository extends JpaRepository<BoardEntity, ReviewEntity> {
	
	@Query(value = "SELECT * FROM imb_board WHERE (boardCategory=3 AND userId= :userId AND ROWNUM<6 ) ORDER BY boardRegDate DESC", nativeQuery = true)
	List<BoardEntity> findSomeByIdAndCategory(@Param("userId") String userId);

	@Query(value = "SELECT * FROM imb_board WHERE (boardCategory=3 AND userId= :userId) ORDER BY boardRegDate DESC", nativeQuery = true)
	List<BoardEntity> findAllByIdAndCategory(@Param("userId") String userId);

	@Query(value = "SELECT * FROM imb_review WHERE (userId= :userId AND ROWNUM<6 ) ORDER BY reviewRegDate DESC", nativeQuery = true)
	List<ReviewEntity> findSomeById(@Param("userId") String userId);

	@Query(value = "SELECT * FROM imb_review WHERE userId= :userId ORDER BY reviewRegDate DESC", nativeQuery = true)
	List<ReviewEntity> findAllById(@Param("userId") String userId);
	
}


