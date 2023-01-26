package com.imbling.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class ReviewController {

//리뷰페이지 보여주기
    @GetMapping(path = { "/board/review" })
    public String showBoardReview() {

        return "board/review";
    }


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
