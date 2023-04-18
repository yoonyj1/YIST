package com.kh.yist.exam.model.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class Exam {

	private int testNo;
	private String id;
	private int subjectNo;
	private String testTitle;
	private Date startDate;
	private Date endDate;
}
