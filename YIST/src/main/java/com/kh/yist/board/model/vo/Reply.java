package com.kh.yist.board.model.vo;

import java.sql.Date;

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
	private String replyWriter;
	private Date replyDate;
	private String status;
	private String replyStatus;
	private int refRno;
}
