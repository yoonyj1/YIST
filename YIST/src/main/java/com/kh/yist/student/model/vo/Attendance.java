package com.kh.yist.student.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class Attendance {
	
	private String id;
	private int count;
	private String attendanceDate;
	private String status;
	private int subjectNo;
}
