package com.imbling.repository;

import com.imbling.dto.AdminProductDto;
import com.imbling.entity.ProductEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import javax.transaction.Transactional;
import java.util.List;


public interface AdminProductRepository extends JpaRepository<ProductEntity, Integer> {

//  @Transactional
//  @Modifying
//  @Query(value = "UPDATE imb_property d set d. boardCount = d.boardCount + 1 WHERE b.boardNo = :boardNo", nativeQuery = true)
//  void increaseBoardCount(int boardNo);
	
	
	
//    @Query(value = "SELECT * FROM imb_board WHERE boardCategory=1 ORDER BY boardRegDate1 DESC", nativeQuery = true)
//    List<BoardEntity> findEventByBoardCategoryDesc();
//
//    @Query(value = "SELECT * FROM imb_board WHERE boardCategory=2 ORDER BY boardRegDate1 DESC", nativeQuery = true)
//    List<BoardEntity> findNoticeByBoardCategoryDesc();
//
//    BoardEntity findByBoardNo(int boardNo);
//
//    BoardEntity findByBoardNoAndBoardCategory(int boardNo, int boardCategory);
//
//    @Transactional
//    @Modifying
//    @Query(value = "UPDATE imb_board b set b. boardCount = b.boardCount + 1 WHERE b.boardNo = :boardNo", nativeQuery = true)
//    void increaseBoardCount(int boardNo);
//
//    @Query(value = "SELECT * FROM imb_board WHERE boardCategory=3 ORDER BY boardRegDate DESC", nativeQuery = true)
//    List<BoardEntity> findModalByBoardCategoryDesc();

}
