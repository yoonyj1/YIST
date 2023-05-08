package com.kh.yist.board.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.yist.board.model.dao.MaterialDao;
import com.kh.yist.common.model.vo.PageInfo;
import com.kh.yist.student.model.vo.Material;

@Service
public class MaterialServiceImpl implements MaterialService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private MaterialDao mDao;

	@Override
	public int selectMaterialCount() {
		return mDao.selectMaterialCount(sqlSession);
	}

	@Override
	public ArrayList<Material> selectMaterialList(PageInfo pi) {
		return mDao.selectMaterialList(sqlSession, pi);
	}

	@Override
	public int insertMaterial(Material m) {
		return mDao.insertMaterial(sqlSession, m);
	}

	@Override
	public Material selectMaterial(int boardNo) {
		return mDao.selectMaterial(sqlSession, boardNo);
	}

	@Override
	public int increaseCount(int boardNo) {
		return mDao.increaseCount(sqlSession, boardNo);
	}

	@Override
	public int deleteMaterial(int boardNo) {
		return 0;
	}

	@Override
	public int updateMaterial(Material m) {
		return 0;
	}

	@Override
	public int selectSearchCount(HashMap<String, String> map) {
		return mDao.selectSearchCount(sqlSession, map);
	}

	@Override
	public ArrayList<Material> selectSearchList(HashMap<String, String> map, PageInfo pi) {
		return mDao.selectSearchList(sqlSession, map, pi);
	}

}
