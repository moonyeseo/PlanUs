package account.model;

public class accountBean {
	private String a_cd; // pk
	private String u_cd; // fk
	private String a_name;
	private float a_state;
	private float a_asset;
	private String a_repaymentdate;

	public String getA_cd() {
		return a_cd;
	}
	public void setA_cd(String a_cd) {
		this.a_cd = a_cd;
	}
	public String getU_cd() {
		return u_cd;
	}
	public void setU_cd(String u_cd) {
		this.u_cd = u_cd;
	}
	public String getA_name() {
		return a_name;
	}
	public void setA_name(String a_name) {
		this.a_name = a_name;
	}
	public float getA_state() {
		return a_state;
	}
	public void setA_state(float a_state) {
		this.a_state = a_state;
	}
	public float getA_asset() {
		return a_asset;
	}
	public void setA_asset(float a_asset) {
		this.a_asset = a_asset;
	}
	public String getA_repaymentdate() {
		return a_repaymentdate;
	}
	public void setA_repaymentdate(String a_repaymentdate) {
		this.a_repaymentdate = a_repaymentdate;
	}
	
}
