package com.min.sche.mapper;

import java.util.List;
import java.util.Map;

import com.min.sche.vo.ScheduleVo;
import com.min.sche.vo.WbsViewVo;

public interface IScheduleDao {

	public List<WbsViewVo> getTeamSchedule(List<String> userList);

	
	public List<ScheduleVo> pScheduleShow(String mId);

	public int pScheduleInsert(Map<String, Object> map);

	public int pScheduleUpdate(Map<String, Object> map);

	public int pScheduleDelete(Map<String, Object> map);

	
	public List<WbsViewVo> callIncomplete(String projName);

	public List<WbsViewVo> callComplete(String projName);
}
