package com.kh.yist.subject.controller;

import java.net.http.HttpRequest;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.yist.common.model.vo.PageInfo;
import com.kh.yist.common.template.Pagination;
import com.kh.yist.member.model.service.MemberService;
import com.kh.yist.member.model.vo.Member;
import com.kh.yist.subject.model.service.SubjectService;
import com.kh.yist.subject.model.vo.Class;
import com.kh.yist.subject.model.vo.Subject;

@Controller
public class SubjectController {
	
	@Autowired
	private SubjectService sService;
	
	@Autowired
	private MemberService mService;
	
	//강의
	@RequestMapping("classAdminList.ad")
	public ModelAndView classAdminList(@RequestParam(value = "page", defaultValue = "1") int currentPage, ModelAndView mv) {
		
		int listCount = sService.selectSubjectListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 5);
		
		ArrayList<Subject> list = sService.selectSubjectList(pi);
		
		mv.addObject("pi", pi).addObject("list", list).setViewName("admin/class/classListView");
		
		return mv;
	}
	
	@RequestMapping("updateForm.cl")
	public String updateClassForm(int sNo, Model m) {
		
		Subject s = sService.selectSubject(sNo);
		
		m.addAttribute("s", s);
		return "admin/class/updateClassForm";
	}
	
	@RequestMapping("insertForm.cl")
	public String insertClassForm(Model m){
		
		ArrayList<Class> cList = sService.selectClassList();
		ArrayList<Member> aList = mService.selectInstructorList();
		
		m.addAttribute("cList", cList);
		m.addAttribute("aList",aList);
		
		return "admin/class/insertClassForm";
	}
	
	@RequestMapping("insertSubject.cl")
	public String insertSubject(Subject s, HttpServletRequest request, Model m) {
		
				
		System.out.println(s);
		
		String id = request.getParameter("id");
		
		System.out.println(id);
		
		
		int result = sService.insertSubject(s);
		int subjectNo = s.getSubjectNo()();
		int iResult = mService.updateInstructor(id, subjectNo);

		if(result>0 && iResult>0) {
			
			m.addAttribute("alertMsg", "강의 등록 성공!");
			
		}else {
			m.addAttribute("alertMsg", "강의 등록 실패!");
		}
		
		return "admin/class/classListView";
		
	}
	
	@RequestMapping("delete.cl")
	public String deleteClassForm(){
		return "admin/class/deleteClassForm";
	}
	
	@RequestMapping("detail.cl")
	public String selectClass(int sNo, Model m) {
		
		Subject s = sService.selectSubject(sNo);
		
		
		m.addAttribute("s", s);
		
		return "admin/class/detailClass";
	}
	
	
	

}
