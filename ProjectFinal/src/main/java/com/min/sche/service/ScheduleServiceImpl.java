package com.min.sche.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.min.sche.mapper.IScheduleDao;
import com.min.sche.vo.ScheduleVo;

@Service
public class ScheduleServiceImpl implements IScheduleService {

	@Autowired
	private IScheduleDao dao;
	
	@Override
	public List<ScheduleVo> getAllSchedule() {
		return dao.getAllSchedule();
	}

}
