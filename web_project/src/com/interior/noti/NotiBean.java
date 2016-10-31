package com.interior.noti;

import java.sql.Date;

public class NotiBean {

	private String NOTI_MEMBER_ID;
	private String NOTI_MEMBER_NAME;
	private String NOTI_SUBJECT;
	private String NOTI_CONTENT;
	private int NOTI_READCOUNT;
	private Date NOTI_DATE;
	private int NOTI_NUM;
	
	//NOTI_REPLY 테이블 컬럼
	private String NOTI_REPLY_MEMBER_NAME;
	private String NOTI_REPLY_MEMBER_ID;
	private String NOTI_REPLY_CONTENT;
	private Date NOTI_REPLY_DATE;
	private int NOTI_REPLY_SEQ;
	private int NOTI_REPLY_REF;
	private int NOTI_REPLY_LEV;
	private int NOTI_REPLY_NUM;
	
	
	public String getNOTI_MEMBER_ID() {
		return NOTI_MEMBER_ID;
	}
	public void setNOTI_MEMBER_ID(String nOTI_MEMBER_ID) {
		NOTI_MEMBER_ID = nOTI_MEMBER_ID;
	}
	public String getNOTI_MEMBER_NAME() {
		return NOTI_MEMBER_NAME;
	}
	public void setNOTI_MEMBER_NAME(String nOTI_MEMBER_NAME) {
		NOTI_MEMBER_NAME = nOTI_MEMBER_NAME;
	}
	public String getNOTI_SUBJECT() {
		return NOTI_SUBJECT;
	}
	public void setNOTI_SUBJECT(String nOTI_SUBJECT) {
		NOTI_SUBJECT = nOTI_SUBJECT;
	}
	public String getNOTI_CONTENT() {
		return NOTI_CONTENT;
	}
	public void setNOTI_CONTENT(String nOTI_CONTENT) {
		NOTI_CONTENT = nOTI_CONTENT;
	}
	public int getNOTI_READCOUNT() {
		return NOTI_READCOUNT;
	}
	public void setNOTI_READCOUNT(int nOTI_READCOUNT) {
		NOTI_READCOUNT = nOTI_READCOUNT;
	}
	public Date getNOTI_DATE() {
		return NOTI_DATE;
	}
	public void setNOTI_DATE(Date nOTI_DATE) {
		NOTI_DATE = nOTI_DATE;
	}
	public int getNOTI_NUM() {
		return NOTI_NUM;
	}
	public void setNOTI_NUM(int nOTI_NUM) {
		NOTI_NUM = nOTI_NUM;
	}
	public String getNOTI_REPLY_MEMBER_NAME() {
		return NOTI_REPLY_MEMBER_NAME;
	}
	public void setNOTI_REPLY_MEMBER_NAME(String nOTI_REPLY_MEMBER_NAME) {
		NOTI_REPLY_MEMBER_NAME = nOTI_REPLY_MEMBER_NAME;
	}
	public String getNOTI_REPLY_MEMBER_ID() {
		return NOTI_REPLY_MEMBER_ID;
	}
	public void setNOTI_REPLY_MEMBER_ID(String nOTI_REPLY_MEMBER_ID) {
		NOTI_REPLY_MEMBER_ID = nOTI_REPLY_MEMBER_ID;
	}
	public String getNOTI_REPLY_CONTENT() {
		return NOTI_REPLY_CONTENT;
	}
	public void setNOTI_REPLY_CONTENT(String nOTI_REPLY_CONTENT) {
		NOTI_REPLY_CONTENT = nOTI_REPLY_CONTENT;
	}
	public Date getNOTI_REPLY_DATE() {
		return NOTI_REPLY_DATE;
	}
	public void setNOTI_REPLY_DATE(Date nOTI_REPLY_DATE) {
		NOTI_REPLY_DATE = nOTI_REPLY_DATE;
	}
	public int getNOTI_REPLY_SEQ() {
		return NOTI_REPLY_SEQ;
	}
	public void setNOTI_REPLY_SEQ(int nOTI_REPLY_SEQ) {
		NOTI_REPLY_SEQ = nOTI_REPLY_SEQ;
	}
	public int getNOTI_REPLY_REF() {
		return NOTI_REPLY_REF;
	}
	public void setNOTI_REPLY_REF(int nOTI_REPLY_REF) {
		NOTI_REPLY_REF = nOTI_REPLY_REF;
	}
	public int getNOTI_REPLY_LEV() {
		return NOTI_REPLY_LEV;
	}
	public void setNOTI_REPLY_LEV(int nOTI_REPLY_LEV) {
		NOTI_REPLY_LEV = nOTI_REPLY_LEV;
	}
	public int getNOTI_REPLY_NUM() {
		return NOTI_REPLY_NUM;
	}
	public void setNOTI_REPLY_NUM(int nOTI_REPLY_NUM) {
		NOTI_REPLY_NUM = nOTI_REPLY_NUM;
	}

	
}