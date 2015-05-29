package com.assentisk.bean;

import java.util.Date;

import com.mysql.jdbc.jdbc2.optional.MysqlDataSource;

@SuppressWarnings("all")
public class LanguageKeysBean {

	protected String key;
	protected String value;
	
	public String getKey() {
		return key;
	}
	public void setKey(String key) {
		this.key = key;
	}
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}
	


}
