package com.kh.yist.board.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.yist.common.model.vo.PageInfo;
import com.kh.yist.student.model.vo.Material;

@Repository
public class MaterialDao {
	
	public int selectMaterialCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("classMapper.selectMaterialCount");
		
	}

	public ArrayList<Material> selectMaterialList(SqlSessionTemplate sqlSession, PageInfo pi){
		
		int offset = ( pi.getCurrentPage() - 1 ) * pi.getBoardLimit();
		
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("classMapper.selectMaterialList", null, rowBounds);
		
	}
	
	
	public int selectSearchCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		
		return sqlSession.selectOne("classMapper.selectSearchCount", map);
		
	}
	
	public ArrayList<Material> selectSearchList(SqlSessionTemplate sqlSession, HashMap<String, String> map, PageInfo pi){
		
		int offset = ( pi.getCurrentPage() - 1 ) * pi.getBoardLimit();
		
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		
		return (ArrayList)sqlSession.selectList("classMapper.selectSearchList", map, rowBounds);
		
	}
	
	public int increaseCount(SqlSessionTemplate sqlSession, int boardNo) {
		
		return sqlSession.update("classMapper.increaseCount", boardNo);
		
	}
	
	public Material selectMaterial(SqlSessionTemplate sqlSession, int boardNo) {
		
		return sqlSession.selectOne("classMapper.selectMaterial", boardNo);
		
	}
	
	
	public int insertMaterial(SqlSessionTemplate sqlSession, Material m) {
		
		return sqlSession.insert("classMapper.insertMaterial", m);
		
	}
	
}
