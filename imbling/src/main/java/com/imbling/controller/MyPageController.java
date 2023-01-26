package com.imbling.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.imbling.dto.AccountDto;
import com.imbling.dto.BoardDto;
import com.imbling.service.MypageService;

@Controller
public class MyPageController {
	
	@Autowired
	@Qualifier("mypageService")
	private MypageService mypageService;
	
	
	@GetMapping(path = { "/mypage/myInfo", })
	public String showMyInfo(HttpSession session) {
		AccountDto loginUser=(AccountDto) session.getAttribute("loginuser");
		//System.out.print(loginUser);
		if(loginUser.getUserId()=="notuser" ||loginUser==null) {
			return "redirect:home";

		}
		
		return "mypage/myInfo";
	}
	
	
	@PostMapping(path = { "/mypage/edit", })
	public String editMyInfo(HttpSession session,AccountDto account) {
		mypageService.modifyAccount(account);
		
		
		AccountDto loginUser=(AccountDto) session.getAttribute("loginuser");
		loginUser.setUserName(account.getUserName());
		loginUser.setUserAddress(account.getUserAddress());
		loginUser.setUserEmail(account.getUserEmail());
		loginUser.setUserPhone(account.getUserPhone());
		
		
		session.setAttribute("loginuser", loginUser);

		
		return "redirect:myInfo";
	}
	
	@GetMapping(path = { "/mypage/cart", })
	public String showCart() {
		return "mypage/cart";
	}
	@GetMapping(path = { "/mypage/heart", })
	public String showHeart() {
		return "mypage/heart";
	}
	@GetMapping(path = { "/mypage/orderList", })
	public String showOrderList() {
		return "mypage/orderList";
	}
	@GetMapping(path = { "/mypage/orderList-detail", })
	public String showOrderListDetail() {
		return "mypage/orderList-detail";
	}
	@GetMapping(path = { "/mypage/myboard", })
	public String showByboard(Model model) {
		
		List<BoardDto> boards = mypageService.findAllMyBoard();
		model.addAttribute("boards", boards);
		
		return "mypage/myboard";
	}
	@GetMapping(path = { "/mypage/myboardInquery", })
	public String showByboardInquery(Model model) {
		
		List<BoardDto> boards = mypageService.findAllMyBoard();
		model.addAttribute("boards", boards);
		
		return "mypage/myboard-see-more";
	}
	@GetMapping(path = { "/mypage/myboardReview", })
	public String showByboardReview(Model model) {
		
		List<BoardDto> boards = mypageService.findAllMyBoard();
		model.addAttribute("boards", boards);
		
		return "mypage/myboard-see-more";
	}


	

}

