package com.assentisk.bean;

import com.mysql.jdbc.jdbc2.optional.MysqlDataSource;

@SuppressWarnings("all")
public class CategoriesBean {

	protected Integer ID;
	protected String categoryName;
	protected Integer isActive;
	
	public Integer getID() {
		return ID;
	}

	public void setID(Integer iD) {
		ID = iD;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public Integer getIsActive() {
		return isActive;
	}

	public void setIsActive(Integer isActive) {
		this.isActive = isActive;
	}
	
	

}
