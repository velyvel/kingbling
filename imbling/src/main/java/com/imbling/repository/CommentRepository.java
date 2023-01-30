package com.imbling.repository;

import com.imbling.dto.BoardCommentDto;
import com.imbling.entity.BoardCommentEntity;
import com.imbling.entity.BoardEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface CommentRepository extends JpaRepository<BoardCommentEntity, Integer> {

    @Query(value = "SELECT * FROM imb_comment WHERE boardNo=:boardNo", nativeQuery = true)
    List<BoardCommentEntity> findBoardCommentDesc(int boardNo);
}
