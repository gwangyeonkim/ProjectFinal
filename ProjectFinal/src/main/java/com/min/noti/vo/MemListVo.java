package com.min.noti.vo;

public class MemListVo {
	public String memId;
	public String projName;
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getProjName() {
		return projName;
	}
	public void setProjName(String projName) {
		this.projName = projName;
	}
	@Override
	public String toString() {
		return "memListVo [memId=" + memId + ", projName=" + projName + "]";
	}
	public MemListVo(String memId, String projName) {
		super();
		this.memId = memId;
		this.projName = projName;
	}
	
	
}
