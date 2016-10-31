package com.interior.review;

import java.sql.Date;

public class ReviewBean {
	
	private String REVIEW_MEMBER_ID;
	private String REVIEW_MEMBER_NAME;
	private String REVIEW_SUBJECT;
	private String REVIEW_CONTENT;
	private int REVIEW_READCOUNT;
	private Date REVIEW_DATE;
	private int REVIEW_NUM;
	
	
	public String getREVIEW_MEMBER_ID() {
		return REVIEW_MEMBER_ID;
	}
	public void setREVIEW_MEMBER_ID(String rEVIEW_MEMBER_ID) {
		REVIEW_MEMBER_ID = rEVIEW_MEMBER_ID;
	}
	public String getREVIEW_MEMBER_NAME() {
		return REVIEW_MEMBER_NAME;
	}
	public void setREVIEW_MEMBER_NAME(String rEVIEW_MEMBER_NAME) {
		REVIEW_MEMBER_NAME = rEVIEW_MEMBER_NAME;
	}
	public String getREVIEW_SUBJECT() {
		return REVIEW_SUBJECT;
	}
	public void setREVIEW_SUBJECT(String rEVIEW_SUBJECT) {
		REVIEW_SUBJECT = rEVIEW_SUBJECT;
	}
	public String getREVIEW_CONTENT() {
		return REVIEW_CONTENT;
	}
	public void setREVIEW_CONTENT(String rEVIEW_CONTENT) {
		REVIEW_CONTENT = rEVIEW_CONTENT;
	}
	public int getREVIEW_READCOUNT() {
		return REVIEW_READCOUNT;
	}
	public void setREVIEW_READCOUNT(int rEVIEW_READCOUNT) {
		REVIEW_READCOUNT = rEVIEW_READCOUNT;
	}
	public Date getREVIEW_DATE() {
		return REVIEW_DATE;
	}
	public void setREVIEW_DATE(Date rEVIEW_DATE) {
		REVIEW_DATE = rEVIEW_DATE;
	}
	public int getREVIEW_NUM() {
		return REVIEW_NUM;
	}
	public void setREVIEW_NUM(int rEVIEW_NUM) {
		REVIEW_NUM = rEVIEW_NUM;
	}

}
