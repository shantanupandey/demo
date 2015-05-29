package com.assentisk.bean;

import com.mysql.jdbc.jdbc2.optional.MysqlDataSource;

@SuppressWarnings("all")
public class GroupBean {

	protected Integer GroupID;
	protected String Gname;
	protected String Description;
	protected Integer IsActive;

	public Integer getGroupID() {
		return GroupID;
	}

	public void setGroupID(Integer groupID) {
		GroupID = groupID;
	}

	public String getGname() {
		return Gname;
	}

	public void setGname(String gname) {
		Gname = gname;
	}

	public String getDescription() {
		return Description;
	}

	public void setDescription(String description) {
		Description = description;
	}

	public Integer getIsActive() {
		return IsActive;
	}

	public void setIsActive(Integer isActive) {
		IsActive = isActive;
	}

}
