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
		System.out.println("서비스: " + id);
		return aDao.selectTeacher(sqlSession, id);
	}
	
	public int selectStudentListCount() {
		return aDao.selectStudentListCount(sqlSession);
	}
	
	public ArrayList<Member> selectJavaStudentList() {
		return aDao.selectJavaStudentList(sqlSession);
	}
	
	public ArrayList<Member> selectPythonStudentList() {
		return aDao.selectPythonStudentList(sqlSession);
	}
	
	public ArrayList<Member> selectCStudentList() {
		return aDao.selectCStudentList(sqlSession);
	}
	
	public Member selectStudent(String id) {
		return aDao.selectStudent(sqlSession, id);
	}
	
	public int updateTeacherInfo(Member m) {
		return aDao.updateTeacherInfo(sqlSession, m);
	}
	
	public ArrayList<Member> selectNullTeacherList(PageInfo pi) {
		return aDao.selectNullTeacherList(sqlSession, pi);
	}
	
	public Member selectTeacherNull(String id) {
		return aDao.selectTeacherNull(sqlSession, id);
	}
	
	public int deleteStudent(String id) {
		return aDao.deleteStudent(sqlSession, id);
	}
}
