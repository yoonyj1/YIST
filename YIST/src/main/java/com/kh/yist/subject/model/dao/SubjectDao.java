package com.kh.yist.subject.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.yist.subject.model.vo.Subject;

@Repository
public class SubjectDao {
	
	public ArrayList<Subject> selectSubjectList(SqlSession sqlSession){
		
		return (ArrayList)sqlSession.selectList("subjectMapper.selectSubjectList");
	}
	
	public int increaseCurrentSeats(SqlSession sqlSession, int subjectNo) {
		
		return sqlSession.update("subjectMapper.increaseCurrentSeats", subjectNo);
				
	}
	
}
