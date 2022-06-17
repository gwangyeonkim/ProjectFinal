package com.min.proj.service;

import java.util.Map;

import com.min.proj.vo.ProjectVo;

public interface IProjectService {

	/**
	 * 프로젝트를 생성하는 메소드
	 * @param projName 생성되는 프로젝트의 이름
	 * @return 성공결과여부 1은 성공, 0은 실패
	 */
	public int newProj(String projName);
	
	/**
	 * 프로젝트 생성시에 이름 중복검사를 하는 메소드
	 * @param projName 생성되는 프로젝트의 이름
	 * @return 1은 중복되는 프로젝트 있음, 0은 없음.
	 */
	public int chkProj(String projName);
	
	/**
	 * 프로젝트 고유 키 값을 생성하는 메소드
	 * 중복검사가 되어 있지 않음.
	 * @return 고유키값
	 */
	public String randomkey();
	
	/**
	 * 생성된 키의 값이 저장하기 이전에
	 * 다른프로젝트와 중복되는지 중복검사하는 메소드
	 * @return 1은 중복, 0은 미중복
	 */
	public int chkRandomKey(String randomkey);
	
	/**
	 * 생성된 키를 프로젝트에 할당하여 저장하는 메소드
	 * @param map key값 randomkey 랜덤키값,projName 프로젝트 이름
	 * @return 1은 성공, 0은 실패
	 */
	public int saveRandomKey(Map<String, String> map);
	
	/**
	 * 프로젝트에 할당 되어 있는 키 값을 확인하는 메소드
	 * @param memId 사용자 아이디
	 * @return ProjectVo
	 */
	public ProjectVo chkProjKey(String memId);
	
	/**
	 * 프로젝트를 삭제하는 메소드
	 * @param projName 프로젝트 이름
	 * @return
	 */
	public int deleteProj(String projName);
	
}
