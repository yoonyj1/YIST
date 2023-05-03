package com.kh.yist.board.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class NoticeDao {
	
	public int selectNoticeCount(SqlSession sqlSession) {
		
		return sqlSession.selectOne("noticeMapper.selectNoticeCount");
		
	}
	
	
}
