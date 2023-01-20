package com.imbling.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class BoardController {

	@GetMapping(path = { "/board/notice" })
	public String showBoardNotice() {
		
		return "board/notice";
	}

	@GetMapping(path = { "/board/qna" })
	public String showBoardQna() {

		return "board/qna";
	}
	

}

