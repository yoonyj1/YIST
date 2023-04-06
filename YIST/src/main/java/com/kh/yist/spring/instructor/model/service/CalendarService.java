package com.kh.yist.spring.instructor.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.yist.spring.instructor.model.dao.CalendarDao;
import com.kh.yist.spring.instructor.model.vo.Calendar;

@Service
public class CalendarService {
	
	@Autowired
	public CalendarDao cDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public ArrayList<Calendar> selectCalendar() {
		ArrayList<Calendar> list = cDao.selectCalendar(sqlSession);
		return list;
	}

	public int insertCalendar(Calendar c) {
		return cDao.insertCalendar(sqlSession, c);
	}
	
}
