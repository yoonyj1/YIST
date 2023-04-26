package com.kh.yist.student.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.yist.student.model.service.StudentService;

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
	
	@RequestMapping("noticeList.st")
	public String noticeList() {
		return "student/studentNoticeList";
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
