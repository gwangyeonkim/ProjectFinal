package com.min.mema.service;

import com.min.mema.vo.MemberVo;

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

}
