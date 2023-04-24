package com.kh.yist.task.model.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class Task {

	private int taskNo;
	private int subjectNo;
	private String instructorId;
	private String taskTitle;
	private String taskContent;
	private Date startDate;			// 등록일
	private Date endDate;			// 제출일
	
	private int fileNo;
	private String originName;
	private String changeName;
	private int fileLevel;
	private String status;
}
