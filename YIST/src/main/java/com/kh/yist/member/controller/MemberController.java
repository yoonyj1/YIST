package com.kh.yist.member.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.yist.member.model.service.MemberServiceImpl;
import com.kh.yist.member.model.service.SendCodeService;
import com.kh.yist.member.model.vo.Alarm;
import com.kh.yist.member.model.vo.Member;
import com.kh.yist.student.model.service.StudentServiceImpl;
import com.kh.yist.subject.model.service.SubjectServiceImpl;
import com.kh.yist.subject.model.vo.Subject;

@Controller
public class MemberController {

	@Autowired
	private MemberServiceImpl mService;
	
	@Autowired
	private SubjectServiceImpl sService;
	
	@Autowired
	private StudentServiceImpl stuService;
	
	@Autowired
	private SendCodeService sendCode;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	private int memSort = 0;
	private boolean loginCheck = true;
	
	@RequestMapping("login.ins")
	public String loginPageController(int sort, Model model, HttpSession session) {
		memSort = sort;
		model.addAttribute("sort", sort);
		if (!loginCheck) {
			loginCheck = true;
			model.addAttribute("alertMsg", "�븘�씠�뵒�� 鍮꾨�踰덊샇瑜� �솗�씤�빐二쇱꽭�슂.");
		}
		return "LOGIN";
	}
	
	@RequestMapping("login.me")
	public String loginMember(Member m, HttpSession session , Model model) {
		
		System.out.println("sort 몇번? " + memSort);
		
		m.setSort(memSort);
		Member loginUser = mService.loginMember(m);
		ArrayList<Member> ins = stuService.selectIns(loginUser);
		
		System.out.println(loginUser);
		
		if (loginUser != null && bcryptPasswordEncoder.matches(m.getPwd(), loginUser.getPwd())) { 
			System.out.println("로그인성공");
			loginCheck = false;
			return "redirect:login.ins?sort=" + memSort;
		} else { 

			boolean hasMember = true;
			
			String mainPage = "";
			
			System.out.println("m.getSort() : " + m.getSort());
			
			if (m.getSort() == 1) { 
				mainPage = "admin/common/header";
			} else if(m.getSort() == 2) { 
				mainPage = "instructor/main";
			} else if(m.getSort() == 3){ // 학생
				System.out.println("학생입니당");
				model.addAttribute("ins", ins);
				mainPage = "student/studentMain";
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
	
	
	
	
	@ResponseBody
	@RequestMapping(value="examTime.ins", produces = "text/html; charset=UTF-8")
	public String examTime(int setTime, int userTime, HttpSession session) {
		Member loginUser = (Member)session.getAttribute("loginUser");

		loginUser.setExamTime(setTime);
		loginUser.setUserTime(userTime);
		
		session.setAttribute("loginUser", loginUser);
		
		return "";
	}
	
	@ResponseBody
	@RequestMapping(value="getTime.ins", method=RequestMethod.POST)
	public String getExamTime(int setTime, int userTime, HttpSession session) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		int originTime = 0;
		
		if (loginUser != null){
			originTime = loginUser.getUserTime(); // 湲곗〈 �떆媛�
		} 
		
		int newTime = userTime; // �깉濡� 諛쏆븘�삩�떆媛� 
		
		loginUser.setExamTime(setTime);
		loginUser.setUserTime(originTime);
		
		session.setAttribute("loginUser", loginUser);
		
		int resultTime = newTime-originTime;

		return ""+resultTime;
	}
	
	@ResponseBody
	@RequestMapping(value="endExam.ins")
	public void endExam(HttpSession session) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		loginUser.setExamTime(0);
		
		session.setAttribute("loginUser", loginUser);
		
	}
	
	
	
	/**
	 * SH
	 * @param sort:�쉶�썝遺꾨쪟(1:愿�由ъ옄, 2:媛뺤궗, 3:�븰�깮)
	 * @return �쉶�썝媛��엯 �솕硫댁쑝濡� �씠�룞
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
	 * �쉶�썝媛��엯�떆 �엯�젰�븳 ID 以묐났泥댄겕
	 * @param checkId:�엯�젰�븳 ID
	 * @return 以묐났�솗�씤媛�
	 */
	@ResponseBody
	@RequestMapping("AjaxIdCheck.me")
	public String ajaxIdCheck(String checkId) {
		
		
		int count = mService.idCheck(checkId);
		
		if(count>0) {
			// 以묐났
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

		
		//�븫�샇�솕
		String encPwd = bcryptPasswordEncoder.encode(m.getPwd());
		
		m.setPwd(encPwd);
		
		int result = mService.insertMember(m);
		
		
		if(result > 0) {
			int sort = m.getSort();
			
			if(sort==3) {
				
				int subjectNo = Integer.parseInt(m.getSubject());
				int count = sService.increaseCurrentSeats(subjectNo);
			}
			
			
			session.setAttribute("alertMsg", "YIST�뿉 �븿猿� �빐二쇱뀛�꽌 媛먯궗�빀�땲�떎!");
			return "redirect:/";
			
		}else {
			
			model.addAttribute("errorMsg","�쉶�썝媛��엯�뿉 �떎�뙣�뻽�뒿�땲�떎. �떎�떆 �떆�룄�빐二쇱꽭�슂");
			return "/student/common/errorPage";
			
		}
		
	}
	
	
	
	
}//Controller end
	





















