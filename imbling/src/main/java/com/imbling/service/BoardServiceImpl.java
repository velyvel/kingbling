package com.imbling.service;

import com.imbling.dto.BoardCommentDto;
import com.imbling.dto.BoardDto;
import com.imbling.entity.BoardCommentEntity;
import com.imbling.entity.BoardEntity;
import com.imbling.repository.CommentRepository;
import com.imbling.repository.BoardRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service("boardService")
public class BoardServiceImpl implements BoardService{

    @Autowired
    private BoardRepository boardRepository;
    @Autowired
    private CommentRepository commentRepository;

    //이벤트 리스트 조회
    @Override
    public List<BoardDto> findEventBoard() {
        List<BoardEntity> boardList = boardRepository.findEventByBoardCategoryDesc();
        ArrayList<BoardDto> boards = new ArrayList<>();
        for (BoardEntity boardEntity: boardList){
            boards.add(boardEntityToDto(boardEntity));
        }
        return boards;
    }


    // 공지사항 리스트 조회
    @Override
    public List<BoardDto> findNoticeBoard() {
        List<BoardEntity> boardList = boardRepository.findNoticeByBoardCategoryDesc();

        ArrayList<BoardDto> boards = new ArrayList<>();
        System.out.println(boardList);
        for (BoardEntity boardEntity: boardList){
            boards.add(boardEntityToDto(boardEntity));
        }
        return boards;
    }


    //카테고리 번호 받아 글쓰기
    @Override
    public void writeBoardNotice(BoardDto board) {
        BoardEntity boardEntity = BoardEntity.builder()
                .boardTitle(board.getBoardTitle())
                .boardCategory(board.getBoardCategory())
                .boardContent(board.getBoardContent())
                .userId(board.getUserId())
                .build();

        // 여기에 첨부파일 작업 추가해야함
//        HashSet<BoardAttachEntity> boardAttachments = new HashSet<>();
//        for(BoardAttachDto boardAttachDto : board.getBoardAttachments()){
//            boardAttachments.add(boardAttachDtoToEntity(boardAttachDto));
//        }
//        boardEntity.setBoardAttachments(boardAttachments);
        boardRepository.save(boardEntity);
    }

    @Override
    public BoardDto findBoardByBoardNo(int boardNo, int boardCategory) {
        BoardEntity boardEntity = boardRepository.findByBoardNoAndBoardCategory(boardNo, boardCategory);
        BoardDto board = boardEntityToDto(boardEntity);
        return board;
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
        boardEntity.setBoardTitle(board.getBoardTitle());
        boardEntity.setBoardCategory(board.getBoardCategory());
        boardEntity.setBoardContent(board.getBoardContent());
        boardRepository.save(boardEntity);
    }

    @Override
    public void deleteBoard(int boardNo) {
        BoardEntity boardEntity = boardRepository.findByBoardNo(boardNo);
        boardRepository.delete(boardEntity);
    }

    @Override
    public void increaseBoardCount(int boardNo) {
        boardRepository.increaseBoardCount(boardNo);
    }
//1:1 문의 모달창
    @Override
    public void writeBoardModal(BoardDto board) {
        BoardEntity boardEntity = BoardEntity.builder()
                .boardTitle(board.getBoardTitle())
                .boardCategory(board.getBoardCategory())
                .boardContent(board.getBoardContent())
                .build();
        boardRepository.save(boardEntity);
    }

    @Override
    public List<BoardDto> findModalBoard() {
        List<BoardEntity> boardList = boardRepository.findModalByBoardCategoryDesc();
        ArrayList<BoardDto> boards = new ArrayList<>();
        for (BoardEntity boardEntity : boardList) {
            boards.add(boardEntityToDto(boardEntity));
        }
        return boards;
    }

    //============ 댓글 ============

    @Override
    public List<BoardCommentDto> findComments(int boardNo) {

        List<BoardCommentEntity> comments = commentRepository.findBoardCommentDesc(boardNo);
        ArrayList<BoardCommentDto> comments2 = new ArrayList<>();
        for (BoardCommentEntity comment : comments) {
            comments2.add(boardCommentEntityToDto(comment));
        }
        return comments2;
    }

    @Override
    public void writeComment(BoardCommentDto comment) {

        BoardEntity board = boardRepository.findByBoardNo(comment.getBoardNo());

        BoardCommentEntity commentEntity = BoardCommentEntity.builder()
                .commentNo(comment.getCommentNo())
                .commentContent(comment.getCommentContent())
                .commentGroup(comment.getCommentGroup())
                //.commentRegDate(comment.getCommentRegDate())
                .board(board)
                .build();

        commentRepository.save(commentEntity);
    }

//    @Override
//    public void updateGroupNo(int commentNo, int commentGroup) {
//        BoardCommentEntity commentEntity = commentRepository.findByBoardCommentNo(commentNo, commentGroup);
//
//    }


}
