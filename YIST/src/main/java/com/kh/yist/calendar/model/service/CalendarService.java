package com.kh.yist.calendar.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.yist.calendar.model.dao.CalendarDao;
import com.kh.yist.calendar.model.vo.Calendar;

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

	public int updateCalendar(Calendar c) {
		return cDao.updateCalendar(sqlSession, c);
	}

	public int deleteCalendar(int calId) {
		return cDao.deleteCalendar(sqlSession, calId);
	}

}
