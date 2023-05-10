package com.kh.yist.student.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.yist.common.model.vo.PageInfo;
import com.kh.yist.student.model.dao.StudentDao;
import com.kh.yist.student.model.vo.Exam;
import com.kh.yist.student.model.vo.Material;
import com.kh.yist.student.model.vo.Notice;
import com.kh.yist.student.model.vo.QnA;
import com.kh.yist.student.model.vo.Task;

@Service
public class StudentServiceImpl implements StudentService {

	@Autowired
	private StudentDao sDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 메인 공지사항 목록 조회
	public ArrayList<Notice> mainNotice() {
		return sDao.mainNotice(sqlSession);
	}
	
	// 시험 목록 조회
	@Override
	public ArrayList<Exam> testList() {
		return sDao.testList(sqlSession);
	}
	
	// 시험 상세 조회
	@Override
	public Exam testDetail(int examNo) {
		return sDao.testDetail(sqlSession, examNo);
	}
	
	// 공지사항 목록 조회
	@Override
	public int noticeListCount() {
		return sDao.noticeListCount(sqlSession);
	}
	@Override
	public ArrayList<Notice> selectList(PageInfo pi) {
		return sDao.selectList(sqlSession, pi);
	}
	
	// 공지사항 상세 조회
	@Override
	public Notice selectNotice(int boardNo) {
		return sDao.selectNotice(sqlSession, boardNo);
	}
	
	// 우리반 게시판 목록 조회
	@Override
	public int boardListCount() {
		return sDao.boardListCount(sqlSession);
	}
	@Override
	public ArrayList<Material> boardList(PageInfo pi) {
		return sDao.boardList(sqlSession, pi);
	}
	
	// 우리반 게시판 학습자료 목록 조회
	@Override
	public ArrayList<Material> MaterialList() {
		return sDao.MaterialList(sqlSession);
	}
	
	// 우리반 게시판 과제 목록 조회
	@Override
	public ArrayList<Task> taskList() {
		return sDao.taskList(sqlSession);
	}
	
	// 과제 상세 조회
	@Override
	public Task selectTask(int taskNo) {
		return sDao.selectTask(sqlSession, taskNo);
	}
	
	// 과제 답글 상세 조회
	@Override
	public Task selectTaskReply(int taskNo) {
		return sDao.selectTaskReply(sqlSession, taskNo);
	}
	
	// 과제 답글 삭제
	@Override
	public int deleteTask(int taskNo) {
		return sDao.deleteTask(sqlSession, taskNo);
	}
	
	// 우리반 게시판 과제 목록 조회
	@Override
	public ArrayList<QnA> qnaList() {
		return sDao.qnaList(sqlSession);
	}
	
	// 과제 등록
	@Override
	public int taskInsert(Task t) {
		return sDao.taskInsert(sqlSession, t);
	}
}
