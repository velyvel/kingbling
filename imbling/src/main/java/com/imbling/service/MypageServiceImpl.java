package com.imbling.service;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.imbling.dto.BoardDto;
import com.imbling.entity.BoardEntity;
import com.imbling.repository.MypageRepository;

@Service("mypageService")
public class MypageServiceImpl implements MypageService{
	
	@Autowired
	private MypageRepository mypageRepository;

	@Override
	public List<BoardDto> findAllMyBoard() {
		List<BoardEntity> boardList = mypageRepository.findAll();
		ArrayList<BoardDto> boards = new ArrayList<>();
		for (BoardEntity boardEntity : boardList) {
			boards.add(boardEntityToDto(boardEntity));
		}
		
		return boards;
	}


	
	

}
