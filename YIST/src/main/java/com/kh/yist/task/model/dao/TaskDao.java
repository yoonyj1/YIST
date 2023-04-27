package com.kh.yist.task.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.yist.common.model.vo.PageInfo;
import com.kh.yist.task.model.vo.Task;

@Repository
public class TaskDao {

	public int insertTask(SqlSessionTemplate sqlSession, Task task) {
		return sqlSession.insert("instructorMapper.insertTask", task);
	}

	public int insertTaskFile(SqlSessionTemplate sqlSession, Task task) {
		return sqlSession.insert("instructorMapper.insertTaskFile", task);
	}

	public int selectTaskListCount(SqlSessionTemplate sqlSession, String id) {
		return sqlSession.selectOne("instructorMapper.selectTaskListCount", id);
	}

	public ArrayList<Task> selectTaskList(SqlSessionTemplate sqlSession, PageInfo pi, String id) {

		// 몇 개의 게시글을 건너 뛸건지
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();

		// 총 몇개를 조회해갈껀지
		int limit = pi.getBoardLimit();

		RowBounds rowBounds = new RowBounds(offset, limit);

		return (ArrayList) sqlSession.selectList("instructorMapper.selectTaskList", id, rowBounds);
	}

	public int updateTask(SqlSessionTemplate sqlSession, Task task) {
		
		int update1, update2 = 0;
		
		update1 = sqlSession.update("instructorMapper.updateTask", task);
		
		if (update1 > 0) {
			update2 = sqlSession.update("instructorMapper.updateTaskFile", task);
		}
		
		return update2; 
	}

}
