package com.kh.yist.student.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.yist.common.model.vo.PageInfo;
import com.kh.yist.common.template.Pagination;
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
import com.kh.yist.student.model.vo.Material;
import com.kh.yist.student.model.vo.Notice;
import com.kh.yist.student.model.vo.QnA;
import com.kh.yist.student.model.vo.Task;

@Controller
public class StudentController {
	
	@Autowired
	private StudentService sService;

	@RequestMapping("main.st")
	public String main() {
		return "student/studentMain";
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
	public String testDetail(@RequestParam(value="eno") int examNo, Model model) {
		
		Exam e = sService.testDetail(examNo);
		
		model.addAttribute("e", e);

		return "student/studentTestDetail";
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
	
	// 우리반 게시판 Q&A 목록 조회
	@ResponseBody
	@RequestMapping(value = "qnaList.st", produces = "application/json; charset=UTF-8")
	public String qnaList() {
		
		ArrayList<QnA> list = sService.qnaList();

		return new Gson().toJson(list);
	}
	
	@RequestMapping("myPage.st")
	public String myPage() {
		return "student/studentMyPage";
	}
	
	@RequestMapping("myTask.st")
	public String myTask() {
		return "student/studentMyTask";
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
