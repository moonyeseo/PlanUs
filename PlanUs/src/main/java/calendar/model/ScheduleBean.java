package calendar.model;

public class ScheduleBean {
	private String s_cd; // PK
	private String u_cd; // user FK
	private String g_cd; // groups FK
	private String s_name; // schedule title
	private String s_memo; // schedule memo
	private String s_color; // schedule font color
	
	private String g_name; // groups name
	
	private String r_type;
	private String r_detail;
	
	public String getG_name() {
		return g_name;
	}
	public void setG_name(String g_name) {
		this.g_name = g_name;
	}
	public String getS_cd() {
		return s_cd;
	}
	public void setS_cd(String s_cd) {
		this.s_cd = s_cd;
	}
	public String getU_cd() {
		return u_cd;
	}
	public void setU_cd(String u_cd) {
		this.u_cd = u_cd;
	}
	public String getG_cd() {
		return g_cd;
	}
	public void setG_cd(String g_cd) {
		this.g_cd = g_cd;
	}
	public String getS_name() {
		return s_name;
	}
	public void setS_name(String s_name) {
		this.s_name = s_name;
	}
	public String getS_memo() {
		return s_memo;
	}
	public void setS_memo(String s_memo) {
		this.s_memo = s_memo;
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
	public String getS_color() {
		return s_color;
	}
	public void setS_color(String s_color) {
		this.s_color = s_color;
	}
}
