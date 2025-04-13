package calendar.model;

public class TodoBean {
	private String t_cd; // PK
	private String u_cd; // user FK
	private String t_name; // title
	private String t_ok_yn; // yes or no
	
	private String r_type; // repeate day(0) or date(1)
	private String r_detail; // repeate detail
	
	public String getT_cd() {
		return t_cd;
	}
	public void setT_cd(String t_cd) {
		this.t_cd = t_cd;
	}
	public String getU_cd() {
		return u_cd;
	}
	public void setU_cd(String u_cd) {
		this.u_cd = u_cd;
	}
	public String getT_name() {
		return t_name;
	}
	public void setT_name(String t_name) {
		this.t_name = t_name;
	}
	public String getT_ok_yn() {
		return t_ok_yn;
	}
	public void setT_ok_yn(String t_ok_yn) {
		this.t_ok_yn = t_ok_yn;
	}
	public String getR_type() {
		return r_type;
	}
	public void setR_type(String r_type) {
		this.r_type = r_type;
	}
	public String getR_detail() {
		return r_detail;
	}
	public void setR_detail(String r_detail) {
		this.r_detail = r_detail;
	}
}
