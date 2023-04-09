package com.kh.yist.spring.calendar.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor 		// 기본생성자
@AllArgsConstructor 	// 매개변수 생성자
@Setter					// setter 메소드
@Getter					// getter 메소드
@ToString
public class Calendar {
	private int calId;
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
