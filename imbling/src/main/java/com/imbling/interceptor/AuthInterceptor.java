package com.imbling.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import com.imbling.dto.AccountDto;

public class AuthInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse resp, Object handler) throws Exception {

		String uri = req.getRequestURI();

		HttpSession session = req.getSession();
		AccountDto loginUser = (AccountDto) session.getAttribute("loginuser");

		if (loginUser == null) {
			if (uri.contains("/mypage") || uri.contains("/product") || uri.contains("/admin")
					|| uri.contains("/board")) {

				resp.sendRedirect("/member/login?errM=1");
				return false;
			}
		} else if (!loginUser.getUserType().contains("admin")) {

			if (uri.contains("/admin")) {
				resp.sendRedirect("/member/login?errM=2");
				System.out.println("check admin");

				return false;
			}

		}

		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
	}

}
