package com.min.mema.controller;

import java.io.IOException;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.min.mema.service.IMemberService;
import com.min.mema.vo.MemberVo;

@Controller
public class MemberCtrl {
	
	@Autowired  
	private IMemberService service;
	
	private static final Logger logger = LoggerFactory.getLogger(MemberCtrl.class);

//	@RequestMapping(value = "/loginPage.do", method = RequestMethod.GET)
//	public String loginForm() {
//		logger.info("로그인페이지 이동");
//		return "loginPage";
//	}
	
	 @RequestMapping(value = "/logout.do", method= RequestMethod.GET)
	   public String logout(HttpSession session ) {
	      session.invalidate();
	      return "redirect:/home.do";
	   }
	
	
	@RequestMapping(value = "/loginPage.do", method = RequestMethod.POST)
	public String login(MemberVo vo, Model model, HttpServletResponse resp, HttpSession session) throws IOException {
		logger.info("LoginController 로그인 값 {}", vo);
		
		resp.setContentType("text/html; charset=UTF-8;");
		
		MemberVo loginVo = service.loginChk(vo.getMemberId(),vo.getMemPw());
		System.out.println(loginVo+"++++++++++++++++++");
		
		PrintWriter out = resp.getWriter();
		
		if (loginVo == null) {
			System.out.println(loginVo+"++++++++++++++++++");
			out.print("<script>alert('로그인이 실패하였습니다.'); location.href='./home.do'</script>");
			out.flush();
			return "redirect:/home.do";
		}else {
			session.setAttribute("loginVo", loginVo);
//			model.addAttribute("loginVo", loginVo);
		}
			return "projectMain";
	}
	
	
	@RequestMapping(value = "/projectMain.do", method = RequestMethod.GET)
	public String projectMain() {
		logger.info("메인페이지 이동");
		return "projectMain";
	}
	
	
	@RequestMapping(value = "/signUp.do", method = RequestMethod.GET)
	public String signUp() {
		logger.info("MemberCtrl signUp 페이지 이동");
		return "signUp";
	}
	
	@RequestMapping(value = "/singUp.do", method = RequestMethod.POST)
	public String maingo(MemberVo vo) {
		logger.info("MemberCtrl signUp 받은값 {} :" ,vo);
		
		
		service.signUp(vo);
//		System.out.println("회원가입 정보"+vo.toString());
		
		return "home";
	}
	
	
	@RequestMapping(value = "/chkUserId.do" ,method = RequestMethod.GET)
	@ResponseBody
	public String chkUserId(@RequestParam String id) {
		
		System.out.println("++++++++++++" +id);
		
		int result = service.chkUserId(id);
		System.out.println(result);
		return Integer.toString(result);
	}
	
	@RequestMapping(value = "/checkMail.do" ,method = RequestMethod.GET)
	@ResponseBody
	public String checkMail(@RequestParam String email) {
		
		return service.chkEmail(email);
	}
	
	
	
	@RequestMapping(value = "/checkHp.do", method = RequestMethod.GET)
	@ResponseBody
	public String checkPh(@RequestParam String Hp) {
		
		return service.chkHp(Hp);
	}
	
	@GetMapping(value = "/mamberInfo.do")
	public String mamberInfo() {
		
		return "mamberInfo";
	}
	
	

	
	
	@GetMapping(value = "/modifyMember.do")
	public String modifyMember() {
		
		return "modifyMember";
	}
	
	@RequestMapping(value = "/modifyMember.do" , method = RequestMethod.POST)
	public String modifyMember(MemberVo vo) {
		logger.info("MemberCtrl modifyMember {}", vo);
		service.modifyMember(vo);
		return "modifyMember";
	}
	
	@RequestMapping(value = "/findIdMember.do", method = RequestMethod.GET)
	public String findIdMember() {
		logger.info("MemberCtrl findIdmdmber 이동");
		return "findIdMember";
	}
	
	@RequestMapping(value = "/findIdMember.do", method = RequestMethod.POST)
	@ResponseBody
	public String findIdmdmber(String memName, String memEmail) {
		Map<String, Object> map = new HashMap<String, Object>()	;
		map.put("memName", memName);
		map.put("memEmail", memEmail);
		System.out.println(map);
		String id = service.findIdmdmber(map);
		return (id==null)?"":id;
	}
	
	@RequestMapping(value = "/findPwMember.do", method = RequestMethod.GET)
	public String findPwMember() {
		logger.info("MemberCtrl findIdmdmber 이동");
		return "findPwMember";
	}
	
	@RequestMapping(value = "/findPwMember.do", method = RequestMethod.POST)
	@ResponseBody
	public String findPwMember(String memName, String memEmail) {
		Map<String, Object> map = new HashMap<String, Object>()	;
		map.put("memName", memName);
		map.put("memEmail", memEmail);
		System.out.println(map);
		String id = service.findIdmdmber(map);
		return (id==null)?"":id;
	}
	
	@RequestMapping(value = "/memberlistAll.do" , method = RequestMethod.GET)
	public String memberlistAll(MemberVo vo, Model model) {
		logger.info("MemberCtrl memberlistAll 이동");
		List<MemberVo> lists = service.memberlistAll(vo);
		System.out.println(lists);
		model.addAttribute("lists", lists);
		return "memberlistAll";
	}
	
//	@RequestMapping(value = "/memberlistAll.do" , method = RequestMethod.POST)
//	public String memberlistAll(MemberVo vo, Model model) {
//		logger.info("MemberCtrl memberlistAll 이동");
//		List<MemberVo> lists = service.memberlistAll(vo);
//		System.out.println(lists);
//		model.addAttribute("lists", lists);
//		return "memberlistAll";
//	}
	
	
	
}
