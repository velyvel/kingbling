package com.imbling.service;

import com.imbling.dto.AccountDocImgDto;
import com.imbling.dto.AccountDto;
import com.imbling.entity.AccountDocImgDtoEntity;
import com.imbling.entity.AccountDtoEntity;

public interface AccountService {

	public default AccountDto accountEntityAccountDto(AccountDtoEntity accountEntity) {
		AccountDto accountDto = new AccountDto();
		accountDto.setUserNo(accountEntity.getUserNo());
		accountDto.setUserName(accountEntity.getUserName());
		accountDto.setUserPhone(accountEntity.getUserPhone());
		accountDto.setUserEmail(accountEntity.getUserEmail());
		accountDto.setUserAddress(accountEntity.getUserAddress());
		accountDto.setUserId(accountEntity.getUserId());
		accountDto.setUserPassword(accountEntity.getUserPassword());
		accountDto.setUserActiveState(accountEntity.isUserActiveState());

		accountDto.setUserCorpNo(accountEntity.getUserCorpNo());

		return accountDto;		
	}
	
	public default AccountDtoEntity boardDtoToEntity(AccountDto accountDto) {
		AccountDtoEntity accountEntity = AccountDtoEntity.builder()
				.userNo(accountDto.getUserNo())
				.userName(accountDto.getUserName())
				.userPhone(accountDto.getUserPhone())
				.userEmail(accountDto.getUserEmail())
				.userAddress(accountDto.getUserAddress())
				.userId(accountDto.getUserId())
				.userPassword(accountDto.getUserPassword())
				.userActiveState(accountDto.isUserActiveState())
				.userCorpNo(accountDto.getUserCorpNo())
				.build();
		return accountEntity;
	}
	
	public default AccountDocImgDto AccountDocImgDtoEntitytoDto(AccountDocImgDtoEntity accountDocImgDtoEntity) {
		AccountDocImgDto accountDocImgDto = new AccountDocImgDto();
//		accountDocImgDto.setUserNo(accountDocImgDtoEntity.getUserNo());
		accountDocImgDto.setDocName(accountDocImgDtoEntity.getDocName());
		accountDocImgDto.setDocNo(accountDocImgDtoEntity.getDocNo());

		return accountDocImgDto;		
	}
	
	public default AccountDocImgDtoEntity accountDocImgDtoToEntity(AccountDocImgDto accountDocImgDto) {
		AccountDocImgDtoEntity accountEntity = AccountDocImgDtoEntity.builder()
//				.userNo(accountDocImgDto.getUserNo())
				.docName(accountDocImgDto.getDocName())
				.docNo(accountDocImgDto.getDocNo())
				.build();
		return accountEntity;
	}
	
	void registerMember(AccountDto accountDto);

}