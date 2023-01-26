package com.imbling.repository;

import com.imbling.dto.BoardDto;
import com.imbling.entity.BoardEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import javax.transaction.Transactional;
import java.util.List;


public interface BoardRepository extends JpaRepository<BoardEntity, Integer> {

    @Query(value = "SELECT * FROM imb_board WHERE boardCategory=1 ORDER BY boardRegDate DESC", nativeQuery = true)
    List<BoardEntity> findEventByBoardCategoryDesc();

    @Query(value = "SELECT * FROM imb_board WHERE boardCategory=2 ORDER BY boardRegDate DESC", nativeQuery = true)
    List<BoardEntity> findNoticeByBoardCategoryDesc();

    BoardEntity findByBoardNo(int boardNo);

//    @Modifying
//    @Query(value = "update imb_board b set b.boardcontent =#{boardContent}, b.boardregdate = sysdate where b. boardNo = #{boardNo}", nativeQuery = true)
//    BoardEntity updateBoardOnly(int BoardNo);

//질문? 파라미터로 받으면 안받아짐
//    @Query(value = "SELECT * FROM imb_board WHERE boardCategory= :boardCategory AND boardNo= :boardNo",nativeQuery = true)
//    BoardEntity findByBoardNoAndCategory(@Param("boardCategory")int boardCategory,@Param("boardNo")int boardNo);

    
}
