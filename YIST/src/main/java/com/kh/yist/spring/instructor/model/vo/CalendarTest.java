package com.kh.yist.spring.instructor.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@ToString
public class CalendarTest {
	private int id;
	private String title;
	private String start;
	private String end;
	private String description;
	private String type;
	private String username;
	private String backgroundColor;
	private String textColor;
	private String allDay;

	
}
