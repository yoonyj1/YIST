package com.kh.yist.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminCotroller {

	

	

	
	
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
