package com.kh.yist.subject.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.yist.common.model.vo.PageInfo;
import com.kh.yist.subject.model.dao.SubjectDao;
import com.kh.yist.subject.model.vo.Class;
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
		return sDao.insertSubject(sqlSession, s);
	}

	@Override
	public Subject selectSubject(int subjectNo) {
		return sDao.selectSubject(sqlSession, subjectNo);
	}

	@Override
	public int updateSubject(Subject s) {
		return sDao.updateSubject(sqlSession, s);
	}

	@Override
	public int deleteSubject(int subjectNo) {
		return sDao.deleteSubject(sqlSession, subjectNo);
	}

	@Override
	public ArrayList<Class> selectClassList() {
		return sDao.selectClassList(sqlSession);
	}

	@Override
	public int selectCurrval() {
		return sDao.selectCurrval(sqlSession);
	}

	@Override
	public int deleteSubject(List<String> subjectNo) {
		return sDao.deleteSubject(sqlSession, subjectNo);
	}

	@Override
	public int selectSearchCount(HashMap<String, String> map) {
		return sDao.selectSearchCount(sqlSession, map);
	}

	@Override
	public ArrayList<Subject> selectSearchList(HashMap<String, String> map, PageInfo pi) {
		return sDao.selectSearchList(sqlSession, map, pi);
	}



}
