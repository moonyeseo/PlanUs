package calendar.model;

public class ScheduleBean {
	private String s_cd; // PK
	private String u_cd; // user FK
	private String g_cd; // groups FK
	private String s_name; // schedule title
	private String s_memo; // schedule memo
	
	private String g_name; // groups name
	
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
}
