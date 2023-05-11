package com.kh.yist.board.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.yist.board.model.vo.ExamMaterial;
import com.kh.yist.common.model.vo.PageInfo;

@Repository
public class ExamMaterialDao {
	
	public int selectExamMaterialCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("examMaterialMapper.selectExamMaterialCount");
		
	}
	
	public ArrayList<ExamMaterial> selectExamMaterialList(SqlSessionTemplate sqlSession, PageInfo pi){
		
		int offset = ( pi.getCurrentPage() - 1 ) * pi.getBoardLimit();
		
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("examMaterialMapper.selectExamMaterialList", null, rowBounds);
		
	}
	
	public int selectSearchCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		
		return sqlSession.selectOne("examMaterialMapper.selectSearchCount", map);
		
	}
	
	public ArrayList<ExamMaterial> selectSearchList(SqlSessionTemplate sqlSession, HashMap<String, String> map, PageInfo pi){
		
		int offset = ( pi.getCurrentPage() - 1 ) * pi.getBoardLimit();
		
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("examMaterialMapper.selectSearchList", map, rowBounds);
		
		
	}
	
	public ExamMaterial selectMaterial(SqlSessionTemplate sqlSession, int boardNo) {
		
		return sqlSession.selectOne("examMaterialMapper.selectMaterial", boardNo);
		
	}
	
	public int insertExamMaterial(SqlSessionTemplate sqlSession, ExamMaterial m) {
		
		return sqlSession.insert("examMaterialMapper.insertExamMaterial", m);
		
	}
	
	public int deleteExamMaterial(SqlSessionTemplate sqlSession, int boardNo) {
		
		return sqlSession.update("examMaterialMapper.deleteExamMaterial", boardNo);
		
	}
	
	public int updateExamMaterial(SqlSessionTemplate sqlSession, ExamMaterial m) {
		
		return sqlSession.update("examMaterialMapper.updateExamMaterial", m);
		
	}

}
