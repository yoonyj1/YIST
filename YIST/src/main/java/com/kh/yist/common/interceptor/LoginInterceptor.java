package com.kh.yist.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter {

	/*
	 *	Interceptor(HandlerInterCeptor)
	 *	: 해당 Controller가 실행되기 전, 후에 낚아채서 실행할 내용 작성 가능
	 *    ex) 로그인 유무 판단, 회원의 접근권한 체크
	 *
	 * 	prehandle(전처리) : DispatcherServlet이 Controller를 호출하기 전 낚아채는 영역
	 *  posthandle(후처리) : Controller에서 요청 처리 후 DispatcherServlet으로 뷰 정보가 리턴되기 전 낚아채는 영역
	 *  
	 *  
	 1. extends HandlerInterceptorAdapter 상속받기
 	
	 */
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object Handler) throws Exception{
		// true : 기존 흐름 요청대로 해당 Controller 제대로 실행
		// false : Controller 실행하지 않음
		
		//	현재 요청을 보낸 사람이 로그인 되어있을 경우 : Controller 실행
		//	로그인 되어있지 않을 경우 Controller 실행하지 않음
		
		HttpSession session = request.getSession();

		if(session.getAttribute("loginUser") != null) {
			return true;
		}else {
			session.setAttribute("alertMsg", "로그인 후 이용 가능한 서비스입니다.");
			response.sendRedirect(request.getContextPath());
			return false;
		}
		
	}
}
