package com.kh.yist.calendar.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.yist.calendar.model.service.CalendarService;
import com.kh.yist.calendar.model.vo.Calendar;

@Controller
public class calendarController {

	@Autowired
	private CalendarService cService;
	
	@ResponseBody
	@RequestMapping(value = "list.cal", produces = "application/json; charset=utf-8")
	public String method1() {
		ArrayList<Calendar> list = cService.selectCalendar();
		
		System.out.println("조회");
		System.out.println(list);
		
		return new Gson().toJson(list);
	}
	
	@ResponseBody
	@RequestMapping(value = "insert.cal", produces = "application/json; charset=utf-8")
	public String method2(Calendar c) {
		
		System.out.println(c);
		
		int result = cService.insertCalendar(c);
		
		return "";
		
	}
	
	@ResponseBody
	@RequestMapping(value = "update.cal", produces = "application/json; charset=utf-8")
	public String method3(Calendar c) {
		
		int result = cService.updateCalendar(c);
		
		return new Gson().toJson(result);
	}
	
	
	@ResponseBody
	@RequestMapping(value = "delete.cal", produces = "application/json; charset=utf-8")
	public String method4(int calId) {
		
		int result = cService.deleteCalendar(calId);
		
		return new Gson().toJson(result);
	}
}












