package com.min.mema.controller;

import java.io.IOException;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
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

	@RequestMapping(value = "/loginPage.do", method = RequestMethod.GET)
	public String loginForm() {
		logger.info("로그인페이지 이동");
		return "loginPage";
	}
	
	
	@RequestMapping(value = "/loginPage.do", method = RequestMethod.POST)
	public String login(MemberVo vo, Model model, HttpServletResponse resp) throws IOException {
		logger.info("LoginController 로그인 값 {}", vo);
		resp.setContentType("text/html; charset=UTF-8;");
		
		MemberVo loginVo = service.loginChk(vo.getMemberId(),vo.getMemPw());
		System.out.println(loginVo+"++++++++++++++++++");
		if (loginVo == null) {
			PrintWriter out = resp.getWriter();
			System.out.println(loginVo+"++++++++++++++++++");
			out.print("<script>alert('로그인이 실패하였습니다.'); location.href='./home.do';</script>");
			out.flush();
//			return "redirect:/home.do";
		}else {
			model.addAttribute("loginVo", loginVo);
		}
			return "index";
	}
	@RequestMapping(value = "/signUp.do", method = RequestMethod.GET)
	public String signUp() {
		logger.info("MemberCtrl signUp 페이지 이동");
		return "signUp";
	}
	
	@RequestMapping(value = "/singUp.do", method = RequestMethod.POST)
	public String maingo(MemberVo vo, Model model) {
		logger.info("MemberCtrl signUp 페이지 이동 {} :" ,vo);
//		System.out.println("회원가입 정보"+vo.toString());
		service.signUp(vo);
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
	
	@GetMapping(value = "/modifyMember.do")
	public String modifyMember() {
		
		return "modifyMember";
	}
	
	@RequestMapping(value = "/modifyMember.do" , method = RequestMethod.POST)
	public String modifyMember(MemberVo vo) {
		
		return "modifyMember";
	}
	
}
