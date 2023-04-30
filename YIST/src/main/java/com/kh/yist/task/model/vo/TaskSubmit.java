package com.kh.yist.task.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class TaskSubmit {

	private int taskNo;
	private String id;
	private String taskTitle;
	private String submitContent;
	private String name;
	private String submitDate; 
	private String modifyDate;
	private String status;
}
