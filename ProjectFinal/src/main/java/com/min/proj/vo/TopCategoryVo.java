package com.min.proj.vo;

public class TopCategoryVo {
	private String topId      ;
	private String docId      ;
	private String topCode    ;
	private String topName    ;
	private String topStep    ;
	private String topDelflag ;
	private String topDate    ;
	@Override
	public String toString() {
		return "TopCategoryVo [topId=" + topId + ", docId=" + docId + ", topCode=" + topCode + ", topName=" + topName
				+ ", topStep=" + topStep + ", topDelflag=" + topDelflag + ", topDate=" + topDate + "]";
	}
	public String getTopCode() {
		return topCode;
	}
	public void setTopCode(String topCode) {
		this.topCode = topCode;
	}
	public String getTopName() {
		return topName;
	}
	public void setTopName(String topName) {
		this.topName = topName;
	}
	public String getTopDelflag() {
		return topDelflag;
	}
	public void setTopDelflag(String topDelflag) {
		this.topDelflag = topDelflag;
	}
	public String getTopDate() {
		return topDate;
	}
	public void setTopDate(String topDate) {
		this.topDate = topDate;
	}
	public String getTopId() {
		return topId;
	}
	public String getDocId() {
		return docId;
	}
	public void setTopStep(String topStep) {
		this.topStep = topStep;
	}
	public String getTopStep() {
		return topStep;
	}
	
	
	
}
