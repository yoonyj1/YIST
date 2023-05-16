package com.kh.yist.board.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.yist.common.model.vo.PageInfo;
import com.kh.yist.student.model.vo.Material;

public interface MaterialService {
	
	// 전체 게시글 개수 조회
	int selectMaterialCount();
	
	// 페이징리스트조회
	ArrayList<Material> selectMaterialList(PageInfo pi);
	
	// 학습자료 등록
	int insertMaterial(Material m);
	
	// 학습자료 상세조회
	Material selectMaterial(int boardNo);

	// 학습자료 조회수 증가
	int increaseCount(int boardNo);
	
	// 학습자료 삭제
	int deleteMaterial(int boardNo);
	
	// 학습자료 수정
	int updateMaterial(Material m);
	
	// 학습자료 검색 게시글 개수 조회
	int selectSearchCount(HashMap<String, String> map);
	
	// 학습자료 검색 게시글 페이징 리스트 조회
	ArrayList<Material> selectSearchList(HashMap<String, String> map, PageInfo pi);
	

}
