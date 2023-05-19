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
import com.kh.yist.admin.model.service.AdminServiceY;
import com.kh.yist.member.model.service.MemberServiceImpl;
import com.kh.yist.member.model.service.SendCodeService;
import com.kh.yist.member.model.vo.Alarm;
import com.kh.yist.member.model.vo.Attendance;
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
	private AdminServiceY aService;
	
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
			model.addAttribute("alertMsg", "아이디와 비밀번호를 확인해주세요.");
		}
		return "LOGIN";
	}
	
	@RequestMapping("login.me")
	public String loginMember(Member m, String id, HttpSession session, Model model) {
	    System.out.println("sort 적용 됬나 ? " + memSort);
	    
	    
	    m.setSort(memSort);
	    
	    if (m.getSort() == 3) {
	    	int result = mService.insertMemberAttendance(id);
	    }
	    Member loginUser = mService.loginMember(m);
	    ArrayList<Member> ins = stuService.selectIns(loginUser);
	    
	    System.out.println(loginUser);

	    System.out.println(loginUser+"로그인유저");

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
	        	
	        	Attendance am = mService.selectStudentAttendance(id);
		    	session.setAttribute("am", am);
	            System.out.println("학생입니당");
	            model.addAttribute("ins", ins);
	            mainPage = "student/studentMain";
	        } else {
	            hasMember = false;
	            mainPage = "redirect:login.ins";
	        }

	        if (hasMember) {
	            // 비밀번호 암호화
	            BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
	            String hashedPassword = passwordEncoder.encode(loginUser.getPwd());
	            loginUser.setPwd(hashedPassword);

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
			originTime = loginUser.getUserTime(); // 기존 시간
		} 
		
		int newTime = userTime; // 새로 받아온시간 
		
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
	





















