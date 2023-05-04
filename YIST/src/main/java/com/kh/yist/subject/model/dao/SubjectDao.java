package com.kh.yist.subject.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.yist.common.model.vo.PageInfo;
import com.kh.yist.subject.model.vo.Class;
import com.kh.yist.subject.model.vo.Subject;

@Repository
public class SubjectDao {
	
	public ArrayList<Subject> selectSubjectList(SqlSessionTemplate sqlSession){
		
		return (ArrayList)sqlSession.selectList("memberMapper.selectSubjectList");
	}
	
	public int increaseCurrentSeats(SqlSessionTemplate sqlSession, int subjectNo) {
		
		return sqlSession.update("subjectMapper.increaseCurrentSeats", subjectNo);
				
	}
	
	public int selectSubjectListCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("subjectMapper.selectSubjectListCount");
		
	}
	
	public ArrayList<Subject> selectSubjectList(SqlSessionTemplate sqlSession, PageInfo pi){
		
		//	offset(건너뛸 게시글 수)
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		//	총 조회할 개수
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("subjectMapper.selectSubjectList", null, rowBounds);
	}
	
	public Subject selectSubject(SqlSessionTemplate sqlSession, int subjectNo) {
		
		return sqlSession.selectOne("subjectMapper.selectSubject", subjectNo);
		
	}
	
	public ArrayList<Class> selectClassList(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("classMapper.selectClassList");
	}
	
	public int insertSubject(SqlSessionTemplate sqlSession, Subject s) {
		return sqlSession.insert("subjectMapper.insertSubject", s);
	}
	
	public int updateSubject(SqlSessionTemplate sqlSession, Subject s) {
		return sqlSession.update("subjectMapper.updateSubject", s);
	}
	
	public int deleteSubject(SqlSessionTemplate sqlSession, int subjectNo) {
		return sqlSession.update("subjectMapper.deleteSubject", subjectNo);
	}
	
	public int deleteSubject(SqlSessionTemplate sqlSession, List<String> subjectNo) {
		return sqlSession.update("subjectMapper.deleteSubjectAjax", subjectNo);
	}
	
	public int selectCurrval(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("subjectMapper.selectCurrval");
	}
	
	public int selectSearchCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("subjectMapper.selectSearchCount", map);
	}
	
	public ArrayList<Subject> selectSearchList(SqlSessionTemplate sqlSession, HashMap<String, String> map, PageInfo pi){
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("subjectMapper.selectSearchList", map, rowBounds);
		
	}
}
