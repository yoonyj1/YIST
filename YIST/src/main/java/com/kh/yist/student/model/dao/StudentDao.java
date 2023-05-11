package com.kh.yist.student.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.yist.common.model.vo.PageInfo;
import com.kh.yist.member.model.vo.Member;
import com.kh.yist.student.model.vo.Exam;
import com.kh.yist.student.model.vo.Material;
import com.kh.yist.student.model.vo.Notice;
import com.kh.yist.student.model.vo.QnA;
import com.kh.yist.student.model.vo.Task;

@Repository
public class StudentDao {

	// 시험 목록 조회
	public ArrayList<Exam> testList(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("studentMapper.testList");
	}
	
	// 시험 상세 조회
	public Exam testDetail(SqlSessionTemplate sqlSession, int examNo) {
		
		return sqlSession.selectOne("studentMapper.testDetail", examNo);
	}
	
	// 공지사항 목록 조회
	public int noticeListCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("studentMapper.noticeListCount");
	}
	
	public ArrayList<Notice> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		int limit = pi.getBoardLimit();
		
		RowBounds rewBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("studentMapper.selectList", null, rewBounds);
	}
	
	// 우리반 게시판 목록 조회
	public int boardListCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("studentMapper.boardListCount");
	}
	// 학습자료
	public ArrayList<Material> boardList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		int limit = pi.getBoardLimit();
		
		RowBounds rewBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("studentMapper.boardList", null, rewBounds);
	}
	
	// 우리반 게시판 학습자료 목록 조회
	public ArrayList<Material> MaterialList(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("studentMapper.MaterialList");
	}
	
	// 우리반 게시판 과제 목록 조회
	public ArrayList<Task> taskList(SqlSessionTemplate sqlSession, Member m) {
		
		return (ArrayList)sqlSession.selectList("studentMapper.taskList", m);
	}
	
	// 과제 상세 조회
	public Task selectTask(SqlSessionTemplate sqlSession, Task task) {
		
		return sqlSession.selectOne("studentMapper.selectTask", task);
	}
	
	// 과제 답글 상세 조회
	public Task selectTaskReply(SqlSessionTemplate sqlSession, Task task) {
		
		return sqlSession.selectOne("studentMapper.selectTaskReply", task);
	}
	
	// 과제 답글 삭제
	public int deleteTask(SqlSessionTemplate sqlSession, Task task) {
		
		return sqlSession.update("studentMapper.deleteTask", task);
	}
	
	// 우리반 게시판 Q&A 목록 조회
	public ArrayList<QnA> qnaList(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("studentMapper.qnaList");
	}
	
	// 과제 등록
	public int taskInsert(SqlSessionTemplate sqlSession, Task t) {
		
		return sqlSession.insert("studentMapper.taskInsert", t);
	}

	public int updateTask(SqlSessionTemplate sqlSession, Task t) {
		return sqlSession.update("studentMapper.updateTask", t);
	}
}
