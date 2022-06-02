package com.min.proj.mapper;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.min.proj.vo.ProjectVo;

@Repository
public class ProjectDaoImpl implements IProjectDao{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
//	private final String NS = "com.min.proj.mapper.ProjectDaoImpl.";
	private final String NS = "Project.";
	
//	@Override
//	public List<ProjectVo> test() {
//		// TODO Auto-generated method stub
//		return sqlSession.selectList(NS+"test");
//	}
	
	@Override
	public int newProj(String projName) {
		return sqlSession.insert(NS+"newProj",projName);
	}

	@Override
	public int chkProj(String projName) {
		
		return sqlSession.selectOne(NS+"chkProj",projName);
		
	}

	
	

}
