package com.min.proj.mapper;

import java.util.List;
import java.util.Map;
import java.util.Random;

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

	@Override
	public String randomkey() {
		int leftLimit = 48; // numeral '0'
	    int rightLimit = 122; // letter 'z'
	    int projKeyLength = 20;
	    Random random = new Random();
	    String projKey = random.ints(leftLimit, rightLimit + 1)
	                                   .filter(i -> (i <= 57 || i >= 65) && (i <= 90 || i >= 97))
	                                   .limit(projKeyLength)
	                                   .collect(StringBuilder::new, StringBuilder::appendCodePoint, StringBuilder::append)
	                                   .toString();
	    System.out.println(projKey);
		return projKey;
	}

	@Override
	public int chkRandomKey(String randomkey) {
		
		return sqlSession.selectOne(NS+"chkRandomKey",randomkey);
	}

	@Override
	public int saveRandomKey(Map<String, String> map) {
		
		return sqlSession.update(NS+"saveRandomKey",map);
	}

	@Override
	public ProjectVo chkProjKey(String memId) {
		return sqlSession.selectOne(NS+"chkProjKey",memId);
	}

	
	

}
