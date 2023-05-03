package com.kh.yist.admin.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.yist.admin.model.service.AdminServiceY;
import com.kh.yist.common.model.vo.PageInfo;
import com.kh.yist.common.template.Pagination;
import com.kh.yist.member.model.vo.Member;
import com.sun.tools.javac.util.List;

@Controller
public class AdminControllerY {
	
	@Autowired
	private AdminServiceY aService; 
	
	@RequestMapping("teacherList.do")
	public ModelAndView teacherListForm(@RequestParam(value="cpage", defaultValue="1") int currentPage, ModelAndView mv) {
		int listCount = aService.selectListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 5);
		
		// 전체 강사 목록 조회
		ArrayList<Member> list = aService.selectList(pi);
		
		// 강의가 배정되지 않은 강사 목록 조회
		ArrayList<Member> nonSubjectList = aService.selectNonSubjectList();
		
		mv.addObject("pi", pi).addObject("list", list).addObject("nonSubjectList", nonSubjectList).setViewName("admin/instructorList");
		return mv;
	}
	
	@ResponseBody
	@RequestMapping("checkDelete.ins")
	public int checkDeleteInstructor(HttpServletRequest request) {
		
		String[] valueArr = request.getParameterValues("valueArr");
		
		System.out.println(valueArr);
		
		int size = valueArr.length;
		
		System.out.println(size);
		
		int result = 0;
		for(int i = 0; i < size; i++) { 
			result = aService.checkDeleteInstuctor(valueArr[i]);
		 	
		 	System.out.println(valueArr[i]);
		 }
		
		return result;
	}
	
	@RequestMapping("studentList.do")
	public String studentListForm(@RequestParam(value="cpage", defaultValue="1") int currentPage, ModelAndView mv) {
		int listCount = aService.selectStudentListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		
		ArrayList<Member> list = aService.selectStudentList(pi);
		
		return "admin/studentList";
	}
	
	@RequestMapping("teacherDetail.do")
	public String teacherDetail(String id, Model model) {
		Member m = aService.selectTeacher(id);
				
		model.addAttribute("td", m);
		
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
