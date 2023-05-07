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
	
	@RequestMapping("insertForm.no")
	public String inserNoticeForm() {
		return "admin/notice/insertNoticeForm";
	}
	
	@RequestMapping("insert.no")
	public String insertNotice(Notice n, HttpSession session, MultipartFile upfile) {
		
		
		if(!upfile.getOriginalFilename().equals("")) {

			String changeName = saveFile(upfile,session);
			n.setOriginName(upfile.getOriginalFilename());
			n.setChangeName("resources/noticeUploadFiles/" + changeName);
		}
		
		
		int result = nService.insertNotice(n);
		
		if(result>0) {
			
			session.setAttribute("alertMsg", "공지사항 등록 성공!");
			
		}else {
			
			session.setAttribute("alertMsg", "공지사항 등록 실패!");
			
		}
		
		return "redirect:noticeAdminList.ad";

	}
	
	@RequestMapping("detail.no")
	public String selectNtotice(@RequestParam(value="no") int boardNo, Model m, HttpSession session) {
		
		
		int result = nService.increaseCount(boardNo);
		
		
		if(result>0) {
		
			Notice n = nService.selectNotice(boardNo);
			m.addAttribute("n", n);
			return "admin/notice/detailNotice";
			
		}else {
			
			session.setAttribute("alertMsg", "해당 공지사항 조회에 실패했습니다!");
			return "redirect:noticeAdminList.ad";
		}
		
		
		
		
		
	}
	
	@RequestMapping("updateForm.no")
	public String UpdateNotice(@RequestParam(value="no") int boardNo, Model m) {
		
		Notice n = nService.selectNotice(boardNo);
		m.addAttribute("n", n);
		
		return "admin/notice/updateNoticeForm";
	}
	
	
	public String saveFile(MultipartFile upfile, HttpSession session) {
		

		String originName = upfile.getOriginalFilename();

		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());

		int ranNum = (int) (Math.random() * 90000 + 10000);

		String ext = originName.substring(originName.lastIndexOf("."));

		String changeName = currentTime + ranNum + ext;

		String savePath = session.getServletContext().getRealPath("/resources/noticeUploadFiles/");

		try {
		    upfile.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException e1) {
		    e1.printStackTrace();
		} catch (IOException e2) {
		    e2.printStackTrace();
		}


		return changeName;
	}	
	
	@RequestMapping("update.no")
	public String updateBoard(Notice n, MultipartFile reupfile, HttpSession session) {
		
		if(!reupfile.getOriginalFilename().equals("")) {
			// 새로 넘어온 첨부파일이 있을 경우
			
			if(n.getOriginName() != null) {
				// 기존 첨부파일 있는 경우 : 기존 첨부파일 삭제
				new File( session.getServletContext().getRealPath(n.getChangeName()) ).delete();
			}
			
			// 새 첨부파일 서버 업로드
			String changeName = saveFile(reupfile, session);
			
			n.setOriginName(reupfile.getOriginalFilename());
			n.setChangeName("resources/noticeUploadFiles/"+changeName);
			
			
		}


		int result = nService.updateNotice(n);
		
		if(result>0) {
			
			session.setAttribute("alertMsg", "공지사항 수정에 성공했습니다!");
			
		}else {
			
			session.setAttribute("alertMsg", "공지사항 수정에 실패했습니다!");
		}
		
		return "redirect:update.no?no="+n.getBoardNo();
		
	}	
	
	@RequestMapping("delete.no")
	public String deleteNotice(String boardNo, String originName, String changeName,  MultipartFile upfile, HttpSession session) {
		
		int bNo = Integer.parseInt(boardNo);
		
		
		Notice n = nService.selectNotice(bNo);
		
		if(originName != null && !originName.isEmpty()) {

			new File( session.getServletContext().getRealPath(changeName) ).delete();
			
		}
		
		int result = nService.deleteNotice(bNo);
		
		if(result>0) {
			
			session.setAttribute("alertMsg", "공지사항 삭제 성공!");
			
			
		}else {
			
			session.setAttribute("alertMsg", "공지사항 삭제에 실패했습니다!");
			
		}
		
		return "redirect:noticeAdminList.ad";
		
	}
	
	@ResponseBody
	@RequestMapping("ajaxDelete.no")
	public String ajaxDeleteNotice(@RequestParam("boardNoArr[]") List<String> boardNo) {
	
		int result = nService.deleteNotice(boardNo);
		
		if(result>0) {
			
			return "YYYY";
					
		}else {
			
			return "YYYN";
			
		}
		
	}
	
	@RequestMapping("search.no")
	public String selectSearch(String condition, String keyword,@RequestParam(value = "page", defaultValue = "1") int currentPage, ModelAndView mv) {
		
		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("condition",condition);
		map.put("keyword", keyword);
		
		int listCount = nService.selectSearchCount(map);
		
		return "";
		
	}
}
