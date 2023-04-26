package com.kh.yist.instructor.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.yist.task.model.service.TaskService;
import com.kh.yist.task.model.vo.Task;
import com.kh.yist.common.model.vo.PageInfo;
import com.kh.yist.common.template.Pagination;
import com.kh.yist.member.model.vo.Member;

@Controller
public class instructorController {

	@Autowired
	private TaskService tService;

	@RequestMapping("detail.task")
	public String detailTask() {
		return "instructor/detailTaskForm";
	}

	@RequestMapping("examForm.ins")
	public String examForm() {
		return "instructor/examForm";
	}

	@RequestMapping("calendar.ins")
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

	@RequestMapping("dataForm.ins")
	public String dataForm() {
		return "instructor/dataForm";
	}

	@RequestMapping("gradeForm.ins")
	public String gradeForm() {
		return "instructor/gradeForm";
	}

	@RequestMapping(value = "insert.task")
	public String insertTask(Task task, MultipartFile upfile, HttpSession session, Model model) {

		System.out.println(task);

		if (!upfile.getOriginalFilename().equals("")) {

			String changeName = saveFile(upfile, session);

			task.setOriginName(upfile.getOriginalFilename());
			task.setChangeName("resources/instructor/uploadFiles/" + changeName);

		}

		int insertTask = tService.insertTask(task);
		int result = 0;

		if (insertTask > 0) {
			result = tService.insertTaskFile(task);
		}
		if (result > 0) {
			session.setAttribute("alertMsg", "성공적으로 파일이 등록되었습니다.");
			return "redirect:taskForm.ins";
		} else {
			System.out.println("실패 하였습니다.");
		}

		return "";
	}
	
	@RequestMapping("update.task")
	public void updateTask(Task task) {
		System.out.println("업데이트");
		System.out.println(task);
	}
	
	@RequestMapping("taskForm.ins")
	public ModelAndView taskForm(@RequestParam(value = "cpage", defaultValue = "1") int currentPage, ModelAndView mv,
			HttpSession session) {

		Member m = (Member) session.getAttribute("loginUser");

		int taskListCount = tService.selectTaskListCount(m.getId());

		PageInfo pi = Pagination.getPageInfo(taskListCount, currentPage, 10, 5);

		ArrayList<Task> taskList = tService.selectTaskList(pi, m.getId());

		mv.addObject("pi", pi).addObject("taskList", taskList).setViewName("instructor/taskForm");

		return mv;
	}

	
	public String saveFile(MultipartFile upfile, HttpSession session) {

		String originName = upfile.getOriginalFilename(); // flower.png

		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());

		int ranNum = (int) (Math.random() * 90000 + 10000);

		String ext = originName.substring(originName.lastIndexOf("."));

		String changeName = currentTime + ranNum + ext;

		String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/");

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
