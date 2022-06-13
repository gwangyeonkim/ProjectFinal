package com.min.proj.vo;

public class WbsVo {

	private String wbsId            ;
	private String midId            ;
	private String wbsCode          ;
	private String wbsName          ;
	private String wbsConent        ;
	private String wbsManager       ;
	private String wbsStartDate    ;
	private String wbsEndDate      ;
	private String wbsFinDate      ;
	private String wbsStep          ;
	private String wbsDelflag       ;
	private String wbsDate          ;
	
	private TopCategoryVo topVo;
	private FbsVo fbsVo;
	public String getWbsId() {
		return wbsId;
	}
	public void setWbsId(String wbsId) {
		this.wbsId = wbsId;
	}
	public String getMidId() {
		return midId;
	}
	public void setMidId(String midId) {
		this.midId = midId;
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
	public String getWbsManager() {
		return wbsManager;
	}
	public void setWbsManager(String wbsManager) {
		this.wbsManager = wbsManager;
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
	public String getWbsStep() {
		return wbsStep;
	}
	public void setWbsStep(String wbsStep) {
		this.wbsStep = wbsStep;
	}
	public String getWbsDelflag() {
		return wbsDelflag;
	}
	public void setWbsDelflag(String wbsDelflag) {
		this.wbsDelflag = wbsDelflag;
	}
	public String getWbsDate() {
		return wbsDate;
	}
	public void setWbsDate(String wbsDate) {
		this.wbsDate = wbsDate;
	}
	public TopCategoryVo getTopVo() {
		return topVo;
	}
	public void setTopVo(TopCategoryVo topVo) {
		this.topVo = topVo;
	}
	public FbsVo getFbsVo() {
		return fbsVo;
	}
	public void setFbsVo(FbsVo fbsVo) {
		this.fbsVo = fbsVo;
	}
	@Override
	public String toString() {
		return "[wbsId=" + wbsId + ", midId=" + midId + ", wbsCode=" + wbsCode + ", wbsName=" + wbsName
				+ ", wbsConent=" + wbsConent + ", wbsManager=" + wbsManager + ", wbsStartDate=" + wbsStartDate
				+ ", wbsEndDate=" + wbsEndDate + ", wbsFinDate=" + wbsFinDate + ", wbsStep=" + wbsStep + ", wbsDelflag="
				+ wbsDelflag + ", wbsDate=" + wbsDate + "," + topVo + "," + fbsVo;
		
	}
	

	
	
	
}
