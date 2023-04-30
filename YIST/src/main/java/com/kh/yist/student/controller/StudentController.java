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

@Controller
public class StudentController {
	
	@Autowired
	private StudentService sService;

	@RequestMapping("main.st")
	public String main() {
		return "student/studentMain";
	}
	
	@RequestMapping("testList.st")
	public String testList() {
		return "student/studentTestList";
	}
	
	@RequestMapping("certificate.st")
	public String certificate() {
		return "student/studentCertificate";
	}
	
	/*
	 * @RequestMapping("noticeList.st") public String noticeList() { return
	 * "student/studentNoticeList"; }
	 */
	@RequestMapping("noticeList.st")
	public ModelAndView noticeList(@RequestParam(value = "cpage", defaultValue = "1") int currentPage, ModelAndView mv) {
		
		int listCount = sService.noticeListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		
		ArrayList<Notice> list = sService.selectList(pi);
		
		mv.addObject("pi", pi).addObject("list", list).setViewName("student/studentNoticeList");
		
		return mv;
	}
	
	@RequestMapping("videoList.st")
	public String videoList() {
		return "student/studentVideoList";
	}
	
	@RequestMapping("boardList.st")
	public String boardList() {
		return "student/studentBoardList";
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
