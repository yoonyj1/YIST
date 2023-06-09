package com.kh.yist.student.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

public interface StudentService {

	ArrayList<Member> selectIns(Member loginUser);
	
	ArrayList<Attendance> selectAtt();
	ArrayList<Attendance> selectAttDay();
	ArrayList<Attendance> selectAttTotal();
	
	ArrayList<Notice> mainNotice();

	ArrayList<Exam> testList(Member loginUser);
	
	Exam testDetail(int testNo);
	
	int testInsert(Exam e);
	
	int noticeListCount();
	
	int increaseCount(int boardNo);

	ArrayList<Notice> selectList(PageInfo pi);

	Notice selectNotice(int boardNo);
	
	int noticeSearchCount(HashMap<String, String> map);
	
	ArrayList<Notice> noticeSearchList(HashMap<String, String> map, PageInfo pi);

	int boardListCount();

	int videoListCount();
	
	int videoSearchCount(HashMap<String, String> map);
	
	ArrayList<Video> videoSearchList(HashMap<String, String> map, PageInfo pi);
	
	ArrayList<Video> selectVideoList(PageInfo pi);

	ArrayList<Material> boardList(PageInfo pi);

	ArrayList<Material> materialList(PageInfo pi, Map<String, Object> map);
	
	int materialListCount(Map<String, Object> map);

	Material selectMaterial(int boardNo);
	
	// 과제 조회
	ArrayList<Task> taskList(Member m);

	// 과제 제출 여부 조회
	ArrayList<Task> taskSubmitList(Member m);

	// 과제 상세 조회
	Task selectTask(Task task);

	// 과제 답변
	int taskSubmitInsert(Task t);

	// 과제 답변 수정
	int updateTask(Task t);

	// 고제 답변 삭제
	int deleteTask(Task t);

	// 알림 조회
	ArrayList<Alarm> selectAlarmList(String id);

	// 알람 갯수 조회
	int selectAlarmCount(String id);

	// 알람 읽음 처리
	int taskAlarmCheck(int alarmNo);

	ArrayList<QnA> qnaList(PageInfo pi, Map<String, Object> map);
	
	int qnaListCount(Map<String, Object> map);
	
	QnA selectQna(int boardNo);
	
	int insertQna(QnA q);
	
	int insertReply(Reply r);
	
	ArrayList<Reply> selectReplyList(int boardNo);
	
	ArrayList<Task> selectMyTask(String id);
	
	int deleteMyTask(List<Integer> taskNoList);

	int updateStudent(Member m);
	
	// 시험 결과 조회
	Exam selectExamResult(Exam exam);

	Exam selectExamQuestion(Exam exam);

	int insertReReply(Reply r);

	int updateQna(QnA qna);

	int deleteQna(QnA qna);

	// 알람 등록
	int insertAlarm(Alarm examAlarm);

	// 시험 제출자 조회
	Member selectExamIns(Exam e);

	// 과제 제출자조회
	Member selectTaskIns(Task t);

	// 마이페이지(평가)
	ArrayList<Exam> selectExamResultList(Exam e);

	
}