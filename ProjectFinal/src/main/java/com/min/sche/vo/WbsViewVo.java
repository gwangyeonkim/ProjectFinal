
package com.min.sche.vo;

public class WbsViewVo {

	private String projName;
	private String wbsId;
	private String wbsName;
	private String wbsConent;
	private String wbsStartDate;
	private String wbsEndDate;
	private String wbsFinDate;
	private String wbsManager; 
	
	public String getProjName() {
		return projName;
	}
	public void setProjName(String projName) {
		this.projName = projName;
	}
	public String getWbsId() {
		return wbsId;
	}
	public void setWbsId(String wbsId) {
		this.wbsId = wbsId;
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
	public String getWbsFinDate() {
		return wbsFinDate;
	}
	public void setWbsFinDate(String wbsFinDate) {
		this.wbsFinDate = wbsFinDate;
	}
	public String getWbsManager() {
		return wbsManager;
	}
	public void setWbsManager(String wbsManager) {
		this.wbsManager = wbsManager;
	}
	@Override
	public String toString() {
		return "WbsViewVo [projName=" + projName + ", wbsId=" + wbsId + ", wbsName=" + wbsName + ", wbsConent="
				+ wbsConent + ", wbsStartDate=" + wbsStartDate + ", wbsEndDate=" + wbsEndDate + ", wbsFinDate="
				+ wbsFinDate + ", wbsManager=" + wbsManager + "]";
	}
	public WbsViewVo(String projName, String wbsId, String wbsName, String wbsConent, String wbsStartDate,
			String wbsEndDate, String wbsFinDate, String wbsManager) {
		super();
		this.projName = projName;
		this.wbsId = wbsId;
		this.wbsName = wbsName;
		this.wbsConent = wbsConent;
		this.wbsStartDate = wbsStartDate;
		this.wbsEndDate = wbsEndDate;
		this.wbsFinDate = wbsFinDate;
		this.wbsManager = wbsManager;
	}
	public WbsViewVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
