package com.kh.yist.student.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.yist.common.model.vo.PageInfo;
import com.kh.yist.common.template.Pagination;
import com.kh.yist.member.model.vo.Member;
import com.kh.yist.student.model.service.MailSendService;
import com.kh.yist.student.model.service.StudentService;
import com.kh.yist.student.model.vo.Notice;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.yist.common.model.vo.PageInfo;
import com.kh.yist.common.template.Pagination;
import com.kh.yist.student.model.service.StudentService;
import com.kh.yist.student.model.vo.Exam;
import com.kh.yist.student.model.vo.Material;
import com.kh.yist.student.model.vo.Notice;
import com.kh.yist.student.model.vo.QnA;
import com.kh.yist.student.model.vo.Task;

@Controller
public class StudentController {
	
	@Autowired
	private StudentService sService;
	
	@Autowired
	private MailSendService mailService;
	

	@RequestMapping("main.st")
	public ModelAndView main(Member m, HttpSession session, ModelAndView mv) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		ArrayList<Member> ins = sService.selectIns(loginUser);
		
		mv.addObject("ins", ins).setViewName("student/studentMain");
		
		return mv;
	}
	
	@ResponseBody
	@RequestMapping(value = "mainNotice.st", produces = "application/json; charset=UTF-8")
	public String mainNotic(ModelAndView mv) {
		
		ArrayList<Notice> nlist = sService.mainNotice();
		
		return new Gson().toJson(nlist);
	}
	
	// 로그아웃
	@RequestMapping("logout.st")
	public String logoutStudent(HttpSession session) {
		
		session.invalidate();
		
		return "redirect:/"; // "main"
	}
	
	// 시험 목록 조회
	@RequestMapping("testList.st")
	public ModelAndView testList(ModelAndView mv) {
		
		ArrayList<Exam> list = sService.testList();
		
		mv.addObject("list", list).setViewName("student/studentTestList");
		
		return mv;
	}
	
	// 시험 상세 조회
	@RequestMapping("testDetail.st")
	public String testDetail(@RequestParam(value="eno") int testNo, Model model) {
	    
	    Exam e = sService.testDetail(testNo);
	    e.setTestNo(testNo);
	    
	    model.addAttribute("e", e);
	    
	    return "student/studentTestDetail";
	}

	
	// 시험 제출
	@RequestMapping("testInsert.st")
	public String testInsert(@RequestParam(value="eno") int testNo, Exam e, HttpSession session) {
		  
		e.setTestNo(testNo);

		int result = sService.testInsert(e);
		
		if(result>0) {
			session.setAttribute("alertMsg", "평가 제출되었습니다");
			return "redirect:testList.st";
		}else {
			session.setAttribute("alertMsg", "평가 제출 실패!");
			return "redirect:testList.st";
		}
		
	}
	
	@RequestMapping("certificate.st")
	public String certificate() {
		return "student/studentCertificate";
	}
	
	// 공지사항 목록 조회
	@RequestMapping("noticeList.st")
	public ModelAndView noticeList(@RequestParam(value = "cpage", defaultValue = "1") int currentPage, ModelAndView mv) {
		
		int listCount = sService.noticeListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		
		ArrayList<Notice> list = sService.selectList(pi);
		
		mv.addObject("pi", pi).addObject("list", list).setViewName("student/studentNoticeList");
		
		return mv;
	}
	
	// 공지사항 상세 조회
	@RequestMapping("noticeDetail.st")
	public ModelAndView selectNotice(int nno, ModelAndView mv) {
		
		Notice n = sService.selectNotice(nno);
		System.out.println(n);
		
		mv.addObject("n", n).setViewName("student/studentNoticeDetail");
		
		return mv;
	}
	
	@RequestMapping("videoList.st")
	public String videoList() {
		return "student/studentVideoList";
	}
	
	// 우리반 게시판 목록 조회
	@RequestMapping("boardList.st")
	public ModelAndView boardList(@RequestParam(value = "cpage", defaultValue = "1") int currentPage, ModelAndView mv) {
		
		int listCount = sService.boardListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		
		ArrayList<Material> list = sService.boardList(pi);
		
		mv.addObject("pi", pi).addObject("list", list).setViewName("student/studentBoardList");
		
		return mv;
	}
	
	// 우리반 게시판 학습자료 목록 조회
	@ResponseBody
	@RequestMapping(value = "MaterialList.st", produces = "application/json; charset=UTF-8")
	public String MaterialList() {
		
		ArrayList<Material> list = sService.MaterialList();
		
		return new Gson().toJson(list);
	}
	
	// 우리반 게시판 과제 목록 조회
	@ResponseBody
	@RequestMapping(value = "taskList.st", produces = "application/json; charset=UTF-8")
	public String taskList() {
		
		ArrayList<Task> list = sService.taskList();

		return new Gson().toJson(list);
	}
	
	// 과제 상세 조회
	@RequestMapping("taskDetail.st")
	public ModelAndView selectTask(int tno, ModelAndView mv) {
		
		Task t = sService.selectTask(tno);
		
		if (t != null) {
			mv.addObject("t", t).setViewName("student/studentTaskDetail");
		} else {
			mv.setViewName("student/common/errorPage");
		}
		
		return mv;
	}
	
	// 과제 답글 상세 조회
	@RequestMapping("taskReplyDetail.st")
	public ModelAndView taskReplyDetail(int tno, ModelAndView mv) {
		
		Task t = sService.selectTaskReply(tno);
		
		if (t != null) {
			mv.addObject("t", t).setViewName("student/studentTaskReply");
		} else {
			mv.setViewName("student/common/errorPage");
		}
		
		return mv;
	}
	
	// 과제 답글 수정
	@RequestMapping("updateForm.st")
	public String updateForm(@RequestParam(value = "tno") int taskNo, Model model) {
		
		Task t = sService.selectTask(taskNo);
		
		model.addAttribute("t", t);
		
		return "student/studentTaskUpdateForm";
	}
	
	// 과제 답글 삭제
	@RequestMapping("deleteTask.st")
	public String delete(@RequestParam(value = "tno") int taskNo, HttpSession session) {
		
		int result = sService.deleteTask(taskNo);
		
		if (result > 0) {
			session.setAttribute("alertMsg", "게시글이 삭제되었습니다!");
			return "redirect:boardList.st";
		} else {
			session.setAttribute("alertMsg", "게시글 삭제 실패했습니다.");
			return "redirect:/taskReplyDetail.st?tno=" + taskNo;
		}
	}
	
	// 우리반 게시판 Q&A 목록 조회
	@ResponseBody
	@RequestMapping(value = "qnaList.st", produces = "application/json; charset=UTF-8")
	public String qnaList() {
		
		ArrayList<QnA> list = sService.qnaList();

		return new Gson().toJson(list);
	}
	
	// 과제 등록폼
	@RequestMapping("enrollForm.st")
	public String enrollForm(@RequestParam int taskNo, Model model) {
		
		Task t = sService.selectTask(taskNo);
		
		String title = t.getTaskTitle();
		
		model.addAttribute("taskNo", taskNo);
		model.addAttribute("title", title);

		return "student/studentTaskEnrollForm";
	}
	
	@RequestMapping("taskInsert.st")
	public String taskInsert(Task t, HttpSession session) {
	    
		int result = sService.taskInsert(t);
		
		if (result > 0) {
			session.setAttribute("alertMsg", "과제가 제출되었습니다!");
		} else {
			session.setAttribute("alertMsg", "과제 제출에 실패했습니다.");
		}
		
		return "student/studentBoardList";
	}
	
	@RequestMapping("myPage.st")
	public String myPage() {
		return "student/studentMyPage";
	}
	
	//이메일 인증
	@GetMapping("/mailCheck")
	@ResponseBody
	public String mailCheck(String email) {
		
		System.out.println("이메일 인증 요청이 들어옴!");
		System.out.println("이메일 인증 이메일 : " + email);
		
		return mailService.joinEmail(email);
	}
	
	// 마이페이지 내 과제 목록
	@RequestMapping("myTask.st")
	public ModelAndView myTask(ModelAndView mv, HttpSession session) {
		
		Member id = (Member)session.getAttribute("loginUser");
	    
	    ArrayList<Task> list = sService.selectMyTask(id.getId());
	    
	    mv.addObject("list", list).setViewName("student/studentMyTask");
	    
	    return mv;
	}

	/*
	 * // 마이페이지 내 과제 삭제
	 * 
	 * @RequestMapping("deleteMyTask.st")
	 * 
	 * @ResponseBody public void deleteTask(@RequestParam(value = "taskNoList[]")
	 * List<Integer> taskNoList) {
	 * 
	 * sService.deleteMyTask(taskNoList); }
	 */

	@RequestMapping("deleteMyTask.st")
	@ResponseBody
	public void deleteTask(@RequestParam(value = "collection") List<Integer> taskNoList) {
	  
	  sService.deleteMyTask(taskNoList);
	}

	
	@RequestMapping("myTest.st")
	public String myTest() {
		return "student/studentMyTestState";
	}
	
	@RequestMapping("myAttendance.st")
	public String myAttendance() {
		return "student/studentMyAttendance";
	}
}
