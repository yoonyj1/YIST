package com.kh.yist.subject.model.service;

import java.util.ArrayList;

import com.kh.yist.subject.model.vo.Subject;

public interface SubjectService {

	ArrayList<Subject> selectSubjectList();
	
	int increaseCurrentSeats(int subjectNo);
}
