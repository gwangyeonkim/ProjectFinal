package com.min.mema.vo;

import java.io.Serializable;

public class MemberVo implements Serializable{
	
	private static final long serialVersionUID = -5905648803516270918L;
	
	private String memberId;
	private String memName;
	private String memPw;
	private String memAddr;
	private String memBirth;
	private String memPhone;
	private String memEmail;
	
	public MemberVo() {
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getMemName() {
		return memName;
	}

	public void setMemName(String memName) {
		this.memName = memName;
	}

	public String getMemPw() {
		return memPw;
	}

	public void setMemPw(String memPw) {
		this.memPw = memPw;
	}

	public String getMemAddr() {
		return memAddr;
	}

	public void setMemAddr(String memAddr) {
		this.memAddr = memAddr;
	}

	public String getMemBirth() {
		return memBirth;
	}

	public void setMemBirth(String memBirth) {
		this.memBirth = memBirth;
	}

	public String getMemPhone() {
		return memPhone;
	}

	public void setMemPhone(String memPhone) {
		this.memPhone = memPhone;
	}

	public String getMemEmail() {
		return memEmail;
	}

	public void setMemEmail(String memEmail) {
		this.memEmail = memEmail;
	}

	@Override
	public String toString() {
		return "MemberVo [memberId=" + memberId + ", memName=" + memName + ", memPw=" + memPw + ", memAddr=" + memAddr
				+ ", memBirth=" + memBirth + ", memPhone=" + memPhone + ", memEmail=" + memEmail + "]";
	}

	public MemberVo(String memberId, String memName, String memPw, String memAddr, String memBirth, String memPhone,
			String memEmail) {
		super();
		this.memberId = memberId;
		this.memName = memName;
		this.memPw = memPw;
		this.memAddr = memAddr;
		this.memBirth = memBirth;
		this.memPhone = memPhone;
		this.memEmail = memEmail;
	}

	
	
	

}
