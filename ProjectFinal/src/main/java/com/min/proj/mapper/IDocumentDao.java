package com.min.proj.mapper;

public interface IDocumentDao {

	/**
	 * 프로젝트가 생성되면서 문서번호를 할당하는 메소드
	 * @param projName 프로젝트 이름
	 * @return 1= 성공
	 */
	public int newDoc(String projName);
	
}
