package com.imbling.dto;

import lombok.Data;

import java.util.Date;
import java.util.List;

@Data
public class ReviewDto {
    private int reviewNo;
    private int orderNo;
    private int propertyNo;
    private String userId;
    private String reviewTitle;
    private String reviewContent;
    private Date reviewRegDate;
    private int reviewStar;
    private int reviewCount;
    private boolean reviewDeleted;


}
