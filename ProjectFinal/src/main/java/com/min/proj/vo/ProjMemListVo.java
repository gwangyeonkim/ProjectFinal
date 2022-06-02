package com.min.proj.vo;

public class ProjMemListVo {

	private String memId               ;
	private String projName            ;
	private String projPm              ;
	private String projDelflag         ;
	
	@Override
	public String toString() {
		return "ProjMemListVo [memId=" + memId + ", projName=" + projName + ", projPm=" + projPm + ", projDelflag="
				+ projDelflag + "]";
	}
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
	public String getProjPm() {
		return projPm;
	}
	public void setProjPm(String projPm) {
		this.projPm = projPm;
	}
	public String getProjDelflag() {
		return projDelflag;
	}
	public void setProjDelflag(String projDelflag) {
		this.projDelflag = projDelflag;
	}
	
	
}
