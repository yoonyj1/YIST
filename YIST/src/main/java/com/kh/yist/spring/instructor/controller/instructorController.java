package com.kh.yist.spring.instructor.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kh.yist.spring.instructor.model.service.TaskService;
import com.kh.yist.spring.instructor.model.vo.Task;
import com.kh.yist.spring.member.model.vo.Member;

@Controller
public class instructorController {
	
	@Autowired
	private TaskService tService;
	
	@RequestMapping("taskForm.ins")
	public String taskForm() {
		return "instructor/taskForm";
	}
	
	@RequestMapping("detail.task")
	public String detailTask() {
		return "instructor/detailTaskForm";
	}
	
	@RequestMapping("examForm.ins")
	public String examForm() {
		return "instructor/examForm";
	}
	
	@RequestMapping("gradeForm.ins")
	public String Calendar() {
		return "instructor/calendarForm";
	}
	
	@RequestMapping(value="insert.task")
	public String insertTask(Task task,  MultipartFile upfile, HttpSession session, Model model) {
		
		// 넘어온 과제 정보 
		System.out.println(task);
		
		if (!upfile.getOriginalFilename().equals("")) {
			
			String changeName = saveFile(upfile, session);
			
			task.setOriginName(upfile.getOriginalFilename());
			task.setChangeName("resources/uploadFiles/" + changeName);

		}
		
		int insetTask =  tService.insertTask(task); 
		int result = 0;
		
		if (insetTask > 0) {
			result = tService.insertTaskFile(task);
		}
		if (result > 0) { // 성공 => 게시글 리스트 페이지 url 재요청 ("list.bo")
			session.setAttribute("alertMsg", "성공적으로 게시글이 등록되었습니다.");
			return "redirect:taskForm.ins";
		} else { // 실패 => 에러페이지 포워딩
			//model.addAttribute("errorMsg", "게시글 등록 실패");
			//return "common/errorPage";
			System.out.println("과제등록 실패");
		}
		
		return "";
	}
	
	// 현재 넘어온 첨부파일 그 자체를 서버의 폴더에 저장시키는 역할
	public String saveFile(MultipartFile upfile, HttpSession session) {
		// 파일명 수정 작업 후 서버에 업로드 시키기 ("flower.png" => "20230331101866666.png") 년월시분초 +
		// 랜덤5자리 + .확장자
		String originName = upfile.getOriginalFilename(); // flower.png

		// "20230331101855" (년월일시분초)
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());

		// 랜덤한 숫자 5자리
		int ranNum = (int) (Math.random() * 90000 + 10000); // 10000 ~ 99999 사이

		// 확장자
		String ext = originName.substring(originName.lastIndexOf("."));

		// 최종 수정명
		String changeName = currentTime + ranNum + ext;

		// 업로드 시키고자 하는 폴더의 물리적인 경로를 알아내기
		String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/");

		// 서버에 파일을 업로드
		try {
			upfile.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return changeName;
	}
	
}
