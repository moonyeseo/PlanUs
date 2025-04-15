package users.model;

import java.sql.Date;

public class usersBean {

	private String u_CD;
	private String u_ID;
	private String u_PWD;
	private String u_NAME;
	private String u_NICK;
	private String u_PHONE; //USERS PHONE NUMBER
	private String u_ACN;	//USERS ACCOUNT NUMBER
	private String b_NAME;	//USERS BANK NAME
	private Date u_BIRTH;	//USERS BIRTH

	public usersBean() {

	}

	public usersBean(String u_CD, String u_ID ,String u_PWD, String u_NAME, String u_NICK,String u_PHONE, String u_ACN, String b_NAME, Date u_BIRTH) {
		super();
		this.u_CD 	= u_CD;
		this.u_ID 	= u_ID;
		this.u_PWD 	= u_PWD;
		this.u_NAME = u_NAME;
		this.u_NICK	= u_NICK;
		this.u_PHONE= u_PHONE;
		this.u_ACN 	= u_ACN;
		this.b_NAME = b_NAME;
		this.u_BIRTH= u_BIRTH;
	}

	public String getU_CD() {
		return u_CD;
	}

	public void setU_CD(String u_CD) {
		this.u_CD = u_CD;
	}

	public String getU_ID() {
		return u_ID;
	}

	public void setU_ID(String u_ID) {
		this.u_ID = u_ID;
	}

	public String getU_PWD() {
		return u_PWD;
	}

	public void setU_PWD(String u_PWD) {
		this.u_PWD = u_PWD;
	}

	public String getU_NAME() {
		return u_NAME;
	}

	public void setU_NAME(String u_NAME) {
		this.u_NAME = u_NAME;
	}

	public String getU_NICK() {
		return u_NICK;
	}

	public void setU_NICK(String u_NICK) {
		this.u_NICK = u_NICK;
	}

	public String getU_PHONE() {
		return u_PHONE;
	}

	public void setU_PHONE(String u_PHONE) {
		this.u_PHONE = u_PHONE;
	}

	public String getU_ACN() {
		return u_ACN;
	}

	public void setU_ACN(String u_ACN) {
		this.u_ACN = u_ACN;
	}

	public String getB_NAME() {
		return b_NAME;
	}

	public void setB_NAME(String b_NAME) {
		this.b_NAME = b_NAME;
	}

	public Date getU_BIRTH() {
		return u_BIRTH;
	}

	public void setU_BIRTH(Date u_BIRTH) {
		this.u_BIRTH = u_BIRTH;
	}

	

}
