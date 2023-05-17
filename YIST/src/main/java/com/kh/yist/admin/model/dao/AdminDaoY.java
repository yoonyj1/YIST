package com.kh.yist.admin.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.yist.common.model.vo.PageInfo;
import com.kh.yist.exam.model.vo.Exam;
import com.kh.yist.member.model.vo.Member;
import com.kh.yist.subject.model.vo.Subject;

@Repository
public class AdminDaoY {
	
	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.selectListCount");
	}
	
	public ArrayList<Member> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		// 몇 개의 게시글을 건너뛸건지
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		// 총 몇개를 조회해갈건지
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);

		return (ArrayList)sqlSession.selectList("adminMapper.selectList", null, rowBounds);
	}
	
	public ArrayList<Member> selectNonSubjectList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("adminMapper.selectNonSubjectList");
	}
	
	public int checkDeleteInstuctor(SqlSessionTemplate sqlSession, String valueArr) {
		return sqlSession.update("adminMapper.checkDeleteInstuctor", valueArr);
	}
	
	public Member selectTeacher(SqlSessionTemplate sqlSession, String id) {
		System.out.println("Dao: " + id);
		return sqlSession.selectOne("adminMapper.selectTeacher", id);
	}
	
	
	public int selectStudentListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.selectStudentListCount");
	}
	
	public ArrayList<Member> selectJavaStudentList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("adminMapper.selectJavaStudentList");
	}
	
	public ArrayList<Member> selectPythonStudentList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("adminMapper.selectPythonStudentList");
	}
	
	public ArrayList<Member> selectCStudentList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("adminMapper.selectCStudentList");
	}
	
	public Member selectStudent(SqlSessionTemplate sqlSession, String id) {
		return sqlSession.selectOne("adminMapper.selectStudent", id);
	}
	
	public int updateTeacherInfo(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("adminMapper.updateTeacherInfo", m);
	}
	
	public ArrayList<Member> selectNullTeacherList(SqlSessionTemplate sqlSession, PageInfo pi) {
		// 몇 개의 게시글을 건너뛸건지
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		// 총 몇개를 조회해갈건지
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
				
		return (ArrayList)sqlSession.selectList("adminMapper.selectNullTeacherList", null, rowBounds);
	}
	
	public Member selectTeacherNull(SqlSessionTemplate sqlSession, String id) {
		return sqlSession.selectOne("adminMapper.selectTeacherNull", id);
	}
	
	public int deleteStudent(SqlSessionTemplate sqlSession, String id) {
		return sqlSession.update("adminMapper.deleteStudent", id);
	}
	
	public ArrayList<Member> selectStudentList(SqlSessionTemplate sqlSession, String subject) {
		return (ArrayList)sqlSession.selectList("adminMapper.selectStudentList", subject);
	}
	
	public int updateStudentInfo(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("adminMapper.updateStudentInfo", m);
	}
	
	public int resultAt(SqlSessionTemplate sqlSession, String id) {
		return sqlSession.update("adminMapper.resultAt", id);
	}
	
	public ArrayList<Subject> selectSubject(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("adminMapper.selectSubject");
	}
	
	public ArrayList<Exam> selectGrade(SqlSessionTemplate sqlSession, String subjectName) {
		return (ArrayList)sqlSession.selectList("adminMapper.selectGrade", subjectName);
	}
	
	public int quitClass(SqlSessionTemplate sqlSession, String id) {
		return sqlSession.update("adminMapper.quitClass", id);
	}
}
