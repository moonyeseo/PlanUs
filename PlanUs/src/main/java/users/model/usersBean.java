package users.model;

import java.sql.Date;

public class usersBean {

	private String U_CD;
	private String U_PWD;
	private String U_NAME;	//USERS PHONE NUMBER
	private String U_PHONE;
	private String U_ACN;	//USERS ACCOUNT NUMBER
	private String B_NAME;	//USERS BANK NAME
	private Date U_BIRTH;	//USERS BIRTH

	public usersBean() {

	}

	public usersBean(String U_CD, String U_PWD, String U_NAME, String U_PHONE, String U_ACN, String B_NAME, Date U_BIRTH) {
		super();
		this.U_CD = U_CD;
		this.U_PWD = U_PWD;
		this.U_NAME = U_NAME;
		this.U_PHONE = U_PHONE;
		this.U_ACN = U_ACN;
		this.B_NAME = B_NAME;
		this.U_BIRTH = U_BIRTH;
	}

	public String getU_CD() {
		return U_CD;
	}

	public void setU_CD(String u_CD) {
		U_CD = u_CD;
	}

	public String getU_PWD() {
		return U_PWD;
	}

	public void setU_PWD(String u_PWD) {
		U_PWD = u_PWD;
	}

	public String getU_NAME() {
		return U_NAME;
	}

	public void setU_NAME(String u_NAME) {
		U_NAME = u_NAME;
	}

	public String getU_PHONE() {
		return U_PHONE;
	}

	public void setU_PHONE(String u_PHONE) {
		U_PHONE = u_PHONE;
	}

	public String getU_ACN() {
		return U_ACN;
	}

	public void setU_ACN(String u_ACN) {
		U_ACN = u_ACN;
	}

	public String getB_NAME() {
		return B_NAME;
	}

	public void setB_NAME(String b_NAME) {
		B_NAME = b_NAME;
	}

	public Date getU_BIRTH() {
		return U_BIRTH;
	}

	public void setU_BIRTH(Date u_BIRTH) {
		U_BIRTH = u_BIRTH;
	}

}
