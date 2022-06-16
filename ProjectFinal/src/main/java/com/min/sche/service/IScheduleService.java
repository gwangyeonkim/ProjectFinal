package com.min.sche.service;

import java.util.List;
import java.util.Map;

import com.min.sche.vo.ScheduleVo;
import com.min.sche.vo.WbsViewVo;

public interface IScheduleService {
	
	public List<WbsViewVo> getTeamSchedule(Map<String, Object> map);
	
	public List<ScheduleVo> pScheduleShow(String mId);
	public int pScheduleInsert(Map<String, Object> map);
	public int pScheduleUpdate(Map<String, Object> map);
	public int pScheduleDelete(Map<String, Object> map);
	
	public int completeSchedule(String wbsId);
	public int incompleteSchedule(String wbsId);
	public List<WbsViewVo> callIncomplete(String memId);
	public List<WbsViewVo> callComplete(String memId);
	public int checkAuth (String memId);
	
}
