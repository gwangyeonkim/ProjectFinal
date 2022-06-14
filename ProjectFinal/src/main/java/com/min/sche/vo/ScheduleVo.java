package com.min.sche.vo;

public class ScheduleVo {
	private String scheId;
	private String memId;
	private String scheName;
	private String scheContent;
	private String scheStart;
	private String scheEnd;
	
	public String getScheId() {
		return scheId;
	}
	public void setScheId(String scheId) {
		this.scheId = scheId;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getScheName() {
		return scheName;
	}
	public void setScheName(String scheName) {
		this.scheName = scheName;
	}
	public String getScheContent() {
		return scheContent;
	}
	public void setScheContent(String scheContent) {
		this.scheContent = scheContent;
	}
	public String getScheStart() {
		return scheStart;
	}
	public void setScheStart(String scheStart) {
		this.scheStart = scheStart;
	}
	public String getScheEnd() {
		return scheEnd;
	}
	public void setScheEnd(String scheEnd) {
		this.scheEnd = scheEnd;
	}
	
	@Override
	public String toString() {
		return "ScheduleVo [scheId=" + scheId + ", memId=" + memId + ", scheName=" + scheName + ", scheContent="
				+ scheContent + ", scheStart=" + scheStart + ", scheEnd=" + scheEnd + "]";
	}
	
	public ScheduleVo(String scheId, String memId, String scheName, String scheContent, String scheStart,
			String scheEnd) {
		super();
		this.scheId = scheId;
		this.memId = memId;
		this.scheName = scheName;
		this.scheContent = scheContent;
		this.scheStart = scheStart;
		this.scheEnd = scheEnd;
	}
	
	public ScheduleVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
