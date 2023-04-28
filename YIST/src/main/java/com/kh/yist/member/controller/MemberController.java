package com.kh.yist.member.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.yist.member.model.service.MemberServiceImpl;
import com.kh.yist.member.model.service.SendCodeService;
import com.kh.yist.member.model.vo.Member;
import com.kh.yist.subject.model.service.SubjectServiceImpl;
import com.kh.yist.subject.model.vo.Subject;

@Controller
public class MemberController {

	@Autowired
	private MemberServiceImpl mService;
	
	@Autowired
	private SubjectServiceImpl sService;
	
	@Autowired
	private SendCodeService sendCode;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	private int memSort = 0;
	private boolean loginCheck = true;
	
	@RequestMapping("login.ins")
	public String loginPageController(int sort, Model model, HttpSession session) {
//		System.out.println("누구인가? : " + sort);
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
				mainPage = "admin/common/header";
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
	

	
	
	@RequestMapping("logout.me")
	public String logOut(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	/**
	 * SH
	 * @param sort:회원분류(1:관리자, 2:강사, 3:학생)
	 * @return 회원가입 화면으로 이동
	 */
	@RequestMapping(value="enrollForm.me")
	public ModelAndView enrollForm(int sort,  ModelAndView mv) {
		
		ArrayList<Subject> list = new ArrayList<Subject>();
		
		if(sort==3) {
			list = sService.selectSubjectList();
		}
		
		mv.addObject("sort",sort).addObject("list", list).setViewName("/student/common/memberEnrollForm");
		return mv;
	}
	
	
	
	/**
	 * 회원가입시 입력한 ID 중복체크
	 * @param checkId:입력한 ID
	 * @return 중복확인값
	 */
	@ResponseBody
	@RequestMapping("AjaxIdCheck.me")
	public String ajaxIdCheck(String checkId) {
		
		
		int count = mService.idCheck(checkId);
		
		if(count>0) {
			// 중복
			return "NNNNN";
		}else {
			return "NNNNY";
		}
		
		
	}
	
	@ResponseBody
	@RequestMapping("AjaxSendCode.me")
	public String ajaxSendCode(String userEmail) {
		
		return sendCode.joinEmail(userEmail);
		
	}
	
	
	@RequestMapping("enroll.me")
	public String insertMember(Member m, HttpSession session, Model model) {

		
		//암호화
		String encPwd = bcryptPasswordEncoder.encode(m.getPwd());
		
		m.setPwd(encPwd);
		
		int result = mService.insertMember(m);
		
		
		if(result > 0) {
			int sort = m.getSort();
			
			if(sort==3) {
				
				int subjectNo = Integer.parseInt(m.getSubject());
				int count = sService.increaseCurrentSeats(subjectNo);
			}
			
			
			session.setAttribute("alertMsg", "YIST에 함께 해주셔서 감사합니다!");
			return "redirect:/";
			
		}else {
			
			model.addAttribute("errorMsg","회원가입에 실패했습니다. 다시 시도해주세요");
			return "/student/common/errorPage";
			
		}
		
	}
	
	
	
	
}//Controller end
	





















