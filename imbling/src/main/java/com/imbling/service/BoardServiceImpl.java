package com.imbling.service;

import com.imbling.dto.BoardDto;
import com.imbling.entity.BoardEntity;
import com.imbling.repository.BoardRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service("boardService")
public class BoardServiceImpl implements BoardService{
    
    @Autowired
    private BoardRepository boardRepository;


    @Override
    public void writeBoardNotice(BoardDto board) {
        BoardEntity boardEntity = BoardEntity.builder()
                .boardTitle(board.getBoardTitle())
                .boardCategory(board.getBoardCategory())
                .boardContent(board.getBoardContent())
                .build();
        boardRepository.save(boardEntity);

    }

    @Override
    public List<BoardDto> findAllBoard() {
        List<BoardEntity> boardList = boardRepository.findAllByBoardDesc();
        ArrayList<BoardDto> boards = new ArrayList<>();
        for (BoardEntity boardEntity: boardList){
            boards.add(boardEntityToDto(boardEntity));
        }
        return boards;
    }

    @Override
    public BoardDto findBoardByBoardNo(int boardNo) {
        BoardEntity boardEntity = boardRepository.findByBoardNo(boardNo);
        BoardDto board = boardEntityToDto(boardEntity);
        return board;
    }

    @Override
    public void modifiedNoticeBoard(BoardDto board) {
        BoardEntity boardEntity = boardRepository.findByBoardNo(board.getBoardNo());
        //boardEntity.setBoardTitle(board.getBoardTitle());
        //boardEntity.setBoardCategory(board.getBoardCategory());
        boardEntity.setBoardContent(board.getBoardContent());
        boardRepository.save(boardEntity);
    }


}
