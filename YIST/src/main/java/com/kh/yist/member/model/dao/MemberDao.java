package com.kh.yist.member.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.yist.member.model.vo.Member;

@Repository
public class MemberDao {

	public Member loginMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.loginMember", m);
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

	public ArrayList<Member> selectInstructorList(SqlSession sqlSession){
		return (ArrayList)sqlSession.selectList("memberMapper.selectInstructorList");
	}
	
	public int updateInstructor(SqlSession sqlSession, Member i) {
		return sqlSession.update("memberMapper.updateInstructor", i);
	}
	
	public Member selectInstructor(SqlSession sqlSession, String subject) {
		return sqlSession.selectOne("memberMapper.selectInstructor", subject);
	}
	
	public int deleteInstructor(SqlSession sqlSession, String id) {
		return sqlSession.update("memberMapper.deleteInstructor", id);
	}
	

}
