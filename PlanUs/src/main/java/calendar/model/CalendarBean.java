package calendar.model;

public class CalendarBean {
	private String c_cd; // PK
	private String u_cd; // user FK
	private String r_cd; // repeat FK
	private String type_cd; // T/ S/ D PK
	private String c_type; // T/ S/ D
	private String c_ymd; // date
	
	public String getC_cd() {
		return c_cd;
	}
	public void setC_cd(String c_cd) {
		this.c_cd = c_cd;
	}
	public String getU_cd() {
		return u_cd;
	}
	public void setU_cd(String u_cd) {
		this.u_cd = u_cd;
	}
	public String getR_cd() {
		return r_cd;
	}
	public void setR_cd(String r_cd) {
		this.r_cd = r_cd;
	}
	public String getType_cd() {
		return type_cd;
	}
	public void setType_cd(String type_cd) {
		this.type_cd = type_cd;
	}
	public String getC_type() {
		return c_type;
	}
	public void setC_type(String c_type) {
		this.c_type = c_type;
	}
	public String getC_ymd() {
		return c_ymd;
	}
	public void setC_ymd(String c_ymd) {
		this.c_ymd = c_ymd;
	}
}
