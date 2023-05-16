package com.kh.yist.member.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

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
	public ArrayList<Member> selectList2(SqlSessionTemplate sqlSession,String subject) {
		return (ArrayList)sqlSession.selectList("memberMapper.selectList2",subject);
	}
	
	public int updateTeacher(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.updateTeacher",m);
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
	
	public Member selectStudentList(SqlSessionTemplate sqlSession, String id){
		return sqlSession.selectOne("memberMapper.selectStudentList", id);
	}
	
	public ArrayList<Member> selectStudentList2(SqlSessionTemplate sqlSession,String DATE) {
		return (ArrayList)sqlSession.selectList("memberMapper.selectList3",DATE);
	}
}
