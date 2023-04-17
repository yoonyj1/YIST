package com.kh.yist.spring.instructor.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor 		// 기본생성자
@AllArgsConstructor 	// 매개변수 생성자
@Setter					// setter 메소드
@Getter					// getter 메소드
@ToString				// toString 메소드
public class Task {
	
	// 과제
	private int taskNo; // 과제번호
	private int subjectNo; // 과목번호
	private String instructorId; // 강사 아이디
	private String taskTitle; // 과제 제목
	private String taskContent; // 과제 내용 
	private Date startDate; // 시작일
	private Date endDate; // 마감일 
	
	// 과제 파일
	private int fileNo;
	private String originName;
	private String changeName;
	private int fileLevel;
	private String fileStatus;
	
	// 학생 제출
	private String studentId;
	private String submitStatus;
	
}
