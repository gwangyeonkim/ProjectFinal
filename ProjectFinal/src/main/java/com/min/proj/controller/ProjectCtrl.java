package com.min.proj.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.min.mema.vo.MemberVo;
import com.min.proj.service.IDocumentService;
import com.min.proj.service.IProjMemListService;
import com.min.proj.service.IProjectService;
import com.min.proj.vo.ProjMemListVo;
import com.min.proj.vo.ProjectVo;

import oracle.jdbc.internal.XSSessionNamespace;

@Controller
public class ProjectCtrl {

	private Logger logger = LoggerFactory.getLogger(ProjectCtrl.class);
	
	@Autowired
	private IProjectService projService;
	@Autowired
	private IProjMemListService projMemService;
	@Autowired
	private IDocumentService docService;
	
	@RequestMapping(value = "/sessionTest.do")
	@ResponseBody
	public MemberVo sessionTest(HttpSession session) {
		String id= (String)session.getAttribute("userId");
		String projName= (String)session.getAttribute("projName");
		String user = (String)session.getAttribute("userId");
		
		MemberVo test =(MemberVo) session.getAttribute("loginVo");
		System.out.println(test.getMemberId());
		return test;
	}

	// memId = 로그인세션에 담겨있는 아이디로 변경
	@RequestMapping(value = "/project.do",method = RequestMethod.GET)
	public String project(String memId,HttpSession session) {
		logger.info("ProjectCtrl project {}",memId);
		//TODO 12. 변경
//		session.setAttribute("userId", memId);
		MemberVo test =(MemberVo) session.getAttribute("loginVo");
		session.setAttribute("userId", test.getMemberId());
//		ProjMemListVo pmVo = projMemService.chkProjMem(memId);
		ProjMemListVo pmVo = projMemService.chkProjMem(test.getMemberId());
		
		if(pmVo==null) {
			session.setAttribute("projName","");
			return "redirect:/selectProj.do";
		}
		session.setAttribute("projName",pmVo.getProjName());
		return "/proj/project";
	}
	
	@RequestMapping(value = "/newProj.do",method = RequestMethod.POST)
	public String newProj(String projName,HttpSession session,HttpServletResponse response,Model model) throws IOException {
		logger.info("ProjectCtrl newProj {}",projName);
		response.setContentType("text/html; charset=UTF-8;");
		int cnt = projService.chkProj(projName);
		if(cnt==0) {
			Map<String, String> map = new HashMap<String, String>();
			map.put("projName",projName);
			map.put("memId",(String)session.getAttribute("userId"));
			projService.newProj(projName);
			
			projMemService.basicMemProj(map);
			String randomKey =null;
			
			cnt = 0;
			System.out.println(cnt);
			while (cnt==0) {
				randomKey = projService.randomkey();
				System.out.println(randomKey);
				if(projService.chkRandomKey(randomKey)==0) {
					cnt++;
				}
			}
			map.put("randomkey", randomKey);
			projService.saveRandomKey(map);
			docService.newDoc(projName);
			model.addAttribute("projName", projName);
			return "redirect:/project.do";
			
		}else {
			System.out.println("여기 들어옴?");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('중복된 프로젝트 명입니다.'); location.href='./selectProj.do'</script>");
			out.flush();
			return "redirect:/selectProj.do";
		}
		
	}
	
	@RequestMapping(value = "/selectProj.do",method = RequestMethod.GET)
	public String selectProj() {
		logger.info("ProjectCtrl selectProj {}");

		return "/proj/selectProj";
	}
	
	@RequestMapping(value = "/joinProj.do",method = RequestMethod.POST)
	public String joinProj(String randomKey,HttpSession session, HttpServletResponse response) throws IOException {
		logger.info("ProjectCtrl joinProj {}",randomKey);
		Map<String, String> map = new HashMap<String, String>();
		map.put("memId", (String)session.getAttribute("userId"));
		map.put("projToken", randomKey);
		int cnt = projMemService.joinProj(map);
		if(cnt==1) {
			System.out.println("!@!@!@!@!@!@!@!@!@!@");
			return "redirect:/project.do";
		}else {
			PrintWriter out = response.getWriter();
			out.println("<script>alert('초대코드가 유효하지 않습니다.'); location.href='./selectProj.do'</script>");
			return "redirect:/selectProj.do";
		}
		
	}
	
	@RequestMapping(value = "/exitProj.do",method = RequestMethod.GET)
	public String exitProj(HttpSession session) {
		logger.info("ProjectCtrl exitProj");
		projMemService.exitProj((String)session.getAttribute("userId"));
		
		return "/proj/selectProj";
	}
	
	@RequestMapping(value = "/chkProjKey.do",method = RequestMethod.GET)
	@ResponseBody
	public String chkProjKey(HttpSession session) {
		logger.info("ProjectCtrl chkProjKey");
		ProjectVo pVo= projService.chkProjKey((String)session.getAttribute("userId"));

		return pVo.getProjToken();
	}
	
	@RequestMapping(value = "/chkProjMem.do",method = RequestMethod.GET)
	@ResponseBody
	public String chkProjMem(HttpSession session) {
		logger.info("ProjectCtrl chkProjMem");
		List<ProjMemListVo> pVo =
				(List<ProjMemListVo>) projMemService.projMemList((String)session.getAttribute("projName"));
		
		return pVo.toString();
	}
	
	@RequestMapping(value = "/changPm.do",method = RequestMethod.POST)
	public String changPm (HttpSession session, String userId){
		logger.info("ProjectCtrl changPm");
		Map<String, String>map = new HashMap<String, String>();
		map.put("memId1", (String)session.getAttribute("userId"));
		map.put("memId2", userId);
		
		int cnt = projMemService.changePm(map);
		System.out.println(cnt);
		return "/proj/project";
	}
}
