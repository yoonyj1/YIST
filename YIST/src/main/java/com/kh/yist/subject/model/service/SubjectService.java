package com.kh.yist.subject.model.service;

import java.util.ArrayList;

import com.kh.yist.common.model.vo.PageInfo;
import com.kh.yist.subject.model.vo.Class;
import com.kh.yist.subject.model.vo.Subject;

public interface SubjectService {

	// 회원가입(학생) 강의 조회
	ArrayList<Subject> selectSubjectList();
	
	// 회원가입시 학생정원 증가
	int increaseCurrentSeats(int subjectNo);
	
	// 전체 강의 개수 조회
	int selectSubjectListCount();
	
	// 강의 페이징
	ArrayList<Subject> selectSubjectList(PageInfo pi);
	
	// 강의 생성
	int insertSubject(Subject s);
	
	// 강의 상세 조회
	Subject selectSubject(int subjectNo);
	
	// 강의 수정
	int updateSubject(Subject s);
	
	// 강의 삭제
	int deleteSubject(int subjectNo);
	
	// 과정 조회
	ArrayList<Class> selectClassList();
	
	// currval 조회
	int selectCurrval();
	

}
