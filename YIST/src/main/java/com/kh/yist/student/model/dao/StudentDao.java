package com.kh.yist.student.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.yist.common.model.vo.PageInfo;
import com.kh.yist.member.model.vo.Alarm;
import com.kh.yist.member.model.vo.Member;
import com.kh.yist.student.model.vo.Attendance;
import com.kh.yist.student.model.vo.Exam;
import com.kh.yist.student.model.vo.Material;
import com.kh.yist.student.model.vo.Notice;
import com.kh.yist.student.model.vo.QnA;
import com.kh.yist.student.model.vo.Reply;
import com.kh.yist.student.model.vo.Task;
import com.kh.yist.student.model.vo.Video;

@Repository
public class StudentDao {

	public ArrayList<Member> selectIns(SqlSessionTemplate sqlSession, Member loginUser) {

		return (ArrayList) sqlSession.selectList("studentMapper.selectIns", loginUser);
	}
	
	public ArrayList<Attendance> selectAtt(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectOne("studentMapper.selectAtt");
	}
	public ArrayList<Attendance> selectAttDay(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectOne("studentMapper.selectAttDay");
	}
	public ArrayList<Attendance> selectAttTotal(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectOne("studentMapper.selectAttTotal");
	}

	// 메인 공지사항 목록 조회
	public ArrayList<Notice> mainNotice(SqlSessionTemplate sqlSession) {

		return (ArrayList) sqlSession.selectList("studentMapper.mainNotice");
	}

	// 시험 목록 조회
	public ArrayList<Exam> testList(SqlSessionTemplate sqlSession, Member loginUser) {

		return (ArrayList) sqlSession.selectList("studentMapper.testList", loginUser);
	}

	// 시험 상세 조회
	public Exam testDetail(SqlSessionTemplate sqlSession, int testNo) {

		return sqlSession.selectOne("studentMapper.testDetail", testNo);
	}

	// 시험 제출
	public int testInsert(SqlSessionTemplate sqlSession, Exam e) {

		return sqlSession.update("studentMapper.testInsert", e);
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

	public int noticeSearchCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		
		return sqlSession.selectOne("studentMapper.noticeSearchCount", map);
		
	}
	
	public ArrayList<Notice> noticeSearchList(SqlSessionTemplate sqlSession, HashMap<String, String> map, PageInfo pi){
		
		int offset = ( pi.getCurrentPage() - 1 ) * pi.getBoardLimit();
		
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("studentMapper.noticeSearchList", map, rowBounds);
		
	}
	
	// 동영상 게시판 목록 조회
	public int videoListCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("studentMapper.videoListCount");
	}
	
	public ArrayList<Video> selectVideoList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();

		int limit = pi.getBoardLimit();

		RowBounds rewBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("studentMapper.selectVideoList", null, rewBounds);
	}
	
	public int videoSearchCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		
		return sqlSession.selectOne("studentMapper.videoSearchCount", map);
		
	}
	
	public ArrayList<Video> videoSearchList(SqlSessionTemplate sqlSession, HashMap<String, String> map, PageInfo pi){
		
		int offset = ( pi.getCurrentPage() - 1 ) * pi.getBoardLimit();
		
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("studentMapper.videoSearchList", map, rowBounds);
		
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
	public ArrayList<Material> materialList(SqlSessionTemplate sqlSession, PageInfo pi, Map<String, Object> map) {

		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();

		int limit = pi.getBoardLimit();

		RowBounds rewBounds = new RowBounds(offset, limit);
		
		return (ArrayList) sqlSession.selectList("studentMapper.materialList", map, rewBounds);
	}

	public int materialListCount(SqlSessionTemplate sqlSession, Map<String, Object> map) {

		return sqlSession.selectOne("studentMapper.materialListCount", map);
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
	public ArrayList<QnA> qnaList(SqlSessionTemplate sqlSession, PageInfo pi, Map<String, Object> map) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();

		int limit = pi.getBoardLimit();

		RowBounds rewBounds = new RowBounds(offset, limit);
		
		return (ArrayList) sqlSession.selectList("studentMapper.qnaList", map, rewBounds);
	}

	public int qnaListCount(SqlSessionTemplate sqlSession, Map<String, Object> map) {

		return sqlSession.selectOne("studentMapper.qnaListCount", map);
	}
	
	// Q&A 상세 조회
	public QnA selectQna(SqlSessionTemplate sqlSession, int boardNo) {
		
		return sqlSession.selectOne("studentMapper.selectQna", boardNo);
	}
	
	// Q&A 게시판 댓글 등록
	public int insertReply(SqlSessionTemplate sqlSession, Reply r) {
		
		return sqlSession.insert("studentMapper.insertReply", r);
	}
	
	public ArrayList<Reply> selectReplyList(SqlSessionTemplate sqlSession, int boardNo) {
		
		return (ArrayList)sqlSession.selectList("studentMapper.selectReplyList", boardNo);
	}
	
	// 과제 등록
	public int taskSubmitInsert(SqlSessionTemplate sqlSession, Task t) {

		return sqlSession.update("studentMapper.taskSubmitInsert", t);
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

		return (ArrayList) sqlSession.selectList("studentMapper.selectMyTask", id);
	}

	// 마이페이지 내과제 삭제
	public int deleteMyTask(SqlSessionTemplate sqlSession, List<Integer> taskNoList) {

		return sqlSession.update("studentMapper.deleteMyTask", taskNoList);
	}

	// 시험 결과 조회
	public Exam selectExamResult(SqlSessionTemplate sqlSession, Exam exam) {
		return sqlSession.selectOne("studentMapper.selectExamResult", exam);
	}

	// 시험 결과들 조회

	public ArrayList<Exam> selectExamResultList(SqlSessionTemplate sqlSession, Exam exam) {
		return (ArrayList) sqlSession.selectList("studentMapper.selectExamResultList", exam);
	}

	// 시험 답안 조회
	public Exam selectExamQuestion(SqlSessionTemplate sqlSession, Exam exam) {
		return sqlSession.selectOne("studentMapper.selectExamQuestion", exam);
	}
	
   // 마이페이지 내정보 수정
   public int updateStudent(SqlSessionTemplate sqlSession, Member m) {
      
      return sqlSession.update("studentMapper.updateStudent", m);
   }

	public int insertQna(QnA q, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("studentMapper.insertQna", q);
	}

	public int insertReReply(SqlSessionTemplate sqlSession, Reply r) {
		return sqlSession.insert("studentMapper.insertReReply", r);
	
	}

	public int updateQna(SqlSessionTemplate sqlSession, QnA qna) {
		return sqlSession.update("studentMapper.updateQna", qna);
	}

	public int deleteQna(SqlSessionTemplate sqlSession, QnA qna) {
		return sqlSession.update("studentMapper.deleteQna", qna);
	}
	
	// 알람 등록
	public int insertAlarm(SqlSessionTemplate sqlSession, Alarm examAlarm) {
		return sqlSession.insert("studentMapper.insertAlarm", examAlarm);
	}

	// 시험 제출자 조회
	public Member selectExamIns(SqlSessionTemplate sqlSession, Exam e) {
		return sqlSession.selectOne("studentMapper.selectExamIns", e);
	}

	// 과제 제출자 조회
	public Member selectTaskIns(SqlSessionTemplate sqlSession, Task t) {
		return sqlSession.selectOne("studentMapper.selectTaskIns", t);
	}
}
	
