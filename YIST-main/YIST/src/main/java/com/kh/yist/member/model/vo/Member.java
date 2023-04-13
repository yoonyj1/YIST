package com.kh.yist.member.model.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter
@Getter
@ToString
public class Member {

	private String id; 				// 회원아이디
	private String name;			// 회원이름
	private String pwd;				// 비밀번호
	private String birth;			// 생년월일
	private String phone; 			// 전화번호
	private String email;			// 이메일
	private int post;				// 우편번호
	private String address;	 		// 주소
	private String detailAddress; 	// 상세주소
	private String subject;			// 과목
	private Date enrollDate; 		// 가입일
	private Date startDate;			// 수강시작일
	private Date endDate;			// 수강종료일
	private String status;			// 회원상태
	private int sort;				// 회원분류
	private Date employDate;		// 입사일자
	
}
