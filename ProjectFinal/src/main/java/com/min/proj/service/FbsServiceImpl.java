package com.min.proj.service;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.min.proj.mapper.IFbsDao;
import com.min.proj.vo.FbsVo;

@Service
public class FbsServiceImpl implements IFbsService{

	@Autowired
	private IFbsDao dao;
	
	private static final Logger logger = LoggerFactory.getLogger(FbsServiceImpl.class);
	
	@Override
	public List<FbsVo> selectFbs(Map<String, String> map) {
		logger.info("FbsServiceImpl selectFbs {}",map);
		return dao.selectFbs(map);
	}

	@Override
	public int newFbs(Map<String, String> map) {
		logger.info("FbsServiceImpl newFbs {}",map);
		return dao.newFbs(map);
	}

	@Override
	public int fixFbs(Map<String, String> map) {
		logger.info("FbsServiceImpl fixFbs {}",map);
		return dao.fixFbs(map);
		
	}

	@Override
	public int deleteFbs(Map<String, String> map) {
		logger.info("FbsServiceImpl deleteFbs {}",map);
		return dao.deleteFbs(map);
	}

}
