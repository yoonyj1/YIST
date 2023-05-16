package com.kh.yist.member.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/*
 * * Lombook(롬복)
 * 
 * 1. 라이브러리 다운 후 적용 (Maven pom.xml)
 * 2. 다운로드된 jar 찾아서 설치 (작업할 IDE 선택해서 설치) (CMD로 해당 경로 진입 후 java -jar lombok-1.18.12.jar
 * 3. IDE 재실행
 * 
 */

@NoArgsConstructor 		// 기본생성자
@AllArgsConstructor 	// 매개변수 생성자
@Setter					// setter 메소드
@Getter					// getter 메소드
@ToString				// toString 메소드
public class Member {
	private String id;
	private String name;
	private String pwd;
	private String birth;
	private String phone;
	private String image;
	private String email;
	private String post;
	private String gender;
	private String address;
	private String detailAddress;
	private String subject;
	private double attendanceRate;
	private String enrollDate;
	private String startDate;
	private String endDate;
	private String status;
	private int sort;
	private String employeeDate;
	private int memberNo;
	private String INHOUR;
	private String OUTHOUR;
	
	private int examTime;
	private int userTime;

	// private String uName;
	// 롬복을 쓸때는 필드명 작성시 적어도 소문자 두글자 이상으로 시작할 것
	
	
}
