package com.kh.yist.board.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.kh.yist.board.model.vo.Notice;
import com.kh.yist.common.model.vo.PageInfo;

public interface NoticeService {
	//	1. 게시판 리스트 페이징
	
	//	1-1. 전체 게시글 개수 조회
	int selectNoticeCount();
	
	//	1-2. 게시글 리스트 조회
	ArrayList<Notice> selectNoticeList(PageInfo pi);
	
	//	2. 게시글 작성
	int insertNotice(Notice n);
	
	//	3. 게시글 상세 조회
	
	// 3-1. 상세 조회할 게시글 조회
	Notice selectNotice(int boardNo);
	
	//	4. 게시글 삭제
	int deleteNotice(int boardNo);
	
	//	5. 게시글 수정
	int	updateNotice(Notice n);
	

	// 조회수증가
	int increaseCount(int boardNo);
	
	
	//키워드검색 일치 개수
	int selectSearchCount(HashMap<String, String> map);
	
	//키워드검색 리스트 조회
	ArrayList<Notice> selectSearchList(HashMap<String, String> map, PageInfo pi);
	
	
	
}
