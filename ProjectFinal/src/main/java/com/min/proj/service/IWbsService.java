package com.min.proj.service;

import java.util.List;
import java.util.Map;

import com.min.proj.vo.WbsVo;

public interface IWbsService {

	/**
	 * wbs를 작성하는 메소드
	 * @param map midName fbs이름,wbsCode wbs코드,wbsName wbs이름,wbsContent wbs 내용,wbsManager wbs담당자,wbsStartDate wbs시작일,wbsFinDate wbs종료일
	 * @return 1은 성공
	 */
	public int newWbs(Map<String, String> map);
	
	/**
	 * wbs를 조회하는 메소드
	 * @param map memId 사용자의 아이디 
	 * @return WbsVo
	 */
	public List<WbsVo> selectWbs(Map<String, String> map);

	/**
	 * wbs를 수정하는 메소드
	 * @param map wbsCode wbs코드명, wbsName wbs이름, wbsContent wbs내용, wbsManager 담당자, wbsStartDate 시작일, wbsEndDate 종료일, wbsId WBSID
	 * @return 1 성공
	 */
	public int fixWbs(Map<String, String> map);
	
	/**
	 * WBS중 작성중인 NULL 값들을 삭제해주는 메소드
	 * @param projName 프로젝트이름
	 * @return
	 */
	public int deleteNullWbs(String projName);
	
}
