package com.kh.yist.member.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.yist.member.model.vo.Alarm;
import com.kh.yist.member.model.vo.Attendance;
import com.kh.yist.member.model.vo.Member;

@Repository
public class MemberDao {

	public Member loginMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.loginMember", m);
	}
	
	public Member selectTeacher(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.selectTeacher", m);
	}

	public int insertMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("memberMapper.insertMember", m);
	}

	public int updateMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.updateMember", m);
	}

	public int deleteMember(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.update("memberMapper.deleteMember", userId);
	}

	public int idCheck(SqlSessionTemplate sqlSession, String checkId) {
		return sqlSession.selectOne("memberMapper.idCheck", checkId);
	}

	public ArrayList<Member> selectList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("memberMapper.selectList");
	}
	
	public int updateTeacher(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.updateTeacher",m);
	}
	
	public int updateyist(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.updateyist",m);
	}
	
	public ArrayList<Member> selectInstructorList(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("memberMapper.selectInstructorList");
	}
	
	public int updateInstructor(SqlSessionTemplate sqlSession, Member i) {
		return sqlSession.update("memberMapper.updateInstructor", i);
	}
	
	public Member selectInstructor(SqlSessionTemplate sqlSession, String subject) {
		return sqlSession.selectOne("memberMapper.selectInstructor", subject);
	}
	
	public int deleteInstructor(SqlSessionTemplate sqlSession, String id) {
		return sqlSession.update("memberMapper.deleteInstructor", id);
	}

	public ArrayList<Member> selectExamMemberList(SqlSessionTemplate sqlSession, String subject) {
		return (ArrayList)sqlSession.selectList("memberMapper.selectExamMemberList", subject);
	}
	
	public ArrayList<Member> selectList2(SqlSessionTemplate sqlSession,String subject) {
		return (ArrayList)sqlSession.selectList("memberMapper.selectList2",subject);
	}
	
	public ArrayList<Member> selectList3(SqlSessionTemplate sqlSession,String DATE) {
		return (ArrayList)sqlSession.selectList("memberMapper.selectList2",DATE);
	}
	
	public Member selectStudentList(SqlSessionTemplate sqlSession, String id){
		return sqlSession.selectOne("memberMapper.selectStudentList", id);
	}
	
	public ArrayList<Member> getAttendanceList(SqlSessionTemplate sqlSession,String modifiedDate) {
		return (ArrayList)sqlSession.selectList("memberMapper.selectList3",modifiedDate);
	}
	
	public ArrayList<Member>selectSearchList(SqlSessionTemplate sqlSession,HashMap<String, String> map){
		return (ArrayList)sqlSession.selectList("memberMapper.selectSearchList", map);
	}
	
	
	 public List<Member> updateAttendanceTime(SqlSessionTemplate sqlSession,Member m) {
		 return sqlSession.selectList("memberMapper.updateAttendanceTime",m);
	 }

	
	
	 
	public int insertMemberAttendance(SqlSessionTemplate sqlSession, String id) {
		System.out.println(id);
		return sqlSession.insert("memberMapper.insertMemberAttendance", id);
	}
	
	public Attendance selectStudentAttendance(SqlSessionTemplate sqlSession, String id) {
		return sqlSession.selectOne("memberMapper.selectStudentAttendance", id);
	}
}
