package com.kh.yist.task.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	
}
