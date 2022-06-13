package com.min.mema.mapper;

import java.util.List;
import java.util.Map;

import com.min.mema.vo.MemberVo;

public interface IMemberDao {
	
	/**
	 * @param id 로그인시 입력된 id를 받아오는 파라미터
	 * @param pw 로그인시 입력된 pw를 받아오는 파라미터
	 * @return
	 */
	public MemberVo loginChk(String id, String pw); 
	
	/**
	 * @param id 중복체크시 입력된 id를 받아오는 파라미터
	 * @return
	 */
	
	public int chkUserId(String id);
	
	/**
	 * 
	 * @param vo 회원가입시 입력된 정보를 받아오는 파라미터
	 * @return
	 */
	
	public int signUp(MemberVo vo);
	
	/**
	 * 회원정보 수정 
	 * @param vo 회원정보 수정 시 입력된 정보를 받아오는 파라미터  
	 * @return
	 */
	
	public int modifyMember(MemberVo vo);
	
	public String findIdmdmber(Map<String, Object> map);
	
	
	public List<MemberVo> memberlistAll(MemberVo vo);
	
}
