package com.min.mema.service;

import java.util.List;
import java.util.Map;

import com.min.mema.vo.MemberVo;
import com.min.proj.vo.ProjectVo;

public interface IMemberService {
	

	public MemberVo loginChk(String id, String pw);
	
	public int signUp(MemberVo vo);
	
	public int chkUserId(String id);

	/**
	 * @param email값을 받아와서 인증번호 전송하는 
	 */
	public String chkEmail(String email);

	/**
	 * @param hp값을 받아와서 인증번호 전송
	 */
	public String chkHp(String hp);
	
	public int modifyMember(MemberVo vo);
	
	public int modifyMemberPw(MemberVo vo);
	
	public String findIdmdmber(Map<String, Object> map);
	
	
	public List<MemberVo> memberlistAll(MemberVo vo);
	
	
	public MemberVo memberSelect(String id);
	
	
	public String findAndUpdatePw(MemberVo vo); 
  
	
	public String inviteMember(MemberVo vo);
}
