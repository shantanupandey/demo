package com.assentisk.bean;

import java.util.Date;

import com.mysql.jdbc.jdbc2.optional.MysqlDataSource;

@SuppressWarnings("all")
public class ControlCategoryBean {

	protected Integer CtrlCategory_ID;
	protected String CtrlCategoryName;
	protected Integer BusinessProcessID;
	protected Integer CtrlCategory_Parent;
	protected Date CreatedDate;
	protected Integer createdBy;
	protected Date ModifiedDate;
	protected Integer modifiyBy;
	protected Integer status;
	public Integer getCtrlCategory_ID() {
		return CtrlCategory_ID;
	}
	public void setCtrlCategory_ID(Integer ctrlCategoryID) {
		CtrlCategory_ID = ctrlCategoryID;
	}
	public String getCtrlCategoryName() {
		return CtrlCategoryName;
	}
	public void setCtrlCategoryName(String ctrlCategoryName) {
		CtrlCategoryName = ctrlCategoryName;
	}
	public Integer getBusinessProcessID() {
		return BusinessProcessID;
	}
	public void setBusinessProcessID(Integer businessProcessID) {
		BusinessProcessID = businessProcessID;
	}
	public Integer getCtrlCategory_Parent() {
		return CtrlCategory_Parent;
	}
	public void setCtrlCategory_Parent(Integer ctrlCategoryParent) {
		CtrlCategory_Parent = ctrlCategoryParent;
	}
	public Date getCreatedDate() {
		return CreatedDate;
	}
	public void setCreatedDate(Date createdDate) {
		CreatedDate = createdDate;
	}
	public Integer getCreatedBy() {
		return createdBy;
	}
	public void setCreatedBy(Integer createdBy) {
		this.createdBy = createdBy;
	}
	public Date getModifiedDate() {
		return ModifiedDate;
	}
	public void setModifiedDate(Date modifiedDate) {
		ModifiedDate = modifiedDate;
	}
	public Integer getModifiyBy() {
		return modifiyBy;
	}
	public void setModifiyBy(Integer modifiyBy) {
		this.modifiyBy = modifiyBy;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	
	
	
	
	

}
