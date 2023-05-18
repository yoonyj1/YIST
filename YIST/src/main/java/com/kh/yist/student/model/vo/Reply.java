package com.kh.yist.student.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class Reply {

	private int replyNo;
	private int boardNo;
	private String replyContent;
	private String replyWriter;
	private String replyDate;
	private String status;
	private String replyStatus;
	private int refRno;
}