package com.min.proj.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.min.mema.controller.MemberCtrl;
import com.min.mema.vo.MemberVo;
import com.min.proj.service.IProjMemListService;
import com.min.proj.service.IProjectService;
import com.min.proj.vo.ProjMemListVo;
import com.min.proj.vo.ProjectVo;

@Controller
public class ProjMemCtrl {

	private Logger logger = LoggerFactory.getLogger(ProjMemCtrl.class);
	
	@Autowired
	private IProjectService projServcie;
	@Autowired
	private IProjMemListService projMemService;
	
	@RequestMapping(value = "/moveProj.do",method = RequestMethod.GET)
	public String moveProj(HttpSession session, Model model, MemberVo vo) {
		logger.info("ProjMemCtrl moveProj");
		ProjectVo pVo =  projServcie.chkProjKey((String)session.getAttribute("userId"));
		List<ProjMemListVo> list = projMemService.projMemList(pVo.getProjName());
		System.out.println("@@@@@@@@@여기다앗");
		System.out.println(list);
		for (int i = 0; i < list.size()-1; i++) {
			ProjMemListVo pmVo =list.get(i);
			if(pmVo.getMemId().equals((String)session.getAttribute("userId"))){
				session.setAttribute("iscPm", pmVo.getProjPm());
			};
		}
		model.addAttribute("projToken", pVo.getProjToken());
		model.addAttribute("projMemList", projMemService.projMemList(pVo.getProjName()));
//		MemberCtrl mCtrl = new MemberCtrl();
//		mCtrl.memberlistAll(vo, model);

		return "/proj/projMem";
	}

//	@RequestMapping(value = "/inviteCode.do",method = RequestMethod.GET)
//	@ResponseBody
//	public String inviteCode(HttpSession session) {
//		logger.info("ProjMemCtrl moveProj");
//		
//		return "/proj/projMem";
//	}
//	
	
}
