package com.imbling.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class BoardController {
	@GetMapping(path = {"/board/home"})
	public String showBoardHome(){
		return "board/home";
	}
//****************************** 메인이벤트 작성 및 수정 **************************
//****************************** 이벤트 리스트 조회 및 분류(지난이벤트) 이벤트 상세보기 **************************

	@GetMapping(path = { "/board/notice" })
	public String showBoardNotice() {
		
		return "board/notice";
	}
//****************************** 자주묻는질문 작성 및 수정 **************************
//****************************** 공지사항작성, 수정, 상세보기, 페이징 **************************
//****************************** 1:1  문의사항 작성(모달창), 마이페이지연결, 페이징 **************************

	@GetMapping(path = { "/board/review" })
	public String showBoardReview() {

		return "board/review";
	}

//****************************** 베스트 후기 조회하기, 리스트 바꾸기 (연관상품으로 이동하기)**************************
//****************************** 후기 작성, 조회(최신순), 검색, 페이징**************************
	@GetMapping(path = { "/board/write" })
	public String showBoardWrite() {

		return "board/write";
	}
}

