package com.min.proj.mapper;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.min.proj.vo.FixHistoryVo;

@Repository
public class FixHistoryDaoImpl implements IFixHistoryDao{

	@Autowired
	private SqlSessionTemplate sqlSession;
	private final String NS = "Project.";
	
	
	@Override
	public int newFix(Map<String, String> map) {
		return sqlSession.insert(NS+"newFix",map);
	}


	@Override
	public int cntFixHistory(Map<String, String> map) {
		return sqlSession.selectOne(NS+"cntFixHistory",map);
	}


	@Override
	public int deletFixHistory(Map<String, String> map) {
		// TODO Auto-generated method stub
		return sqlSession.delete(NS+"deletFixHistory",map);
	}


	@Override
	public int modifyFixHistory(Map<String, String> map) {
		// TODO Auto-generated method stub
		return sqlSession.update(NS+"modifyFixHistory",map);
	}


	@Override
	public List<FixHistoryVo> selectFixHistory(Map<String, String> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NS+"selectFixHistory",map);
	}

}
