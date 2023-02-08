package com.imbling.service;

import com.imbling.dto.*;
import com.imbling.entity.*;
import com.imbling.repository.OrderDetailRepository;
import com.imbling.repository.OrderRepository;
import com.imbling.repository.PropertyRepository;
import com.imbling.repository.ReviewRepository;
import org.hibernate.criterion.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

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
                .reviewTitle(review.getReviewTitle())
                .reviewStar(review.getReviewStar())
                .reviewContent(review.getReviewContent())
                .userId(review.getUserId())
                .build();


        PropertyEntity propertyEntity = propertyRepository.findById(review.getPropertyNo()).orElse((null));
        OrderEntity orderEntity = orderRepository.findById(review.getOrderNo()).orElse(null);
        OrderDetailEntity orderDetailEntity = orderDetailRepository.findByIds(review.getOrderNo(), review.getPropertyNo());
        reviewEntity.setOrder(orderEntity);
        reviewEntity.setProperty(propertyEntity);
        orderDetailEntity.setReviewState(true);

        reviewRepository.save(reviewEntity);
        orderDetailRepository.save(orderDetailEntity);
    }

    @Override
    public List<ReviewDto> findAllReview(ReviewDto review) {
        List<ReviewEntity> reviewList = reviewRepository.findAll();
        ArrayList<ReviewDto> reviews = new ArrayList<>();

        for(ReviewEntity reviewEntity : reviewList){

            ReviewDto reviewDto = reviewEntityToDto(reviewEntity);
            reviewDto.setOrderDto(orderEntityToDto(reviewEntity.getOrder()));
            reviewDto.setPropertyDto(propertyEntityToDto(reviewEntity.getProperty()));
            reviewDto.setProductDto(productEntityToDto(reviewEntity.getProperty().getProduct()));
            reviews.add(reviewDto);
        }

        return reviews;
    }

    @Override
    public ReviewDto findReviewByReviewNo(int reviewNo) {

        ReviewEntity reviewEntity = reviewRepository.findByReviewNo(reviewNo);
        ReviewDto reviewDto = reviewEntityToDto(reviewEntity);
        reviewDto.setOrderDto(orderEntityToDto(reviewEntity.getOrder()));
        reviewDto.setPropertyDto(propertyEntityToDto(reviewEntity.getProperty()));
        reviewDto.setProductDto(productEntityToDto(reviewEntity.getProperty().getProduct()));

        return reviewDto;
    }

    //=============================================================================

    @Override
    public void increaseReviewCount(int reviewNo) {
        reviewRepository.increaseReviewCount(reviewNo);
    }


}
