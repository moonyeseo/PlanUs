package calendar.model;

public class DiaryBean {
	private String d_cd; // PK
	private String u_cd; // user FK
	private String d_title; // diary title
	private String d_detail; // diary content
	
	public String getD_cd() {
		return d_cd;
	}
	public void setD_cd(String d_cd) {
		this.d_cd = d_cd;
	}
	public String getU_cd() {
		return u_cd;
	}
	public void setU_cd(String u_cd) {
		this.u_cd = u_cd;
	}
	public String getD_title() {
		return d_title;
	}
	public void setD_title(String d_title) {
		this.d_title = d_title;
	}
	public String getD_detail() {
		return d_detail;
	}
	public void setD_detail(String d_detail) {
		this.d_detail = d_detail;
	}
}
