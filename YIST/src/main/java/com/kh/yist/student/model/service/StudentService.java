package com.kh.yist.student.model.service;

import java.util.ArrayList;
import java.util.List;

import com.kh.yist.common.model.vo.PageInfo;
import com.kh.yist.member.model.vo.Member;
import com.kh.yist.student.model.vo.Exam;
import com.kh.yist.student.model.vo.Material;
import com.kh.yist.student.model.vo.Notice;
import com.kh.yist.student.model.vo.QnA;
import com.kh.yist.student.model.vo.Task;

public interface StudentService {

	ArrayList<Member> selectIns(Member loginUser);
	
	ArrayList<Notice> mainNotice();
	
	ArrayList<Exam> testList();
	
	Exam testDetail(int testNo);
	
	int testInsert(Exam e);
	
	int noticeListCount();
	
	ArrayList<Notice> selectList(PageInfo pi);
	
	Notice selectNotice(int boardNo);
	
	int boardListCount();
	
	ArrayList<Material> boardList(PageInfo pi);
	
	ArrayList<Material> MaterialList();
	
	ArrayList<Task> taskList();
	
	Task selectTask(int taskNo);
	
	Task selectTaskReply(int taskNo);
	
	int deleteTask(int taskNo);
	
	ArrayList<QnA> qnaList();
	
	int taskInsert(Task t);
	
	ArrayList<Task> selectMyTask(String id);
	
	int deleteMyTask(List<Integer> taskNoList);
	
	ArrayList<Exam> myTestList(String id);
}
