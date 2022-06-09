package com.min.edu;

import static org.junit.Assert.*;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.min.proj.mapper.FbsDaoImpl;
import com.min.proj.mapper.IDocumentDao;
import com.min.proj.mapper.IFbsDao;
import com.min.proj.mapper.IFixHistoryDao;
import com.min.proj.mapper.IProjMemListDao;
import com.min.proj.mapper.IProjectDao;
import com.min.proj.mapper.ITopCategoryDao;
import com.min.proj.mapper.IWbsDao;
import com.min.proj.vo.FbsVo;
import com.min.proj.vo.FixHistoryVo;
import com.min.proj.vo.ProjMemListVo;
import com.min.proj.vo.ProjectVo;
import com.min.proj.vo.WbsVo;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class ProjTest {

	@Autowired
	public IProjectDao projDao;
	@Autowired
	public IProjMemListDao projMemDao;
	@Autowired
	public IDocumentDao docDao;
	@Autowired
	public ITopCategoryDao topDao;
	@Autowired
	public IFbsDao fbsDao;
	@Autowired
	public IWbsDao wbsDao;
	@Autowired
	public IFixHistoryDao fixDao;
//	@Test
	public void newProj() {
		System.out.println("1번 들어옴");
		int n = projDao.newProj("창창일학1");
		System.out.println("2번 들어옴");
		System.out.println("++++++++++++++++++++"+n);
	}
	
//	@Test
	public void chkProj() {
		int n = projDao.chkProj("창창일학1");
		System.out.println(n);
	}

//	@Test
	public void chkProjMem() {
		System.out.println(projMemDao.chkProjMem("Yammy"));
	}
	
//	@Test
	public void randomkey() {
		int leftLimit = 48; // numeral '0'
	    int rightLimit = 122; // letter 'z'
	    int projKeyLength = 20;
	    Random random = new Random();
	    String projKey = random.ints(leftLimit, rightLimit + 1)
	                                   .filter(i -> (i <= 57 || i >= 65) && (i <= 90 || i >= 97))
	                                   .limit(projKeyLength)
	                                   .collect(StringBuilder::new, StringBuilder::appendCodePoint, StringBuilder::append)
	                                   .toString();
	    System.out.println(projKey);
	}
	
//	@Test
	public void chkRandomKey() {
		int n = projDao.chkRandomKey("BVn7Uhm2zbbAFsXrImme");
		
		System.out.println(n);
	}
	
//	@Test
	public void saveRandomKey() {
		Map<String, String> map = new HashMap<String, String>();
		map.put("randomkey", projDao.randomkey());
		map.put("projName", "창창일학1");
		int n = projDao.saveRandomKey(map);
		
		System.out.println(n);
	}
	
//	@Test
	public void joinProj() {
		Map<String, String> map = new HashMap<String, String>();
		map.put("memId", "CH001");
		map.put("projToken", "PBWRZbDMIaOZId27PlxR");
		
		int n = projMemDao.joinProj(map);
		System.out.println(n);
	}
	
//	@Test
	public void basicMemProj() {
		Map<String, String> map = new HashMap<String, String>();
		map.put("memId", "PM001");
		map.put("projName", "창창일학1");
		
		int n = projMemDao.basicMemProj(map);
		System.out.println(n);
	}
	
//	@Test
	public void newDoc() {
		int n = docDao.newDoc("창창일학1");
		System.out.println(n);
	}
	
//	@Test
	public void exitProj() {
		int n = projMemDao.exitProj("CH001");
		System.out.println(n);
	}
	
//	@Test
	public void chkProjKey() {
		ProjectVo pVo = projDao.chkProjKey("PM001");
		System.out.println(pVo);
	}
	
//	@Test
	public void projMemList() {
		List<ProjMemListVo> list = projMemDao.projMemList("창창일학1");
		System.out.println(list);
	}
	
//	@Test
	public void newTopCategory() {
		Map<String, String> map = new HashMap<String, String>();
		map.put("projName", "자두과");
		map.put("topCode", "A02");
		map.put("topName", "프로젝트");
		int n = topDao.newTopCategory(map);
		System.out.println(n);
		
	}
	
	@Test
	public void newFbs() {
		Map<String, String> map = new HashMap<String, String>();
		map.put("projName", "자두과");
		map.put("topName", "회원");
		map.put("fbsName", "로그인");
		map.put("fbsCode", "01");
		map.put("fbsContent", "로그인 기능입니다.");
		map.put("fbsImp", "5");
		map.put("fbsLevel", "3");
		map.put("fbsManager", "이창훈");
		
		int n = fbsDao.newFbs(map);
		System.out.println(n);
		
	}
	
//	@Test
	public void newWbs() {
		Map<String, String> map = new HashMap<String, String>();
		map.put("midName", "더미값의 기능 1");
		map.put("wbsCode", "01");
		map.put("wbsName", "로그인");
		map.put("wbsContent", "wbs의 기능 1");
		map.put("wbsManager", "이창훈");
		map.put("wbsStartDate", "2022-06-06");
		map.put("wbsFinDate", "2022-06-07");
		
		int n = wbsDao.newWbs(map);
		System.out.println(n);
	}
	
//	@Test
	public void selectFbs() {
		Map<String, String> map = new HashMap<String, String>();
		map.put("memId", "PM001");
		
		List<FbsVo> list = fbsDao.selectFbs(map);
//		list.remove(null);
		System.out.println(list);
	}
	
//	@Test
	public void selectWbs() {
		Map<String, String> map = new HashMap<String, String>();
		map.put("memId", "PM001");
		
		List<WbsVo> list = wbsDao.selectWbs(map);
//		list.remove(null);
		System.out.println(list.get(0));
		
		List<String> list1 = new ArrayList<String>();
		list1.add("A");
		list1.add(null);
		list1.add("");
		list1.add(null); 
		list1.add("B");
		// List 출력
		System.out.println(list1);
		// [A, null, , null, B]
        // 공백, null 제거 
		list1.removeAll(Arrays.asList("", null));
		// 공백, null이 제거된 List 출력 
		System.out.println(list1); // [A, B]
	}
//	@Test
	public void selectFixHistory() {
		Map<String, String> map = new HashMap<String, String>();
		map.put("memId", "PM001");
		
		List<FixHistoryVo> list =fixDao.selectFixHistory(map);
//		list.remove(null);
		System.out.println(list);
	}
}
