package com.kh.yist.board.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.yist.board.model.dao.ExamMaterialDao;
import com.kh.yist.board.model.vo.ExamMaterial;
import com.kh.yist.common.model.vo.PageInfo;

@Service
public class ExamMaterialServiceImpl implements ExamMaterialService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ExamMaterialDao eDao;

	@Override
	public int selectExamMaterialCount() {
		return eDao.selectExamMaterialCount(sqlSession);
	}

	@Override
	public ArrayList<ExamMaterial> selectExamMaterialList(PageInfo pi) {
		return eDao.selectExamMaterialList(sqlSession, pi);
	}

	@Override
	public int insertExamMaterial(ExamMaterial m) {
		return 0;
	}

	@Override
	public ExamMaterial selectMaterial(int boardNo) {
		return eDao.selectMaterial(sqlSession, boardNo);
	}

	@Override
	public int increaseCount(int boardNo) {
		return 0;
	}

	@Override
	public int deleteExamMaterial(int boardNo) {
		return 0;
	}

	@Override
	public int updateExamMaterial(ExamMaterial m) {
		return 0;
	}

	@Override
	public int selectSearchCount(HashMap<String, String> map) {
		return eDao.selectSearchCount(sqlSession, map);
	}

	@Override
	public ArrayList<ExamMaterial> selectSearchList(HashMap<String, String> map, PageInfo pi) {
		return eDao.selectSearchList(sqlSession, map, pi);
	}

}
