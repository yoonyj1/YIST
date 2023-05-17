package com.kh.yist.task.model.service;

import java.util.ArrayList;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.yist.common.model.vo.PageInfo;
import com.kh.yist.exam.model.vo.Exam;
import com.kh.yist.member.model.vo.Alarm;
import com.kh.yist.member.model.vo.Member;
import com.kh.yist.task.model.dao.TaskDao;
import com.kh.yist.task.model.vo.Task;
import com.kh.yist.task.model.vo.TaskSubmit;

@Service
public class TaskService {
	
	@Autowired
	private TaskDao tDao;

	@Autowired
	public SqlSessionTemplate sqlSession;
	
	public int insertTask(Task task) {
		return tDao.insertTask(sqlSession, task);
	}

	public int insertTaskFile(Task task) {
		return tDao.insertTaskFile(sqlSession, task);
	}

	public int selectTaskListCount(Map<String, String> optMap) {
		return tDao.selectTaskListCount(sqlSession, optMap);
	}

	public ArrayList<Task> selectTaskList(PageInfo pi, Map<String, String> optMap) {
		return tDao.selectTaskList(sqlSession, pi, optMap);
	}

	public int updateTask(Task task) {
		return tDao.updateTask(sqlSession, task);
	}

	public int deleteTask(Task task) {
		return tDao.deleteTask(sqlSession, task);
	}

	public ArrayList<TaskSubmit> selectSubmitList(int taskNo) {
		return tDao.selectSubmitList(sqlSession, taskNo);
	}

	public int checkTaskSubmit(TaskSubmit ts) {
		return tDao.checkTaskSubmit(sqlSession, ts);
	}

	public ArrayList<Exam> selectExamList(String id) {
		return tDao.selectExamList(sqlSession, id);
	}

	public ArrayList<Exam> selectExamSubmitList(int testNo) {
		return tDao.selectExamSubmitList(sqlSession, testNo);
	}

	public Exam selectQuestion(int testNo) {
		return tDao.selectQuestion(sqlSession, testNo);
	}

	public int setExam(int testNo) {
		return tDao.setExam(sqlSession, testNo);
	}

	public ArrayList<Member> selectExamMemberList(String subject) {
		return tDao.selectExamMemberList(sqlSession, subject);
	}

	public int insertAlarm(Alarm taskAlarm) {
		return tDao.insertAlarm(sqlSession, taskAlarm);
	}
	
	// 성적 조회
	public ArrayList<Exam> selectGradeList(Member loginUser) {
		return tDao.selectGradeList(sqlSession, loginUser);
	}

	public ArrayList<Exam> selectExamScore(Member loginUser) {
		return tDao.selectExamScore(sqlSession, loginUser);
	}
	
}
