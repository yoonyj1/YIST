package com.kh.yist.board.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.kh.yist.board.model.dao.MaterialDao;
import com.kh.yist.common.model.vo.PageInfo;
import com.kh.yist.student.model.vo.Material;

@Service
public class MaterialServiceImpl implements MaterialService {
	
	private SqlSessionTemplate sqlSession;
	
	private MaterialDao mDao;

	@Override
	public int selectMaterialCount() {
		return 0;
	}

	@Override
	public ArrayList<Material> selectMaterialList(PageInfo pi) {
		return null;
	}

	@Override
	public int insertMaterial(Material m) {
		return 0;
	}

	@Override
	public Material selectMaterial(int boardNo) {
		return null;
	}

	@Override
	public int increaseCount(int boardNo) {
		return 0;
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
		return 0;
	}

	@Override
	public ArrayList<Material> selectSearchList(HashMap<String, String> map, PageInfo pi) {
		return null;
	}

}
