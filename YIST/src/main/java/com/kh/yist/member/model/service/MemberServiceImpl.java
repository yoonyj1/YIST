package com.kh.yist.member.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.yist.member.model.dao.MemberDao;
import com.kh.yist.member.model.vo.Member;
import com.kh.yist.message.Message;
import com.kh.yist.subject.model.vo.Class;

// @Component
@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	public MemberDao mDao;

	@Autowired
	private SqlSessionTemplate sqlSession; // 스프링에서 다룸

	@Override
	public Member loginMember(Member m) {

		Member loginUser = mDao.loginMember(sqlSession, m);

		return loginUser;

	}

	@Override
	public int insertMember(Member m) {
		int result = mDao.insertMember(sqlSession, m);
		return result;
	}

	@Override
	public int updateMember(Member m) {
		int result = mDao.updateMember(sqlSession, m);
		return result;
	}

	@Override
	public int deleteMember(String userId) {

		int result = mDao.deleteMember(sqlSession, userId);
		return result;
	}

	@Override
	public int idCheck(String checkId) {
		int count = mDao.idCheck(sqlSession, checkId);
		return count;
	}

	// 쪽지저장
	@Override
	public int insertMessage(Message message) {
		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		int result = 0;
//		try {
//			result = dao.insertMessage(message);
//		} catch (ClassNotFoundException | SQLException e) {
//			System.out.println("쪽지저장DB : " + e.getMessage());
//		}
		return result;
	}

	// 쪽지건수
	@Override
	public int getmsgcount(String userid) {
		int result = 0;
		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		return result;
	}

	// 쪽지보기
	@Override
	public ArrayList<Message> messageList(String userid) {
		ArrayList<Message> msglist = null;
		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		return msglist;
	}

	// 쪽지확인
	@Override
	public int updateMessage(String userid) {
		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		int result = 0;

		return result;
	}

	// 미배정강사리스트조회
	@Override
	public ArrayList<Member> selectInstructorList() {
		return mDao.selectInstructorList(sqlSession);
	}
	
	// 강사배정
	@Override
	public int updateInstructor(Member i) {
		
		return mDao.updateInstructor(sqlSession, i);
	}

	//담당강사조회
	@Override
	public Member selectInstructor(String subject) {
		return mDao.selectInstructor(sqlSession, subject);
	}

	//담당강사해제
	@Override
	public int deleteInstructor(String id) {
		System.out.println("서비스타나?");
		return mDao.deleteInstructor(sqlSession, id);
	}




}
