package com.kh.yist.subject.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.kh.yist.common.model.vo.PageInfo;
import com.kh.yist.member.model.vo.Member;
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
	
	int deleteSubject(List<String> subjectNo);
	
	// 과정 조회
	ArrayList<Class> selectClassList();
	
	// currval 조회
	int selectCurrval();
	
	// 검색 게시글 수 조회
	int selectSearchCount(HashMap<String, String> map);
	
	// 검색 게시글 조회
	ArrayList<Subject> selectSearchList(HashMap<String, String> map, PageInfo pi);
	
	// 수강 학생 리스트 조회
	ArrayList<Member> selectStudentList(int subject);

}
