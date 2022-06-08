package com.min.sche.vo;

public class ScheduleVo {

	private String fbs_name;
	private String proj_name;
	private String doc_id;
	private String top_id;
	private String mid_id;
	private String wbs_id;
	private String wbs_name;
	private String wbs_conent;
	private String wbs_manager;
	private String wbs_start_date;
	private String wbs_end_date;
	private String wbs_fin_date;
	private String wbs_code;
	public String getFbs_name() {
		return fbs_name;
	}
	public void setFbs_name(String fbs_name) {
		this.fbs_name = fbs_name;
	}
	public String getProj_name() {
		return proj_name;
	}
	public void setProj_name(String proj_name) {
		this.proj_name = proj_name;
	}
	public String getDoc_id() {
		return doc_id;
	}
	public void setDoc_id(String doc_id) {
		this.doc_id = doc_id;
	}
	public String getTop_id() {
		return top_id;
	}
	public void setTop_id(String top_id) {
		this.top_id = top_id;
	}
	public String getMid_id() {
		return mid_id;
	}
	public void setMid_id(String mid_id) {
		this.mid_id = mid_id;
	}
	public String getWbs_id() {
		return wbs_id;
	}
	public void setWbs_id(String wbs_id) {
		this.wbs_id = wbs_id;
	}
	public String getWbs_name() {
		return wbs_name;
	}
	public void setWbs_name(String wbs_name) {
		this.wbs_name = wbs_name;
	}
	public String getWbs_conent() {
		return wbs_conent;
	}
	public void setWbs_conent(String wbs_conent) {
		this.wbs_conent = wbs_conent;
	}
	public String getWbs_manager() {
		return wbs_manager;
	}
	public void setWbs_manager(String wbs_manager) {
		this.wbs_manager = wbs_manager;
	}
	public String getWbs_start_date() {
		return wbs_start_date;
	}
	public void setWbs_start_date(String wbs_start_date) {
		this.wbs_start_date = wbs_start_date;
	}
	public String getWbs_end_date() {
		return wbs_end_date;
	}
	public void setWbs_end_date(String wbs_end_date) {
		this.wbs_end_date = wbs_end_date;
	}
	public String getWbs_fin_date() {
		return wbs_fin_date;
	}
	public void setWbs_fin_date(String wbs_fin_date) {
		this.wbs_fin_date = wbs_fin_date;
	}
	public String getWbs_code() {
		return wbs_code;
	}
	public void setWbs_code(String wbs_code) {
		this.wbs_code = wbs_code;
	}
	@Override
	public String toString() {
		return "ScheduleVo [fbs_name=" + fbs_name + ", proj_name=" + proj_name + ", doc_id=" + doc_id + ", top_id="
				+ top_id + ", mid_id=" + mid_id + ", wbs_id=" + wbs_id + ", wbs_name=" + wbs_name + ", wbs_conent="
				+ wbs_conent + ", wbs_manager=" + wbs_manager + ", wbs_start_date=" + wbs_start_date + ", wbs_end_date="
				+ wbs_end_date + ", wbs_fin_date=" + wbs_fin_date + ", wbs_code=" + wbs_code + "]";
	}
	public ScheduleVo(String fbs_name, String proj_name, String doc_id, String top_id, String mid_id, String wbs_id,
			String wbs_name, String wbs_conent, String wbs_manager, String wbs_start_date, String wbs_end_date,
			String wbs_fin_date, String wbs_code) {
		super();
		this.fbs_name = fbs_name;
		this.proj_name = proj_name;
		this.doc_id = doc_id;
		this.top_id = top_id;
		this.mid_id = mid_id;
		this.wbs_id = wbs_id;
		this.wbs_name = wbs_name;
		this.wbs_conent = wbs_conent;
		this.wbs_manager = wbs_manager;
		this.wbs_start_date = wbs_start_date;
		this.wbs_end_date = wbs_end_date;
		this.wbs_fin_date = wbs_fin_date;
		this.wbs_code = wbs_code;
	}
	public ScheduleVo() {
		super();
	}
	
	

}
