package com.assentisk.bean;

public class AuditTrail {

	private int AuditTrailID;
	private String TableName;
	private String ColumnName;
	private String RowID;
	private String OldValue;
	private String NewValue;
	private String Action;
	private String IPAddress;
	private int ChangedBy;
	private String ChangedDate;
	private String EmpName;
	
	public int getAuditTrailID() {
		return AuditTrailID;
	}
	public void setAuditTrailID(int auditTrailID) {
		AuditTrailID = auditTrailID;
	}
	public String getTableName() {
		return TableName;
	}
	public void setTableName(String tableName) {
		TableName = tableName;
	}
	public String getColumnName() {
		return ColumnName;
	}
	public void setColumnName(String columnName) {
		ColumnName = columnName;
	}
	public String getRowID() {
		return RowID;
	}
	public void setRowID(String rowID) {
		RowID = rowID;
	}
	public String getOldValue() {
		return OldValue;
	}
	public void setOldValue(String oldValue) {
		OldValue = oldValue;
	}
	public String getNewValue() {
		return NewValue;
	}
	public void setNewValue(String newValue) {
		NewValue = newValue;
	}
	public String getAction() {
		return Action;
	}
	public void setAction(String action) {
		Action = action;
	}
	public String getIPAddress() {
		return IPAddress;
	}
	public void setIPAddress(String iPAddress) {
		IPAddress = iPAddress;
	}
	public int getChangedBy() {
		return ChangedBy;
	}
	public void setChangedBy(int changedBy) {
		ChangedBy = changedBy;
	}
	public String getChangedDate() {
		return ChangedDate;
	}
	public void setChangedDate(String changedDate) {
		ChangedDate = changedDate;
	}
	public String getEmpName() {
		return EmpName;
	}
	public void setEmpName(String empName) {
		EmpName = empName;
	}
	
	
	
	
}
