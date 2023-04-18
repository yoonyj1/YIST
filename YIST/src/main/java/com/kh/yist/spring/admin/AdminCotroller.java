package com.kh.yist.spring.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminCotroller {

	
	//강의
	@RequestMapping("classAdminList.ad")
	public String classAdminList() {
		return "admin/class/classListView";
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
	
	
	//공지사항
	@RequestMapping("noticeAdminList.ad")
	public String noticeAdminList() {
		return "admin/notice/noticeAdminView";
	}
	
	@RequestMapping("insert.no")
	public String InserNtotice() {
		return "admin/notice/insertNoticeForm";
	}
	
	@RequestMapping("detail.no")
	public String selectNtotice() {
		return "admin/notice/detailNotice";
	}
	
	@RequestMapping("update.no")
	public String UpdateNotice() {
		return "admin/notice/updateNoticeForm";
	}
	
	
	//수업자료
	@RequestMapping("classMaterialAdminList.ad")
	public String classMaterialAdminList() {
		return "admin/classMaterial/classMaterialListView";
	}	
	
	@RequestMapping("insert.cm")
	public String InsertClassMaterial() {
		return "admin/classMaterial/insertClassMaterialForm";
	}
	
	@RequestMapping("detail.cm")
	public String selectClassMaterial() {
		return "admin/classMaterial/detailClassMaterial";
	}
	
	@RequestMapping("update.cm")
	public String UpdateClassMaterial() {
		return "admin/classMaterial/updateClassMaterialForm";
	}
	
	//시험자료
	@RequestMapping("examMaterialAdminList.ad")
	public String examMaterialAdminList() {
		return "admin/examMaterial/examMaterialListView";
	}	
	@RequestMapping("insert.em")
	public String InserExamMaterial() {
		return "admin/examMaterial/insertExamMaterialForm";
	}
	
	@RequestMapping("detail.em")
	public String selectEtotice() {
		return "admin/examMaterial/detailExamMaterial";
	}
	
	@RequestMapping("update.em")
	public String UpdateEotice() {
		return "admin/examMaterial/updateExamMaterialForm";
	}
}
