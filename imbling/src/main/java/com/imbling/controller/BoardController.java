package com.imbling.controller;

import com.fasterxml.jackson.annotation.JsonCreator;
import com.imbling.dto.BoardDto;
import com.imbling.service.BoardService;
import oracle.jdbc.proxy.annotation.Post;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping(path = { "/board" })
public class BoardController {
	private final int PAGE_SIZE = 5;

	@Autowired
	@Qualifier("boardService")
	private BoardService boardService;

//이벤트(메인)페이지 보여주기
	@GetMapping(path = {"/event"})
	public String showBoardHome(@RequestParam(defaultValue = "1") int pageNo, BoardDto board, Model model){

		board.setBoardCategory(1);
		List<BoardDto> boards = boardService.findEventBoard();
		model.addAttribute("boards", boards);
		model.addAttribute("pageNo", pageNo);

		return "board/event";
	}



//============================ 공지사항 ============================
//공지사항 페이지 보여주기
	@GetMapping(path = { "/notice" })
	public String showBoardNotice(@RequestParam (defaultValue = "1") int pageNo, BoardDto board, Model model) {

		board.setBoardCategory(2);
		List<BoardDto> boards = boardService.findNoticeBoard();
		model.addAttribute("boards", boards);
		model.addAttribute("pageNo", pageNo);

		return "board/notice";
	}
//공지사항 작성 페이지 보여주기
	@GetMapping(path = {"/noticeWrite"})
	public String showWriteNotice(@RequestParam(defaultValue = "1") int boardCategory, Model model){

		model.addAttribute("boardCategory", boardCategory);
		return "board/noticeWrite";
	}
//공지사항 작성(카테고리별로 나눔)
	@PostMapping(path = {"/noticeWrite"})
	public String writeNotice(BoardDto board){

		int boardCategory = board.getBoardCategory();
		boardService.writeBoardNotice(board);
		System.out.println(board);

		if(boardCategory == 1) {
			board.setBoardCategory(board.getBoardCategory());
			return "redirect:notice";
		}else if(boardCategory == 2) {
			board.setBoardCategory(board.getBoardCategory());
			return "redirect:event";
		} else {
			return "board/noticeWrite";
		}

	}
// 공지사항 상세보기(카테고리 받아서 조회하기): 파라미터로 받으면 오류남
//	@GetMapping(path = {"/noticeDetail"})
//	public String showNoticeDetail(@RequestParam(defaultValue = "-1") int boardNo, @RequestParam(defaultValue = "-1") int pageNo, @RequestParam(defaultValue = "1") int boardCategory, Model model){
//		BoardDto board = boardService.findBoardByBoardNoAndBoardCategory(boardNo, boardCategory);
//		model.addAttribute("board",board);
//		model.addAttribute("pageNo", pageNo);
//		return "board/noticeDetail";
//	}
	@GetMapping(path = {"/noticeDetail"})
	public String showNoticeDetail(@RequestParam(defaultValue = "-1") int boardNo, @RequestParam(defaultValue = "-1") int pageNo, Model model){
		BoardDto board = boardService.findBoardByBoardNo(boardNo);
		model.addAttribute("board",board);
		model.addAttribute("pageNo", pageNo);
		return "board/noticeDetail";
	}

// 공지사항 수정화면 보여주기
	@GetMapping(path = {"/noticeEdit"})
	public String showNoticeEdit(@RequestParam(defaultValue = "-1") int boardNo, @RequestParam(defaultValue = "-1") int pageNo, @RequestParam(defaultValue = "1") int boardCategory, Model model){
		BoardDto board = boardService.findBoardByBoardNo(boardNo);
		model.addAttribute("board", board);
		model.addAttribute("boardNo", boardNo);
		model.addAttribute("pageNo", pageNo);
		model.addAttribute("boardCategory", boardCategory);

		return "board/noticeEdit";
	}

 //공지사항 수정(기능)
	@PostMapping(path = {"/noticeEdit"})
	public String noticeEdit(@RequestParam(defaultValue = "-1") int pageNo, BoardDto board){

		boardService.modifiedNoticeBoard(board);
		//System.out.println(board);

		return "redirect:noticeDetail?boardNo=" + board.getBoardNo() + "&pageNo=" + pageNo;
	}

//게시글삭제
	@GetMapping(path = {"/{boardNo}/delete"})
	public String deleteBoard(@PathVariable("boardNo") int boardNo, @RequestParam(defaultValue = "-1")int pageNo){
		boardService.deleteBoard(boardNo);

		return "redirect:/board/event?pageNo=" + pageNo;
	}





}

