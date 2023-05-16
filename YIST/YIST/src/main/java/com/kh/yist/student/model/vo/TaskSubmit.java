package com.kh.yist.student.model.vo;

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
	private String submitContent;
	private String submitDate;
	private String modifyDate;
	private String status;
}
