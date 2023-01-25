package com.imbling.dto;
import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class AccountDto {
	//유저 정보 
	private int userNo;	//유저 번호(식별자) 
	private String userName;
	private String userPhone;
	private String userEmail;
	private String userType; //유저 구분 
	private String userAddress;	//회사 위치 
	private String userId;	// id, pw
	private String userPassword;
	private boolean userActiveState;	//활동 여부 
	//사업자 정보 
	private String userCorpNo;	//사업자 등록번호
	private boolean userDocValid;	//사업자 사진 유효성 
	private List<AccountDocImgDto> attachments ;	//사업자 사진 정보 
	
	
	
	
}
