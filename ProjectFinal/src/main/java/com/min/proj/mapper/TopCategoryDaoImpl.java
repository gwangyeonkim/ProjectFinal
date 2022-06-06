package com.min.proj.mapper;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class TopCategoryDaoImpl implements ITopCategoryDao{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private final String NS = "Project.";

	
	@Override
	public int newTopCategory(Map<String, String> map) {
		return sqlSession.insert(NS+"newTopCategory",map);
	}


	@Override
	public int fixTopCategory(Map<String, String> map) {
		return sqlSession.update(NS+"fixTopCategory",map);
	}

}
