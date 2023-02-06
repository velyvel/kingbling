package com.imbling.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.imbling.controller.AccountController;
import com.imbling.dto.AccountDto;

public class AuthInterceptor implements HandlerInterceptor {

	// 컨트롤러를 호출하기 전에 호출되는 메서드
	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse resp, Object handler)
			throws Exception {
		 System.out.println("PreHandler");
		
		String uri = req.getRequestURI(); // 현재 요청 경로 (웹경로 : http://.../.../*.action)

		HttpSession session = req.getSession();
		AccountDto loginUser = (AccountDto) session.getAttribute("loginuser");
		
		if (loginUser == null) {	// 로그인 하지 않은 사용자
			if ( 
				uri.contains("/mypage")||
				uri.contains("/product")||
				uri.contains("/board")||
				uri.contains("/admin")||
				uri.contains("/mypage")
				) { // 로그인한 사용자만 볼 수 있는 요청
				
//				RedirectAttributes s=new RedirectAttributes();
//				AccountController as=new AccountController();
//				as.needLogin(s);
				resp.sendRedirect("/member/login");
				return false; // 예정된 컨트롤러 호출을 취소				
			}
		}
		
		
		
		
		
		return true; // 예정대로 컨트롤러 호출을 수행
	}	
	
	// 컨트롤러 처리가 끝난 후에 호출되는 메서드
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// System.out.println("PostHandle");
	}	
	// View 처리까지 끝난 후에 호출되는 메서드
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// System.out.println("AfterCompletion");
	}
	
}
