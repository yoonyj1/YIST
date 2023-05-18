package com.kh.yist.task.model.dao;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.yist.common.model.vo.PageInfo;
import com.kh.yist.exam.model.vo.Exam;
import com.kh.yist.member.model.vo.Alarm;
import com.kh.yist.member.model.vo.Member;
import com.kh.yist.task.model.vo.Task;
import com.kh.yist.task.model.vo.TaskSubmit;

@Repository
public class TaskDao {

	public int insertTask(SqlSessionTemplate sqlSession, Task task) {
		
		System.out.println("dao-----------------------------");
		System.out.println(task);
		
		return sqlSession.insert("instructorMapper.insertTask", task);
	}

	public int insertTaskFile(SqlSessionTemplate sqlSession, Task task) {
		System.out.println("fileNo : " + task.getFileNo());
		return sqlSession.insert("instructorMapper.insertTaskFile", task);
	}

	public int selectTaskListCount(SqlSessionTemplate sqlSession, Map<String, String> optMap) {
		return sqlSession.selectOne("instructorMapper.selectTaskListCount", optMap);
	}

	public ArrayList<Task> selectTaskList(SqlSessionTemplate sqlSession, PageInfo pi, Map<String, String> optMap) {

		// 몇 개의 게시글을 건너 뛸건지
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();

		// 총 몇개를 조회해갈껀지
		int limit = pi.getBoardLimit();

		RowBounds rowBounds = new RowBounds(offset, limit);

		return (ArrayList) sqlSession.selectList("instructorMapper.selectTaskList", optMap, rowBounds);
	}

	public int updateTask(SqlSessionTemplate sqlSession, Task task) {
		
		int update1, update2 = 0;
		
		update1 = sqlSession.update("instructorMapper.updateTask", task);
		if (update1 > 0 ) {
			update2 = sqlSession.update("instructorMapper.updateTaskFile", task);
		}
		return update2; 
	}

	public int deleteTask(SqlSessionTemplate sqlSession, Task task) {
		
		int result = sqlSession.update("instructorMapper.deleteTask", task);
		
		for (int i = 0; i < task.getTaskNo(); i++) {
			sqlSession.update("instructorMapper.deleteTaskSubmit", task);
		}
		
		if (task.getFileNo() > 0) {
			sqlSession.update("instructorMapper.deleteTaskFile", task);
		}
		
		return result;
	}

	public ArrayList<TaskSubmit> selectSubmitList(SqlSessionTemplate sqlSession, int taskNo) {
		return (ArrayList)sqlSession.selectList("instructorMapper.selectSubmitList", taskNo);
	}

	public int checkTaskSubmit(SqlSessionTemplate sqlSession, TaskSubmit ts) {
		return sqlSession.update("instructorMapper.checkTaskSubmit", ts);
	}

	public ArrayList<Exam> selectExamList(SqlSessionTemplate sqlSession, String id) {
		return (ArrayList)sqlSession.selectList("instructorMapper.selectExamList", id);
	}

	public ArrayList<Exam> selectExamSubmitList(SqlSessionTemplate sqlSession, int testNo) {
		return (ArrayList)sqlSession.selectList("instructorMapper.selectExamSubmitList", testNo);
	}

	public Exam selectQuestion(SqlSessionTemplate sqlSession, int testNo) {
		return sqlSession.selectOne("instructorMapper.selectQuestion", testNo);
	}

	public int setExam(SqlSessionTemplate sqlSession, Exam exam) {
		return sqlSession.insert("instructorMapper.setExam", exam);
	}

	public ArrayList<Exam> selectExamMemberList(SqlSessionTemplate sqlSession, String subject) {
		return (ArrayList)sqlSession.selectList("instructorMapper.selectExamMemberList", subject);
	}

	public int insertAlarm(SqlSessionTemplate sqlSession, Alarm taskAlarm) {
		return sqlSession.insert("instructorMapper.insertAlarm", taskAlarm);
	}

	public int insertTaskSubmit(SqlSessionTemplate sqlSession, String id) {
		return sqlSession.insert("instructorMapper.insertTaskSubmit", id);
	}

	public int setExamTime(SqlSessionTemplate sqlSession, Exam exam) {
		return sqlSession.insert("instructorMapper.setExamTime", exam);
	}

	public int updateSetExam(SqlSessionTemplate sqlSession, Exam exam) {
		return sqlSession.update("instructorMapper.updateSetExam", exam);
	}

	public int updateSetExamAnswer(SqlSessionTemplate sqlSession, Exam exam) {
		return sqlSession.update("instructorMapper.updateSetExamAnswer", exam);
	}
	
	// 성적 조회
	public ArrayList<Exam> selectGradeList(SqlSessionTemplate sqlSession, Member loginUser) {
		return (ArrayList)sqlSession.selectList("instructorMapper.selectGradeList", loginUser);
	}

	// 성적 조회
	public ArrayList<Exam> selectExamScore(SqlSessionTemplate sqlSession, Member loginUser) {
		return (ArrayList)sqlSession.selectList("instructorMapper.selectExamScore", loginUser);
	}

	// 알람 조회
	public ArrayList<Alarm> selectInsAlarmList(SqlSessionTemplate sqlSession, String id) {
		return (ArrayList) sqlSession.selectList("instructorMapper.selectInsAlarmList", id);
	}

	public int insAlarmCheck(SqlSessionTemplate sqlSession, int alarmNo) {
		return sqlSession.update("instructorMapper.insAlarmCheck", alarmNo);
	}

	public ArrayList<Exam> selectAjaxGradeList(SqlSessionTemplate sqlSession, Exam exam) {
		return (ArrayList)sqlSession.selectList("instructorMapper.selectAjaxGradeList", exam);
	}
	

}
