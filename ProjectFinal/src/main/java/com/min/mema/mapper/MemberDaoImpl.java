package com.min.mema.mapper;

import org.mybatis.spring.SqlSessionTemplate;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Repository;

import com.min.mema.vo.MemberVo;


@Repository
public class MemberDaoImpl implements IMemberDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	private static final Logger logger = LoggerFactory.getLogger(MemberDaoImpl.class);
	
	private final String NS = "com.min.mema.mapper.MemberDaoImpl.";
	
	@Override
	public MemberVo loginChk(String id, String pw) {
		System.out.println("MemberDaoImpl"+id + pw+"+++++++++++++++++++++++++++++++++++++++++++");
		
		MemberVo vo = sqlSession.selectOne(NS+"loginChk",id);
		System.out.println(vo+"++++++++++++++++");
		if (!passwordEncoder.matches(pw, vo.getMemPw())) {
			System.out.println(vo);
			return null;
		}
		System.out.println(vo);
		return vo;
	}
	

	@Override
	public int signUp(MemberVo vo) {
		logger.info("MemberDaoImpl signUp {}" , vo);
		String encodePw = passwordEncoder.encode(vo.getMemPw());
		vo.setMemPw(encodePw);
		return sqlSession.insert(NS+"signUp",vo);
	}
	
	
	@Override
	public int chkUserId(String id) {
		logger.info("MemberDaoImpl chkUserId {}" , id);
		return sqlSession.selectOne(NS+"chkUserId",id);
	}

	@Override
	public int modifyMember(MemberVo vo) {
		logger.info("MemberDaoImpl modifyMember {}" , vo);
		
		String encodePw =passwordEncoder.encode(vo.getMemPw());
		vo.setMemPw(encodePw);
		return sqlSession.update(NS+"modifyMember",vo);
	}
	 
	
}
