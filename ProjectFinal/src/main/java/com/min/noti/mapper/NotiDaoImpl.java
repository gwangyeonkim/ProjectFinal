package com.min.noti.mapper;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.min.noti.vo.NotiVo;
import com.min.noti.vo.MemListVo;

@Repository
public class NotiDaoImpl implements INotiDao {
	
	@Autowired
	private SqlSessionTemplate session;
	
	private final String NS = "com.min.noti.mapper.NotiDaoImpl.";
	
	@Override
	public int notification_insert_privacy() {
		return session.insert(NS + "notification_insert_privacy");
	}

	@Override
	public int notification_insert_team() {
		return session.insert(NS + "notification_insert_team");
	}

	@Override
	public int notification_update(Map<String, Object> map) {
		return session.update(NS + "notification_update", map);
	}

	@Override
	public List<NotiVo> notification_my_noti(Map<String, Object> map) {
		return session.selectList(NS + "notification_my_noti", map);
	}

	@Override
	public List<NotiVo> notification_noti_confirm() {
		return session.selectList(NS + "notification_noti_confirm");
	}

	@Override
	public int notification_delete(Map<String, Object> map) {
		return session.update(NS + "notification_delete", map);
	}

	@Override
	public int notification_count(Map<String, Object> map) {
		return session.selectOne(NS + "notification_count", map);
	}

	@Override
	public MemListVo chatting_groupName(Map<String, Object> map) {
		return session.selectOne(NS + "chatting_groupName", map);
	}

	@Override
	public int notification_delete_All() {
		return session.update(NS + "notification_delete_All");
	}
}
