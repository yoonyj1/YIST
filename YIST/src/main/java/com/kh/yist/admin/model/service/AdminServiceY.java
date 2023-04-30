package com.kh.yist.admin.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.yist.admin.model.dao.AdminDaoY;

@Service
public class AdminServiceY {

	@Autowired
	private AdminDaoY aDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int selectListCount() {
		return aDao.selectListCount(sqlSession);
	}
	
}
