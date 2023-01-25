package com.imbling.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class ReviewController {
    //****************************** 자주묻는질문 작성 및 수정 **************************
//****************************** 공지사항작성, 수정, 상세보기, 페이징 **************************
//****************************** 1:1  문의사항 작성(모달창), 마이페이지연결, 페이징 **************************



    @GetMapping(path = { "/board/writeReview" })
    public String showBoardWrite() {

        return "board/writeReview";
    }
//    //entity 전체 받기
//    @PostMapping(path={ "/writeReview" })
//    public String boardWrite(String title, String content, int typeIdNo){
//        return "";
//    }


}
