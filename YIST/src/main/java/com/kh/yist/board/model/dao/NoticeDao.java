package com.kh.yist.board.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.yist.board.model.vo.Notice;
import com.kh.yist.common.model.vo.PageInfo;

@Repository
public class NoticeDao {
	
	public int selectNoticeCount(SqlSession sqlSession) {
		
		return sqlSession.selectOne("noticeMapper.selectNoticeCount");
		
	}
	
	public ArrayList<Notice> selectNoticeList(SqlSession sqlSession, PageInfo pi){
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("noticeMapper.selectNoticeList", null, rowBounds);
		
	}
	
	
	public Notice selectNotice(SqlSession sqlSession,int boardNo) {
		
		return sqlSession.selectOne("noticeMapper.selectNotice", boardNo);
		
	}
}
