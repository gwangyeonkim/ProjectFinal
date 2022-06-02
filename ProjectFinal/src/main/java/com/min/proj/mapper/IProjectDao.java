package com.min.proj.mapper;

import java.util.List;

import com.min.proj.vo.ProjectVo;

public interface IProjectDao {

//	public List<ProjectVo> test();

	/**
	 * 프로젝트를 생성하는 메소드
	 * @param projName = 생성되는 프로젝트의 이름
	 * @return 성공결과여부 1은 성공, 0은 실패
	 */
	public int newProj(String projName);
	
	/**
	 * 프로젝트 생성시에 이름 중복검사를 하는 메소드
	 * @param projName = 생성되는 프로젝트의 이름
	 * @return 1은 중복되는 프로젝트 있음, 0은 없음.
	 */
	public int chkProj(String projName);
	
	
	
}
