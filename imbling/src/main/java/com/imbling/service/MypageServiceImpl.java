package com.imbling.service;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.imbling.dto.AccountDto;
import com.imbling.dto.BoardDto;
import com.imbling.entity.AccountDtoEntity;
import com.imbling.entity.BoardEntity;
import com.imbling.repository.AccountRepository;
import com.imbling.repository.MypageRepository;

@Service("mypageService")
public class MypageServiceImpl implements MypageService{
	
	@Autowired
	private MypageRepository mypageRepository;

	@Autowired
	private AccountRepository accountRepository;
	
	@Override
	public List<BoardDto> findMyInquery(String userId){
		List<BoardEntity> boardList = mypageRepository.findByIdAndCategory(userId);
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


	
	

}
