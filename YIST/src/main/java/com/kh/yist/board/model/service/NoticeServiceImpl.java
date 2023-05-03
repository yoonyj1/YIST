package com.kh.yist.board.model.service;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.yist.board.model.dao.NoticeDao;
import com.kh.yist.board.model.vo.Notice;
import com.kh.yist.common.model.vo.PageInfo;

@Service
public class NoticeServiceImpl implements NoticeService{
	
	@Autowired
	private NoticeDao nDao;
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int selectNoticeCount() {
		return nDao.selectNoticeCount(sqlSession);
	}

	@Override
	public ArrayList<Notice> selectNoticeList(PageInfo pi) {
		return nDao.selectNoticeList(sqlSession, pi);
	}

	@Override
	public int insertNotice(Notice b) {
		return 0;
	}

	@Override
	public Notice selectNotice(int boardNo) {
		return null;
	}

	@Override
	public int deleteNotice(int boardNo) {
		return 0;
	}

	@Override
	public int updateNotice(Notice b) {
		return 0;
	}

}
