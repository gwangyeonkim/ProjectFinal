package com.min.proj.vo;

public class ProjectVo {
	
	private String projName     ;
	private String projToken    ;
	
	@Override
	public String toString() {
		return "ProjectVo [projName=" + projName + ", projToken=" + projToken + "]";
	}
	public String getProjName() {
		return projName;
	}
	public void setProjName(String projName) {
		this.projName = projName;
	}
	public String getProjToken() {
		return projToken;
	}
	public void setProjToken(String projToken) {
		this.projToken = projToken;
	}
	
	
}
