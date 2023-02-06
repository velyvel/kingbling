package com.imbling.service;

import com.imbling.dto.OrderDetailDto;
import com.imbling.dto.OrderDto;
import com.imbling.dto.ProductDto;
import com.imbling.dto.ReviewDto;
import com.imbling.entity.BoardEntity;
import com.imbling.entity.OrderDetailEntity;
import com.imbling.entity.OrderEntity;
import com.imbling.entity.ReviewEntity;
import com.imbling.repository.OrderDetailRepository;
import com.imbling.repository.OrderRepository;
import com.imbling.repository.PropertyRepository;
import com.imbling.repository.ReviewRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("reviewService")
public class ReviewServiceImpl implements ReviewService{

    @Autowired
    private ReviewRepository reviewRepository;

    @Autowired
    private PropertyRepository propertyRepository;

    @Autowired
    private OrderDetailRepository orderDetailRepository;

    @Autowired
    private OrderRepository orderRepository;


    @Override
    public void writeReview(ReviewDto review) {
        ReviewEntity reviewEntity = ReviewEntity.builder()
//                .orderNo(review.getOrderNo())
                .reviewTitle(review.getReviewTitle())
                .reviewStar(review.getReviewStar())
                .reviewContent(review.getReviewContent())
                .userId(review.getUserId())
                .build();

        reviewRepository.save(reviewEntity);
    }
}
