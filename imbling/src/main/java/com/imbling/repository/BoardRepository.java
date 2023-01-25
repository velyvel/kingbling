package com.imbling.repository;

import com.imbling.entity.BoardEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;


public interface BoardRepository extends JpaRepository<BoardEntity, Integer> {

    @Query(value = "SELECT * FROM imb_board ORDER BY boardRegDate DESC", nativeQuery = true)
    List<BoardEntity> findAllByBoardDesc();


    BoardEntity findByBoardNo(int boardNo);

}
