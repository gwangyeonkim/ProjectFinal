package com.min.sche.service;

import java.util.List;
import java.util.Map;

import com.min.sche.vo.ScheduleVo;

public interface IScheduleService {
	
	public List<ScheduleVo> getTeamSchedule(List<String> userList);
	
	public int pScheduleInsert(Map<String, Object> map);
	public int pScheduleUpdate(Map<String, Object> map);
	public int pScheduleDelete(Map<String, Object> map);
	
}
