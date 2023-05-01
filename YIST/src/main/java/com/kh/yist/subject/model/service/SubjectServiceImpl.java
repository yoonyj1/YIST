package com.kh.yist.subject.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.yist.common.model.vo.PageInfo;
import com.kh.yist.subject.model.dao.SubjectDao;
import com.kh.yist.subject.model.vo.Subject;

@Service
public class SubjectServiceImpl implements SubjectService{
	
	@Autowired
	private SubjectDao sDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	/**
	 * 강의 리스트 조회
	 */
	@Override
	public ArrayList<Subject> selectSubjectList() {
		return sDao.selectSubjectList(sqlSession);
	}

	@Override
	public int increaseCurrentSeats(int subjectNo) {
		return sDao.increaseCurrentSeats(sqlSession, subjectNo);
	}

	@Override
	public int selectSubjectListCount() {
		return sDao.selectSubjectListCount(sqlSession);
	}

	@Override
	public ArrayList<Subject> selectSubjectList(PageInfo pi) {
		return sDao.selectSubjectList(sqlSession, pi);
	}

	@Override
	public int insertSubject(Subject s) {
		return 0;
	}

	@Override
	public Subject selectSubject(int subjectNo) {
		return null;
	}

	@Override
	public int updateSubject(Subject s) {
		return 0;
	}

	@Override
	public int deleteSubject(int subjectNo) {
		return 0;
	}

}
