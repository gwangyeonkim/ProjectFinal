package com.min.noti.vo;

public class NotiVo {
	private String noti_id        ;
	private String proj_name      ;
	private String mem_id         ;
	private String noti_content   ;
	private String noti_notifided ;
	private String noti_regdate   ;
	public String getNoti_id() {
		return noti_id;
	}
	public void setNoti_id(String noti_id) {
		this.noti_id = noti_id;
	}
	public String getProj_name() {
		return proj_name;
	}
	public void setProj_name(String proj_name) {
		this.proj_name = proj_name;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getNoti_content() {
		return noti_content;
	}
	public void setNoti_content(String noti_content) {
		this.noti_content = noti_content;
	}
	public String getNoti_notifided() {
		return noti_notifided;
	}
	public void setNoti_notifided(String noti_notifided) {
		this.noti_notifided = noti_notifided;
	}
	public String getNoti_regdate() {
		return noti_regdate;
	}
	public void setNoti_regdate(String noti_regdate) {
		this.noti_regdate = noti_regdate;
	}
	@Override
	public String toString() {
		return "NotiVo [noti_id=" + noti_id + ", proj_name=" + proj_name + ", mem_id=" + mem_id + ", noti_content="
				+ noti_content + ", noti_notifided=" + noti_notifided + ", noti_regdate=" + noti_regdate + "]";
	}
	public NotiVo(String noti_id, String proj_name, String mem_id, String noti_content, String noti_notifided,
			String noti_regdate) {
		super();
		this.noti_id = noti_id;
		this.proj_name = proj_name;
		this.mem_id = mem_id;
		this.noti_content = noti_content;
		this.noti_notifided = noti_notifided;
		this.noti_regdate = noti_regdate;
	}
	
	public NotiVo() {
		// TODO Auto-generated constructor stub
	}
}

