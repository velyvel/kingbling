package com.imbling.repository;

import com.imbling.entity.BoardEntity;
import com.imbling.entity.BoardFaqEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import javax.transaction.Transactional;
import java.util.List;


public interface BoardFaqRepository extends JpaRepository<BoardFaqEntity, Integer> {


//    @Query(value = "SELECT * FROM imb_board WHERE boardCategory=1 ORDER BY boardRegDate DESC", nativeQuery = true)
//    List<BoardEntity> findEventByBoardCategoryDesc();
//
//    @Query(value = "SELECT * FROM imb_board WHERE boardCategory=2 ORDER BY boardRegDate DESC", nativeQuery = true)
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

    @Query(value = "select * from imb_boardfaq order by faqRegdate desc", nativeQuery = true)
    List<BoardFaqEntity> findFaqByBoardFaqCategoryDesc();

    BoardFaqEntity findByFaqNoAndFaqCategory(int faqNo, int faqCategory);

    BoardFaqEntity findByFaqNo(int faqNo);


}
