package com.kh.yist.subject.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.yist.common.model.vo.PageInfo;
import com.kh.yist.common.template.Pagination;
import com.kh.yist.subject.model.service.SubjectService;
import com.kh.yist.subject.model.vo.Subject;

@Controller
public class SubjectController {
	
	@Autowired
	private SubjectService sService;
	
	//강의
	@RequestMapping("classAdminList.ad")
	public ModelAndView classAdminList(@RequestParam(value = "page", defaultValue = "1") int currentPage, ModelAndView mv) {
		
		int listCount = sService.selectSubjectListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 5);
		
		ArrayList<Subject> list = sService.selectSubjectList(pi);
		System.out.println(pi);
		System.out.println(list);
		
		mv.addObject("pi", pi).addObject("list", list).setViewName("admin/class/classListView");
		
		return mv;
	}
	
	@RequestMapping("update.cl")
	public String updateClassForm() {
		return "admin/class/updateClassForm";
	}
	
	@RequestMapping("insert.cl")
	public String insertClassForm(){
		return "admin/class/insertClassForm";
	}
	
	@RequestMapping("delete.cl")
	public String deleteClassForm(){
		return "admin/class/deleteClassForm";
	}
	
	@RequestMapping("detail.cl")
	public String selectClass() {
		return "admin/class/detailClass";
	}
	

}
