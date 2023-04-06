package com.kh.yist.spring.instructor.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.yist.spring.instructor.model.vo.Calendar;

@Repository
public class CalendarDao {

	public ArrayList<Calendar> selectCalendar(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("calendarMapper.selectCalendar");
	}

	public int insertCalendar(SqlSessionTemplate sqlSession, Calendar c) {
		return sqlSession.insert("calendarMapper.insertCalendar", c);
	}

}
