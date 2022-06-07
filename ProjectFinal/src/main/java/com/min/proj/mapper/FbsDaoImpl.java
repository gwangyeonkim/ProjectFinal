package com.min.proj.mapper;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.min.proj.vo.FbsVo;

@Repository
public class FbsDaoImpl implements IFbsDao{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private final String NS = "Project.";

	
	@Override
	public int newFbs(Map<String, String> map) {
		return sqlSession.insert(NS+"newFbs",map);
	}


	@Override
	public List<FbsVo> selectFbs(Map<String, String> map) {
		return sqlSession.selectList(NS+"selectFbs",map);
	}


	@Override
	public int fixFbs(Map<String, String> map) {
		return sqlSession.update(NS+"fixFbs",map);
	}

}
