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
	
	private String memSort = "0";
	
	@RequestMapping("login.ins")
	public String loginPageController(String sort, Model model, HttpSession session) {
		System.out.println("누구인가? : " + sort);
		memSort = sort;
		if (memSort == null) {
			model.addAttribute("alertMsg", "아이디와 비밀번호를 확인해주세요.");
		}
		return "LOGIN";
	}
	
	@RequestMapping("login.me")
	public String loginMember(Member m, HttpSession session , Model model, String sort) {
		System.out.println(sort);
		memSort = sort;
		
		// 암호화 작업 전에 했던 과정
		System.out.println(m);
		Member loginUser = mService.loginMember(m);
		
		System.out.println(m);
		if (loginUser == null) { // 로그인 실패 => requestScope에 담아서 에러페이지 포워딩
			System.out.println("로그인실패");
			return "redirect:login.ins";
		} else { // 로그인 성공 => loginUser sessionScope에 담아서 메인페이지 url 재요청
			System.out.println("로그인 성공");
			
			String mainPage = "";

			if (memSort.equals("1")) { // 관리자
				mainPage = "admin/adminSideBar";
			} else if(memSort.equals("2")) { // 강사
				mainPage = "instructor/main";
			} else if(memSort.equals("3")){ // 학생
				mainPage = "student/main";
			} else {
				mainPage = "redirect:login.ins";
			}
			session.setAttribute("loginUser", loginUser);
			return mainPage;
		}

	}
}
