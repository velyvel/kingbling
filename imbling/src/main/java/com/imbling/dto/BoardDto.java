package com.imbling.dto;

import java.util.Date;

import lombok.Data;

@Data
public class BoardDto {
	
	private int boardNo;
	private String boardCategory;
	private String boardTitle;
	private String boardContent;
	private Date boardRegDate;
	private int boardCount;
	private int userNo;
	private boolean boardDeleted; 

}
