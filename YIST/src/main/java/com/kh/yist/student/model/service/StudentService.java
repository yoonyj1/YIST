package com.kh.yist.student.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.yist.common.model.vo.PageInfo;
import com.kh.yist.student.model.dao.StudentDao;
import com.kh.yist.student.model.vo.Material;
import com.kh.yist.student.model.vo.Notice;

@Service
public class StudentService {

	@Autowired
	private StudentDao sDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 공지사항 목록 조회
	public int noticeListCount() {
		return sDao.noticeListCount(sqlSession);
	}
	public ArrayList<Notice> selectList(PageInfo pi) {
		return sDao.selectList(sqlSession, pi);
	}
	
	// 학습자료 목록 조회
	public int boardListCount() {
		return sDao.boardListCount(sqlSession);
	}
	public ArrayList<Material> boardList(PageInfo pi) {
		return sDao.boardList(sqlSession, pi);
	}
}
