package com.min.sche.vo;

public class ScheduleVo {

	private String projName;
	private String wbsCode;
	private String wbsName;
	private String wbsConent;
	private String wbsStartDate;
	private String wbsEndDate;
	public String getProjName() {
		return projName;
	}
	public void setProjName(String projName) {
		this.projName = projName;
	}
	public String getWbsCode() {
		return wbsCode;
	}
	public void setWbsCode(String wbsCode) {
		this.wbsCode = wbsCode;
	}
	public String getWbsName() {
		return wbsName;
	}
	public void setWbsName(String wbsName) {
		this.wbsName = wbsName;
	}
	public String getWbsConent() {
		return wbsConent;
	}
	public void setWbsConent(String wbsConent) {
		this.wbsConent = wbsConent;
	}
	public String getWbsStartDate() {
		return wbsStartDate;
	}
	public void setWbsStartDate(String wbsStartDate) {
		this.wbsStartDate = wbsStartDate;
	}
	public String getWbsEndDate() {
		return wbsEndDate;
	}
	public void setWbsEndDate(String wbsEndDate) {
		this.wbsEndDate = wbsEndDate;
	}
	
	@Override
	public String toString() {
		return "ScheduleVo [projName=" + projName + ", wbsCode=" + wbsCode + ", wbsName=" + wbsName + ", wbsConent="
				+ wbsConent + ", wbsStartDate=" + wbsStartDate + ", wbsEndDate=" + wbsEndDate + "]";
	}
	
	public ScheduleVo(String projName, String wbsCode, String wbsName, String wbsConent, String wbsStartDate,
			String wbsEndDate) {
		super();
		this.projName = projName;
		this.wbsCode = wbsCode;
		this.wbsName = wbsName;
		this.wbsConent = wbsConent;
		this.wbsStartDate = wbsStartDate;
		this.wbsEndDate = wbsEndDate;
	}
	
	public ScheduleVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
