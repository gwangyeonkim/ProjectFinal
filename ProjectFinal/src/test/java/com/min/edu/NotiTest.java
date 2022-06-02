package com.min.edu;

import static org.junit.Assert.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.min.noti.vo.NotiVo;


@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/appServlet/*.xml" })
public class NotiTest {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	private final Logger logger = LoggerFactory.getLogger(NotiTest.class);
	

//	@Test
	public void notification_insert_privacy() {
		int i = sqlSession.insert("com.min.noti.mapper.NotiDaoImpl.notification_insert_privacy");
		System.out.println("@@@@@@@@@@@" + i);
	}
//	@Test
	public void notification_insert_team() {
		int i = sqlSession.insert("com.min.noti.mapper.NotiDaoImpl.notification_insert_team");
		System.out.println("@@@@@@@@@@@" + i);
	}
	
//	@Test // 부적합한 열유형
	public void notification_update() {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("notiNotifided", "Y");
		map.put("notiId", "GD001WBS002");
		int n =  sqlSession.insert("com.min.noti.mapper.NotiDaoImpl.notification_update", map);
		System.out.println(n);
	}
	
//	@Test
	public void notification_my_noti() {
		Map<String,String> map = new HashMap<String, String>();
		map.put("mem_id", "GD001");
		List<NotiVo> nvo = sqlSession.selectList("com.min.noti.mapper.NotiDaoImpl.notification_my_noti",map);
		System.out.println(nvo);
	}
	
//	@Test
	public void notification_noti_confirm() {
		List<NotiVo> nvo = sqlSession.selectList("com.min.noti.mapper.NotiDaoImpl.notification_noti_confirm");
		System.out.println(nvo);
	}
	
//	@Test // 부적합한 열유형
	public void notification_delete() {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("notiId", "si1");
		int n =  sqlSession.update("com.min.noti.mapper.NotiDaoImpl.notification_delete", map);
		System.out.println(n);
	}
	
//	@Test
	public void notification_count() {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("mem_id", "GD006");
		int n =  sqlSession.selectOne("com.min.noti.mapper.NotiDaoImpl.notification_count", map);
		System.out.println(n);
	}

}
