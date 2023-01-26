package com.imbling.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
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
@Table(name = "imb_board")
public class BoardEntity {


	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(nullable = false)
	private int boardNo;

	@Column
	private int boardCategory;

	@Column(length = 100)
	private String boardTitle;

	@Column(length = 1000, nullable = false)
	private String boardContent;

	@Builder.Default
	@Column(nullable = false)
	private Date boardRegDate = new Date();

	@Builder.Default
	@Column(nullable = false)
	private int boardCount = 0;

	@Column
	private int userNo;

	@Builder.Default
	@Column(nullable = false)
	private boolean boardDeleted = false;

}