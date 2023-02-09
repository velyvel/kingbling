package com.imbling.service;

import com.imbling.dto.*;
import com.imbling.entity.*;
import com.imbling.repository.*;
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

    @Autowired
    private ProductRepository productRepository;


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

        //reviewEntity에 property타고 product 넣기.. 디비는 수정 해야함
        reviewEntity.setProduct(propertyEntity.getProduct());
        reviewEntity.setOrder(orderEntity);
        reviewEntity.setProperty(propertyEntity);
        reviewRepository.save(reviewEntity);

        OrderDetailEntity orderDetailEntity = orderDetailRepository.findByIds(review.getOrderNo(), review.getPropertyNo());
        orderDetailEntity.setReviewState(true);
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

    //insert할 때 넣은 productId가지고 리뷰찾기 메서드 만들기




}
