package com.kh.yist.member.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.yist.member.model.dao.MemberDao;
import com.kh.yist.member.model.vo.Alarm;
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
	public Member selectTeacher(Member m) {
		Member loginUser = mDao.selectTeacher(sqlSession, m);

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

	public ArrayList<Member> selectExamMemberList(String subject) {
		return mDao.selectExamMemberList(sqlSession, subject);
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
	
	//학생정보 조회
	@Override
	public ArrayList<Member> selectList(){
		return mDao.selectList(sqlSession);
	}
	
	//선생님 수정
	@Override
	public int updateTeacher(Member m) {
		int result = mDao.updateTeacher(sqlSession,m);
		return result;
	}
	
	@Override
	public int updateyist(Member m) {
		int result = mDao.updateyist(sqlSession,m);
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
	
	@Override
	public ArrayList<Member> selectList2(String subject){
		return mDao.selectList2(sqlSession,subject);
	}
	

	//선생 학생조회
	@Override
	public Member selectStudentList(String id){
		return mDao.selectStudentList(sqlSession, id);
	}
	
	@Override
	public ArrayList<Member> selectList3(String DATE){
		return mDao.selectList3(sqlSession, DATE);
	}
	//날짜별 출결조회 (선생)
	@Override
	public ArrayList<Member> getAttendanceList(String modifiedDate) {
		return mDao.getAttendanceList(sqlSession,modifiedDate);
	}
	
	//학생 검색
	@Override
    public ArrayList<Member> selectSearchList(HashMap<String, String> map) {
        return mDao.selectSearchList(sqlSession,map);
    }
	
	public void updateAttendanceTime(Member m) {
	    mDao.updateAttendanceTime(sqlSession,m);
	}

	
	




}
