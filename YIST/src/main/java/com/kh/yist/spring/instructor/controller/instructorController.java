package com.kh.yist.spring.instructor.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kh.yist.spring.instructor.model.service.TaskService;
import com.kh.yist.spring.instructor.model.vo.Task;

@Controller
public class instructorController {
	
	@Autowired
	private TaskService tService;
	
	@RequestMapping("taskForm.ins")
	public String taskForm() {
		return "instructor/taskForm";
	}
	
	@RequestMapping("examForm.ins")
	public String examForm() {
		return "instructor/examForm";
	}
	
	@RequestMapping("gradeForm.ins")
	public String Calendar() {
		return "instructor/calendarForm";
	}
	
	@ResponseBody
	@RequestMapping(value="insert.task", produces = "application/json; charset=utf-8")
	public String insertTask(Task task,  String upfile) {
		
		System.out.println("파일 : " + upfile);
		System.out.println(task);
		
		return "";
	}
	
	
}
