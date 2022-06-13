package com.min.proj.service;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.min.proj.mapper.ITopCategoryDao;

@Service
public class TopCategoryServiceImpl implements ITopCategoryService{

	@Autowired
	private ITopCategoryDao dao;
	
	private static final Logger logger = LoggerFactory.getLogger(TopCategoryServiceImpl.class);
	
	@Override
	public int newTopCategory(Map<String, String> map) {
		logger.info("TopCategoryServiceImpl newTopCategory {}",map);
		return dao.newTopCategory(map);
	}

	@Override
	public int fixTopCategory(Map<String, String> map) {
		logger.info("TopCategoryServiceImpl fixTopCategory {}",map);
		return dao.fixTopCategory(map);
	}

	@Override
	public int deleteTopCategory(String topId) {
		logger.info("TopCategoryServiceImpl deleteTopCategory {}",topId);
		return dao.deleteTopCategory(topId);
	}

	@Override
	public int deleteNullTopCategory(String projName) {
		// TODO Auto-generated method stub
		return dao.deleteNullTopCategory(projName);
	}

}
