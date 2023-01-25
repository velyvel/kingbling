package com.imbling.controller;

import com.imbling.dto.BoardDto;
import com.imbling.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping(path = { "/board" })
public class BoardController {
	private final int PAGE_SIZE = 5;

	@Autowired
	@Qualifier("boardService")
	private BoardService boardService;

//페이지 보여주기
	@GetMapping(path = {"/home"})
	public String showBoardHome(){
		return "board/home";
	}

	@GetMapping(path = { "/notice" })
	public String showBoardNotice() {

		return "board/notice";
	}

	@GetMapping(path = {"/writeNotice"})
	public String showWriteNotice(@RequestParam(defaultValue = "1") int pageNo, Model model){
		List<BoardDto> boards = boardService.findAllBoard();
		model.addAttribute("boards", boards);
		model.addAttribute("pageNo", pageNo);
		return "board/writeNotice";
	}

//글쓰기
	@PostMapping(path = {"/writeNotice"})
	public String writeNotice(BoardDto board){

		int boardCategory = board.getBoardCategory();
		boardService.writeBoardNotice(board);
		System.out.println(board);

		if(boardCategory == 1) {
			board.setBoardCategory(board.getBoardCategory());
			return "redirect:notice";
		}else if(boardCategory == 2) {
			board.setBoardCategory(board.getBoardCategory());
			return "redirect:home";
		} else {
			return "board/writeNotice";
		}

	}

	@GetMapping(path = { "/review" })
	public String showBoardReview() {

		return "board/review";
	}




}

