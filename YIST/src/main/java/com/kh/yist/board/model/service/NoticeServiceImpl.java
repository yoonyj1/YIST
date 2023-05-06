package com.kh.yist.board.model.service;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
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
	private SqlSessionTemplate sqlSession;

	@Override
	public int selectNoticeCount() {
		return nDao.selectNoticeCount(sqlSession);
	}

	@Override
	public ArrayList<Notice> selectNoticeList(PageInfo pi) {
		return nDao.selectNoticeList(sqlSession, pi);
	}

	@Override
	public int insertNotice(Notice n) {
		return nDao.insertNotice(sqlSession, n);
	}

	@Override
	public Notice selectNotice(int boardNo) {
		return nDao.selectNotice(sqlSession, boardNo);
	}

	@Override
	public int deleteNotice(int boardNo) {
		return 0;
	}

	@Override
	public int updateNotice(Notice n) {
		return nDao.updateNotice(sqlSession, n);
	}

	@Override
	public int increaseCount(int boardNo) {
		return nDao.increaseCount(sqlSession, boardNo);
	}

}
