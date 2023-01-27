package com.imbling.service;

import com.imbling.dto.BoardAttachDto;
import com.imbling.dto.BoardDto;
import com.imbling.entity.BoardAttachEntity;
import com.imbling.entity.BoardEntity;
import jdk.jfr.Category;

import java.util.List;

public interface BoardService {

    public default BoardDto boardEntityToDto(BoardEntity boardEntity){
        BoardDto boardDto = new BoardDto();
        boardDto.setBoardNo(boardEntity.getBoardNo());
        boardDto.setBoardCategory(boardEntity.getBoardCategory());
        boardDto.setBoardTitle(boardEntity.getBoardTitle());
        boardDto.setBoardContent(boardEntity.getBoardContent());
        boardDto.setBoardRegDate(boardEntity.getBoardRegDate());
        boardDto.setBoardCount(boardEntity.getBoardCount());
        boardDto.setUserId(boardEntity.getUserId());
        boardDto.setBoardDeleted(boardEntity.isBoardDeleted());

        return boardDto;
    }

    public default BoardEntity boardDtoToEntity(BoardDto boardDto){
        BoardEntity boardEntity = BoardEntity.builder()
                            .boardNo(boardDto.getBoardNo())
                            .boardCategory(boardDto.getBoardCategory())
                            .boardTitle(boardDto.getBoardTitle())
                            .boardContent(boardDto.getBoardContent())
                            .boardRegDate(boardDto.getBoardRegDate())
                            .boardCount(boardDto.getBoardCount())
                            .userId(boardDto.getUserId())
                            .boardDeleted(boardDto.isBoardDeleted())
                            .build();
        return boardEntity;
    }

    public default BoardAttachDto boardAttachEntityToDto(BoardAttachEntity boardAttachEntity){
        BoardAttachDto boardAttachDto = new BoardAttachDto();
        boardAttachDto.setAttachName(boardAttachEntity.getAttachName());
        boardAttachDto.setSavedAttachName(boardAttachEntity.getSavedAttachName());
        //boardAttachDto.setBoardNo(boardEntityToDto());
        boardAttachDto.setAttachNo(boardAttachEntity.getAttachNo());

        return boardAttachDto;
    }



    public default BoardAttachEntity boardAttachDtoToEntity(BoardAttachDto boardAttachDto){
        BoardAttachEntity boardAttachEntity = BoardAttachEntity.builder()
                            .attachNo(boardAttachDto.getAttachNo())
                            .attachName(boardAttachDto.getAttachName())
                            .savedAttachName(boardAttachDto.getSavedAttachName())
                            .build();
        return boardAttachEntity;
    }


    List<BoardDto> findEventBoard();

    List<BoardDto> findNoticeBoard();

    void writeBoardNotice(BoardDto board);

    //Detail 수정
    //BoardDto findBoardByBoardNoAndBoardCategory(int boardNo, int boardCategory);
    BoardDto findBoardByBoardNo(int boardNo, int boardCategory);

    BoardDto findBoardByBoardNo(int boardNo);

    void modifiedNoticeBoard(BoardDto board);

    void deleteBoard(int boardNo);

    void increaseBoardCount(int boardNo);

    void writeBoardModal(BoardDto board);

    List<BoardDto> findModalBoard();
}
