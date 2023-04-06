package com.kh.yist.spring.instructor.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.yist.spring.instructor.model.service.CalendarService;

import com.kh.yist.spring.instructor.model.vo.Calendar;

@Controller
public class instructorController {
	
	@Autowired
	private CalendarService cService;
	
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
	@RequestMapping(value = "list.cal", produces = "application/json; charset=utf-8")
	public String method1() {
		ArrayList<Calendar> list = cService.selectCalendar();
		
		return new Gson().toJson(list);
	}
	
	@ResponseBody
	@RequestMapping(value = "insert.cal", produces = "application/json; charset=utf-8")
	public String method2(Calendar c) {
		
		System.out.println(c);
		
		int result = cService.insertCalendar(c);
		
		return "";
		
	}
	
	/*
	 * @RequestMapping("/") public String Calendar() { return "index"; }
	 */
	
}
