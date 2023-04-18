package com.kh.yist.member.model.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class Attendance {

	private String Id;
	private int count;
	private Date attendanceDate;
	private String status;
	private int subjectNo;
	
}
