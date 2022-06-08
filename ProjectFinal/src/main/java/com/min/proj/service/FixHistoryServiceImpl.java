package com.min.proj.service;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.min.proj.mapper.IFixHistoryDao;
import com.min.proj.vo.FixHistoryVo;

@Service
public class FixHistoryServiceImpl implements IFixHistoryService{

	@Autowired
	private IFixHistoryDao dao;
	
	private static final Logger logger = LoggerFactory.getLogger(FixHistoryServiceImpl.class);
	
	@Override
	public int newFix(Map<String, String> map) {
		logger.info("FixHistoryServiceImpl newFix : {}",map);
		return dao.newFix(map);
	}

	@Override
	public int cntFixHistory(Map<String, String> map) {
		logger.info("FixHistoryServiceImpl cntFixHistory : {}",map);
		return dao.cntFixHistory(map);
	}

	@Override
	public int deletFixHistory(Map<String, String> map) {
		logger.info("FixHistoryServiceImpl deletFixHistory : {}",map);
		return dao.deletFixHistory(map);
	}

	@Override
	public int modifyFixHistory(Map<String, String> map) {
		logger.info("FixHistoryServiceImpl modifyFixHistory : {}",map);
		return dao.modifyFixHistory(map);
	}

	@Override
	public List<FixHistoryVo> selectFixHistory(Map<String, String> map) {
		logger.info("FixHistoryServiceImpl selectFixHistory : {}",map);
		return dao.selectFixHistory(map);
	}

}
