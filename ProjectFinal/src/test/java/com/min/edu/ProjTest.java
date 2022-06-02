package com.min.edu;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.min.proj.mapper.IProjectDao;
import com.min.proj.vo.ProjectVo;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class ProjTest {

	@Autowired
	public IProjectDao ProjDao;
	

//	@Test
	public void newProj() {
		System.out.println("1번 들어옴");
		int n = ProjDao.newProj("창창일학1");
		System.out.println("2번 들어옴");
		System.out.println("++++++++++++++++++++"+n);
	}
	
	@Test
	public void chkProj() {
		int n = ProjDao.chkProj("창창일학1");
		System.out.println(n);
	}

}
