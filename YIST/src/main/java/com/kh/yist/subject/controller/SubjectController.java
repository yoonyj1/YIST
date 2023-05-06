package com.kh.yist.subject.controller;

import java.net.http.HttpRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
		
		String subject = String.valueOf(sNo);
		
		ArrayList<Member> iList = mService.selectInstructorList();
		Member i = mService.selectInstructor(subject);
		
		m.addAttribute("s", s);
		m.addAttribute("iList", iList);
		m.addAttribute("i", i);
		
		return "admin/class/updateClassForm";
	}
	
	
	@RequestMapping("update.cl")
	public String updateClass(Subject s, String id, String instructorId, HttpSession session) {
		
		System.out.println(s);
		int result = sService.updateSubject(s);
		int deleteFlag = 1;
		int updateFlag = 1;
		
		
		Member i = new Member();
		i.setId(id);
		i.setSubject(String.valueOf(s.getSubjectNo()));
		
		if(!id.equals(instructorId)) {
			
			int deleteResult = mService.deleteInstructor(instructorId);
			
				if(deleteResult>0) {
					deleteFlag = 1;
				}else {
					deleteFlag = 0;
				}
			
			int updateResult = mService.updateInstructor(i);
			
				if(updateResult>0) {
					updateFlag = 1;
				}else {
					updateFlag = 0;
				}
		}
		
		if(result>0 && deleteFlag>0 && updateFlag>0 ) {
			session.setAttribute("alertMsg", "강의 수정이 성공했습니다");
		}else {
			session.setAttribute("alertMsg", "강의 수정이 실패했습니다");
		}
		
		return "redirect:updateForm.cl?sNo="+s.getSubjectNo();
		
	}
	
	
	
	@RequestMapping("insertForm.cl")
	public String insertClassForm(Model m){
		
		ArrayList<Class> cList = sService.selectClassList();
		ArrayList<Member> iList = mService.selectInstructorList();

		m.addAttribute("cList", cList);
		m.addAttribute("iList",iList);
		
		return "admin/class/insertClassForm";
	}
	
	@RequestMapping("insertSubject.cl")
	public String insertSubject(Subject s, HttpServletRequest request, HttpSession session) {
		
		
		String id = request.getParameter("id");
		
		int result = sService.insertSubject(s);
		
		int subject= sService.selectCurrval();
		
		Member i = new Member();
		i.setId(id);
		i.setSubject(String.valueOf(subject));		
		
		
		
		int iResult = mService.updateInstructor(i);

		if(result>0 && iResult>0) {
			session.setAttribute("alertMsg", "강의 등록 성공!");
			
		}else {
			session.setAttribute("alertMsg", "강의 등록 실패!");
		}
		
		return "redirect:classAdminList.ad";
		
	}
	
	@RequestMapping("delete.cl")
	public String deleteClassForm(String subjectNo, HttpSession session){
		
		int sNo = Integer.parseInt(subjectNo);
		
		
		int result = sService.deleteSubject(sNo);
		
		if(result>0) {
			
			session.setAttribute("alertMsg", "강의 삭제 성공!");
			
		}else {
			
			session.setAttribute("alertMsg", "강의 삭제 실패!");
		}
		
		return "redirect:classAdminList.ad";
	}
	
	@RequestMapping("detail.cl")
	public String selectClass(int sNo, Model m) {
		
		Subject s = sService.selectSubject(sNo);
		
		
		m.addAttribute("s", s);
		
		return "admin/class/detailClass";
	}
	
	@ResponseBody
	@RequestMapping("ajaxDelete.cl")
	public String ajaxDeleteClass(@RequestParam("classNoArr[]") List<String> subjectNo) {
	
		int result = sService.deleteSubject(subjectNo);
		if(result>0) {
			
			return "YYYY";
			
		}else {
			
			return "NNNN";

		}
		
	}
	
	@RequestMapping("search.cl")
	public ModelAndView selectSearch(String condition, String keyword,@RequestParam(value = "page", defaultValue = "1") int currentPage, ModelAndView mv) {
		
		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("condition",condition);
		map.put("keyword", keyword);
		
		int listCount = sService.selectSearchCount(map);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 5);
		
		ArrayList<Subject> list = sService.selectSearchList(map, pi);
		
		mv.addObject("list", list);
		mv.addObject("condition",condition);
		mv.addObject("keyword", keyword);
		mv.addObject("pi", pi).setViewName("admin/class/classListView");
		
		return mv;
	}

}
