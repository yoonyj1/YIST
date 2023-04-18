package com.kh.yist.spring.jjw.message;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor 		// 기본생성자
@AllArgsConstructor 	// 매개변수 생성자
@Setter					// setter 메소드
@Getter					// getter 메소드
@ToString
public class Message {

	private String m_to; //발신자
	private String m_from; //수신자
	private String msg; //쪽지내용
	private String m_check; //read여부
}
