package com.kh.yist.board.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.yist.board.model.service.ExamMaterialService;
import com.kh.yist.board.model.vo.ExamMaterial;
import com.kh.yist.common.model.vo.PageInfo;
import com.kh.yist.common.template.Pagination;
import com.kh.yist.student.model.vo.Material;

@Controller
public class ExamMaterialController {
	
	@Autowired
	private ExamMaterialService eService;

	//시험자료
	
	@RequestMapping("examMaterialAdminList.ad")
	public ModelAndView examMaterialAdminList(@RequestParam(value="page", defaultValue = "1")int currentPage, ModelAndView mv) {
		
		int listCount = eService.selectExamMaterialCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 5);
		
		ArrayList<ExamMaterial> list = eService.selectExamMaterialList(pi);
		
		mv.addObject("pi", pi).addObject("list", list);
		
		mv.setViewName("admin/examMaterial/examMaterialListView");
		
		return mv;
	}	
	
	
	@RequestMapping("search.em")
	public ModelAndView selectSearch(String condition, String keyword, @RequestParam(value="page", defaultValue = "1")int currentPage, ModelAndView mv) {
		
		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("condition", condition);
		
		map.put("keyword", keyword);
		
		int listCount = eService.selectSearchCount(map);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 5);
		
		ArrayList<ExamMaterial> list = eService.selectSearchList(map, pi);
		
		mv.addObject("keyword", keyword);
		mv.addObject("condition", condition);
		mv.addObject("pi", pi);
		mv.addObject("list", list);
		
		mv.setViewName("admin/examMaterial/examMaterialListView");
		
		return mv;
		
		
	}
	
	@RequestMapping("detail.em")
	public String selectExamMaterial(@RequestParam(value = "no")int boardNo, Model m, HttpSession session) {
		
		ExamMaterial em = eService.selectMaterial(boardNo);
		
		if(em != null) {
			
			m.addAttribute("em", em);			
			return "admin/examMaterial/detailExamMaterial";
			
		}else {
			
			session.setAttribute("alertMsg", "해당 게시글 조회에 실패했습니다.");
			return "redirect:examMaterialAdminList.ad";
		}
		
	}
	
	@RequestMapping("insertForm.em")
	public String inserFormExamMaterial() {
		
		return "admin/examMaterial/insertExamMaterialForm";
	}
	
	
	@RequestMapping("insert.em")
	public String insertExamMaterial(ExamMaterial em, HttpSession session, MultipartFile upfile) {
		
		
		if(!upfile.getOriginalFilename().equals("")) {
			
			String changeName = saveFile(upfile, session);
			
			em.setOriginName(upfile.getOriginalFilename());
			
			em.setChangeName(changeName);
			
		}

		
		int result = eService.insertExamMaterial(em);
		
		if(result > 0) {
			
			session.setAttribute("alertMsg", "자료 등록 성공!");
			
		}else {
			
			session.setAttribute("alertMsg", "자료 등록 실패!");
			
		}
		
		return "redirect:examMaterialAdminList.ad";
		
	}
		
	
	
	
	@RequestMapping("updateForm.em")
	public String updateFormExamMaterial(@RequestParam(value = "no")int boardNo, Model m) {
		
		ExamMaterial em = eService.selectMaterial(boardNo);
		
		m.addAttribute("em", em);
		
		return "admin/examMaterial/updateExamMaterialForm";
	}

	
	@RequestMapping("update.em")
	public String updateExamMaterial(ExamMaterial em, MultipartFile reupfile, HttpSession session) {
		
		
		
		if(reupfile != null && !reupfile.getOriginalFilename().equals("")) {
			
			if(em.getOriginName() != null) {
				
				new File(session.getServletContext().getRealPath(em.getChangeName())).delete();

			}
			
			String changeName = saveFile(reupfile, session);
			
			em.setOriginName(reupfile.getOriginalFilename());
			
			em.setChangeName("resources/materialUploadFiles/" + changeName);
			
		}
		
		
		int result = eService.updateExamMaterial(em);
		
		if(result > 0) {
			
			session.setAttribute("alertMsg", "게시글 수정에 성공했습니다");
			
		}else {
			
			session.setAttribute("alertMsg", "게시글 수정에 실패했습니다");
			
		}
		
		return "redirect:detail.em?no=" + em.getBoardNo();
		
	}
	
	
	
	public String saveFile(MultipartFile upfile, HttpSession session) {
		
		String originName = upfile.getOriginalFilename();
		
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		
		int ranNum = (int)( Math.random() * 90000 + 10000 );
		
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
	
	
	@RequestMapping("delete.em")
	public String deleteExamMaterial(String boardNo, String originName, String changeName, MultipartFile upfile, HttpSession session) {
		
		int bNo = Integer.parseInt(boardNo);
		
		
		if(originName != null && !originName.isEmpty()) {

			new File( session.getServletContext().getRealPath(changeName) ).delete();
			
		}
		
		int result = eService.deleteExamMaterial(bNo);
		
		if(result > 0) {
			
			session.setAttribute("alertMsg", "게시글 삭제에 성공했습니다!");
			
		}else {
			
			session.setAttribute("alertMsg", "게시글 삭제에 실패했습니다!");
			
		}
		
		return "redirect:examMaterialAdminList.ad";
		
	}
	
	
	@ResponseBody
	@RequestMapping("ajaxDelete.em")
	public String ajaxDeleteExamMaterial(@RequestParam("boardNoArr[]") List<String> boardNo, HttpSession session, MultipartFile upfile) {
		
		for(String b : boardNo) {
			
			int bNo = Integer.parseInt(b);
			
			ExamMaterial em = eService.selectMaterial(bNo);
			
			String originName = em.getOriginName();
			String changeName = em.getChangeName();
			
			if(originName != null && !originName.isEmpty()) {
				new File(session.getServletContext().getRealPath(changeName)).delete();
			}
			
			int result = eService.deleteExamMaterial(bNo);
			
			if(result <= 0) {
				return "YYYN";
			}
			
			
		}
		
		return "YYYY";
		
	}
	
	
	
}
