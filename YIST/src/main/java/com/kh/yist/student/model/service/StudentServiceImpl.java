package com.kh.yist.student.model.service;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.yist.common.model.vo.PageInfo;
import com.kh.yist.member.model.vo.Alarm;
import com.kh.yist.member.model.vo.Member;
import com.kh.yist.student.model.dao.StudentDao;
import com.kh.yist.student.model.vo.Exam;
import com.kh.yist.student.model.vo.Material;
import com.kh.yist.student.model.vo.Notice;
import com.kh.yist.student.model.vo.QnA;
import com.kh.yist.student.model.vo.Reply;
import com.kh.yist.student.model.vo.Task;
import com.kh.yist.student.model.vo.Video;

@Service
public class StudentServiceImpl implements StudentService {

	@Autowired
	private StudentDao sDao;

	@Autowired
	private SqlSessionTemplate sqlSession;

	
	// 메인 정보 조회
	@Override
	public ArrayList<Member> selectIns(Member loginUser) {
		return sDao.selectIns(sqlSession, loginUser);
	}
	
	// 메인 공지사항 목록 조회
	@Override
	public ArrayList<Notice> mainNotice() {
		return sDao.mainNotice(sqlSession);
	}

	// 시험 목록 조회
	@Override
	public ArrayList<Exam> testList(Member loginUser) {
		return sDao.testList(sqlSession, loginUser);
	}

	// 시험 상세 조회
	@Override
	public Exam testDetail(int testNo) {
		return sDao.testDetail(sqlSession, testNo);
	}
	
	// 시험 제출
	@Override
	public int testInsert(Exam e) {
		return sDao.testInsert(sqlSession, e);
	}

	// 공지사항 목록 조회
	@Override
	public int noticeListCount() {
		return sDao.noticeListCount(sqlSession);
	}

	@Override
	public int increaseCount(int boardNo) {
		
		return sDao.increaseCount(sqlSession, boardNo);
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

	// 동영상 게시판 목록 조회
	@Override
	public int videoListCount() {
		return sDao.videoListCount(sqlSession);
	}
	
	@Override
	public ArrayList<Video> selectVideoList(PageInfo pi) {
		return sDao.selectVideoList(sqlSession, pi);
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
	public ArrayList<Material> materialList(PageInfo pi) {
		return sDao.materialList(sqlSession, pi);
	}

	@Override
	public int materialListCount() {
		return sDao.materialListCount(sqlSession);
	}
	
	// 학습자료 상세 조회
	@Override
	public Material selectMaterial(int boardNo) {
		return sDao.selectMaterial(sqlSession, boardNo);
	}
		
	// 우리반 게시판 과제 목록 조회
	@Override
	public ArrayList<Task> taskList(Member m) {
		return sDao.taskList(sqlSession, m);
	}

	// 과제 제출여부 조회
	@Override
	public ArrayList<Task> taskSubmitList(Member m) {
		return (ArrayList) sDao.taskSubmitList(sqlSession, m);
	}

	// 과제 상세 조회
	@Override
	public Task selectTask(Task task) {
		return sDao.selectTask(sqlSession, task);
	}

	// 과제 등록
	@Override
	public int taskSubmitInsert(Task t) {
		return sDao.taskSubmitInsert(sqlSession, t);
	}

	// 과제 수정
	@Override
	public int updateTask(Task t) {
		return sDao.updateTask(sqlSession, t);
	}

	// 과제 답글 삭제
	@Override
	public int deleteTask(Task task) {
		return sDao.deleteTask(sqlSession, task);
	}

	// 우리반 게시판 ??
	@Override
	public ArrayList<QnA> qnaList() {
		return sDao.qnaList(sqlSession);
	}
	
	// Q&A 상세 조회
	@Override
	public QnA selectQna(int boardNo) {
		return sDao.selectQna(sqlSession, boardNo);
	}

	// Q&A 게시판 댓글 등록
	@Override
	public int insertReply(Reply r) {
		return sDao.insertReply(sqlSession, r);
	}
	
	@Override
	public ArrayList<Reply> selectReplyList(int boardNo) {
		return sDao.selectReplyList(sqlSession, boardNo);
	}
	
	// 알람조회
	@Override
	public ArrayList<Alarm> selectAlarmList(String id) {
		return sDao.selectAlarmList(sqlSession, id);
	}

	@Override
	public int selectAlarmCount(String id) {
		return sDao.selectAlarmCount(sqlSession, id);
	}

	@Override
	public int taskAlarmCheck(int alarmNo) {
		return sDao.taskAlarmCheck(sqlSession, alarmNo);
	}
	
	// 내 과제 목록
	@Override
	public ArrayList<Task> selectMyTask(String id) {
		return sDao.selectMyTask(sqlSession, id);
	}

	@Override
	public int deleteMyTask(List<Integer> taskNoList) {
	  return sDao.deleteMyTask(sqlSession, taskNoList);
	}

   // 내정보 수정
   @Override
   public int updateStudent(Member m) {
      return sDao.updateStudent(sqlSession, m);
   }
	   
	// 시험 결과 조회
	@Override
	public Exam selectExamResult(Exam exam) {
		return sDao.selectExamResult(sqlSession, exam);
	}

	// 시험 답안 조회
	@Override
	public Exam selectExamQuestion(Exam exam) {
		return sDao.selectExamQuestion(sqlSession, exam);
	}

}
