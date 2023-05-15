package com.kh.yist.student.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.yist.common.model.vo.PageInfo;
import com.kh.yist.member.model.vo.Alarm;
import com.kh.yist.member.model.vo.Member;
import com.kh.yist.student.model.vo.Exam;
import com.kh.yist.student.model.vo.Material;
import com.kh.yist.student.model.vo.Notice;
import com.kh.yist.student.model.vo.QnA;
import com.kh.yist.student.model.vo.Task;

@Repository
public class StudentDao {

	public ArrayList<Member> selectIns(SqlSessionTemplate sqlSession, Member loginUser) {
		
		return (ArrayList)sqlSession.selectList("studentMapper.selectIns", loginUser);
	}
	
	// 메인 공지사항 목록 조회
	public ArrayList<Notice> mainNotice(SqlSessionTemplate sqlSession) {

		return (ArrayList) sqlSession.selectList("studentMapper.mainNotice");
	}

	// 시험 목록 조회
	public ArrayList<Exam> testList(SqlSessionTemplate sqlSession) {

		return (ArrayList) sqlSession.selectList("studentMapper.testList");
	}

	// 시험 상세 조회
	public Exam testDetail(SqlSessionTemplate sqlSession, int testNo) {
		
		return sqlSession.selectOne("studentMapper.testDetail", testNo);
	}
	
	// 시험 제출
	public int testInsert(SqlSessionTemplate sqlSession, Exam e) {
		
		return sqlSession.insert("studentMapper.testInsert", e);
	}

	// 공지사항 목록 조회
	public int noticeListCount(SqlSessionTemplate sqlSession) {

		return sqlSession.selectOne("studentMapper.noticeListCount");
	}
	
	public int increaseCount(SqlSessionTemplate sqlSession, int boardNo) {
		
		return sqlSession.update("studentMapper.increaseCount", boardNo);
	}

	public ArrayList<Notice> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {

		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();

		int limit = pi.getBoardLimit();

		RowBounds rewBounds = new RowBounds(offset, limit);

		return (ArrayList) sqlSession.selectList("studentMapper.selectList", null, rewBounds);
	}

	// 공지사항 상세 조회
	public Notice selectNotice(SqlSessionTemplate sqlSession, int boardNo) {

		return sqlSession.selectOne("studentMapper.selectNotice", boardNo);
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

		return (ArrayList) sqlSession.selectList("studentMapper.boardList", null, rewBounds);
	}

	// 우리반 게시판 학습자료 목록 조회
	public ArrayList<Material> MaterialList(SqlSessionTemplate sqlSession) {

		return (ArrayList) sqlSession.selectList("studentMapper.MaterialList");
	}

	// 학습자료 상세 조회
	public Material selectMaterial(SqlSessionTemplate sqlSession, int boardNo) {

		return sqlSession.selectOne("studentMapper.selectMaterial", boardNo);
	}
	
	// 우리반 게시판 과제 목록 조회
	public ArrayList<Task> taskList(SqlSessionTemplate sqlSession, Member m) {

		return (ArrayList) sqlSession.selectList("studentMapper.taskList", m);
	}

	// 과제 제출 여부 조히
	public ArrayList taskSubmitList(SqlSessionTemplate sqlSession, Member student) {
		return (ArrayList) sqlSession.selectList("studentMapper.taskSubmitList", student);
	}

	// 과제 상세 조회
	public Task selectTask(SqlSessionTemplate sqlSession, Task task) {

		return sqlSession.selectOne("studentMapper.selectTask", task);
	}

	// 과제 답글 상세 조회
	public Task selectTaskReply(SqlSessionTemplate sqlSession, Task task) {

		return sqlSession.selectOne("studentMapper.selectTaskReply", task);
	}

	// 우리반 게시판 Q&A 목록 조회
	public ArrayList<QnA> qnaList(SqlSessionTemplate sqlSession) {

		return (ArrayList) sqlSession.selectList("studentMapper.qnaList");
	}

	// 과제 등록
	public int taskInsert(SqlSessionTemplate sqlSession, Task t) {

		return sqlSession.insert("studentMapper.taskInsert", t);
	}

	// 과제 수정
	public int updateTask(SqlSessionTemplate sqlSession, Task t) {
		return sqlSession.update("studentMapper.updateTask", t);
	}

	// 과제 답글 삭제
	public int deleteTask(SqlSessionTemplate sqlSession, Task task) {
		return sqlSession.update("studentMapper.deleteTask", task);
	}

	// 알람 조회
	public ArrayList<Alarm> selectAlarmList(SqlSessionTemplate sqlSession, String id) {
		return (ArrayList) sqlSession.selectList("studentMapper.selectAlarmList", id);
	}

	// 알람 갯수 조회
	public int selectAlarmCount(SqlSessionTemplate sqlSession, String id) {
		return sqlSession.selectOne("studentMapper.selectAlarmCount", id);
	}

	// 알람 읽음 처리
	public int taskAlarmCheck(SqlSessionTemplate sqlSession, int alarmNo) {
		return sqlSession.update("studentMapper.taskAlarmCheck", alarmNo);
	}

	// 마이페이지 내과제 목록
	public ArrayList<Task> selectMyTask(SqlSessionTemplate sqlSession, String id) {
		
		return (ArrayList)sqlSession.selectList("studentMapper.selectMyTask", id);
	}
	
	// 마이페이지 내과제 삭제
	public int deleteMyTask(SqlSessionTemplate sqlSession, List<Integer> taskNoList) {
		
		return sqlSession.update("studentMapper.deleteMyTask", taskNoList);
	}
	
	// 마이페이지 평가 현황
	public ArrayList<Exam> myTestList(SqlSessionTemplate sqlSession, String id) {
		
		return (ArrayList)sqlSession.selectList("studentMapper.myTestList", id);
	}
}
	
