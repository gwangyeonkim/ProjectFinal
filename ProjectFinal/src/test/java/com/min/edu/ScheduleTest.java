package com.min.edu;

import static org.junit.Assert.*;

import java.util.List;

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
	
	@Test
	public void callSchedule() {
	List<ScheduleVo> lists = sqlsession.selectList("com.min.sche.mapper.ScheduleDaoImpl.getAllSchedule");
	System.out.println(lists.size());
	}
}
