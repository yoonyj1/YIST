package com.kh.yist.task.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class TaskFile {

	private int fileNo;
	private int taskNo;
	private String originName;
	private String changeName;
	private int fileLevel;
	private String status;
}
