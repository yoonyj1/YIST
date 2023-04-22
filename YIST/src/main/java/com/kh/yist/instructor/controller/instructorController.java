package com.kh.yist.instructor.controller;

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

import com.kh.yist.task.model.service.TaskService;
import com.kh.yist.task.model.vo.Task;
import com.kh.yist.member.model.vo.Member;

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
	
	@RequestMapping("studentForm.ins")
	public String studentForm() {
		return "instructor/studentForm";
	}
	
	@RequestMapping("main.ins")
	public String main() {
		return "instructor/main";
	}
	
	@RequestMapping("yistcheck.ins")
	public String yistcheck() {
		return "instructor/yistcheck";
	}
	
	@RequestMapping("teacher.ins")
	public String teacher() {
		return "instructor/teacher";
	}
	
	@RequestMapping("login.ins")
	public String login() {
		return "instructor/LOGIN";
	}
	
	@RequestMapping(value="insert.task")
	public String insertTask(Task task,  MultipartFile upfile, HttpSession session, Model model) {
		
		// �꽆�뼱�삩 怨쇱젣 �젙蹂� 
		System.out.println(task);
		
		if (!upfile.getOriginalFilename().equals("")) {
			
			String changeName = saveFile(upfile, session);
			
			task.setOriginName(upfile.getOriginalFilename());
			task.setChangeName("resources/uploadFiles/" + changeName);

		}
		
		int insertTask =  tService.insertTask(task); 
		int result = 0;
		
		if (insertTask > 0) {
			result = tService.insertTaskFile(task);
		}
		if (result > 0) { // �꽦怨� => 寃뚯떆湲� 由ъ뒪�듃 �럹�씠吏� url �옱�슂泥� ("list.bo")
			session.setAttribute("alertMsg", "�꽦怨듭쟻�쑝濡� 寃뚯떆湲��씠 �벑濡앸릺�뿀�뒿�땲�떎.");
			return "redirect:taskForm.ins";
		} else { // �떎�뙣 => �뿉�윭�럹�씠吏� �룷�썙�뵫
			//model.addAttribute("errorMsg", "寃뚯떆湲� �벑濡� �떎�뙣");
			//return "common/errorPage";
			System.out.println("怨쇱젣�벑濡� �떎�뙣");
		}
		
		return "";
	}
	
	// �쁽�옱 �꽆�뼱�삩 泥⑤��뙆�씪 洹� �옄泥대�� �꽌踰꾩쓽 �뤃�뜑�뿉 ���옣�떆�궎�뒗 �뿭�븷
	public String saveFile(MultipartFile upfile, HttpSession session) {
		// �뙆�씪紐� �닔�젙 �옉�뾽 �썑 �꽌踰꾩뿉 �뾽濡쒕뱶 �떆�궎湲� ("flower.png" => "20230331101866666.png") �뀈�썡�떆遺꾩큹 +
		// �옖�뜡5�옄由� + .�솗�옣�옄
		String originName = upfile.getOriginalFilename(); // flower.png

		// "20230331101855" (�뀈�썡�씪�떆遺꾩큹)
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());

		// �옖�뜡�븳 �닽�옄 5�옄由�
		int ranNum = (int) (Math.random() * 90000 + 10000); // 10000 ~ 99999 �궗�씠

		// �솗�옣�옄
		String ext = originName.substring(originName.lastIndexOf("."));

		// 理쒖쥌 �닔�젙紐�
		String changeName = currentTime + ranNum + ext;

		// �뾽濡쒕뱶 �떆�궎怨좎옄 �븯�뒗 �뤃�뜑�쓽 臾쇰━�쟻�씤 寃쎈줈瑜� �븣�븘�궡湲�
		String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/");

		// �꽌踰꾩뿉 �뙆�씪�쓣 �뾽濡쒕뱶
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
