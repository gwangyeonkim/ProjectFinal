package com.min.mema.vo;


public class MemberVo {
	
	
	private String member_id;
	private String mem_name;
	private String mem_pw;
	private String mem_addr;
	private String mem_birth;
	private String mem_phone;
	private String mem_email;
	
	public MemberVo() {
	}

	public MemberVo(String member_id, String mem_name, String mem_pw, String mem_addr, String mem_birth, String mem_phone,
			String mem_email) {
		super();
		this.member_id = member_id;
		this.mem_name = mem_name;
		this.mem_pw = mem_pw;
		this.mem_addr = mem_addr;
		this.mem_birth = mem_birth;
		this.mem_phone = mem_phone;
		this.mem_email = mem_email;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getMem_name() {
		return mem_name;
	}

	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}

	public String getMem_pw() {
		return mem_pw;
	}

	public void setMem_pw(String mem_pw) {
		this.mem_pw = mem_pw;
	}

	public String getMem_addr() {
		return mem_addr;
	}

	public void setMem_addr(String mem_addr) {
		this.mem_addr = mem_addr;
	}

	public String getMem_birth() {
		return mem_birth;
	}

	public void setMem_birth(String mem_birth) {
		this.mem_birth = mem_birth;
	}

	public String getMem_phone() {
		return mem_phone;
	}

	public void setMem_phone(String mem_phone) {
		this.mem_phone = mem_phone;
	}

	public String getMem_email() {
		return mem_email;
	}

	public void setMem_email(String mem_email) {
		this.mem_email = mem_email;
	}

	@Override
	public String toString() {
		return "MemberVo [member_id=" + member_id + ", mem_name=" + mem_name + ", mem_pw=" + mem_pw + ", mem_addr=" + mem_addr
				+ ", mem_birth=" + mem_birth + ", mem_phone=" + mem_phone + ", mem_email=" + mem_email + "]";
	}
	
	

}
