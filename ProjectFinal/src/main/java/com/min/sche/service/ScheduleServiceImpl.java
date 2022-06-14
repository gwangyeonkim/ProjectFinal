package com.min.sche.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.min.sche.mapper.IScheduleDao;
import com.min.sche.vo.WbsViewVo;

@Service
public class ScheduleServiceImpl implements IScheduleService {

	@Autowired
	private IScheduleDao dao;
	
	@Override
	public List<WbsViewVo> getTeamSchedule(List<String> userList) {
		// TODO Auto-generated method stub
		return dao.getTeamSchedule(userList);
	}

	@Override
	public int pScheduleInsert(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.pScheduleInsert(map);
	}

	@Override
	public int pScheduleUpdate(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.pScheduleUpdate(map);
	}

	@Override
	public int pScheduleDelete(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.pScheduleDelete(map);
	}

	

}
