package calendar.model;

public class RepeatBean {
	private String r_cd; // PK
	private String type_cd; // T/ S/ D PK
	private String c_type; // T/ S/ D
	private String r_type; // day or date
	private String r_detail; // mon, sat... or 22, 7...

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
