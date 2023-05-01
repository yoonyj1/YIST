package com.kh.yist.member.model.service;

import java.util.ArrayList;

import com.kh.yist.member.model.vo.Member;
import com.kh.yist.message.Message;

public interface MemberService {
	
	// 로그인 서비스(select)
	Member loginMember(Member m);
	
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
	
	ArrayList<Member> selectInstructorList();
	
	// 강사 배정
	int updateInstructor(String id, int subjectNo);
}
