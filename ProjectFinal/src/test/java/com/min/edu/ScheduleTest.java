package com.min.edu;

import static org.junit.Assert.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.min.sche.mapper.IScheduleDao;
import com.min.sche.vo.ScheduleVo;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class ScheduleTest {

	@Autowired
	private IScheduleDao dao;
	
	
	@Autowired
	private SqlSessionTemplate sqlsession;
	
//	@Test
	public void sqlsessiontest() {
		assertNotNull(sqlsession);
	}
	
//	@Test
	public void callSchedule() {
	List<ScheduleVo> lists = sqlsession.selectList("com.min.sche.mapper.ScheduleDaoImpl.getAllSchedule");
	System.out.println(lists.size());
	}
	
//	@Test
	public void insertTest() {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("sId", "s001");
		map.put("mId", "CH001"); // FK임 
		map.put("sName", "일정1");
		map.put("sCont", "내용1");
		map.put("start", "2022-05-06");
		map.put("end", "2022-05-07");
		int cnt = dao.pScheduleInsert(map);
		System.out.println(cnt);
	}
	
//	@Test
	public void updateTest() {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("sId", "s001");
		map.put("mId", "CH001");
		map.put("sName", "일정수정1");
		map.put("sCont", "내용수정1");
		map.put("start", "2022-06-06");
		map.put("end", "2022-06-07");
		int cnt = dao.pScheduleUpdate(map);
		System.out.println(cnt);
	}
	
//	@Test
	public void deleteTest() {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("sId", "s001");
		map.put("mId", "CH001"); 
		int cnt = dao.pScheduleDelete(map);
		System.out.println(cnt);
	}
}














