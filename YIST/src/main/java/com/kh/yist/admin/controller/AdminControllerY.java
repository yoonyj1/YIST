package com.kh.yist.admin.controller;


import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.WriterException;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.kh.yist.admin.model.service.AdminServiceY;
import com.kh.yist.common.model.vo.PageInfo;
import com.kh.yist.common.template.Pagination;
import com.kh.yist.member.model.vo.Member;

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
		
		ArrayList<Member> nullList = aService.selectNullTeacherList(pi);
		
		
		mv.addObject("pi", pi).addObject("list", list).addObject("nList", nullList).setViewName("admin/instructorList");
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
	public ModelAndView studentListForm(ModelAndView mv) {
		
		ArrayList<Member> list = aService.selectJavaStudentList();
		ArrayList<Member> pList = aService.selectPythonStudentList();
		ArrayList<Member> cList = aService.selectCStudentList();
		
		mv.addObject("list", list).addObject("pList", pList).addObject("cList", cList).setViewName("admin/studentList");
		
		return mv;
	}
	
	@RequestMapping("teacherDetail.do")
	public String teacherDetail(String id, String subject, Model model) {
		Member m = aService.selectTeacher(id);
				
		model.addAttribute("td", m);
		
		return "admin/teacherDetail";
	}
	
	@RequestMapping("changeTeacherInfo.do")
	public String updateTeacherInfo(Member m, HttpSession session) {
		int result = aService.updateTeacherInfo(m);
		
		
		if(result > 0) {
			session.setAttribute("td", aService.selectTeacher(m.getId()));
			
			
			return "redirect:teacherDetail.do?id=" + m.getId();
		} else {
			session.setAttribute("alertMsg", "입력한 정보를 다시 확인해주세요.");
			
			return "redirect:teacherDetail.do?id=" + m.getId();
		}
		
	}
	
	@RequestMapping("teacherDetail-lecture.do")
	public String teacherDetailLecture(String id, String subject, Model model) {
		Member teacherInfo = aService.selectTeacher(id);
		
		model.addAttribute("t", teacherInfo);
		
		System.out.println(subject);
		ArrayList<Member> studentList = aService.selectStudentList(subject);
		model.addAttribute("s", studentList);
		
		return "admin/teacherDetail-lecture";
	}
	
	@RequestMapping("studentDetail.do")
	public String studentDetail(String id, Model model) {
		Member m = aService.selectStudent(id);
		
		model.addAttribute("sd", m);
		
		return "admin/studentDetail";
	}
	
	@RequestMapping("gradeView.do")
	public String gradeView() {
		return "admin/gradeView";
	}
	
	@RequestMapping("deleteStudent.do")
	public String deleteStudent(String id) {
		int result = aService.deleteStudent(id);
		
		
		if(result > 0) {
			return "redirect:studentList.do";
		} else {
			return "redirect:studentList.do";
		}
		
	}
	
	@RequestMapping("updateAttendanceForm.do")
	public String updateAttForm(String id) {
		
		return "admin/updateAttendance";
	}
	
	@RequestMapping("updateStudent.do")
	public String updateStudentInfo(Member m, HttpSession session) {
		int result = aService.updateStudentInfo(m);
		
		System.out.println(m.getId());
		
		if(result > 0) {
			session.setAttribute("td", aService.selectStudent(m.getId()));
			
			
			return "redirect:studentDetail.do?id="+m.getId();
		} else {
			return "redirect:studentList";
		}
		
	}
	
	@RequestMapping("test.qr")
	public Object createQr(@RequestParam String url) throws WriterException, IOException {
        int width = 200;
        int height = 200;
        BitMatrix matrix = new MultiFormatWriter().encode(url, BarcodeFormat.QR_CODE, width, height);
 
        try (ByteArrayOutputStream out = new ByteArrayOutputStream();) {
            MatrixToImageWriter.writeToStream(matrix, "PNG", out);
            return ResponseEntity.ok()
                    .contentType(MediaType.IMAGE_PNG)
                    .body(out.toByteArray());
        }
    }
	
	@RequestMapping("result.att")
	public String resultAt(String id) {
	System.out.println(id);
	  int result = aService.resultAt(id);
	  
	  if(result > 0) {
		  System.out.println("성공? " + result);
		  return "redirect:/";
	  }
	  System.out.println(result);
	  return "redirect:/";
	}
	
	@RequestMapping("adminLogout.do")
	public String adminLogout(HttpSession session) {
		session.invalidate();
		
		return "redirect:/";
	}
    
}
