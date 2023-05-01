package com.kh.yist.subject.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.yist.common.model.vo.PageInfo;
import com.kh.yist.subject.model.vo.Class;
import com.kh.yist.subject.model.vo.Subject;

@Repository
public class SubjectDao {
	
	public ArrayList<Subject> selectSubjectList(SqlSession sqlSession){
		
		return (ArrayList)sqlSession.selectList("memberMapper.selectSubjectList");
	}
	
	public int increaseCurrentSeats(SqlSession sqlSession, int subjectNo) {
		
		return sqlSession.update("subjectMapper.increaseCurrentSeats", subjectNo);
				
	}
	
	public int selectSubjectListCount(SqlSession sqlSession) {
		
		return sqlSession.selectOne("subjectMapper.selectSubjectListCount");
		
	}
	
	public ArrayList<Subject> selectSubjectList(SqlSession sqlSession, PageInfo pi){
		
		//	offset(건너뛸 게시글 수)
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		//	총 조회할 개수
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("subjectMapper.selectSubjectList", null, rowBounds);
	}
	
	public Subject selectSubject(SqlSession sqlSession, int subjectNo) {
		
		return sqlSession.selectOne("subjectMapper.selectSubject", subjectNo);
		
	}
	
	public ArrayList<Class> selectClassList(SqlSession sqlSession){
		return (ArrayList)sqlSession.selectList("classMapper.selectClassList");
	}
	
	public int insertSubject(SqlSession sqlSession, Subject s) {
		return sqlSession.insert("subjectMapper.insertSubject", s);
	}
	
}
