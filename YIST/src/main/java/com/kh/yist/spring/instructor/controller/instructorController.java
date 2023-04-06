package com.kh.yist.spring.instructor.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class instructorController {
	
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
	
	/*
	 * @RequestMapping("/") public String Calendar() { return "index"; }
	 */
	
}
