package com.assentisk.bean;

import java.util.Date;

import com.mysql.jdbc.jdbc2.optional.MysqlDataSource;

@SuppressWarnings("all")
public class employeesBean {

	protected Integer EmployeeID;
	protected Integer UserRecordID;
	protected Integer CompanyID;
	protected Integer DepartmentID;
	protected Integer BranchID;
	protected String EmpName;
	protected String Email;
	protected Integer ReportingTo;
	protected String RoleID;
	protected Date RequestDate;
	protected Date CreatedDate;
	protected Date ModifiedDate;
	protected Integer CreatedBy;
	protected Integer ModifiedBy;
	protected Integer IsActive;
	protected String  address;
	protected Integer city;
	protected Integer state;
	protected Integer country;
	protected String zip;
	protected String phone1;
	protected String phone2;
	protected String locations;
	protected Integer divisions;
	public Integer getEmployeeID() {
		return EmployeeID;
	}
	public void setEmployeeID(Integer employeeID) {
		EmployeeID = employeeID;
	}
	public Integer getUserRecordID() {
		return UserRecordID;
	}
	public void setUserRecordID(Integer userRecordID) {
		UserRecordID = userRecordID;
	}
	public Integer getCompanyID() {
		return CompanyID;
	}
	public void setCompanyID(Integer companyID) {
		CompanyID = companyID;
	}
	public Integer getDepartmentID() {
		return DepartmentID;
	}
	public void setDepartmentID(Integer departmentID) {
		DepartmentID = departmentID;
	}
	public Integer getBranchID() {
		return BranchID;
	}
	public void setBranchID(Integer branchID) {
		BranchID = branchID;
	}
	public String getEmpName() {
		return EmpName;
	}
	public void setEmpName(String empName) {
		EmpName = empName;
	}
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
	public Integer getReportingTo() {
		return ReportingTo;
	}
	public void setReportingTo(Integer reportingTo) {
		ReportingTo = reportingTo;
	}
	public String getRoleID() {
		return RoleID;
	}
	public void setRoleID(String roleID) {
		RoleID = roleID;
	}
	public Date getRequestDate() {
		return RequestDate;
	}
	public void setRequestDate(Date requestDate) {
		RequestDate = requestDate;
	}
	public Date getCreatedDate() {
		return CreatedDate;
	}
	public void setCreatedDate(Date createdDate) {
		CreatedDate = createdDate;
	}
	public Date getModifiedDate() {
		return ModifiedDate;
	}
	public void setModifiedDate(Date modifiedDate) {
		ModifiedDate = modifiedDate;
	}
	public Integer getCreatedBy() {
		return CreatedBy;
	}
	public void setCreatedBy(Integer createdBy) {
		CreatedBy = createdBy;
	}
	public Integer getModifiedBy() {
		return ModifiedBy;
	}
	public void setModifiedBy(Integer modifiedBy) {
		ModifiedBy = modifiedBy;
	}
	public Integer getIsActive() {
		return IsActive;
	}
	public void setIsActive(Integer isActive) {
		IsActive = isActive;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Integer getCity() {
		return city;
	}
	public void setCity(Integer city) {
		this.city = city;
	}
	public Integer getState() {
		return state;
	}
	public void setState(Integer state) {
		this.state = state;
	}
	public Integer getCountry() {
		return country;
	}
	public void setCountry(Integer country) {
		this.country = country;
	}
	public String getZip() {
		return zip;
	}
	public void setZip(String zip) {
		this.zip = zip;
	}
	public String getPhone1() {
		return phone1;
	}
	public void setPhone1(String phone1) {
		this.phone1 = phone1;
	}
	public String getPhone2() {
		return phone2;
	}
	public void setPhone2(String phone2) {
		this.phone2 = phone2;
	}
	public String getLocations() {
		return locations;
	}
	public void setLocations(String locations) {
		this.locations = locations;
	}
	public Integer getDivisions() {
		return divisions;
	}
	public void setDivisions(Integer divisions) {
		this.divisions = divisions;
	}
	
	
	

}
