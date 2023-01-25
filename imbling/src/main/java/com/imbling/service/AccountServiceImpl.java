package com.imbling.service;

import java.util.HashSet;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.imbling.common.Util;
import com.imbling.dto.AccountDocImgDto;
import com.imbling.dto.AccountDto;
import com.imbling.entity.AccountDocImgDtoEntity;
import com.imbling.entity.AccountDtoEntity;
import com.imbling.repository.AccountRepository;

// @Component
@Service("accountService")
public class AccountServiceImpl implements AccountService {

	@Autowired
	private AccountRepository accountRepository;
	
	
	@Override
	public void registerMember(AccountDto member) {

		String passwd = Util.getHashedString(member.getUserPassword(), "SHA-256");
		member.setUserPassword(passwd); // 암호화된 패스워드를 멤버에 저장
		
		AccountDtoEntity accountEntity;
		accountEntity= accountDtoToEntity(member);
		
		HashSet<AccountDocImgDtoEntity> attachments = new HashSet<>();
 		for (AccountDocImgDto boardAttachDto : member.getAttachments()) {
 			attachments.add(accountDocImgDtoToEntity(boardAttachDto));
 		}
 		accountEntity.setAttachments(attachments);
 		
		
		accountRepository.save(accountEntity); // 데이터베이스에 데이터 저장	
		
		
		
	}


	@Override
	public AccountDto  findByUserIdAndUserPassword(String userId, String userPassword) {
		userPassword = Util.getHashedString(userPassword, "SHA-256");
		AccountDtoEntity loginuser=accountRepository.findByUserIdAndUserPassword(userId,userPassword);
		System.out.printf("===========");
		System.out.printf("\\\\\\\\\\\\");
		System.out.print("service accountid:"+userId+"service account pw:"+userPassword);
		AccountDto loginuserDto =accountEntityAccountDto(loginuser);
		return loginuserDto;
	}



	


}
