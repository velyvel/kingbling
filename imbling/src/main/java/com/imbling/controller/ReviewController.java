package com.imbling.controller;

import com.imbling.common.Util;
import com.imbling.dto.*;
import com.imbling.entity.ReviewEntity;
import com.imbling.service.ProductService;
import com.imbling.service.ReviewService;
import com.imbling.service.UserOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.ServletContext;
import java.io.File;
import java.util.HashMap;
import java.util.List;

@Controller
@RequestMapping(path = {"/board"})
public class ReviewController {

    @Autowired
    @Qualifier("reviewService")
    private ReviewService reviewService;


    @Autowired
    @Qualifier("userOrderService")
    private UserOrderService userOrderService;

    @Autowired
    @Qualifier("productService")
    private ProductService productService;

//리뷰페이지 보여주기
    @GetMapping(path = { "/review" })
    public String showBoardReview(@RequestParam(defaultValue = "1") int pageNo, @RequestParam(defaultValue = "1") int reviewNo,ReviewDto review, OrderDto orders, PropertyDto properties, Model model ) {

        List<ReviewDto> reviews = reviewService.findAllReview(review);
        model.addAttribute("reviews", reviews);


        return "board/review";
    }

    @GetMapping(path = { "/writeReview" })
    public String showBoardWrite(@RequestParam(defaultValue = "-1") int orderNo, int propertyNo,@RequestParam(defaultValue = "1") int productNo, Model model) {

        OrderDto order = userOrderService.getOrderInfo(orderNo);

        model.addAttribute("orderNo", orderNo);
        model.addAttribute("orders", order.getOrders());
        model.addAttribute("productNo", productNo);
        //model.addAttribute("product",order.getOrders());

        for(int i=0; i<order.getOrders().size(); i ++){
            if(order.getOrders().get(i).getPropertyNo()==propertyNo){
                model.addAttribute("property", order.getOrders().get(i));
            }
        }

        return "board/writeReview";
    }


    @PostMapping(path="/uploadReviewFileImage")
    @ResponseBody
    public HashMap<String, Object> uploadReviewImage(MultipartHttpServletRequest req){
        HashMap<String, Object> response = new HashMap<>();

        MultipartFile attach = req.getFile("file");

        if(attach != null){
            ServletContext application = req.getServletContext();
            String path = application.getRealPath("/review-attachments");
            String fileName = attach.getOriginalFilename();
            response.put("attachName", fileName);

            if(fileName != null && fileName.length()>0){
                String uniqueFileName = Util.makeUniqueFileName(fileName); //파일 저장하는 코드입니다
                response.put("savedFileName", uniqueFileName);

                try {
                    attach.transferTo(new File(path, uniqueFileName));
                    response.put("url", "/review-attachments/"+uniqueFileName);
                }catch (Exception ex){
                    ex.printStackTrace();
                }
            }
        }

        return response;
    }


    @PostMapping(path={ "/writeReview" })
    public String reviewWrite(ReviewDto review, @RequestParam(defaultValue = "-1") int orderNo, String productName, Model model){
    	System.out.println(review);
        reviewService.writeReview(review);
        OrderDto order = userOrderService.getOrderInfo(orderNo);
        model.addAttribute("orderNo", orderNo);
        model.addAttribute("orders", order.getOrders());
        model.addAttribute("productName", productName);

        return "redirect:review";
    }

    //상세리뷰 조회
    @GetMapping(path = {"/reviewDetail"})
    public String showReviewDetail(@RequestParam(defaultValue = "-1") int reviewNo,@RequestParam(defaultValue = "-1") int orderNo, @RequestParam(defaultValue = "-1") int pageNo,String propertyName, Model model){

        reviewService.increaseReviewCount(reviewNo);
        ReviewDto review = reviewService.findReviewByReviewNo(reviewNo);
        model.addAttribute("review", review);
        model.addAttribute("pageNo", pageNo);
        model.addAttribute("orderNo",review.getOrderNo());
        //model.addAttribute("orders", review.getOrderDto().getOrders());
        return "board/reviewDetail";
    }

    // 수정화면은 ajax로






}
