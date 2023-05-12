package com.kh.yist.student.model.service;

import java.util.ArrayList;

import com.kh.yist.common.model.vo.PageInfo;
import com.kh.yist.member.model.vo.Member;
import com.kh.yist.student.model.dao.StudentDao;
import com.kh.yist.student.model.vo.Exam;
import com.kh.yist.student.model.vo.Material;
import com.kh.yist.student.model.vo.Notice;
import com.kh.yist.student.model.vo.QnA;
import com.kh.yist.student.model.vo.Task;

public interface StudentService {

	ArrayList<Notice> mainNotice();
	
	ArrayList<Exam> testList();
	

	Exam testDetail(int examNo);
	
	int noticeListCount();
	
	ArrayList<Notice> selectList(PageInfo pi);
	
	Notice selectNotice(int boardNo);
	
	int boardListCount();
	
	// 우리반 게시판 과제 목록 조회
	public ArrayList<Task> taskList(Member m) {
		return sDao.taskList(sqlSession, m);
	}
	
	// 과제 제출 여부 조회
	public ArrayList<Task> taskSubmitList(Member student) {
		return (ArrayList)sDao.taskSubmitList(sqlSession, student);
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
	ArrayList<Material> boardList(PageInfo pi);
	
	ArrayList<Material> MaterialList();
	
	ArrayList<Task> taskList();
	
	Task selectTask(int taskNo);
	
	Task selectTaskReply(int taskNo);
	
	// 과제 등록
	public int taskInsert(Task t) {
		return sDao.taskInsert(sqlSession, t);
	}

	// 과제 수정 
	public int updateTask(Task t) {
		return sDao.updateTask(sqlSession, t);
	}

	
	int deleteTask(int taskNo);
	
	ArrayList<QnA> qnaList();
	
	int taskInsert(Task t);
	

}
