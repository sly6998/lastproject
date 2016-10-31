package com.interior.advice;

import java.sql.Date;

public class AdviceBean {

	private String ADVICE_NAME;
	private String ADVICE_TEL;
	private String ADVICE_CONTENT;
	private Date ADVICE_DATE;
	private int ADVICE_NUM;
	
	
	public String getADVICE_NAME() {
		return ADVICE_NAME;
	}
	public void setADVICE_NAME(String aDVICE_NAME) {
		ADVICE_NAME = aDVICE_NAME;
	}
	public String getADVICE_TEL() {
		return ADVICE_TEL;
	}
	public void setADVICE_TEL(String aDVICE_TEL) {
		ADVICE_TEL = aDVICE_TEL;
	}
	public String getADVICE_CONTENT() {
		return ADVICE_CONTENT;
	}
	public void setADVICE_CONTENT(String aDVICE_CONTENT) {
		ADVICE_CONTENT = aDVICE_CONTENT;
	}
	public Date getADVICE_DATE() {
		return ADVICE_DATE;
	}
	public void setADVICE_DATE(Date aDVICE_DATE) {
		ADVICE_DATE = aDVICE_DATE;
	}
	public int getADVICE_NUM() {
		return ADVICE_NUM;
	}
	public void setADVICE_NUM(int aDVICE_NUM) {
		ADVICE_NUM = aDVICE_NUM;
	}
	
	
}
