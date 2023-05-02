package com.kh.yist.admin.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.yist.admin.model.dao.AdminDaoY;
import com.kh.yist.common.model.vo.PageInfo;
import com.kh.yist.member.model.vo.Member;

@Service
public class AdminServiceY {

	@Autowired
	private AdminDaoY aDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int selectListCount() {
		return aDao.selectListCount(sqlSession);
	}
	
	public ArrayList<Member> selectList(PageInfo pi) {
		return aDao.selectList(sqlSession, pi);
	}
	
	public ArrayList<Member> selectNonSubjectList() {
		return aDao.selectNonSubjectList(sqlSession);
	}
	
	public int checkDeleteInstuctor(String valueArr) {
		return aDao.checkDeleteInstuctor(sqlSession, valueArr);
	}
	
	public Member selectTeacher(String id) {
		return aDao.selectTeacher(sqlSession, id);
	}
	
	public int selectStudentListCount() {
		return aDao.selectStudentListCount(sqlSession);
	}
	
	public ArrayList<Member> selectStudentList(PageInfo pi) {
		return aDao.selectStudentList(sqlSession, pi);
	}
}
