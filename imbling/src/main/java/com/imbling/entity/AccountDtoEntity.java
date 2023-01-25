package com.imbling.entity;

import java.util.Collection;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
@Table(name="imb_user")
public class AccountDtoEntity {
	
	
	
	@Column(nullable = false)
	private String userName;
	
	@Column(nullable = false)
	private String userPhone;
	
	@Column(nullable = false)
	private String userEmail;
	
	@Column(nullable = false)
	private String userAddress;
	
	@Id
	@Column(nullable = false)
	private String userId;
	
	@Column(nullable = false)
	private String userPassword;
	
	@Column(nullable = false)
	private boolean userActiveState;
	
	@Column
	private String userCorpNo;
	
	@Builder.Default
	@Column(nullable = false)
	private boolean userDocValid = true;
	
	

	@OneToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	@JoinColumn(name = "userNo")
	private Collection<AccountDocImgDtoEntity> attachments;
	
}
