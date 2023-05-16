package com.kh.yist.subject.model.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class Subject {

	private int subjectNo;
	private int classNo;
	private String subjectName;
	private String startDate;
	private String endDate;
	private String status;
	private String day;
	private int maximumSeats;
	private int currentSeats;
	private int fee;
	private String instructor;
	private String className;
	
}
