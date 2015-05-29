package com.assentisk.dao;

import java.util.List;

import com.assentisk.bean.ApplicationsBean;
import com.assentisk.bean.AuditTrail;
import com.assentisk.bean.BusinessProcessesBean;
import com.assentisk.bean.CategoriesBean;
import com.assentisk.bean.CityBean;
import com.assentisk.bean.CompanyBean;
import com.assentisk.bean.ControlCategoryBean;
import com.assentisk.bean.CountryBean;
import com.assentisk.bean.DepartmentBean;
import com.assentisk.bean.EmployeeBean;
import com.assentisk.bean.GroupBean;
import com.assentisk.bean.LanguageKeysBean;
import com.assentisk.bean.LegalEntitiesBean;
import com.assentisk.bean.LocationsBean;
import com.assentisk.bean.StateBean;
import com.assentisk.bean.UserRecordBean;
import com.assentisk.bean.VendorBean;
import com.assentisk.bean.VendorContactBean;
import com.assentisk.bean.employeesBean;

public interface OrganizationDao {

	public List<CompanyBean> getCompanyList();
	
	public void savecompany(String cname, String no, Integer isactive);

	public void updatecompany(String cid,String cname, String no, Integer isactive);
	
	public List getcompany(String id);

	public void deletecompany(String cid);
	
	public List<DepartmentBean> getDepartmentList();
	
	public List<LegalEntitiesBean> getLegalEntitiesList();
	
	public void savedepartment(Integer companyID, String departmentName, String departmentDesc, String createdDate, Integer createdBy, String modifiedDate, Integer modifiedBy, Integer isActive);
	
	public void saveLegalEntity(String legalEntityName, String legalEntityDescription,Integer departmentID, Integer branchID,Integer companyPeriodID,String createdDate, Integer createdBy, String modifiedDate, Integer modifiedBy, Integer isActive, Integer employeeid);
	
	public void updatedDepartment(Integer departmentID,Integer companyID, String departmentName, String departmentDesc, String modifiedDate, Integer modifiedBy, Integer isActive);
	
	public void updatedLegalEntity(Integer legalEntityID, String legalEntityName,String legalEntityDescription,Integer departmentID,Integer branchID, Integer companyPeriodID,String modifiedDate, Integer modifiedBy, Integer isActive, Integer employeeid);
	
	public List<DepartmentBean> getDepartmentById(Integer departmentID);

	public List<LegalEntitiesBean> getLegalEntityById(Integer legalEntityID);
	
	public void deleteLegalEntity(Integer legalEntityID);
	
	public void deleteDepartment(Integer departmentID);
		
	public List getCmpList();
	
	public List getDepList();
	
	public List getBranchList();
	
	public List<LocationsBean> getLocationsList();
	
	public void saveLocation(String locationname, Integer countryid, Integer stateid, String cityid, String street, String address, String contactno, String zipcode, String phone1, String phone2, String email1, String email2, String fax1, String fax2, String url,String createdate, Integer createby, String modifieddate, Integer modifyby, Integer isactive);
	
	public void updateLocation(Integer locationid, String locationname, Integer countryid, Integer stateid, String cityid, String street, String address, String contactno, String zipcode, String phone1, String phone2, String email1, String email2, String fax1, String fax2, String url,String modifieddate, Integer modifyby, Integer isactive);
	
	public List<LocationsBean> getLocationById(Integer locationid);
	
	public List<StateBean> getStateByCountryID(Integer countryid);
	
	public List<CityBean> getCityByStateCountryID(Integer stateid, Integer countryid);
	
	public void deleteLocationById(Integer locationid);
	
	public List<ApplicationsBean> getApplicationsList();
	
	public List<BusinessProcessesBean> getBusinessProcessesList();
		
	public List getSelectBranchList(String id);
	
	public List getSelectDeptList(String branchid,String companyid);
	
	public void saveApplication(String applicationname, String locationid, String divisionid, Integer employeeid, String requestdate, String createdate, Integer createdby, String modifieddate, Integer modifyby, Integer isactive,String deptdata);
	
	public void updateApplication(Integer applicationid, String applicationname, String locationid, String divisionid, Integer employeeid,String modifieddate, Integer modifyby, Integer isactive,String deptdata);
	
	public List<ApplicationsBean> getApplicationDetailById(Integer applicationid);
	
	public void deleteApplicationById(Integer applicationid);
	
	public void saveBusinessProcess(String businessprocessname, String locationid, String divisionid, Integer employeeid, String requestdate, String createdate, Integer createdby, String modifieddate, Integer modifyby, Integer isactive,String deptname);
	
	public List<BusinessProcessesBean> getBusinessProcessDetailById(Integer businessprocessid);
	
	public void updateBusinessProcess(Integer businessprocessid, String businessprocessname, String locationid, String divisionid, Integer employeeid,String modifieddate, Integer modifyby, Integer isactive,String deptname);
	
	public void deleteBusinessProcessById(Integer businessprocessid);
	
	public int getEmployeeIdByName(String empname);
	
	public String getLocationIdByName(String locationName);
	
	public String getDivisionIdByName(String divisionName);	

	public void userAuditTrail(String tableName, String rowID, String action, String changeDate, Integer changeBy, String ipAddress);
	
	public List<EmployeeBean> getEmployeeList();

	public void saveEmployee(Integer userRecordID,String departmentID, String locationID, String empName, String email, String ReportingTo, String roleID,String requestDate, String createdDate,Integer createdBy, String modifiedDate,Integer modifiedBy, Integer isActive,String address,String city,String state,String country,String zip,String photo, String phone1, String phone2, String divisions, String email2);
	
	public void saveUserRecord(String employeeName,String username, String password, String emailID,String createdDate, String modificationDate);

	public List<CompanyBean> getCompanyDetails();
	
	public List getCurrency();
	
	public void updatedCompany(int parseInt, String companyname,
			String headOffice, String country, String city, String state,
			String zip, String primaryContactName, String primaryContactNumber,
			String primaryEmail, String legalContactName,
			String legalContactNumber, String legalContactEmail,
			String accountsContactName, String accountsContactNumber,
			String accountsContactEmail, int status, String currentTime,
			String currency);
	
	public int getUserRecordID();
	
	public List<EmployeeBean> getEmployeeRecordById(Integer employeeid);
	
    public void updateEmployee(Integer employeeid, Integer userRecordID,String departmentID, String locationID, String empName, String email, String ReportingTo, String roleID,String modifiedDate,Integer modifiedBy, Integer isActive,String address,String city,String state,String country,String zip,String photo, String phone1, String phone2, String divisions, String email2, String licenseuser);
	
	public void udpateUserRecord(Integer employeeid,String employeeName,String username, String password, String emailID,String modificationDate);
	
	public String getLocationNameById(Integer locationid);
	
	public String getDivisionNameById(Integer divisionid);

	public List getLicense();
	
	public List<LocationsBean> getLocationById(String ID);
	
	public List<LegalEntitiesBean> getDivisionById(String ID);
	
	public List<EmployeeBean> getEmployeeListByLicense();

	public void updatePassword(String id, String newPassword);

	public List getPassword(String id);

	public void deleteEmployee(int parseInt);
	
	public List<VendorBean> getVendorList();

	public List getCountryList();

	public void insertVendorRecord( String vendorname,
			 String country, String stateid, String cityid,
			String phone1, String phone2, String email1, String email2,
			int status,String address);

	public List<VendorBean> getVendorById(String vendorID);
	
	public void updateVendorRecord( String vendorname,
			 String country, String stateid, String cityid,
			String phone1, String phone2, String email1, String email2,String vendorid,
			int status,String address);
	
	public void deleteVendor(String deleteVendor);


	public void saveEnglishConfg(String key, String value);

	public List getLaungageKey(String language);


	public List<LanguageKeysBean> getLanguageKeysList(String language);

	public void updateLanguageKey(String languagekey, String launguageValue, String language);
	
	public List<UserRecordBean> checkUserName(String username);
	
	public List<LegalEntitiesBean> getDivisionsGroupList();
	
	public List<LocationsBean> getLocationsGroupList();
	
	public String getDivisionGroupById(String ID);

	public String getLocationGroupById(String string);
	
	public List<GroupBean> getGroupDataList();

	public String getGroupIdByName(String group);

	public String getGroupDataById(String string);

	public List<DepartmentBean> getDepartmentGroupList();

	public String getDepIdByName(String departmentid);

	public String getDeptDataById(String string);
	
	public List<LegalEntitiesBean> checkdivisionName(String divisionName);
	
	public List<LocationsBean> checkLocationName(String locationName);
	
	public List<DepartmentBean> checkDepartmentName(String departmentName);
	
	public List<ApplicationsBean> checkApplicationName(String applicationName);
	
	public List<BusinessProcessesBean> checkBusinessProcessName(String BusinessProcessName);
	
	public List<GroupBean> checkGroupName(String groupName);
	
	public List<VendorBean> checkVendorName(String vendorName);
	
	public List<EmployeeBean> checkResponsibleHead(String empName);

	public List<VendorContactBean> getVendorContact(int parseInt);

	public void editVendorContact(VendorContactBean contactBean1, int id);

	public void saveVendorContact(VendorContactBean contactBean);

	public void deleteVendorContact(int id);


	public List checkOldPassword(String password, String userID);
	
	public List<AuditTrail> geAauditTrailList();

	public List<CategoriesBean> getCategoryList();


	public List<BusinessProcessesBean> getBusinessList();

	public List<ApplicationsBean> getAppList();

	public String getApplicationByName(String application);



	public void saveAsset(String assets, String categoryByName,
			String locationIdByName, String applicationByName,
			String businessByName, String string, String currentTime,
			int parseInt, String currentTime2, int parseInt2, String string2,
			String string3, String initial, String quantity);

	public List<CountryBean> getCountryData();

	public String getAppByName(String application, String currentTime,
			int parseInt);

	public String getLocIdByName(String location, String currentTime,
			int parseInt, String country, String state, String city,
			String contact, String email);

	public String getBusinessByName(String business, String currentTime,
			int usertID);

	public String getCategoryByName(String category, String currentTime,
			int usertID);

	public String getDeparmentIdByName(String departmentID, String currentTime,
			int usertID);

	public String getDivisionByName(String divisions, String currentTime,
			int parseInt);

	public void saveCompanyLogo(String fileName, String companyID);

	public String saveEmployeedata(int i, String departmentID,
			String locationID, String empName, String email1, String reporting,
			String groupdata, String currentTime, String currentTime2,
			int parseInt, String currentTime3, int parseInt2, int status,
			String address, String city, String string, String string2,
			String zip, String photo, String phone1, String phone2,
			String divisions, String email2);

	public String saveAssetData(String assets, String category,
			String location, String application, String business,
			String string, String currentTime, int parseInt,
			String currentTime2, int parseInt2, String string2, String string3,
			String initial, String quantity);

	public String getUserId(String userName);

	public String getuserDataConcat(String reporting);

	public List<ControlCategoryBean> checkcontrolCatname(String controlname);

	public List getTaskList(int parseInt);

	public List getEmpList(String rowId);
	
	public void updateTaskRecord(int parseInt, int i);




	}

	

