package com.min.proj.service;

public interface IDocumentService {

	/**
	 * 프로젝트가 생성되면서 문서번호를 할당하는 메소드
	 * @param projName
	 * @return 1= 성공
	 */
	public int newDoc(String projName);
	
	
}
