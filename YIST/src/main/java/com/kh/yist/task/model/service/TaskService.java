package com.kh.yist.task.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.yist.common.model.vo.PageInfo;
import com.kh.yist.task.model.dao.TaskDao;
import com.kh.yist.task.model.vo.Task;

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

	public int selectTaskListCount(String id) {
		return tDao.selectTaskListCount(sqlSession, id);
	}

	public ArrayList<Task> selectTaskList(PageInfo pi, String id) {
		return tDao.selectTaskList(sqlSession, pi, id);
	}

	public int updateTask(Task task) {
		return tDao.updateTask(sqlSession, task);
	}

	public int deleteTask(Task task) {
		return tDao.deleteTask(sqlSession, task);
	}
	
}
