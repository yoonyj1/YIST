package com.kh.yist.task.model.vo;

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
	private int fileNo;
	private int subjectNo;
	private String instructorId;
	private String taskTitle;
	private String taskContent;
	private String startDate;			// 등록일
	private String endDate;			// 제출일
	private String originName;
	private String changeName;
	private int fileLevel;
	private String status;
}
