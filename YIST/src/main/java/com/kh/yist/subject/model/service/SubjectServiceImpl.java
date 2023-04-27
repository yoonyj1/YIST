package com.kh.yist.subject.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

}
