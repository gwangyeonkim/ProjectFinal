package com.min.sche.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.min.sche.mapper.IScheduleDao;
import com.min.sche.vo.ScheduleVo;
import com.min.sche.vo.WbsViewVo;

@Service
public class ScheduleServiceImpl implements IScheduleService {

	@Autowired
	private IScheduleDao dao;
	
	@Override
	public List<WbsViewVo> getTeamSchedule(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.getTeamSchedule(map); 
	}
	
	@Override
	public List<ScheduleVo> pScheduleShow(String mId) {
		// TODO Auto-generated method stub
		return dao.pScheduleShow(mId);
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

	@Override
	public List<WbsViewVo> callIncomplete(String memId) {
		// TODO Auto-generated method stub
		return dao.callIncomplete(memId);
	}

	@Override
	public List<WbsViewVo> callComplete(String memId) {
		// TODO Auto-generated method stub
		return dao.callComplete(memId);
	}

	@Override
	public int completeSchedule(String wbsId) {
		// TODO Auto-generated method stub
		return dao.completeSchedule(wbsId);
	}
	
	@Override
	public int incompleteSchedule(String wbsId) {
		// TODO Auto-generated method stub
		return dao.incompleteSchedule(wbsId);
	}

	@Override
	public int checkAuth(String memId) {
		// TODO Auto-generated method stub
		return dao.checkAuth(memId);
	}

	

	

}
