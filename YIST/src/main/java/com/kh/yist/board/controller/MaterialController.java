package com.kh.yist.board.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.yist.board.model.service.MaterialService;
import com.kh.yist.board.model.vo.Notice;
import com.kh.yist.common.model.vo.PageInfo;
import com.kh.yist.common.template.Pagination;
import com.kh.yist.student.model.vo.Material;

@Controller
public class MaterialController {
	
	@Autowired
	private MaterialService mService;
	
	//수업자료
	@RequestMapping("classMaterialAdminList.ad")
	public ModelAndView classMaterialAdminList(@RequestParam(value = "page", defaultValue = "1") int currentPage, ModelAndView mv) {
		
		int listCount = mService.selectMaterialCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 5);
		
		ArrayList<Material> list = mService.selectMaterialList(pi);
		
		mv.addObject("list", list).addObject("pi", pi);
		mv.setViewName("admin/classMaterial/classMaterialListView");
		
		
		return mv;
	}	
	
	@RequestMapping("search.cm")
	public ModelAndView selectSearch(String condition, String keyword, @RequestParam(value = "page", defaultValue = "1") int currentPage, ModelAndView mv) {
		
		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("condition", condition);
		map.put("keyword", keyword);
		
		int listCount = mService.selectSearchCount(map);
		
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 5);
		
		ArrayList<Material> list = mService.selectSearchList(map, pi);
		
		mv.addObject("list", list);
		mv.addObject("condition", condition);
		mv.addObject("keyword", keyword);
		mv.addObject("pi", pi);
		
		mv.setViewName("admin/classMaterial/classMaterialListView");
		
		return mv;
		
		
	}
	
	@RequestMapping("insertForm.cm")
	public String insertClassMaterialForm() {
		return "admin/classMaterial/insertClassMaterialForm";
	}
	
	@RequestMapping("insert.cm")
	public String insertClass(Material m, MultipartFile upfile, HttpSession session) {
		
		if(!upfile.getOriginalFilename().equals("")) {
			
			String changeName = saveFile(upfile, session);
			
			m.setOriginName(upfile.getOriginalFilename());
			m.setChangeName("resources/materialUploadFiles/"+changeName);
			
		}
		
		int result = mService.insertMaterial(m);
		
		if(result > 0) {
			
			session.setAttribute("alertMsg", "학습자료 등록 성공!");
			
		}else{

			session.setAttribute("alertMsg", "학습자료 등록 성공!");
			
		}
		
		return "redirect:classMaterialAdminList.ad";
		
	}
	
	
	
	@RequestMapping("detail.cm")
	public String selectClassMaterial(@RequestParam(value="no") int boardNo, Model model, HttpSession session) {
		
		int result = mService.increaseCount(boardNo);
		
		if(result>0) {

			Material m = mService.selectMaterial(boardNo);
			model.addAttribute("m", m);
			return "admin/classMaterial/detailClassMaterial";
		
		}else {
			
			session.setAttribute("alertMsg", "해당 학습자료 조회에 실패했습니다");
			return "redirect:classMaterialAdminList.ad";
			
		}
	}
	
	
	@RequestMapping("updateForm.cm")
	public String UpdateClassMaterialForm() {
		return "admin/classMaterial/updateClassMaterialForm";
	}	
	
	@RequestMapping("update.cm")
	public String UpdateClassMaterial(Material m, MultipartFile reupfile, HttpSession session) {
		
		if(!reupfile.getOriginalFilename().equals("")) {
			
			if(m.getOriginName()!=null) {
				
			}
			
			
		}
		
		
		return "admin/classMaterial/updateClassMaterialForm";
		
		
	}		
	
	
	
	
	
	
	public String saveFile(MultipartFile upfile, HttpSession session) {
		

		String originName = upfile.getOriginalFilename();

		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());

		int ranNum = (int) (Math.random() * 90000 + 10000);

		String ext = originName.substring(originName.lastIndexOf("."));

		String changeName = currentTime + ranNum + ext;

		String savePath = session.getServletContext().getRealPath("/resources/materialUploadFiles/");

		try {
		    upfile.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException e1) {
		    e1.printStackTrace();
		} catch (IOException e2) {
		    e2.printStackTrace();
		}


		return changeName;
	}
	
	
}
