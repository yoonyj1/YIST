package com.kh.yist.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.yist.member.model.service.MemberServiceImpl;
import com.kh.yist.member.model.vo.Member;

@Controller
public class MemberController {

	@Autowired
	private MemberServiceImpl mService;

	@RequestMapping("login.me")
	public String loginMember(String sort, Member m, HttpSession session , Model model) {

		// 암호화 작업 전에 했던 과정
		System.out.println(m);
		Member loginUser = mService.loginMember(m);
		
		System.out.println(m);
		if (loginUser == null) { // 로그인 실패 => requestScope에 담아서 에러페이지 포워딩
			System.out.println("로그인실패");
			model.addAttribute("alertMsg", "로그인 실패");
			return "redirect:/";
			
		} else { // 로그인 성공 => loginUser sessionScope에 담아서 메인페이지 url 재요청
			System.out.println("로그인 성공");
			session.setAttribute("loginUser", loginUser);
			return "instructor/common/header";
		}

	}
}
