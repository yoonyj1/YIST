package com.kh.yist.student.model.vo;

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
	private String id;
	private String taskTitle;
	private String taskContent;
	private String startDate;
	private String endDate;
}
