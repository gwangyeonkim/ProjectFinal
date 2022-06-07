package com.min.proj.mapper;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DocumentDaoImpl implements IDocumentDao{

	@Autowired
	private SqlSessionTemplate sqlsession;
	
	private final String NS = "Project.";
	
	@Override
	public int newDoc(String projName) {
		return sqlsession.insert(NS+"newDoc",projName);
	}

}
