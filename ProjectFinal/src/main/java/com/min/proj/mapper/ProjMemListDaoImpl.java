package com.min.proj.mapper;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.min.proj.vo.ProjMemListVo;

@Repository
public class ProjMemListDaoImpl implements IProjMemListDao{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private final String NS = "Project.";

	@Override
	public int chkProjMem(String memId) {
		return sqlSession.selectOne(NS+"chkProjMem",memId);
	}

	@Override
	public int joinProj(Map<String, String> map) {
		
		return sqlSession.insert(NS+"joinProj",map);
	}

	@Override
	public int basicMemProj(Map<String, String> map) {
		return sqlSession.insert(NS+"basicMemProj",map);
	}

	@Override
	public int exitProj(String memId) {
		return sqlSession.update(NS+"exitProj",memId);
	}

	@Override
	public List<ProjMemListVo> projMemList(String projName) {
		return sqlSession.selectList(NS+"projMemList",projName);
	}

	@Override
	public int changePm(Map<String, String> map) {
		// TODO Auto-generated method stub
		return sqlSession.update(NS+"changePm",map);
	}


}
