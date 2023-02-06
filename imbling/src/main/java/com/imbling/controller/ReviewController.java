package com.imbling.controller;

import com.imbling.dto.OrderDetailDto;
import com.imbling.dto.OrderDto;
import com.imbling.dto.ProductDto;
import com.imbling.dto.ReviewDto;
import com.imbling.service.ReviewService;
import com.imbling.service.UserOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping(path = {"/board"})
public class ReviewController {

    @Autowired
    @Qualifier("reviewService")
    private ReviewService reviewService;


    @Autowired
    @Qualifier("userOrderService")
    private UserOrderService userOrderService;

//리뷰페이지 보여주기
    @GetMapping(path = { "/review" })
    public String showBoardReview() {

        return "board/review";
    }

    @GetMapping(path = { "/writeReview" })
    public String showBoardWrite(@RequestParam(defaultValue = "-1") int orderNo, Model model) {

        OrderDto order = userOrderService.getOrderInfo(orderNo);

        model.addAttribute("orderNo", orderNo);
        model.addAttribute("productName", order.getOrders());
        return "board/writeReview";
    }
//    //entity 전체 받기, detail조회와 insert를 동시에 해야 함
    @PostMapping(path={ "/writeReview" })
    public String reviewWrite(ReviewDto review){

        //String productNo = review.getProductNo(productName);
        reviewService.writeReview(review);

        return "redirect:review";
    }


}
