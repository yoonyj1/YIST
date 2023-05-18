package com.kh.yist.member.model.service;

import java.util.ArrayList;

import com.kh.yist.member.model.vo.Alarm;
import com.kh.yist.member.model.vo.Attendance;
import com.kh.yist.member.model.vo.Member;
import com.kh.yist.message.Message;

public interface MemberService {
	
	// 로그인 서비스(select)
	Member loginMember(Member m);
	Member selectTeacher(Member m);
	
	// 회원가입 서비스 (insert)
	int insertMember(Member m);
	
	// 정보수정 서비스 (update)
	int updateMember(Member m);
	
	// 회원 탈퇴 서비스 (update)
	int deleteMember(String userId);
	
	// 아이디 중복체크 서비스 (select)
	int idCheck(String checkId); 
	
	int insertMessage(Message message);
	
	int getmsgcount(String userId);
	
	ArrayList<Message> messageList(String userId);
	
	int updateMessage(String userId);
	
	ArrayList<Member> selectList();
	ArrayList<Member> selectList2(String subject);
	//선생정보 수정
	int updateTeacher(Member m);
	// 미배정 강사 리스트 조회
	ArrayList<Member> selectInstructorList();
	
	// 강사 배정(강의생성시)
	int updateInstructor(Member i);
	
	// 담당 강사 조회
	Member selectInstructor(String subject);
	
	// 담당 강사에서 해제
	int deleteInstructor(String id);
	//학생조회 (선생란)
	Member selectStudentList(String id);
	//출결조회 ajax (선생)
	ArrayList<Member> selectStudentList2(String DATE);
	
	// 출석 테이블에 로그인하는 멤버 sysdate로 추가
	int insertMemberAttendance(String id);
	
	Attendance selectStudentAttendance(String id);
}
