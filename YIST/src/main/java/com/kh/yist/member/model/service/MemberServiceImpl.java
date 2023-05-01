package com.kh.yist.member.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.yist.member.model.dao.MemberDao;
import com.kh.yist.member.model.vo.Member;
import com.kh.yist.message.Message;

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

	@Override
	public ArrayList<Member> selectInstructorList() {
		return mDao.selectInstructorList(sqlSession);
	}

	@Override
	public int updateInstructor(String id, int subjectNo) {
		return mDao.updateInstructor(sqlSession, id, subjectNo);
	}

}
