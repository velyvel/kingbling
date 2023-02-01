package com.imbling.service;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.imbling.dto.AccountDto;
import com.imbling.dto.BoardDto;
import com.imbling.dto.CartDto;
import com.imbling.dto.CategoryDto;
import com.imbling.dto.ReviewDto;
import com.imbling.entity.AccountDtoEntity;
import com.imbling.entity.BoardEntity;
import com.imbling.entity.CartEntity;
import com.imbling.entity.CategoryEntity;
import com.imbling.entity.ReviewEntity;
import com.imbling.repository.AccountRepository;
import com.imbling.repository.MypageRepository;
import com.imbling.repository.ProductRepository;
import com.imbling.repository.CartRepository;

@Service("mypageService")
public class MypageServiceImpl implements MypageService{
	
	@Autowired
	private MypageRepository mypageRepository;

	@Autowired
	private AccountRepository accountRepository;
	
	@Autowired
	private CartRepository cartRepository;
	
	@Autowired
	private ProductRepository productRepository;
	
	@Override
	public List<BoardDto> findMyInquery(String userId){
		List<BoardEntity> boardList = mypageRepository.findSomeByIdAndCategory(userId);
		ArrayList<BoardDto> boards = new ArrayList<>();
		for (BoardEntity boardEntity : boardList) {
			boards.add(boardEntityToDto(boardEntity));
		}
		return boards;
	}
	
	@Override
	public List<ReviewDto> findMyreview(String userId) {
		List<ReviewEntity> reviewList = mypageRepository.findSomeById(userId);
		ArrayList<ReviewDto> reviews = new ArrayList<>();
		for (ReviewEntity reviewEntity : reviewList) {
			reviews.add(reviewEntityToDto(reviewEntity));
		}
		return reviews;
	}
	
	@Override
	public List<ReviewDto> findMyAllReview(String userId) {
		List<ReviewEntity> reviewList = mypageRepository.findAllById(userId);
		ArrayList<ReviewDto> reviews = new ArrayList<>();
		for (ReviewEntity reviewEntity : reviewList) {
			reviews.add(reviewEntityToDto(reviewEntity));
		}
		return reviews;
	}
	
	@Override
	public List<BoardDto> findMyAllInquery(String userId) {
		List<BoardEntity> boardList = mypageRepository.findAllByIdAndCategory(userId);
		ArrayList<BoardDto> boards = new ArrayList<>();
		for (BoardEntity boardEntity : boardList) {
			boards.add(boardEntityToDto(boardEntity));
		}
		
		return boards;
	}

	@Override
	public void modifyAccount(AccountDto account) {
		
		AccountDtoEntity modifyAccount=accountRepository.findByUserId(account.getUserId());
		modifyAccount.setUserEmail(account.getUserEmail());
		modifyAccount.setUserAddress(account.getUserAddress());
		modifyAccount.setUserName(account.getUserName());
		modifyAccount.setUserPhone(account.getUserPhone());
		
		accountRepository.save(modifyAccount);
	}

	@Override
	public List<CartDto> getCartInfo(String userId) {
		
		List<CartEntity> carts = cartRepository.findAllByUserId(userId);
		ArrayList<CartDto> cartDtos = new ArrayList<>();
		for (CartEntity cart : carts) {
			CartDto cartDto = new CartDto();
			cartDto.setCartEA(cart.getCartEA());
			cartDto.setCartRegDate(cart.getCartRegDate());
			cartDto.setCartTotalPrice(cart.getCartTotalPrice());
			cartDto.setPropertyNo(cart.getProperty().getPropertyNo());
			cartDto.setUserId(userId);
			cartDto.setProduct(productEntityToDto(productRepository.findByPropertyNo(cart.getProperty().getPropertyNo())));
			
			cartDtos.add(cartDto);
		}
		return cartDtos;
	}



	
	

}
