package com.kh.yist.board.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.yist.board.model.vo.ExamMaterial;
import com.kh.yist.common.model.vo.PageInfo;

public interface ExamMaterialService {
	
	// 전체 게시글 개수 조회
	int selectExamMaterialCount();
	
	// 페이징리스트조회
	ArrayList<ExamMaterial> selectExamMaterialList(PageInfo pi);
	
	// 학습자료 등록
	int insertExamMaterial(ExamMaterial m);
	
	// 학습자료 상세조회
	ExamMaterial selectMaterial(int boardNo);

	// 학습자료 조회수 증가
	int increaseCount(int boardNo);
	
	// 학습자료 삭제
	int deleteExamMaterial(int boardNo);
	
	// 학습자료 수정
	int updateExamMaterial(ExamMaterial m);
	
	// 학습자료 검색 게시글 개수 조회
	int selectSearchCount(HashMap<String, String> map);
	
	// 학습자료 검색 게시글 페이징 리스트 조회
	ArrayList<ExamMaterial> selectSearchList(HashMap<String, String> map, PageInfo pi);
}
