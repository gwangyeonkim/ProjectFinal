package com.min.proj.vo;

public class DocumentVo {

	private String docId         ;
	private String projName      ;
	private String docDate       ;
	@Override
	public String toString() {
		return "DocumentVo [docId=" + docId + ", projName=" + projName + ", docDate=" + docDate + "]";
	}
	public String getDocId() {
		return docId;
	}
	public void setDocId(String docId) {
		this.docId = docId;
	}
	public String getProjName() {
		return projName;
	}
	public void setProjName(String projName) {
		this.projName = projName;
	}
	public String getDocDate() {
		return docDate;
	}
	public void setDocDate(String docDate) {
		this.docDate = docDate;
	}
	
	
}
