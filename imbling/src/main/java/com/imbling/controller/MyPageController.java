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
import com.imbling.dto.CartDto;
import com.imbling.dto.ReviewDto;
import com.imbling.service.MypageService;

@Controller
public class MyPageController {

	@Autowired
	@Qualifier("mypageService")
	private MypageService mypageService;

	@GetMapping(path = { "/mypage/myInfo", })
	public String showMyInfo(HttpSession session) {
		AccountDto loginUser = (AccountDto) session.getAttribute("loginuser");
		System.out.print(loginUser);
		if (loginUser == null) {
			return "/member/login";

		}

		return "mypage/myInfo";
	}

	@PostMapping(path = { "/mypage/edit", })
	public String editMyInfo(HttpSession session, AccountDto account) {
		mypageService.modifyAccount(account);

		AccountDto loginUser = (AccountDto) session.getAttribute("loginuser");
		loginUser.setUserName(account.getUserName());
		loginUser.setUserAddress(account.getUserAddress());
		loginUser.setUserEmail(account.getUserEmail());
		loginUser.setUserPhone(account.getUserPhone());

		session.setAttribute("loginuser", loginUser);

		return "redirect:myInfo";
	}

	///////////////////////// 장바구니////////////////////////////////////////
	@GetMapping(path = { "/mypage/cart", })
	public String showCart(HttpSession session,Model model) {
		AccountDto loginUser = (AccountDto) session.getAttribute("loginuser");
		List<CartDto> carts = mypageService.getCartInfo(loginUser.getUserId());
		
		model.addAttribute("carts", carts);
		
		return "mypage/cart";
	}

	///////////////////////// 관심상품////////////////////////////////////////
	@GetMapping(path = { "/mypage/heart", })
	public String showHeart() {
		return "mypage/heart";
	}

	////////////////////////// 내 주문 내역//////////////////////////////////
	@GetMapping(path = { "/mypage/orderList", })
	public String showOrderList() {
		return "mypage/orderList";
	}

	@GetMapping(path = { "/mypage/orderList-detail", })
	public String showOrderListDetail() {
		return "mypage/orderList-detail";
	}

	////////////////////////// 내가 쓴 게시글////////////////////////////////////////////
	@GetMapping(path = { "/mypage/myboard", })
	public String showByboard(HttpSession session, Model model) {
		AccountDto loginUser = (AccountDto) session.getAttribute("loginuser");
		List<BoardDto> boards = mypageService.findMyInquery(loginUser.getUserId());
		List<ReviewDto> reviews = mypageService.findMyreview(loginUser.getUserId());
		model.addAttribute("boards", boards);
		model.addAttribute("reviews", reviews);

		return "mypage/myboard";
	}
	
	  @GetMapping(path = { "/mypage/myboardInquery"}) 
	  public String showByboardInquery(String userId, Model model) {
	  System.out.println(userId);
	  List<BoardDto> boards = mypageService.findMyAllInquery(userId);
	  model.addAttribute("boards", boards);
	  model.addAttribute("sort", "inquery");
	  
	  return "mypage/myboard-see-more";
	  }
	  
	  @GetMapping(path = { "/mypage/myboardReview"}) 
	  public String showByboardReview(String userId, Model model) {
	  System.out.println(userId);
	  List<ReviewDto> reviews = mypageService.findMyAllReview(userId);
	  model.addAttribute("reviews", reviews);
	  model.addAttribute("sort", "review");
	  
	  return "mypage/myboard-see-more";
	  }
	 

}
