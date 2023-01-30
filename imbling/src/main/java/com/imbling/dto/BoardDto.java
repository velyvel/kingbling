package com.imbling.dto;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class BoardDto {
	
	private int boardNo;
	private int boardCategory;
	private String boardTitle;
	private String boardContent;
	private Date boardRegDate;
	private int boardCount;
	private String userId;
	private boolean boardDeleted;

	private List<BoardAttachDto> boardAttachments;
	private List<BoardCommentDto> boardComments;
}
