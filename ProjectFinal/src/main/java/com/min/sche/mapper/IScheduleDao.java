package com.min.sche.mapper;

import java.util.List;
import java.util.Map;

import com.min.sche.vo.ScheduleVo;


public interface IScheduleDao {

	public List<ScheduleVo> getAllSchedule();
	public int pScheduleInsert(Map<String, Object> map);
	public int pScheduleUpdate(Map<String, Object> map);
	public int pScheduleDelete(Map<String, Object> map);
	
}
