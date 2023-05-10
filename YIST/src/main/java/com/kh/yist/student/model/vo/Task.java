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

	/*
	private int taskNo;
	private int subjectNo;
	private String id;
	private String taskTitle;
	private String taskContent;
	private String startDate;
	private String endDate;
	*/
	
	private int taskNo;
    private int subjectNo;
    private String id;
    private String taskTitle;
    private String taskContent;
    private String startDate;
    private String endDate;
    private String studentId;
    private String submitContent;
    private String submitDate;
    private String modifyDate;
    private String status;
    
    private int fileNo;
    private String originName;
	private String changeName;
}
