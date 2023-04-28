package com.kh.yist.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminControllerY {
	@RequestMapping("teacherList.do")
	public String teacherListForm() {
		return "admin/instructorList";
	}
	
	@RequestMapping("studentList.do")
	public String studentListForm() {
		return "admin/studentList";
	}
	
	@RequestMapping("teacherDetail.do")
	public String teacherDetail() {
		return "admin/teacherDetail";
	}
	
	@RequestMapping("teacherDetail-lecture.do")
	public String teacherDetailLecture() {
		return "admin/teacherDetail-lecture";
	}
	
	@RequestMapping("studentDetail.do")
	public String studentDetail() {
		return "admin/studentDetail";
	}
	
	@RequestMapping("gradeView.do")
	public String gradeView() {
		return "admin/gradeView";
	}
}
