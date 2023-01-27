package com.imbling.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.imbling.entity.AccountDtoEntity;
import com.imbling.entity.BoardEntity;

public interface MypageRepository extends JpaRepository<BoardEntity, Long> {
	
	@Query(value = "SELECT * FROM imb_board WHERE (boardCategory=3 AND userId= :userId AND ROWNUM<6 ) ORDER BY boardRegDate DESC", nativeQuery = true)
	List<BoardEntity> findByIdAndCategory(@Param("userId") String userId);





	
}
