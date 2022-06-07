package com.min.proj.mapper;

import java.util.List;
import java.util.Map;

import com.min.proj.vo.FixHistoryVo;

public interface IFixHistoryDao {

	/**
	 * 수정이력을 작성하는 메소드
	 * @param map memId 사용자아이디, fixContent 수정내용, fixName 작성자
	 * @return 1 성공
	 */
	public int newFix(Map<String,String>map);
	
	/**
	 * 그 동안 작성된 수정이력의 갯수를 확인하는 메소드
	 * @param map memId 사용자 아이디
	 * @return 그간 작성된 수정이력 갯수 int
	 */
	public int cntFixHistory(Map<String,String>map);

	
	/**
	 * 가장 마지막에 작성된 수정이력을 삭제해주는 메소드
	 * @param map memId 사용자 아이디
	 * @return 1 성공
	 */
	public int deletFixHistory(Map<String,String>map);
	
	
	/**
	 * 작성된 수정이력을 수정하는 메소드 삭제는 불가능
	 * @param map fixContent 수정내용, fixName 담당자, fixId FIX_ID
	 * @return
	 */
	public int modifyFixHistory(Map<String,String>map);
	
	/**
	 * 작성된 수정이력을 조회하는 메소드
	 * @param map memId 사용자 아이디
	 * @return FixHistoryVo
	 */
	public List<FixHistoryVo> selectFixHistory(Map<String,String>map);
}
