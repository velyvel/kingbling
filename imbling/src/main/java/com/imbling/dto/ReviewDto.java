package com.imbling.dto;

import lombok.Data;

import java.util.Date;

@Data
public class ReviewDto {
    private int reviewNo;
    private int orderNo;
    private int productNo;
    private int  userNo;
    private String reviewTitle;
    private String reviewContent;
    private Date reviewRegdate;
    private int reviewStar;
    private int reviewCount;
    private boolean reviewDeleted;

}
