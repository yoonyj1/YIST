package com.kh.yist.spring.instructor.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.yist.spring.instructor.model.dao.TaskDao;

@Service
public class TaskService {
	
	@Autowired
	private TaskDao tDao;
	
	
	
}
