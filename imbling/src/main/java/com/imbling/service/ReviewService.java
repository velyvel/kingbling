package com.imbling.service;

import com.imbling.dto.OrderDetailDto;
import com.imbling.dto.OrderDto;
import com.imbling.dto.PropertyDto;
import com.imbling.dto.ReviewDto;
import com.imbling.entity.OrderDetailEntity;
import com.imbling.entity.OrderEntity;
import com.imbling.entity.PropertyEntity;
import com.imbling.entity.ReviewEntity;

import java.util.List;

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

        //reviewDto.setProductNo(reviewEntity.getProductNo());

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

                //.productNo(reviewDto.getProductNo())
                .build();
        return reviewEntity;
    }

    //================================================================================================


    public default OrderDto orderEntityToDto(OrderEntity orderEntity) {
        OrderDto orderDto = new OrderDto();
        orderDto.setOrderNo(orderEntity.getOrderNo());
        orderDto.setOrderState(orderEntity.getOrderState());
        orderDto.setOrderDate(orderEntity.getOrderDate());
        orderDto.setOrderDeliveryRequire(orderEntity.getOrderDeliveryRequire());
        orderDto.setOrderPay(orderEntity.getOrderPay());
        orderDto.setUserId(orderEntity.getUserId());
        orderDto.setOrderAddr(orderEntity.getOrderAddr());

        return orderDto;
    }

    public default OrderEntity orderDtoToEntity(OrderDto orderDto) {

        OrderEntity orderEntity = OrderEntity.builder().orderNo(orderDto.getOrderNo()).orderState(orderDto.getOrderState()).orderDate(orderDto.getOrderDate())
                .orderDeliveryRequire(orderDto.getOrderDeliveryRequire()).orderPay(orderDto.getOrderPay())
                .userId(orderDto.getUserId()).orderAddr(orderDto.getOrderAddr())
                .build();

        return orderEntity;
    }

    public default OrderDetailDto orderDetailEntityToDto(OrderDetailEntity orderDetailEntity) {
        OrderDetailDto orderDetailDto = new OrderDetailDto();
        orderDetailDto.setOrderDetailEA(orderDetailEntity.getOrderDetailEA());
        orderDetailDto.setOrderDetailTotalPrice(orderDetailEntity.getOrderDetailTotalPrice());
        orderDetailDto.setOrderNo(orderDetailEntity.getOrder().getOrderNo());
        orderDetailDto.setPropertyNo(orderDetailEntity.getProperty().getPropertyNo());

        return orderDetailDto;
    }

    public default OrderDetailEntity orderDetailDtoToEntity(OrderDetailDto orderDetailDto) {
        OrderEntity orderEntity = OrderEntity.builder().orderNo(orderDetailDto.getOrderNo()).build();
        PropertyEntity propertyEntity = PropertyEntity.builder().propertyNo(orderDetailDto.getPropertyNo()).build();

        OrderDetailEntity orderDetailEntity = OrderDetailEntity.builder().orderDetailEA(orderDetailDto.getOrderDetailEA())
                .order(orderEntity).property(propertyEntity).orderDetailTotalPrice(orderDetailDto.getOrderDetailTotalPrice())
                .build();

        return orderDetailEntity;
    }

    //================================================================================================

    public default PropertyDto propertyEntityToDto(PropertyEntity propertyEntity) {
        PropertyDto propertyDto = new PropertyDto();
        propertyDto.setProductColor(propertyEntity.getProductColor());
        propertyDto.setProductEA(propertyEntity.getProductEA());
        propertyDto.setProductSize(propertyEntity.getProductSize());
        propertyDto.setPropertyNo(propertyEntity.getPropertyNo());

        return propertyDto;
    }

    public default PropertyEntity propertyDtoToEntity(PropertyDto propertyDto) {
        PropertyEntity propertyEntity = PropertyEntity.builder()
                .propertyNo(propertyDto.getPropertyNo())
                .productColor(propertyDto.getProductColor())
                .productEA(propertyDto.getProductEA())
                .productSize(propertyDto.getProductSize())
                .build();

        return propertyEntity;
    }
    //================================================================================================


    void writeReview(ReviewDto review);
    //void findOrder(OrderDto order);

    List<ReviewDto> findAllReview(ReviewDto review);


}
