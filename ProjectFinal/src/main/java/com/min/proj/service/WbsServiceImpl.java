package com.min.proj.service;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.min.proj.mapper.IWbsDao;
import com.min.proj.vo.WbsVo;

@Service
public class WbsServiceImpl implements IWbsService{

	@Autowired
	private IWbsDao dao;
	
	private static final Logger logger = LoggerFactory.getLogger(WbsServiceImpl.class);
	
	@Override
	public int newWbs(Map<String, String> map) {
		logger.info("WbsServiceImpl newWbs {}",map);
		return dao.newWbs(map);
	}

	@Override
	public List<WbsVo> selectWbs(Map<String, String> map) {
		logger.info("WbsServiceImpl selectWbs {}",map);
		return dao.selectWbs(map);
	}

	@Override
	public int fixWbs(Map<String, String> map) {
		logger.info("WbsServiceImpl fixWbs {}",map);
		return dao.fixWbs(map);
	}

	@Override
	public int deleteNullWbs(String projName) {
		logger.info("WbsServiceImpl deleteNullWbs {}",projName);
		return dao.deleteNullWbs(projName);
	}

	@Override
	public int deleteWbs(Map<String, String> map) {
		logger.info("WbsServiceImpl deleteWbs {}",map);
		return dao.deleteWbs(map);
	}

}
