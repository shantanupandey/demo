package com.assentisk.bean;

import java.util.Date;

import com.mysql.jdbc.jdbc2.optional.MysqlDataSource;

@SuppressWarnings("all")
public class VendorCategoryBean {
	
	protected Integer id;
	protected String VendorCatName;
	protected Integer IsActive;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getVendorCatName() {
		return VendorCatName;
	}
	public void setVendorCatName(String vendorCatName) {
		VendorCatName = vendorCatName;
	}
	public Integer getIsActive() {
		return IsActive;
	}
	public void setIsActive(Integer isActive) {
		IsActive = isActive;
	}

	

}
