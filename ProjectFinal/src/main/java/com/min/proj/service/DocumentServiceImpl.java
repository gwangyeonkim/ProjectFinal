package com.min.proj.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.min.proj.mapper.IDocumentDao;

@Service
public class DocumentServiceImpl implements IDocumentService{

	@Autowired
	private IDocumentDao dao;
	
	private static final Logger logger = LoggerFactory.getLogger(DocumentServiceImpl.class);
		
	@Override
	public int newDoc(String projName) {
		logger.info("DocumentServiceImpl newDoc {}",projName);
		return dao.newDoc(projName);
	}

}
