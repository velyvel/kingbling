package com.imbling.dto;

import lombok.Data;

import java.util.Date;

@Data
public class BoardDto {
    private int boardNo;
    private int boardCategory;
    private String boardTitle;
    private String boardContent;
    private Date boardRegdate;
    private int boardCount;
    private int userNo;
    private boolean boardDeleted;

}
