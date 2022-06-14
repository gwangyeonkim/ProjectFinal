package com.min.mema.mapper;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Repository;

import com.min.mema.vo.MemberVo;
import com.min.proj.vo.ProjectVo;


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
//		System.out.println("MemberDaoImpl"+id + pw+"+++++++++++++++++++++++++++++++++++++++++++");
		
		MemberVo vo = sqlSession.selectOne(NS+"loginChk",id);
//		System.out.println(vo);
		System.out.println(vo+"++++++++++++++++");
		
		if (vo == null) {
//			System.out.println(vo);
			return null;
		}else {
			if (!passwordEncoder.matches(pw, vo.getMemPw())) {
				return null;
			}
		}
//		System.out.println(vo);
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
	
	@Override
	public String findIdmdmber(Map<String, Object> map) {
		logger.info("MemberDaoImpl findIdmdmber {}" , map);
		return sqlSession.selectOne(NS+"findIdmdmber",map);
	}
	
	@Override
	public List<MemberVo> memberlistAll(MemberVo vo) {
		logger.info("MemberDaoImpl findIdmdmber {}" , vo);
		return sqlSession.selectList(NS+"memberlistAll",vo);
	}
	 
	@Override
	public MemberVo memberSelect(String id) {
		logger.info("MemberDaoImpl findIdmdmber {}" , id);
		return sqlSession.selectOne(NS+"memberSelect",id);
	}
	
	@Override
	public MemberVo findPwmember(MemberVo vo) {
		return sqlSession.selectOne(NS+"findPwmember",vo);
	}
	
	@Override
	public int updatePw(MemberVo vo) {
		return sqlSession.update(NS+"updatePw",vo);
	}
	
	@Override
	public String inviteMember(MemberVo vo) {
		return sqlSession.selectOne(NS+"inviteMember",vo);
	}
}
