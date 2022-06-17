package com.min.proj.service;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.min.proj.mapper.IProjectDao;
import com.min.proj.vo.ProjectVo;

@Service
public class ProjectServiceImpl implements IProjectService{

	@Autowired
	private IProjectDao dao;
	
	private static final Logger logger = LoggerFactory.getLogger(ProjectServiceImpl.class);
	
	@Override
	public int newProj(String projName) {
		logger.info("ProjectServiceImpl newProj {}",projName);
		return dao.newProj(projName);
	}

	@Override
	public int chkProj(String projName) {
		logger.info("ProjectServiceImpl newProj {}",projName);
		return dao.chkProj(projName);
	}

	@Override
	public String randomkey() {
		logger.info("ProjectServiceImpl randomkey {}");
		return dao.randomkey();
	}

	@Override
	public int chkRandomKey(String randomkey) {
		logger.info("ProjectServiceImpl chkRandomKey {}",randomkey);
		return dao.chkRandomKey(randomkey);
	}

	@Override
	public int saveRandomKey(Map<String, String> map) {
		logger.info("ProjectServiceImpl saveRandomKey {}",map);
		return dao.saveRandomKey(map);
	}

	@Override
	public ProjectVo chkProjKey(String memId) {
		logger.info("ProjectServiceImpl chkProjKey {}",memId);
		return dao.chkProjKey(memId);
	}

	@Override
	public int deleteProj(String projName) {
		// TODO Auto-generated method stub
		return dao.deleteProj(projName);
	}

}
