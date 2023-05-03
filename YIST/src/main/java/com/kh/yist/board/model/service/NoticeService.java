package com.kh.yist.board.model.service;

import java.util.ArrayList;

import com.kh.yist.board.model.vo.Notice;
import com.kh.yist.common.model.vo.PageInfo;

public interface NoticeService {
	//	1. 게시판 리스트 페이징
	
	//	1-1. 전체 게시글 개수 조회
	int selectNoticeCount();
	
	//	1-2. 게시글 리스트 조회
	ArrayList<Notice> selectNoticeList(PageInfo pi);
	
	//	2. 게시글 작성
	int insertNotice(Notice b);
	
	//	3. 게시글 상세 조회
	
	// 3-1. 상세 조회할 게시글 조회
	Notice selectNotice(int boardNo);
	
	//	4. 게시글 삭제
	int deleteNotice(int boardNo);
	
	//	5. 게시글 수정
	int	updateNotice(Notice b);
	


	
	
}
