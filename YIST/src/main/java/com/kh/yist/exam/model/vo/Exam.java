package com.kh.yist.exam.model.vo;

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
	private String studentId;
	private int subjectNo;
	private String testTitle;
	private String examDate;
	private int examTime;
	private String status; // 종료여부
	private String name;
	private String q1;
	private String q2;
	private String q3;
	private String q4;
	private String q5;
	private String a1;
	private String a2;
	private String a3;
	private String a4;
	private String a5;
	private int score;
	private int count;
	private String submitStatus; // 제출여부
}
