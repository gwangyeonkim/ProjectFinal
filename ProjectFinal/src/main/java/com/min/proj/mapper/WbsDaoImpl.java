package com.min.proj.mapper;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.min.proj.vo.WbsVo;

@Repository
public class WbsDaoImpl implements IWbsDao{

	@Autowired
	private SqlSessionTemplate sqlSession;
	private final String NS = "Project.";
	
	@Override
	public int newWbs(Map<String, String> map) {
		return sqlSession.insert(NS+"newWbs",map);
	}

	@Override
	public List<WbsVo> selectWbs(Map<String, String> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NS+"selectWbs",map);
	}

	@Override
	public int fixWbs(Map<String, String> map) {
		return sqlSession.update(NS+"fixWbs",map);
	}

	@Override
	public int deleteNullWbs(String projName) {
		// TODO Auto-generated method stub
		return sqlSession.delete(NS+"deleteNullWbs",projName);
	}

}
