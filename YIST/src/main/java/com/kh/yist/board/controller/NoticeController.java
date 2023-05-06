package com.kh.yist.board.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
		
		System.out.println(n);
		
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
	
	
	public String saveFile(MultipartFile upfile, HttpSession session) {
		
		// 파일명 수정 ("origin.jpg" -> "yyyyMMddHHmmss"+"랜덤숫자5개".jpg)

		// 원본 파일의 이름
		String originName = upfile.getOriginalFilename();

		// 현재 시간
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());

		// 난수 생성
		int ranNum = (int) (Math.random() * 90000 + 10000);

		// 확장자
		String ext = originName.substring(originName.lastIndexOf("."));

		String changeName = currentTime + ranNum + ext;

		// 서버 업로드

		// 업로드할 폴더의 물리적인 경로 찾기

		String savePath = session.getServletContext().getRealPath("/resources/noticeUploadFiles/");
		// getRealPath(/resources/uploadFiles/) 폴더 안에 저장해야하니까 마지막 / 꼭 쓰기

		// 서버에 업로드
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
