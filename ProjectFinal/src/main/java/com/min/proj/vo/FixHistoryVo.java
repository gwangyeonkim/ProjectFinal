package com.min.proj.vo;

public class FixHistoryVo {
	private String fixId        ;
	private String docId        ;
	private String fixContent   ;
	private String fixName   ;
	private String fixDate      ;
	public String getFixId() {
		return fixId;
	}
	public void setFixId(String fixId) {
		this.fixId = fixId;
	}
	public String getDocId() {
		return docId;
	}
	public void setDocId(String docId) {
		this.docId = docId;
	}
	public String getFixContent() {
		return fixContent;
	}
	public void setFixContent(String fixContent) {
		this.fixContent = fixContent;
	}
	public String getFixName() {
		return fixName;
	}
	public void setFixName(String fixName) {
		this.fixName = fixName;
	}
	public String getFixDate() {
		return fixDate;
	}
	public void setFixDate(String fixDate) {
		this.fixDate = fixDate;
	}
	@Override
	public String toString() {
		return "FixHistoryVo [fixId=" + fixId + ", docId=" + docId + ", fixContent=" + fixContent + ", fixName="
				+ fixName + ", fixDate=" + fixDate + "]";
	}
	
}
