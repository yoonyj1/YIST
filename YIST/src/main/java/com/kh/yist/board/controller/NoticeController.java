package com.kh.yist.board.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.yist.board.model.service.NoticeService;
import com.kh.yist.board.model.vo.Notice;
import com.kh.yist.common.model.vo.PageInfo;
import com.kh.yist.common.template.Pagination;

@Controller
public class NoticeController {
	
	@Autowired
	private NoticeService nService;
	
	
	//admin
	
	@RequestMapping("noticeAdminList.ad")
	public ModelAndView noticeAdminList(@RequestParam(value = "page", defaultValue = "1") int currentPage, ModelAndView mv) {
		
		int listCount = nService.selectNoticeCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 5);
		
		ArrayList<Notice> list = nService.selectNoticeList(pi);
		
		mv.addObject("pi", pi).addObject("list", list).setViewName("admin/notice/noticeAdminView");
		
		return mv;
	}
	
	@RequestMapping("insert.no")
	public String InserNtotice() {
		return "admin/notice/insertNoticeForm";
	}
	
	@RequestMapping("detail.no")
	public String selectNtotice(@RequestParam(value="no") int boardNo, Model m) {
		
		Notice n = nService.selectNotice(boardNo);
		
		m.addAttribute("n", n);
		
		return "admin/notice/detailNotice";
	}
	
	@RequestMapping("updateForm.no")
	public String UpdateNotice(@RequestParam(value="no") int boardNo, Model m) {
		
		Notice n = nService.selectNotice(boardNo);
		m.addAttribute("n", n);
		
		return "admin/notice/updateNoticeForm";
	}
 
}
