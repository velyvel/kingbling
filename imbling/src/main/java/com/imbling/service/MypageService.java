package com.imbling.service;

import java.util.List;

import com.imbling.dto.AccountDto;
import com.imbling.dto.BoardDto;
import com.imbling.dto.ReviewDto;
import com.imbling.entity.AccountDtoEntity;
import com.imbling.entity.BoardEntity;
import com.imbling.entity.ReviewEntity;

public interface MypageService {
	
	public default BoardDto boardEntityToDto(BoardEntity boardEntity) {
		BoardDto boardDto = new BoardDto();
		boardDto.setBoardNo(boardEntity.getBoardNo());
		boardDto.setBoardCategory(boardEntity.getBoardCategory());
		boardDto.setBoardTitle(boardEntity.getBoardTitle());
		boardDto.setBoardContent(boardEntity.getBoardContent());
		boardDto.setBoardRegDate(boardEntity.getBoardRegDate());
		boardDto.setBoardCount(boardEntity.getBoardCount());
		boardDto.setUserId(boardEntity.getUserId());
		boardDto.setBoardDeleted(boardEntity.isBoardDeleted());

		return boardDto;
	}
	
	public default BoardEntity boardDtoToEntity(BoardDto boardDto) {
		BoardEntity boardEntity = BoardEntity.builder()
											 .boardNo(boardDto.getBoardNo())
											 .boardCategory(boardDto.getBoardCategory())
											 .boardTitle(boardDto.getBoardTitle())
											 .boardContent(boardDto.getBoardContent())
											 .boardRegDate(boardDto.getBoardRegDate())
											 .boardCount(boardDto.getBoardCount())
											 .userId(boardDto.getUserId())
											 .boardDeleted(boardDto.isBoardDeleted())
											 .build();		
		return boardEntity;
	}
	
	public default ReviewDto reviewEntityToDto(ReviewEntity ReviewEntity) {
		ReviewDto reviewDto = new ReviewDto();
		reviewDto.setReviewNo(ReviewEntity.getReviewNo());
		reviewDto.setOrderNo(ReviewEntity.getOrderNo());
		reviewDto.setProductNo(ReviewEntity.getProductNo());
		reviewDto.setUserId(ReviewEntity.getUserId());
		reviewDto.setReviewTitle(ReviewEntity.getReviewTitle());
		reviewDto.setReviewContent(ReviewEntity.getReviewContent());
		reviewDto.setReviewRegDate(ReviewEntity.getReviewRegDate());
		reviewDto.setReviewStar(ReviewEntity.getReviewStar());
		reviewDto.setReviewCount(ReviewEntity.getReviewCount());
		reviewDto.setReviewDeleted(ReviewEntity.isReviewDeleted());

		return reviewDto;
	}
	
	public default ReviewEntity reviewDtoToEntity(ReviewDto reviewDto) {
		ReviewEntity reviewEntity = ReviewEntity.builder()
											 .reviewNo(reviewDto.getReviewNo())
											 .orderNo(reviewDto.getOrderNo())
											 .productNo(reviewDto.getProductNo())
											 .userId(reviewDto.getUserId())
											 .reviewTitle(reviewDto.getReviewTitle())
											 .reviewContent(reviewDto.getReviewContent())
											 .reviewRegDate(reviewDto.getReviewRegDate())
											 .reviewStar(reviewDto.getReviewStar())
											 .reviewCount(reviewDto.getReviewCount())
											 .reviewDeleted(reviewDto.isReviewDeleted())
											 .build();		
		return reviewEntity;
	}
	
	public default AccountDto accountEntityAccountDto(AccountDtoEntity accountEntity) {
		AccountDto accountDto = new AccountDto();
		accountDto.setUserName(accountEntity.getUserName());
		accountDto.setUserType(accountEntity.getUserType());

		accountDto.setUserPhone(accountEntity.getUserPhone());
		accountDto.setUserEmail(accountEntity.getUserEmail());
		accountDto.setUserAddress(accountEntity.getUserAddress());
		accountDto.setUserId(accountEntity.getUserId());
		accountDto.setUserPassword(accountEntity.getUserPassword());
		accountDto.setUserActiveState(accountEntity.isUserActiveState());

		accountDto.setUserCorpNo(accountEntity.getUserCorpNo());

		return accountDto;		
	}
	
	public default AccountDtoEntity accountDtoToEntity(AccountDto accountDto) {
		AccountDtoEntity accountEntity = AccountDtoEntity.builder()
				.userName(accountDto.getUserName())
				.userPhone(accountDto.getUserPhone())
				.userType(accountDto.getUserType())
				.userEmail(accountDto.getUserEmail())
				.userAddress(accountDto.getUserAddress())
				.userId(accountDto.getUserId())
				.userPassword(accountDto.getUserPassword())
				.userActiveState(accountDto.isUserActiveState())
				.userCorpNo(accountDto.getUserCorpNo())
				.build();
		return accountEntity;
	}
	
	List<BoardDto> findMyInquery(String userId);
	
	List<BoardDto> findMyAllInquery(String userId);
	
	List<ReviewDto> findMyreview(String userId);
	
	List<ReviewDto> findMyAllReview(String userId);

	void modifyAccount(AccountDto account);

	

}
