package com.interior.basket;

import java.sql.Date;

public class BasketBean {
	

	private String BASKET_MEMBER_ID;
	private String BASKET_MEMBER_NAME;
	private String BASKET_ITEM_NAME;
	private int BASKET_ITEM_PRICE;
	private String BASKET_ITEM_IMAGE;
	private String BASKET_ITEM_BRAND;
	private String BASKET_ITEM_TYPE;
	private Date BASKET_DATE;
	private int BASKET_AMOUNT;//수량
	private int BASKET_RESULT;
	private String BASKET_ITEM_MODEL;
	private int BASKET_NUM;
	
	
	public int getBASKET_NUM() {
		return BASKET_NUM;
	}
	public void setBASKET_NUM(int bASKET_NUM) {
		BASKET_NUM = bASKET_NUM;
	}
	public int getBASKET_AMOUNT() {
		return BASKET_AMOUNT;
	}
	public void setBASKET_AMOUNT(int bASKET_AMOUNT) {
		BASKET_AMOUNT = bASKET_AMOUNT;
	}
	public String getBASKET_ITEM_TYPE() {
		return BASKET_ITEM_TYPE;
	}
	public void setBASKET_ITEM_TYPE(String bASKET_ITEM_TYPE) {
		BASKET_ITEM_TYPE = bASKET_ITEM_TYPE;
	}
	public String getBASKET_MEMBER_ID() {
		return BASKET_MEMBER_ID;
	}
	public void setBASKET_MEMBER_ID(String bASKET_MEMBER_ID) {
		BASKET_MEMBER_ID = bASKET_MEMBER_ID;
	}
	public String getBASKET_MEMBER_EMAIL() {
		return BASKET_MEMBER_ID;
	}
	public void setBASKET_MEMBER_EMAIL(String bASKET_MEMBER_EMAIL) {
		BASKET_MEMBER_ID = bASKET_MEMBER_EMAIL;
	}
	public String getBASKET_MEMBER_NAME() {
		return BASKET_MEMBER_NAME;
	}
	public void setBASKET_MEMBER_NAME(String bASKET_MEMBER_NAME) {
		BASKET_MEMBER_NAME = bASKET_MEMBER_NAME;
	}
	public String getBASKET_ITEM_NAME() {
		return BASKET_ITEM_NAME;
	}
	public void setBASKET_ITEM_NAME(String bASKET_ITEM_NAME) {
		BASKET_ITEM_NAME = bASKET_ITEM_NAME;
	}
	public int getBASKET_ITEM_PRICE() {
		return BASKET_ITEM_PRICE;
	}
	public void setBASKET_ITEM_PRICE(int bASKET_ITEM_PRICE) {
		BASKET_ITEM_PRICE = bASKET_ITEM_PRICE;
	}
	public String getBASKET_ITEM_IMAGE() {
		return BASKET_ITEM_IMAGE;
	}
	public void setBASKET_ITEM_IMAGE(String bASKET_ITEM_IMAGE) {
		BASKET_ITEM_IMAGE = bASKET_ITEM_IMAGE;
	}
	public String getBASKET_ITEM_BRAND() {
		return BASKET_ITEM_BRAND;
	}
	public void setBASKET_ITEM_BRAND(String bASKET_ITEM_BRAND) {
		BASKET_ITEM_BRAND = bASKET_ITEM_BRAND;
	}
	public Date getBASKET_DATE() {
		return BASKET_DATE;
	}
	public void setBASKET_DATE(Date bASKET_DATE) {
		BASKET_DATE = bASKET_DATE;
	}
	public int getBASKET_RESULT() {
		return BASKET_RESULT;
	}
	public void setBASKET_RESULT(int bASKET_RESULT) {
		BASKET_RESULT = bASKET_RESULT;
	}
	public String getBASKET_ITEM_MODEL() {
		return BASKET_ITEM_MODEL;
	}
	public void setBASKET_ITEM_MODEL(String bASKET_ITEM_MODEL) {
		BASKET_ITEM_MODEL = bASKET_ITEM_MODEL;
	}
}
