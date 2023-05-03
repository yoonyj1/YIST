package com.kh.yist.student.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.yist.common.model.vo.PageInfo;
import com.kh.yist.student.model.dao.StudentDao;
import com.kh.yist.student.model.vo.Material;
import com.kh.yist.student.model.vo.Notice;
import com.kh.yist.student.model.vo.QnA;
import com.kh.yist.student.model.vo.Task;

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
	
	// 우리반 게시판 목록 조회
	public int boardListCount() {
		return sDao.boardListCount(sqlSession);
	}
	public ArrayList<Material> boardList(PageInfo pi) {
		return sDao.boardList(sqlSession, pi);
	}
	
	// 우리반 게시판 학습자료 목록 조회
	public ArrayList<Material> MaterialList() {
		return sDao.MaterialList(sqlSession);
	}
	
	// 우리반 게시판 과제 목록 조회
	public ArrayList<Task> taskList() {
		return sDao.taskList(sqlSession);
	}
	
	// 우리반 게시판 과제 목록 조회
	public ArrayList<QnA> qnaList() {
		return sDao.qnaList(sqlSession);
	}
}
