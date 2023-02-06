package com.imbling.service;

import com.imbling.dto.OrderDto;
import com.imbling.dto.ReviewDto;
import com.imbling.entity.ReviewEntity;

public interface ReviewService {

    public default ReviewDto reviewEntityToDto(ReviewEntity reviewEntity){
        ReviewDto reviewDto = new ReviewDto();
        reviewDto.setReviewNo(reviewEntity.getReviewNo());
        reviewDto.setUserId(reviewEntity.getUserId());
        reviewDto.setReviewTitle(reviewEntity.getReviewTitle());
        reviewDto.setReviewContent(reviewEntity.getReviewContent());
        reviewDto.setReviewRegDate(reviewEntity.getReviewRegDate());
        reviewDto.setReviewStar(reviewEntity.getReviewStar());
        reviewDto.setReviewCount(reviewEntity.getReviewCount());
        reviewDto.setReviewDeleted(reviewEntity.isReviewDeleted());
        reviewDto.setProductNo(reviewEntity.getProductNo());

        return reviewDto;
    }

    public default ReviewEntity reviewDtoToEntity(ReviewDto reviewDto){
        ReviewEntity reviewEntity = ReviewEntity.builder()
                .reviewNo(reviewDto.getReviewNo())
                .userId(reviewDto.getUserId())
                .reviewTitle(reviewDto.getReviewTitle())
                .reviewContent(reviewDto.getReviewContent())
                .reviewRegDate(reviewDto.getReviewRegDate())
                .reviewStar(reviewDto.getReviewStar())
                .reviewCount(reviewDto.getReviewCount())
                .reviewDeleted(reviewDto.isReviewDeleted())
                .productNo(reviewDto.getProductNo())
                .build();
        return reviewEntity;
    }

    //================================================================================================

    void writeReview(ReviewDto review);

}
