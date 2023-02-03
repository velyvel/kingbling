package com.imbling.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.imbling.dto.AccountDto;
import com.imbling.dto.BoardDto;
import com.imbling.dto.CartDto;
import com.imbling.dto.ReviewDto;
import com.imbling.dto.HeartDto;
import com.imbling.entity.AccountDtoEntity;
import com.imbling.entity.BoardEntity;
import com.imbling.entity.CartEntity;
import com.imbling.entity.HeartEntity;
import com.imbling.entity.ProductEntity;
import com.imbling.entity.ReviewEntity;
import com.imbling.repository.AccountRepository;
import com.imbling.repository.CartRepository;
import com.imbling.repository.HeartRepository;
import com.imbling.repository.MypageRepository;
import com.imbling.repository.ProductRepository;
import com.imbling.repository.PropertyRepository;

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
	
	@Autowired
	private PropertyRepository propertyRepository;
	
	@Autowired
	private HeartRepository heartRepository;
	
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
			cartDto.setCartChk(cart.isCartChk());
			cartDto.setProduct(productEntityToDto(productRepository.findByPropertyNo(cart.getProperty().getPropertyNo())));
			cartDto.setProperty(propertyEntityToDto(propertyRepository.findById(cartDto.getPropertyNo()).orElse(null)));
			cartDtos.add(cartDto);
		}
		return cartDtos;
	}

	@Override
	public void setCartInfoToUnChk(String userId) {
		List<CartEntity> carts = cartRepository.findAllByUserId(userId);
		for(CartEntity cart : carts) {
			cart.setCartChk(false);
			cartRepository.save(cart);
		}
	}



	
	
	// 관심상품 /////////////////////////////////////////////////////////////
	// 관심상품에 넣을 데이터 저장 
	@Override
	public void addProductToHeart(HeartDto heart) {
		AccountDtoEntity userEntity = accountRepository.findByUserId(heart.getUserId());
		ProductEntity productEntity = productRepository.findByProductNo(heart.getProductNo());
		
		HeartEntity heartEntity = HeartEntity.builder()
											 .heartRegdate(new Date())
											 .categoryNo(heart.getCategoryNo())
											 .user(userEntity)
											 .products(productEntity)
											 .build();
		
		heartRepository.save(heartEntity);
	}

	// 관심상품 리스트 조회
	@Override
	public List<HeartDto> getHeartInfo(String userId) {
		
		List<HeartEntity> hearts = heartRepository.findAllByUserId(userId);
		ArrayList<HeartDto> heartDtos = new ArrayList<>();
		
		for (HeartEntity heart : hearts) {
			HeartDto heartDto = new HeartDto();
			
			heartDto.setUserId(userId);
			heartDto.setProductNo(heart.getProducts().getProductNo());
			heartDto.setHeartRegdate(heart.getHeartRegdate());
			heartDto.setCategoryNo(heart.getCategoryNo());
			heartDto.setProducts(productEntityToDto(productRepository.findByProductNo(heart.getProducts().getProductNo())));
			
			heartDtos.add(heartDto);
		}
		return heartDtos;
	}
	
}
