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
	
	private int memSort = 0;
	private boolean loginCheck = true;
	
	@RequestMapping("login.ins")
	public String loginPageController(int sort, Model model, HttpSession session) {
		System.out.println("누구인가? : " + sort);
		memSort = sort;
		model.addAttribute("sort", sort);
		if (!loginCheck) {
			loginCheck = true;
			model.addAttribute("alertMsg", "아이디와 비밀번호를 확인해주세요.");
		}
		return "LOGIN";
	}
	
	@RequestMapping("login.me")
	public String loginMember(Member m, HttpSession session , Model model) {
		
		System.out.println("sort 적용 됬나 ? " + memSort);
		
		m.setSort(memSort);
		Member loginUser = mService.loginMember(m);
		
		System.out.println(m);
		
		if (loginUser == null) { // 로그인 실패 => requestScope에 담아서 에러페이지 포워딩
			System.out.println("로그인실패");
			loginCheck = false;
			return "redirect:login.ins?sort=" + memSort;
		} else { // 로그인 성공 => loginUser sessionScope에 담아서 메인페이지 url 재요청

			boolean hasMember = true;
			
			String mainPage = "";
			
			System.out.println("m.getSort() : " + m.getSort());
			
			if (m.getSort() == 1) { // 관리자
				mainPage = "admin/adminSidebar";
			} else if(m.getSort() == 2) { // 강사
				mainPage = "instructor/main";
			} else if(m.getSort() == 3){ // 학생
				mainPage = "student/main";
			} else {
				hasMember = false;
				mainPage = "redirect:login.ins";
			}
			
			if (hasMember) {
				session.setAttribute("loginUser", loginUser);
			}
			
			return mainPage;
		}

	}
	
	@RequestMapping("enrollForm.me")
	public String enrollForm(int sort) {
		Member m = new Member();
		m.setSort(sort);
		System.out.println(m);
		return "/student/common/memberEnrollForm";
	}
}
