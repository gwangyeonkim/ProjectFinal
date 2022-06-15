package com.min.sche.mapper;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.min.sche.vo.ScheduleVo;
import com.min.sche.vo.WbsViewVo;

@Repository
public class ScheduleDaoImpl implements IScheduleDao {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	private static final String NS = "com.min.sche.mapper.ScheduleDaoImpl.";
	
	@Autowired
	private SqlSessionTemplate session;
	

	@Override
	public List<WbsViewVo> getTeamSchedule(List<String> userList) {
		logger.info("해당 인원이 맡은 팀일정 가져오기");
		List<WbsViewVo> lists = session.selectList(NS+"getTeamSchedule", userList);
		return lists;
	}

	@Override
	public List<ScheduleVo> pScheduleShow(String mId) {
		// TODO Auto-generated method stub
		List<ScheduleVo> lists = session.selectList(NS+"pScheduleShow", mId);
		return lists;
	}
	
	@Override
	public int pScheduleInsert(Map<String, Object> map) {
		logger.info("개인 일정 생성");
		int cnt = session.insert(NS+"pScheduleInsert",map);
		return cnt;
	}


	@Override
	public int pScheduleUpdate(Map<String, Object> map) {
		logger.info("개인 일정 수정");
		int cnt = session.insert(NS+"pScheduleUpdate",map);
		return cnt;
	}


	@Override
	public int pScheduleDelete(Map<String, Object> map) {
		logger.info("개인 일정 삭제");
		int cnt = session.insert(NS+"pScheduleDelete",map);
		return cnt;
	}


	


	

}
