package com.min.noti.mapper;

import java.util.List;
import java.util.Map;

import com.min.noti.vo.NotiVo;
import com.min.noti.vo.MemListVo;

public interface INotiDao {

	public int notification_insert_privacy();
	
	public int notification_insert_team();
	
	public int notification_update(Map<String, Object> map);
	
	public List<NotiVo> notification_my_noti(Map<String, Object> map);
	
	public List<NotiVo> notification_noti_confirm();
	
	public int notification_delete(Map<String, Object> map);
	
	public int notification_count(Map<String, Object> map);
	
	public MemListVo chatting_groupName(Map<String, Object> map);
	
	public int notification_delete_All();
}
