package com.min.proj.service;

import java.util.List;
import java.util.Map;

import com.min.proj.vo.FbsVo;

public interface IFbsService {


	/**
	 * 작성되어있는 FBS를 조회하는 기능 (작성중인 것 포함)
	 * @param map memId 사용자 아이디
	 * @return FbsVo
	 */
	public List<FbsVo> selectFbs(Map<String, String> map);
	
	/**
	 * FBS를 입력하는 메소드
	 * @param map topName 대분류이름, fbsName fbs이름,fbsCode fbs코드,fbsContent fbs내용,fbsImp 중요도 ,fbsLevel 난이도 ,fbsManager 담당자
	 * @return 1 성공
	 */
	public int newFbs(Map<String, String> map);
	
	/**
	 * FBS를 수정하는 메소드
	 * @param map  fbsName fbs이름,fbsCode fbs코드,fbsContent fbs내용,fbsImp 중요도 ,fbsLevel 난이도 ,fbsManager 담당자, topId 대분류 Id
	 * @return 1 성공
	 */
	public int fixFbs(Map<String, String> map);
	
}
