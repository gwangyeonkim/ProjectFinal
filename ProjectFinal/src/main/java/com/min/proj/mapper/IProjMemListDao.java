package com.min.proj.mapper;

import java.util.List;
import java.util.Map;

import com.min.proj.vo.ProjMemListVo;

public interface IProjMemListDao {

	/**
	 * 사용자가 참여중인 프로젝트가 있는지 없는지 판단하는 메소드.
	 * 추 후에 세션에 담긴 ID를 사용할 건데 명칭이 정의되지 않음
	 * 그래서 아규먼트값은 String으로 받지만 메소드 자체에서는 map으로 처리함
	 * @param memId 현재 사용자의 ID
	 * @return 1:참여중인 프로젝트 있음, 0:없음.
	 */
	public int chkProjMem(String memId);
	
	/**
	 * 프로젝트에 참여하는 메소드
	 * @param map , memId, projToken 두개의 키 값으로 구성
	 * @return 1은 참여성공, 0은 실패
	 */
	public int joinProj(Map<String, String> map);
	
	/**
	 * 프로젝트를 생성한 사용자가 초기에 바로 프로젝트에 참여하도록 하는 메소드
	 * @param map, memId, projName 두개의 키값으로 구성
	 * @return 1은 성공, 0실패
	 */
	public int basicMemProj(Map<String, String> map);
	
	/**
	 * 현재 참여중인 프로젝트에서 탈퇴하는 기능
	 * delflag = Y로 변경하는 메소드
	 * @param memId
	 * @return 1= 성공
	 */
	public int exitProj(String memId);
	
	/**
	 * 자신과 동일한 프로젝트에 참여중인 사용자 목록을 확인하는 메소드
	 * @param projName 프로젝트 이름.
	 * @return List<ProjMemListVo> 현재 사용자 목록
	 */
	public List<ProjMemListVo> projMemList(String projName);
	
	/**
	 * PM을 변경하는 메소드
	 * @param map, memId1,memId2의 키 값으로 구성 pm인 사용자와, pm이 아닌 사용자 아이디 두개
	 * @return 2가 아닐경우 정상 작동이 아님.
	 */
	public int changePm (Map<String, String> map);
	
}
