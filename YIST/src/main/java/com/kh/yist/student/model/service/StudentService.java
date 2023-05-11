package com.kh.yist.student.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.yist.common.model.vo.PageInfo;
import com.kh.yist.member.model.vo.Member;
import com.kh.yist.student.model.dao.StudentDao;
import com.kh.yist.student.model.vo.Exam;
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
	
	// 시험 목록 조회
	public ArrayList<Exam> testList() {
		return sDao.testList(sqlSession);
	}
	
	// 시험 상세 조회
	public Exam testDetail(int examNo) {
		return sDao.testDetail(sqlSession, examNo);
	}
	
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
	public ArrayList<Task> taskList(Member m) {
		return sDao.taskList(sqlSession, m);
	}
	
	// 과제 상세 조회
	public Task selectTask(Task task) {
		return sDao.selectTask(sqlSession, task);
	}
	
	// 과제 답글 상세 조회
	public Task selectTaskReply(Task task) {
		return sDao.selectTaskReply(sqlSession, task);
	}
	
	// 과제 답글 삭제
	public int deleteTask(Task task) {
		return sDao.deleteTask(sqlSession, task);
	}
	
	// 우리반 게시판 과제 목록 조회
	public ArrayList<QnA> qnaList() {
		return sDao.qnaList(sqlSession);
	}
	
	// 과제 등록
	public int taskInsert(Task t) {
		return sDao.taskInsert(sqlSession, t);
	}

	// 과제 수정 
	public int updateTask(Task t) {
		return sDao.updateTask(sqlSession, t);
	}
}
