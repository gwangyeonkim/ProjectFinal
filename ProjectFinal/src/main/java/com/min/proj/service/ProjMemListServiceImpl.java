package com.min.proj.service;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.min.proj.mapper.IProjMemListDao;
import com.min.proj.vo.ProjMemListVo;
import com.min.proj.vo.ProjectVo;

@Service
public class ProjMemListServiceImpl implements IProjMemListService{

	@Autowired
	private IProjMemListDao dao;
	
	private static final Logger logger = LoggerFactory.getLogger(ProjectServiceImpl.class);
	
	@Override
	public ProjMemListVo chkProjMem(String memId) {
		logger.info("ProjMemListServiceImpl chkProjMem {}",memId);
		return dao.chkProjMem(memId);
	}

	@Override
	public int joinProj(Map<String, String> map) {
		logger.info("ProjMemListServiceImpl joinProj {}",map);
		return dao.joinProj(map);
	}

	@Override
	public int basicMemProj(Map<String, String> map) {
		logger.info("ProjMemListServiceImpl basicMemProj {}",map);
		return dao.basicMemProj(map);
	}

	@Override
	public int exitProj(String memId) {
		logger.info("ProjMemListServiceImpl exitProj {}",memId);
		return dao.exitProj(memId);
	}

	@Override
	public List<ProjMemListVo> projMemList(String projName) {
		logger.info("ProjMemListServiceImpl projMemList {}",projName);
		return dao.projMemList(projName);
	}

	@Override
	public int changePm(Map<String, String> map) {
		logger.info("ProjMemListServiceImpl changePm {}",map);
		return dao.changePm(map);
	}

}
