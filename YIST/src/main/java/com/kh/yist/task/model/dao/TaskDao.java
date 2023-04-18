package com.kh.yist.task.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.yist.task.model.vo.Task;

@Repository
public class TaskDao {

	public int insertTask(SqlSessionTemplate sqlSession, Task task) {
		return sqlSession.insert("instructorMapper.insertTask", task);
	}

	public int insertTaskFile(SqlSessionTemplate sqlSession, Task task) {
		return sqlSession.insert("instructorMapper.insertTaskFile", task);
	}
	
}
