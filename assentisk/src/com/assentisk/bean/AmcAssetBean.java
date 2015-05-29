package com.assentisk.bean;

import java.util.Date;

import com.mysql.jdbc.jdbc2.optional.MysqlDataSource;

@SuppressWarnings("all")
public class AmcAssetBean {

	protected Integer ID;
	protected String amcName;
	protected Integer vendorID;
	protected Date fromDate;
	protected Date toDate;
	public Integer getID() {
		return ID;
	}
	public void setID(Integer iD) {
		ID = iD;
	}
	public String getAmcName() {
		return amcName;
	}
	public void setAmcName(String amcName) {
		this.amcName = amcName;
	}
	public Integer getVendorID() {
		return vendorID;
	}
	public void setVendorID(Integer vendorID) {
		this.vendorID = vendorID;
	}
	public Date getFromDate() {
		return fromDate;
	}
	public void setFromDate(Date fromDate) {
		this.fromDate = fromDate;
	}
	public Date getToDate() {
		return toDate;
	}
	public void setToDate(Date toDate) {
		this.toDate = toDate;
	}
	
	
}
