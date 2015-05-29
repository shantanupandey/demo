package com.assentisk.dao;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import net.sf.cglib.core.EmitUtils;

import org.springframework.jdbc.core.JdbcTemplate;

import com.assentisk.bean.ApplicationsBean;
import com.assentisk.bean.AuditTrail;
import com.assentisk.bean.BusinessProcessesBean;
import com.assentisk.bean.CategoriesBean;
import com.assentisk.bean.CityBean;
import com.assentisk.bean.CompanyBean;
import com.assentisk.bean.ControlCategoryBean;
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
import com.assentisk.util.DBUtill;

import electric.xml.io.model.Group;

public  class OrganizationDaoImpl implements OrganizationDao{

	DBUtill dbUtil = new DBUtill();
	
	JdbcTemplate jdbcTemplate = new JdbcTemplate();

	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	@SuppressWarnings("unchecked")
	public List<CompanyBean> getCompanyList(){
		List<CompanyBean> list = jdbcTemplate
				.queryForList("select * from assentisk_company order by CompanyID");
		return list;
	}

	public void savecompany(String cname, String no, Integer isactive) {

		Date now = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String currentDate = format.format(now);
		String query = "insert into assentisk_company(NoOfEmployees,CompanyName,CreatedDate,CreatedBy,ModifiedDate,ModifiedBy,IsActive) values('"
				+ no
				+ "','"
				+ cname
				+ "','"
				+ currentDate
				+ "',1,'"
				+ currentDate + "',1,'" + isactive + "')";
		jdbcTemplate.execute(query);

	}

	@SuppressWarnings("unchecked")
	public List getcompany(String id) {
		List list = jdbcTemplate
				.queryForList("select *from assentisk_company where CompanyID='"
						+ id + "'");
		System.out.println("select *from assentisk_company where CompanyID='"
						+ id + "'");
		
		return list;
	}

	public void updatecompany(String cid, String cname, String no,
			Integer isactive) {
		Date now = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String currentDate = format.format(now);
		String query = "update assentisk_company set NoOfEmployees='" + no
				+ "',CompanyName='" + cname + "',IsActive='" + isactive
				+ "',ModifiedDate='" + currentDate
				+ "',ModifiedBy='1' where CompanyID='" + cid + "'";

		jdbcTemplate.execute(query);

	}
	
	public void deletecompany(String cid) {

		String query = "delete from assentisk_company where CompanyID='" + cid
				+ "'";
		jdbcTemplate.execute(query);

	}


      @SuppressWarnings("unchecked")
  	public List<DepartmentBean> getDepartmentList() {
  	  	String query = "select asd.DepartmentID,asd.CompanyID,asd.DeptName,asd.DeptDesc,IF(LENGTH(asd.DeptDesc)>50,'true','false')  as DeptDesclen,LEFT(asd.DeptDesc, 100) as DeptDesc1,asd.CreatedDate,asd.CreatedBy,asd.ModifiedDate,asd.ModifiedBy,asd.IsActive from assentisk_company_department asd order by asd.DepartmentID";
    	List<DepartmentBean> dptList = jdbcTemplate.queryForList(query);
    	for(int i=0;i<dptList.size();i++){
			Map mp=(Map)dptList.get(i);
			String DeptDesc1=mp.get("DeptDesc1").toString();
			DeptDesc1 = DeptDesc1.replaceAll("\\<.*?\\>", "");
			DeptDesc1 = DeptDesc1.replaceAll("\\&#39;", "'");
			
			((Map) dptList.get(i)).put("DeptDesc1data",DeptDesc1);
			
			String DeptDesc=mp.get("DeptDesc").toString();
			DeptDesc = DeptDesc1.replaceAll("\\<.*?\\>", "");
			DeptDesc = DeptDesc1.replaceAll("\\&#39;", "'");
			
			((Map) dptList.get(i)).put("DeptDescdata",DeptDesc);
    	}
  		return dptList;
  	}

	public void savedepartment(Integer companyID, 
			String departmentName, String departmentDesc, String createdDate,
			Integer createdBy, String modifiedDate, Integer modifiedBy,
			Integer isActive) {
		
		String query = "insert into assentisk_company_department(CompanyID,DeptName,DeptDesc,CreatedDate,CreatedBy,ModifiedDate,ModifiedBy,IsActive)values('"+companyID+"','"+departmentName+"','"+departmentDesc+"','"+createdDate+"','"+createdBy+"','"+modifiedDate+"','"+modifiedBy+"','"+isActive+"')";
		jdbcTemplate.execute(query);
		
	}

	@SuppressWarnings("unchecked")
	public List<DepartmentBean> getDepartmentById(Integer departmentID) {
		
		String query = "select *from assentisk_company_department where DepartmentID = '"+departmentID+"'";
		List<DepartmentBean> departmentList = jdbcTemplate.queryForList(query);
		return departmentList;
	}

	public void updatedDepartment(Integer departmentID,Integer companyID, 
			String departmentName, String departmentDesc, String modifiedDate,
			Integer modifiedBy, Integer isActive) {
		
		String query = "update assentisk_company_department set CompanyID = '"+companyID+"',DeptName = '"+departmentName+"', DeptDesc = '"+departmentDesc+"', ModifiedDate = '"+modifiedDate+"', ModifiedBy = '"+modifiedBy+"', IsActive = '"+isActive+"' where DepartmentID = '"+departmentID+"'";
		jdbcTemplate.execute(query);
	}

	@SuppressWarnings("unchecked")
	public List<LegalEntitiesBean> getLegalEntitiesList() {
		
		String query = "select al.LegalEntityID, al.LegalEntityName, al.LegalEntityDescription,IF(LENGTH(al.LegalEntityDescription)>50,'true','false') as legalDesclen,LEFT(al.LegalEntityDescription, 100) as legaldesc1, al.CompanyID,al.CompanyPeriodID, al.CreatedDate,al.CreatedBy, al.MoidifiedDate, al.ModifiedBy, al.IsActive from assentisk_divisions al order by al.LegalEntityID";
		List<LegalEntitiesBean> legalEntitiesList = jdbcTemplate.queryForList(query);
		if(legalEntitiesList.size()>0){
			for(int i=0;i<legalEntitiesList.size();i++){
				Map mp=(Map)legalEntitiesList.get(i);
				String legaladdress=mp.get("LegalEntityDescription").toString();
				legaladdress = legaladdress.replaceAll("\\<.*?\\>", "");
				legaladdress = legaladdress.replaceAll("\\&#39;", "'");
				
				((Map) legalEntitiesList.get(i)).put("LegalEntityDescriptiondata",legaladdress);
				
				
				String legaldesc1=mp.get("legaldesc1").toString();
				legaldesc1 = legaldesc1.replaceAll("\\<.*?\\>", "");
				legaldesc1 = legaldesc1.replaceAll("\\&#39;", "'");
				
				((Map) legalEntitiesList.get(i)).put("legaldesc1data",legaldesc1);
				
				
			}
		}
		return legalEntitiesList;
	}

	public void saveLegalEntity(String legalEntityName,
			String legalEntityDescription,
			Integer departmentID, Integer branchID, Integer companyPeriodID,
			String createdDate, Integer createdBy, String modifiedDate,
			Integer modifiedBy, Integer isActive, Integer employeeid) {
		
		String query = "insert into assentisk_divisions(LegalEntityName, LegalEntityDescription,DepartmentID,BranchID,CompanyPeriodID,CreatedDate,CreatedBy,MoidifiedDate,ModifiedBy,IsActive, EmployeeID)values('"+legalEntityName+"','"+legalEntityDescription+"','"+departmentID+"','"+branchID+"','"+companyPeriodID+"','"+createdDate+"','"+createdBy+"','"+modifiedDate+"','"+modifiedBy+"','"+isActive+"','"+employeeid+"')";
		jdbcTemplate.execute(query);
		
	}

	@SuppressWarnings("unchecked")
	public List<LegalEntitiesBean> getLegalEntityById(Integer legalEntityID) {
		
		String query = "select ad.LegalEntityID,ad.LegalEntityName,ad.LegalEntityDescription,ad.CompanyID,ad.DepartmentID,ad.BranchID,ad.CompanyPeriodID,ad.EmployeeID, ae.EmpName from assentisk_divisions ad left outer join assentisk_employees ae on ae.EmployeeID= ad.EmployeeID where ad.LegalEntityID = '"+legalEntityID+"'";
		List<LegalEntitiesBean> legalEntityList = jdbcTemplate.queryForList(query);
		return legalEntityList;
	}

	public void updatedLegalEntity(Integer legalEntityID,
			String legalEntityName, String legalEntityDescription,
			Integer departmentID, Integer branchID,
			Integer companyPeriodID, String modifiedDate, Integer modifiedBy,
			Integer isActive, Integer employeeID) {
		
		String query = "update assentisk_divisions set LegalEntityName = '"+legalEntityName+"',LegalEntityDescription='"+legalEntityDescription+"',DepartmentID='"+departmentID+"', BranchID = '"+branchID+"',  MoidifiedDate = '"+modifiedDate+"', ModifiedBy = '"+modifiedBy+"', IsActive = '"+isActive+"', EmployeeID='"+employeeID+"' where LegalEntityID = '"+legalEntityID+"'";
		jdbcTemplate.execute(query);
		
	}

	public void deleteLegalEntity(Integer legalEntityID) {
		
		String query = "delete from assentisk_divisions where LegalEntityID = '"+legalEntityID+"'";
		jdbcTemplate.execute(query);
	}

	public void deleteDepartment(Integer departmentID) {

		String query = "delete from assentisk_company_department where DepartmentID = '"+departmentID+"'";
		jdbcTemplate.execute(query);
	}

	

	@SuppressWarnings("unchecked")
	public List<CompanyBean> getCmpList() {
		List<CompanyBean> list = jdbcTemplate
				.queryForList("select * from assentisk_company where IsActive='1' order by CompanyID");
		return list;
	}
	
	@SuppressWarnings("unchecked")
	public List<CompanyBean> getDepList() {
		List<CompanyBean> list = jdbcTemplate
				.queryForList("select * from assentisk_company_department order by DepartmentID");
		return list;
	}
	
	@SuppressWarnings("unchecked")
	public List<CompanyBean> getBranchList() {
		List<CompanyBean> list = jdbcTemplate
				.queryForList("select * from assentisk_company_locations order by LocationID");
		return list;
	}

	@SuppressWarnings("unchecked")
	public List<LocationsBean> getLocationsList() {
		
		//String query = "select acl.LocationID, acl.CompanyID, acl.Name, acl.Street, acl.Address, acl.CityID, acl.CountryID, acl.StateID,acl.Contactno,acl.ZipCode, acl.Phone1, acl.Phone2, acl.Email1, acl.Email2, acl.Fax1, acl.Fax2, acl.Url,acl.IsActive,ac.CompanyName, acn.CountryName, ass.StateName from assentisk_company_locations acl join assentisk_company ac on acl.CompanyID = ac.CompanyID join assentisk_country acn on acn.CountryID = acl.CountryID join assentisk_state ass on ass.StateID = acl.StateID";
		String query = "select acl.LocationID, acl.CompanyID, acl.Name, acl.Street, acl.Address, acl.CityID, acl.CountryID, acl.StateID,acl.Contactno,acl.ZipCode, acl.Phone1, acl.Phone2, acl.Email1, acl.Email2, acl.Fax1, acl.Fax2, acl.Url,acl.IsActive,acn.CountryName, ass.StateName from assentisk_company_locations acl join assentisk_country acn on acn.CountryID = acl.CountryID join assentisk_state ass on ass.StateID = acl.StateID";
		List<LocationsBean> locationsList = jdbcTemplate.queryForList(query);
		return locationsList;
	}

	public void saveLocation(String locationname,Integer countryid,
			Integer stateid, String cityid, String street, String address,
			String contactno, String zipcode, String phone1, String phone2,
			String email1, String email2, String fax1, String fax2, String url,
			String createdate, Integer createby, String modifieddate, Integer modifyby,
			Integer isactive) {
	
		String query = "insert into assentisk_company_locations(CountryID, StateID, CityID, Name, Street, Address, Contactno, ZipCode, Phone1, Phone2, Email1, Email2, Fax1, Fax2, Url, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy, IsActive) values('"+countryid+"','"+stateid+"','"+cityid+"','"+locationname+"','"+street+"','"+address+"','"+contactno+"','"+zipcode+"','"+phone1+"','"+phone2+"','"+email1+"','"+email2+"','"+fax1+"','"+fax2+"','"+url+"','"+createdate+"','"+createby+"','"+modifieddate+"','"+modifyby+"','"+isactive+"')";
		jdbcTemplate.execute(query);
		
	}

	@SuppressWarnings("unchecked")
	public List<LocationsBean> getLocationById(Integer locationid) {
		
		String query = "select *from assentisk_company_locations where LocationID = '"+locationid+"'";
		List<LocationsBean> getRow = jdbcTemplate.queryForList(query); 
		return getRow;
	}
	
	@SuppressWarnings("unchecked")
	public List<StateBean> getStateByCountryID(Integer countryid) {

		String query = "select ifnull(StateID,'')as StateID ,ifnull(StateName,'') as StateName from assentisk_state where CountryID = '"+ countryid + "'";
		List<StateBean> stateList = jdbcTemplate.queryForList(query);
		return stateList;
	}

	@SuppressWarnings("unchecked")
	public List<CityBean> getCityByStateCountryID(Integer stateid,
			Integer countryid) {

		String query = "select *from assentisk_city where StateID = '"
				+ stateid + "' and CountryID = '" + countryid + "'";		
		List<CityBean> cityList = jdbcTemplate.queryForList(query);
		return cityList;
	}

	public void updateLocation(Integer locationid, String locationname,
			Integer countryid, Integer stateid,
			String cityid, String street, String address, String contactno,
			String zipcode, String phone1, String phone2, String email1,
			String email2, String fax1, String fax2, String url,
			String modifieddate, Integer modifyby, Integer isactive) {
		
		String query = "update assentisk_company_locations set Name='"+locationname+"', Street='"+street+"', Address='"+address+"', CityID='"+cityid+"', CountryID='"+countryid+"', StateID='"+stateid+"', Contactno='"+contactno+"', ZipCode='"+zipcode+"', Phone1='"+phone1+"', Phone2='"+phone2+"', Email1='"+email1+"', Email2='"+email2+"', Fax1='"+fax1+"', Fax2='"+fax2+"', Url='"+url+"', ModifiedDate='"+modifieddate+"', ModifiedBy='"+modifyby+"', IsActive='"+isactive+"' where LocationID='"+locationid+"'";
		jdbcTemplate.execute(query);
		
	}

	public void deleteLocationById(Integer locationid) {
	
		String query = "delete from assentisk_company_locations where LocationID = '"+locationid+"'";
		jdbcTemplate.execute(query);
		
	}

	@SuppressWarnings("unchecked")
	public List<ApplicationsBean> getApplicationsList() {
		StringBuilder sb = new StringBuilder();
		String query = "select aa.ApplicationID, aa.ApplicationName,aa.LocationID,aa.DivisionID,aa.EmployeeID,aa.DepartmentID,aa.RequestDate,aa.CreatedDate,aa.CreatedBy, aa.ModifiedDate,aa.ModifiedBy, aa.IsActive, acl.Name , ad.LegalEntityName,ae.EmpName from assentisk_applications aa left outer join assentisk_company_locations acl on acl.LocationID = aa.LocationID left outer join assentisk_divisions ad on ad.LegalEntityID = aa.DivisionID left outer join assentisk_userrecord ae on ae.UserRecordID = aa.EmployeeID";
		List<ApplicationsBean> applicationsList = jdbcTemplate.queryForList(query);
		if(applicationsList.size()>0){
			for(int i=0;i<applicationsList.size();i++){
				Map mp=(Map)applicationsList.get(i);
				List<LocationsBean> list = jdbcTemplate.queryForList("select ifnull(GROUP_CONCAT(`Name`),'') as Locations from assentisk_company_locations where LocationID IN ("+mp.get("LocationID").toString()+")");
				Map getLoc=(Map)list.get(0);
				String Locations=getLoc.get("Locations").toString();
				((Map) applicationsList.get(i)).put("LocationsData",Locations);
				
				List<LegalEntitiesBean> listDivisions = jdbcTemplate.queryForList("select ifnull(GROUP_CONCAT(`LegalEntityName`),'')as Divisions from assentisk_divisions where LegalEntityID IN ("+mp.get("DivisionID").toString()+")");
				Map getDiv=(Map)listDivisions.get(0);
				String Divisions=getDiv.get("Divisions").toString();
				((Map) applicationsList.get(i)).put("DivisionsData",Divisions);
				
				List<LegalEntitiesBean> listDeptName = jdbcTemplate.queryForList("select  ifnull(GROUP_CONCAT(`DeptName`),'')as DeptName from assentisk_company_department where DepartmentID IN ("+mp.get("DepartmentID").toString()+")");
				Map getDept=(Map)listDeptName.get(0);
				String DeptName=getDept.get("DeptName").toString();
				((Map) applicationsList.get(i)).put("DeptName",DeptName);
			}
			
			
		}
		return applicationsList;
	}
	
	
	@SuppressWarnings("unchecked")
	public List getSelectBranchList(String id) {
		List<CompanyBean> list = jdbcTemplate
				.queryForList("select * from assentisk_company_locations where CompanyID='"+id+"' and IsActive='1' order by LocationID");
		return list;
	}
	
	
	@SuppressWarnings("unchecked")
	public List getSelectDeptList(String branchid,String companyid) {
		List<CompanyBean> list = jdbcTemplate
				.queryForList("select * from assentisk_company_department where CompanyID='"+companyid+"'  and BranchID ='"+branchid+"'  and IsActive='1' order by DepartmentID");
		return list;
	}

	public void saveApplication(String applicationname, String locationid,
			String divisionid, Integer employeeid, String requestdate,
			String createdate, Integer createdby, String modifieddate,
			Integer modifyby, Integer isactive,String deptdata) {
		
		String query = "insert into assentisk_applications(ApplicationName, LocationID, DivisionID, EmployeeID, RequestDate, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy, IsActive,DepartmentID) values('"+applicationname+"','"+locationid+"','"+divisionid+"','"+employeeid+"','"+requestdate+"','"+createdate+"','"+createdby+"','"+modifieddate+"','"+modifyby+"','"+isactive+"','"+deptdata+"')";
		jdbcTemplate.execute(query);
		
	}

	@SuppressWarnings("unchecked")
	public List<ApplicationsBean> getApplicationDetailById(Integer applicationid) {
		
		String query = "select aa.ApplicationID,aa.ApplicationName,aa.LocationID, aa.DivisionID,aa.DepartmentID,aa.EmployeeID,aa.RequestDate,aa.IsActive,ifnull(acl.Name,'') as Name,ifnull(ad.LegalEntityName,'') as LegalEntityName ,ifnull(ae.EmpName,'') as EmpName from assentisk_applications aa left outer join assentisk_company_locations acl on acl.LocationID= aa.LocationID left outer join assentisk_divisions ad on ad.LegalEntityID = aa.DivisionID left outer join assentisk_employees ae on ae.EmployeeID = aa.EmployeeID where aa.ApplicationID = '"+applicationid+"'";
		List <ApplicationsBean> applicationList = jdbcTemplate.queryForList(query);
		return applicationList;
	}

	public void updateApplication(Integer applicationid,
			String applicationname, String locationid, String divisionid,
			Integer employeeid, String modifieddate, Integer modifyby,
			Integer isactive,String deptdata) {
		
		String query = "update assentisk_applications set ApplicationName='"+applicationname+"', LocationID='"+locationid+"', DivisionID='"+divisionid+"', EmployeeID='"+employeeid+"', ModifiedDate='"+modifieddate+"', ModifiedBy='"+modifyby+"', IsActive='"+isactive+"',DepartmentID='"+deptdata+"' where ApplicationID='"+applicationid+"'";
		jdbcTemplate.execute(query);
		
	}

	public void deleteApplicationById(Integer applicationid) {
		
		String query = "delete from assentisk_applications where ApplicationID = '"+applicationid+"' ";
		jdbcTemplate.execute(query);
		
	}

	@SuppressWarnings("unchecked")
	public List<BusinessProcessesBean> getBusinessProcessesList() {
		
		System.out.println("inside the list method>>>");

		String query = "select aa.BusinessProcessID, aa.LocationID,aa.DivisionID,aa.BusinessProcessName,aa.LocationID,aa.DivisionID,aa.EmployeeID,aa.DepartmentID,aa.RequestDate,aa.CreatedDate,aa.CreatedBy, aa.ModifiedDate,aa.ModifiedBy, aa.IsActive, acl.Name , ad.LegalEntityName,ae.EmpName from assentisk_businessprocess aa left outer join assentisk_company_locations acl on acl.LocationID = aa.LocationID left outer join assentisk_divisions ad on ad.LegalEntityID = aa.DivisionID left outer join assentisk_userrecord ae on ae.UserRecordID = aa.EmployeeID";
		
		System.out.println("check the query>>"+query);
		
		List<BusinessProcessesBean> getBusinessProcessesList = jdbcTemplate.queryForList(query); 
		
		if(getBusinessProcessesList.size()>0){
			
			for(int i=0;i<getBusinessProcessesList.size();i++){
				Map mp=(Map)getBusinessProcessesList.get(i);
				List<LocationsBean> list = jdbcTemplate.queryForList("select ifnull(GROUP_CONCAT(`Name`),'')as Locations from assentisk_company_locations where LocationID IN ("+mp.get("LocationID").toString()+")");
				Map getLoc=(Map)list.get(0);
				String Locations=getLoc.get("Locations").toString();
				((Map) getBusinessProcessesList.get(i)).put("LocationsData",Locations);
				
				List<LegalEntitiesBean> listDivisions = jdbcTemplate.queryForList("select ifnull(GROUP_CONCAT(`LegalEntityName`),'')as Divisions from assentisk_divisions where LegalEntityID IN ("+mp.get("DivisionID").toString()+")");
				Map getDiv=(Map)listDivisions.get(0);
				String Divisions=getDiv.get("Divisions").toString();
				((Map) getBusinessProcessesList.get(i)).put("DivisionsData",Divisions);
				
				List<LegalEntitiesBean> listDeptName = jdbcTemplate.queryForList("select  ifnull(GROUP_CONCAT(`DeptName`),'')as DeptName from assentisk_company_department where DepartmentID IN ("+mp.get("DepartmentID").toString()+")");
				Map getDept=(Map)listDeptName.get(0);
				String DeptName=getDept.get("DeptName").toString();
				((Map) getBusinessProcessesList.get(i)).put("DeptName",DeptName);
			}
			
			
		}
		
		return getBusinessProcessesList;
	}

	public void saveBusinessProcess(String businessprocessname,
			String locationid, String divisionid, Integer employeeid,
			String requestdate, String createdate, Integer createdby,
			String modifieddate, Integer modifyby, Integer isactive,String deptdata) {
		
		String query = "insert into assentisk_businessprocess(BusinessProcessName, LocationID, DivisionID, EmployeeID, RequestDate, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy, IsActive,DepartmentID) values('"+businessprocessname+"','"+locationid+"','"+divisionid+"','"+employeeid+"','"+requestdate+"','"+createdate+"','"+createdby+"','"+modifieddate+"','"+modifyby+"','"+isactive+"','"+deptdata+"')";
		jdbcTemplate.execute(query);
		
	}

	@SuppressWarnings("unchecked")
	public List<BusinessProcessesBean> getBusinessProcessDetailById(Integer businessprocessid) {
		
		String query = "select  ab.BusinessProcessID, ab.BusinessProcessName, ab.RequestDate, ab.LocationID, ab.DivisionID,ab.DepartmentID, ab.EmployeeID,ab.IsActive,ifnull(ae.EmpName,'0') as EmpName from assentisk_businessprocess  ab left outer join assentisk_employees ae on ae.EmployeeID = ab.EmployeeID where ab.BusinessProcessID = '"+businessprocessid+"'";
		
		List <BusinessProcessesBean> businessprocessList = jdbcTemplate.queryForList(query);
		return businessprocessList;
	}

	public void updateBusinessProcess(Integer businessprocessid,
			String businessprocessname, String locationid, String divisionid,
			Integer employeeid, String modifieddate, Integer modifyby,
			Integer isactive,String deptdata) {
	
		String query = "update assentisk_businessprocess set BusinessProcessName='"+businessprocessname+"', LocationID='"+locationid+"', DivisionID='"+divisionid+"', EmployeeID='"+employeeid+"', ModifiedDate='"+modifieddate+"', ModifiedBy='"+modifyby+"', IsActive='"+isactive+"',DepartmentID='"+deptdata+"' where BusinessProcessID='"+businessprocessid+"'";
		jdbcTemplate.execute(query);
		
	}

	public void deleteBusinessProcessById(Integer businessprocessid) {
		
		String query = "delete from assentisk_businessprocess where BusinessProcessID = '"+businessprocessid+"' ";
		jdbcTemplate.execute(query);
		
	}

	@SuppressWarnings("unchecked")
	public int getEmployeeIdByName(String empname) {
		
		int employeeid = 0;
		String query = "select EmployeeID from assentisk_employees where EmpName = '"+empname+"'";
		List<EmployeeBean> getRow = jdbcTemplate.queryForList(query);
		if(getRow.size()>0)
		{
			Map m = (Map)getRow.get(0);
			employeeid = Integer.parseInt(m.get("EmployeeID").toString());
		}
		return employeeid;
	}

	@SuppressWarnings("unchecked")
	public String getDivisionIdByName(String divisionName) {
		String divisionid = "";
		String query = "select ifnull(group_Concat(LegalEntityID,''),'0')as LegalEntityID  from assentisk_divisions where LegalEntityName IN ('"+divisionName+"')";
		List<LegalEntitiesBean> getRow = jdbcTemplate.queryForList(query);
		if(getRow.size()>0)
		{
			Map m = (Map)getRow.get(0);
			divisionid = m.get("LegalEntityID").toString();
		}
		return divisionid;
	}

	@SuppressWarnings("unchecked")
	public String getLocationIdByName(String locationName) {
		String locationid = "";
		
		String query="select ifnull(group_Concat(LocationID,''),'0') as LocationID from assentisk_company_locations where Name IN ('"+locationName+"')";
		List<LocationsBean> getRow = jdbcTemplate.queryForList(query);
		if(getRow.size()>0)
		{
			Map m = (Map)getRow.get(0);
			locationid = m.get("LocationID").toString();
		}
		return locationid;
	}
	
	public void userAuditTrail(String tableName, String rowID, String action,
			String changeDate, Integer changeBy, String ipAddress) {
	
		String query = "insert into assentisk_audittrail (TableName, RowID, Action, ChangedDate, ChangedBy, IPAddress) values ('"+tableName+"','"+rowID+"','"+action+"','"+changeDate+"','"+changeBy+"','"+ipAddress+"')";
		jdbcTemplate.execute(query);
		
	}
	
	@SuppressWarnings("unchecked")
	public List<EmployeeBean> getEmployeeList() {
		List<EmployeeBean> emplist = jdbcTemplate
				.queryForList("select ae.divisions,ae.EmployeeID ,ae.LocationID,ae.UserRecordID,ae.EmpName,ae.Email,ae.ReportingTo,(select EmpName from assentisk_userrecord where "+
								"UserRecordID =ae.ReportingTo) as Reporting,(select `Name` from assentisk_company_locations where  "+
										"LocationID =ae.LocationID) as locations,(select EmpUsername from  assentisk_userrecord where UserRecordID=ae.UserRecordID )as username "+
											",(select EmpPassword from  assentisk_userrecord where UserRecordID=ae.UserRecordID )as pword,ae.ReportingTo,ae.IsActive "+
												"from assentisk_employees as ae where  ae.IsDeleted='1' order by ae.EmployeeID");
		
		
		if(emplist.size()>0){
			for(int i=0;i<emplist.size();i++){
				Map mp=(Map)emplist.get(i);
				List<LocationsBean> list = jdbcTemplate.queryForList("select ifnull(GROUP_CONCAT(`Name`),'')as Locations from assentisk_company_locations where LocationID IN ("+mp.get("LocationID").toString()+")");
				Map getLoc=(Map)list.get(0);
				String Locations=getLoc.get("Locations").toString();
				((Map) emplist.get(i)).put("LocationsData",Locations);
				
				List<LegalEntitiesBean> listDivisions = jdbcTemplate.queryForList("select ifnull(GROUP_CONCAT(`LegalEntityName`),'')as Divisions from assentisk_divisions where LegalEntityID IN ("+mp.get("divisions").toString()+")");
				Map getDiv=(Map)listDivisions.get(0);
				String Divisions=getDiv.get("Divisions").toString();
				((Map) emplist.get(i)).put("DivisionsData",Divisions);
			}
			
			
		}
		
		
		return emplist;
	}

	public void saveEmployee(Integer userRecordID,String departmentID, String locationID, String empName, String email, String ReportingTo, String roleID,String requestDate, String createdDate,Integer createdBy, String modifiedDate,Integer modifiedBy, Integer isActive,String address,String city,String state,String country,String zip,String photo, String phone1, String phone2, String divisions, String email2) {
		String Licensevalue="0"; 
		if(!ReportingTo.equals("0")){
			Licensevalue="1";
		}
		String query = "insert into assentisk_employees (UserRecordID,DepartmentID, LocationID, EmpName, Email, ReportingTo, RoleID, RequestDate, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy, IsActive, address, city, state, country, zip, photo, phone1, phone2, divisions, email2,isLicense)" +
				"values('"+userRecordID+"','"+departmentID+"','"+locationID+"','"+empName+"','"+email+"','"+ReportingTo+"','"+roleID+"','"+requestDate+"','"+createdDate+"','"+createdBy+"','"+modifiedDate+"','"+modifiedBy+"','"+isActive+"','"+address+"','"+city+"','"+state+"','"+country+"','"+zip+"','"+photo+"','"+phone1+"','"+phone2+"','"+divisions+"','"+email2+"','"+Licensevalue+"')";
		jdbcTemplate.execute(query);
		
	}

	public void saveUserRecord(String employeeName, String username,
			String password, String emailID, String createdDate,
			String modificationDate) {
		
		String query = "insert into assentisk_userrecord (EmpName, EmpUsername, EmpPassword, Email_ID, CreatedDate, ModifiedDate)" +
				"values ('"+employeeName+"','"+username+"','"+password+"','"+emailID+"','"+createdDate+"','"+modificationDate+"')";
		
		jdbcTemplate.execute(query);
		
	}
	@SuppressWarnings("unchecked")
	public List<CompanyBean> getCompanyDetails() {
		List<CompanyBean> list = jdbcTemplate.queryForList("select ac.CompanyID, ac.NoOfEmployees, ac.CompanyName, ac.CreatedDate, ac.CreatedBy, ac.ModifiedDate,"+
								" ac.ModifiedBy,ac.IsActive,ac.CompanyLogo, ac.HeadOffice_Address,ac.HeadOffice_Country, ac.HeadOffice_City,ac.HeadOffice_State, "+
									" ac.HeadOffice_Zip,ac.PrimaryEmail, ac.SecondaryEmail, ac.Mobile, ac.Phone,ac.Fax, ac.currency, ac.Primary_Contact_Name, "+
									" ac. Primary_Contact_Number,ac.Legal_Contact_Name,ac.Legal_Contact_Number, ac.Legal_Contact_Email,ac.Accounts_Contact_Name, "+
											" ac.Accounts_Contact_Number,acoun.CountryName,ast.StateName,ac.Accounts_Contact_Email,c.shortForm from assentisk_company ac  "+
											" join assentisk_country acoun on acoun.CountryID = ac.HeadOffice_Country join assentisk_state ast on ast.StateID = "+
											" ac.HeadOffice_State left outer join assentisk_currencies c on c.Currency=ac.currency order by ac.CompanyID");
		System.out.println("select ac.CompanyID, ac.NoOfEmployees, ac.CompanyName, ac.CreatedDate, ac.CreatedBy, ac.ModifiedDate,"+
								" ac.ModifiedBy,ac.IsActive,ac.CompanyLogo, ac.HeadOffice_Address,ac.HeadOffice_Country, ac.HeadOffice_City,ac.HeadOffice_State, "+
									" ac.HeadOffice_Zip,ac.PrimaryEmail, ac.SecondaryEmail, ac.Mobile, ac.Phone,ac.Fax, ac.currency, ac.Primary_Contact_Name, "+
									" ac. Primary_Contact_Number,ac.Legal_Contact_Name,ac.Legal_Contact_Number, ac.Legal_Contact_Email,ac.Accounts_Contact_Name, "+
											" ac.Accounts_Contact_Number,acoun.CountryName,ast.StateName,ac.Accounts_Contact_Email,c.shortForm from assentisk_company ac  "+
											" join assentisk_country acoun on acoun.CountryID = ac.HeadOffice_Country join assentisk_state ast on ast.StateID = "+
											" ac.HeadOffice_State left outer join assentisk_currencies c on c.Currency=ac.currency order by ac.CompanyID");
		
		
		
        return list;
	}

	
	public List getCurrency() {
		List list = jdbcTemplate
		.queryForList("select * from assentisk_currencies");
        return list;
	}

	public void updatedCompany(int companyID, String companyname,
			String headOffice, String country, String city, String state,
			String zip, String primaryContactName, String primaryContactNumber,
			String primaryEmail, String legalContactName,
			String legalContactNumber, String legalContactEmail,
			String accountsContactName, String accountsContactNumber,
			String accountsContactEmail, int status, String currentTime,
			String currency) {
		headOffice = "\"" + headOffice + "\"";
		String query = "update assentisk_company set CompanyName = '"+companyname+"', " +
        "ModifiedDate = '"+currentTime+"', IsActive = '"+status+"', HeadOffice_Address = "+headOffice+", HeadOffice_Country = '"+country+"'," +
		" HeadOffice_City = '"+city+"', HeadOffice_State = '"+state+"', HeadOffice_Zip = '"+zip+"', Primary_Contact_Name = '"+primaryContactName+"', Primary_Contact_Number = '"+primaryContactNumber+"', PrimaryEmail = '"+primaryEmail+"', currency = '"+currency+"', Legal_Contact_Name = '"+legalContactName+"'," +
	    " Legal_Contact_Number = '"+legalContactNumber+"', Legal_Contact_Email = '"+legalContactEmail+"', Accounts_Contact_Name = '"+accountsContactName+"', Accounts_Contact_Number = '"+accountsContactNumber+"', Accounts_Contact_Number = '"+accountsContactNumber+"', Accounts_Contact_Email = '"+accountsContactEmail+"' where CompanyID = '"+companyID+"'";		
        jdbcTemplate.execute(query);
		
	}

	@SuppressWarnings("unchecked")
	public int getUserRecordID()
	{
		int userrecordid = 0;
		String query = "select UserRecordID from assentisk_userrecord  order by UserRecordID desc  limit 1";
		List<UserRecordBean> getRow = jdbcTemplate.queryForList(query);
		if(getRow.size()>0)
		{
			Map m = (Map)getRow.get(0);
			userrecordid = Integer.parseInt(m.get("UserRecordID").toString());
		}
		return userrecordid;
	}

	@SuppressWarnings("unchecked")
	public List<EmployeeBean> getEmployeeRecordById(Integer employeeid) {
		
		String query = "select ae.EmployeeID,ae.UserRecordID,ae.CompanyID,ae.DepartmentID,ae.LocationID,ae.EmpName,ae.Email,ae.ReportingTo,ae.RoleID,"+
						" ae.RequestDate,ae.CreatedDate,ae.CreatedBy,ae.ModifiedDate,ae.ModifiedBy,ae.IsActive,ae.address,ae.city,ae.state, "+
							" ae.country,ae.zip,ae.phone1,ae.photo,ae.phone2,ae.divisions,ae.email2,ae.isLicense,ae.IsDeleted, "+
								" ifnull(au.EmpUsername,'') as EmpUsername,ifnull(au.EmpPassword,'') as EmpPassword, "+
									" ifnull(au.Sessionid,'') as Sessionid,ifnull(au.Email_ID,'') as Email_ID,"+
									" ifnull(au.CreatedDate,'') as CreatedDate,ifnull(au.ModifiedDate,'') as ModifiedDate,ifnull(au.currency,'')as currency, "+
										"ifnull(au.expandBar,'')as expandBar,ifnull(au.riskID,'') as riskID from assentisk_employees ae "+
											" left outer join assentisk_userrecord au on au.UserRecordID = ae.UserRecordID where ae.EmployeeID='"+employeeid+"'";
		System.out.println("db: " + query);
		List<EmployeeBean> employeeRecord = jdbcTemplate.queryForList(query);
		return employeeRecord;
	}

	public void udpateUserRecord(Integer userID, String employeeName,
			String username, String password, String emailID,
			String modificationDate) {
	String query="select * from assentisk_userrecord where UserRecordID='"+userID+"'";
	List getRecord= jdbcTemplate.queryForList(query);
	if(getRecord.size()>0){
		if(username.equals("")){
			query="delete from assentisk_userrecord where UserRecordID='"+userID+"'";
			jdbcTemplate.execute(query);

		}
		else
		{
			 query = "update assentisk_userrecord set EmpName='"+employeeName+"', EmpUsername='"+username+"', EmpPassword='"+password+"', Email_ID='"+emailID+"',  ModifiedDate='"+modificationDate+"' where UserRecordID='"+userID+"'";		
			 jdbcTemplate.execute(query);
		}
	}
	else
	{
		if(username.equals("")){
			
		}
		else
			{
			query = "insert into assentisk_userrecord (EmpName,EmpUsername,EmpPassword,Email_ID,CreatedDate, ModifiedDate) values('"+employeeName+"','"+username+"','"+password+"','"+emailID+"', '"+modificationDate+"','"+modificationDate+"')";		
			jdbcTemplate.execute(query);
			}
		
	}

	}

	public void updateEmployee(Integer employeeid, Integer userRecordID,
			String departmentID, String locationID,
			String empName, String email, String ReportingTo, String roleID,			
			String modifiedDate, Integer modifiedBy, Integer isActive,
			String address, String city, String state, String country,
			String zip, String photo, String phone1, String phone2,
			String divisions, String email2, String licenseuser) {
		
		int userIDmod,userIDnew;
	
		if(licenseuser.equals("1"))
		{			
			licenseuser = "1";

			userIDnew= jdbcTemplate.queryForInt("select max(UserRecordID) from assentisk_userrecord");				
			
		}
		else
		{			
			licenseuser="0";			
		}
	

		
		String query = "update assentisk_employees set DepartmentID='"+departmentID+"', LocationID='"+locationID+"', EmpName='"+empName+"',  Email='"+email+"', ReportingTo='"+ReportingTo+"',  RoleID='"+roleID+"', ModifiedDate='"+modifiedDate+"', ModifiedBy='"+modifiedBy+"', IsActive='"+isActive+"' ,address='"+address+"', city='"+city+"',state='"+state+"', country='"+country+"', zip='"+zip+"', phone1='"+phone1+"', phone2='"+phone2+"', divisions='"+divisions+"', email2='"+email2+"',UserRecordID='"+userRecordID+"',isLicense='"+licenseuser+"' where EmployeeID='"+employeeid+"'";		
		jdbcTemplate.execute(query);
	}

	@SuppressWarnings("unchecked")
	public String getDivisionNameById(Integer divisionid) {
		
		String divisionName = "";
		String query = "select LegalEntityName from assentisk_divisions where LegalEntityID = '"+divisionid+"'";
		List<LegalEntitiesBean> getRow = jdbcTemplate.queryForList(query);
		if(getRow.size()>0)
		{
			Map m = (Map)getRow.get(0);
			divisionName = m.get("LegalEntityName").toString();
		}
		return divisionName;
		
	}

	@SuppressWarnings("unchecked")
	public String getLocationNameById(Integer locationid) {
		
		String locationName = "";
		String query = "select Name from assentisk_company_locations where LocationID = '"+locationid+"'";		
		List<LocationsBean> getRow = jdbcTemplate.queryForList(query);
		if(getRow.size()>0)
		{
			Map m = (Map)getRow.get(0);
			locationName = m.get("Name").toString();
		}
		
		return locationName;
	}

	
	public List getLicense() {
		List list = jdbcTemplate
		.queryForList("select LicenseID, LicenseDescription, CreatedDate, CreatedBy, Date_format(ModifiedDate, '%d-%m-%Y')as ModifiedDate, ModifiedBy,MaxUser,expiryDate,licenseTo from assentisk_license order by LicenseID desc  limit 1");
        return list;
	}
	
	public List<LocationsBean> getLocationById(String ID)
	{
		List list = jdbcTemplate
		.queryForList("select Name from assentisk_company_locations where LocationID IN ("+ID+") and IsActive='1'");
        return list;
	}
	
	public List<LegalEntitiesBean> getDivisionById(String ID)
	{
		List list = jdbcTemplate
		.queryForList("select LegalEntityName from assentisk_divisions where LegalEntityID IN ("+ID+") and IsActive='1'");
        return list;
	}
	
	@SuppressWarnings("unchecked")
	public List<EmployeeBean> getEmployeeListByLicense() {
	
		
		
		List<EmployeeBean> emplist = jdbcTemplate
		.queryForList("select ae.divisions,ae.EmployeeID ,ae.LocationID,ae.UserRecordID,ae.EmpName,ae.Email,ae.ReportingTo,(select EmpName from assentisk_employees where "+
						"UserRecordID =ae.ReportingTo) as Reporting,(select `Name` from assentisk_company_locations where  "+
								"LocationID =ae.LocationID) as locations,(select EmpUsername from  assentisk_userrecord where UserRecordID=ae.UserRecordID )as username "+
									",(select EmpPassword from  assentisk_userrecord where UserRecordID=ae.UserRecordID )as pword,ae.IsActive "+
										"from assentisk_employees as ae where isLicense = '1' and ae.IsDeleted='1' order by ae.EmployeeID");
	

		if(emplist.size()>0){
	for(int i=0;i<emplist.size();i++){
		Map mp=(Map)emplist.get(i);
		List<LocationsBean> list = jdbcTemplate.queryForList("select GROUP_CONCAT(`Name`)as Locations from assentisk_company_locations where LocationID IN ("+mp.get("LocationID").toString()+")");
		Map getLoc=(Map)list.get(0);
		String Locations=getLoc.get("Locations").toString();
		((Map) emplist.get(i)).put("LocationsData",Locations);
		
		List<LegalEntitiesBean> listDivisions = jdbcTemplate.queryForList("select GROUP_CONCAT(`LegalEntityName`)as Divisions from assentisk_divisions where LegalEntityID IN ("+mp.get("divisions").toString()+")");
		Map getDiv=(Map)listDivisions.get(0);
		String Divisions=getDiv.get("Divisions").toString();
		((Map) emplist.get(i)).put("DivisionsData",Divisions);
	}
	
	
}


return emplist;
	}
	
	public List getPassword(String id) {
		int idVal = Integer.parseInt(id);
		
		List list = jdbcTemplate
		.queryForList("select * from assentisk_userrecord where UserRecordID="+idVal+"");
        return list;
	}

	public void updatePassword(String id, String newPassword) {
		int idVal = Integer.parseInt(id);
		String query = "update assentisk_userrecord set EmpPassword='"+newPassword+"' where UserRecordID='"+idVal+"'";		
		jdbcTemplate.execute(query);
		
	}
	
public void deleteEmployee(int employeeID) {

	List list = jdbcTemplate
	.queryForList("select * from assentisk_employees where  EmployeeID = '"+employeeID+"'");
	
	
	if(list.size()>0){
		Map m=(Map)list.get(0);
		String userRecord=m.get("UserRecordID").toString();
		
		if(userRecord.equals("0")){
		}
		
		if(userRecord.equals("0") || userRecord.equals("")){	
		}
		else 
		{
			String query = "delete from  assentisk_userrecord  where UserRecordID = '"+m.get("UserRecordID").toString()+"' ";
			jdbcTemplate.execute(query);
		}
		
	}
	
	
	String query = "update assentisk_employees set IsDeleted='0',isLicense='0' where EmployeeID = '"+employeeID+"' ";
	jdbcTemplate.execute(query);
		
	}

@SuppressWarnings("unchecked")
public List<VendorBean> getVendorList(){
	String query = "select v.id,v.VendorName,ifnull(v.address,'') as address,v.city,(select CountryName from assentisk_country where CountryID=v.country)as country,"+
					" (select StateName from assentisk_state where StateID=v.state)as state, "+
						"v.IsActive "+
							" from assentisk_vendor as v order by v.id";
	List<VendorBean> listRecord = jdbcTemplate.queryForList(query);
	if(listRecord.size()>0){
		for(int i=0;i<listRecord.size();i++){
			Map mp=(Map)listRecord.get(i);
			String address=mp.get("address").toString();
			address = address.replaceAll("\\<.*?\\>", "");
			address = address.replaceAll("\\&#39;", "'");
			
			((Map) listRecord.get(i)).put("addressdata",address);
			
		}
	}
	
	return listRecord;
   
}
@SuppressWarnings("unchecked")
public List getCountryList() {
	List list = jdbcTemplate.queryForList("select *from assentisk_country where IsActive='1' order by CountryID");
	return list;
}

public void insertVendorRecord(String vendorname,String country,String stateid,String cityid,String phone1,String phone2,String email1,String email2,int status,String address){
	String query = "insert into assentisk_vendor (VendorName, country, state, city, phone1, phone2, email1, email2, IsActive,address)" +
	"values('"+vendorname+"','"+country+"','"+stateid+"','"+cityid+"','"+phone1+"','"+phone2+"','"+email1+"','"+email2+"','"+status+"','"+address+"')";
	jdbcTemplate.execute(query);
}



@SuppressWarnings("unchecked")
public List<VendorBean> getVendorById(String vendorId) {
	String query = "select *from assentisk_vendor where id='"+vendorId+"'";
	List<VendorBean> vendorRecord = jdbcTemplate.queryForList(query);
	return vendorRecord;
}

public void updateVendorRecord(String vendorname,String country,String stateid,String cityid,String phone1,String phone2,String email1,String email2,String vendorid,int status,String address){
	String query = "update assentisk_vendor set VendorName='"+vendorname+"'," +
			" country='"+country+"', state='"+stateid+"', city='"+cityid+"', phone1='"+phone1+"'," +
			" phone2='"+phone2+"', email1='"+email1+"', email2='"+email2+"'," +
			" IsActive='"+status+"',address='"+address+"' where id='"+vendorid+"'";
	jdbcTemplate.execute(query);
}
public void deleteVendor(String vendorID){
	String query = "delete from  assentisk_vendor  where id = '"+vendorID+"' ";
	jdbcTemplate.execute(query);
}

public void saveEnglishConfg(String key, String value) {
	 String type="varchar";
	 String query = "insert into spanish_config(CFG_KEY,CFG_TYPE,CFG_VALUE)values('"+key+"','"+type+"','"+value+"')";
	 jdbcTemplate.execute(query);
	 
	}


	public List getLaungageKey(String language) {
	
	 List list;
	 if(language.equals("Spanish")){
	   list = jdbcTemplate
	  .queryForList("select * from spanish_config");
	 }else{
	   list = jdbcTemplate
	  .queryForList("select * from english_config");
	 }
	 
	    return list;
	}
	


	@SuppressWarnings("unchecked")
	public List<LanguageKeysBean> getLanguageKeysList(String language) {
		
		String query;
		if(language.equals("Spanish")){
			 query = "select * from spanish_config";
		}else{
			 query = "select * from english_config";	
		}
		
		List<LanguageKeysBean> languageKeysBean = jdbcTemplate.queryForList(query);
		return languageKeysBean;
	}

	public void updateLanguageKey(String languagekey, String launguageValue,String language) {
		
		String query;
		
		if(language.equals("Spanish")){
			query = "update spanish_config set CFG_VALUE='"+launguageValue+"' where CFG_KEY = '"+languagekey+"' ";
		}else{
			query = "update english_config set CFG_VALUE='"+launguageValue+"' where CFG_KEY = '"+languagekey+"' ";
		}
		 
		jdbcTemplate.execute(query);
		
	}

	@SuppressWarnings("unchecked")
	public List<UserRecordBean> checkUserName(String username) {
		
		String query = "select *from assentisk_userrecord where EmpUsername='"+username+"'";
		System.out.println("query---"+query);
		List<UserRecordBean> getRow = jdbcTemplate.queryForList(query);
		return getRow;
	}
	
	@SuppressWarnings("unchecked")
	public List<LegalEntitiesBean> getDivisionsGroupList(){
		String query = "select concat(group_concat(LegalEntityName,''),',') as divisions from assentisk_divisions order by LegalEntityID";
		List<LegalEntitiesBean> getRow = jdbcTemplate.queryForList(query);
		return getRow;
	}
	
	@SuppressWarnings("unchecked")
	public List<LocationsBean> getLocationsGroupList(){
		String query = "select concat(group_concat(Name,''),',') as locations from assentisk_company_locations order by LocationID";
		List<LocationsBean> getRow = jdbcTemplate.queryForList(query);
		return getRow;
	}
	
	public String getDivisionGroupById(String ID)
	{
		String LegalEntityName="";
		List list = jdbcTemplate
		.queryForList("select  ifnull(group_concat(LegalEntityName,''),'') as LegalEntityName   from assentisk_divisions where LegalEntityID IN ("+ID+") ");
		if(list.size()>0){
			Map m=(Map)list.get(0);
			LegalEntityName=m.get("LegalEntityName").toString();
		}
		return LegalEntityName;
	}
	
	
	public String getLocationGroupById(String ID)
	{
		String locName="";
		List list = jdbcTemplate
		.queryForList("select  ifnull(group_concat(Name,''),'') as locName   from assentisk_company_locations where LocationID IN ("+ID+")");
		if(list.size()>0){
			Map m=(Map)list.get(0);
			locName=m.get("locName").toString();
		}
		return locName;
	}


	@SuppressWarnings("unchecked")
	public List<GroupBean> getGroupDataList(){
		String query = "select concat(group_concat(Gname,''),',') as Gname from assentisk_group order by GroupID";
		List<GroupBean> getRow = jdbcTemplate.queryForList(query);
		return getRow;
	}
	
	
	
	@SuppressWarnings("unchecked")
	public String getGroupIdByName(String groupName) {
		String GroupID = "";
		
		String query="select ifnull(GROUP_CONCAT(CAST(GroupID AS CHAR)),'0')as GroupID  from assentisk_group where Gname IN ('"+groupName+"')";
		System.out.println("query---"+query);
		List<GroupBean> getRow = jdbcTemplate.queryForList(query);
		if(getRow.size()>0)
		{
			Map m = (Map)getRow.get(0);
			System.out.println("groupID---"+m.get("GroupID").toString());

			GroupID = m.get("GroupID").toString();
			
		}
		//System.out.println(GroupID);
		return GroupID;
	}
	
	public String getGroupDataById(String ID)
	{
		String Gname="";
		List list = jdbcTemplate
		.queryForList("select  ifnull(group_concat(Gname,''),'') as Gname   from assentisk_group where GroupID IN ("+ID+")");
		if(list.size()>0){
			Map m=(Map)list.get(0);
			Gname=m.get("Gname").toString();
		}
		return Gname;
	}
	
	@SuppressWarnings("unchecked")
	public List<DepartmentBean> getDepartmentGroupList(){
		String query = "select ifnull(concat(group_concat(DeptName,''),','),'') as DeptName from assentisk_company_department order by DepartmentID";
		List<DepartmentBean> getRow = jdbcTemplate.queryForList(query);
		return getRow;
	}
	
	@SuppressWarnings("unchecked")
	public String getDepIdByName(String deptName) {
		String DepartmentID = "";
		String query = "select ifnull(group_Concat(DepartmentID,''),'0')as DepartmentID  from assentisk_company_department where DeptName IN ('"+deptName+"')";
		List<DepartmentBean> getRow = jdbcTemplate.queryForList(query);
		if(getRow.size()>0)
		{
			Map m = (Map)getRow.get(0);
			DepartmentID = m.get("DepartmentID").toString();
		}
		return DepartmentID;
	}
	
	public String getDeptDataById(String ID)
	{
		String DeptName="";
		List list = jdbcTemplate
		.queryForList("select  ifnull(group_concat(DeptName,''),'') as DeptName   from assentisk_company_department where DepartmentID IN ("+ID+")");
		if(list.size()>0){
			Map m=(Map)list.get(0);
			DeptName=m.get("DeptName").toString();
		}
		return DeptName;
	}

	@SuppressWarnings("unchecked")
	public List<LegalEntitiesBean> checkdivisionName(String divisionName) {
		
		String query = "select LegalEntityName from assentisk_divisions where LegalEntityName='"+divisionName+"'";
		List<LegalEntitiesBean> getRow = jdbcTemplate.queryForList(query);
		return getRow;
	}

	@SuppressWarnings("unchecked")
	public List<LocationsBean> checkLocationName(String locationName) {
		
		String query = "select Name from assentisk_company_locations where Name = '"+locationName+"'";
		List<LocationsBean> getRow = jdbcTemplate.queryForList(query);
		return getRow;
	}

	@SuppressWarnings("unchecked")
	public List<ApplicationsBean> checkApplicationName(String applicationName) {
		
		String query = "select ApplicationName from assentisk_applications where ApplicationName='"+applicationName+"'";
		List<ApplicationsBean> getRow = jdbcTemplate.queryForList(query);
		return getRow;
	}

	@SuppressWarnings("unchecked")
	public List<BusinessProcessesBean> checkBusinessProcessName(
			String BusinessProcessName) {
		
		String query = "select BusinessProcessName from assentisk_businessprocess where BusinessProcessName='"+BusinessProcessName+"'";
		List<BusinessProcessesBean> getRow = jdbcTemplate.queryForList(query);
		return getRow;		
	}

	@SuppressWarnings("unchecked")
	public List<DepartmentBean> checkDepartmentName(String departmentName) {
		
		String query = "select DeptName from assentisk_company_department where DeptName='"+departmentName+"'";
		List<DepartmentBean> getRow = jdbcTemplate.queryForList(query);
		return getRow;	
	}

	@SuppressWarnings("unchecked")
	public List<GroupBean> checkGroupName(String groupName) {
	
		String query = "select Gname from assentisk_group where Gname = '"+groupName+"'";
		List<GroupBean> getRow = jdbcTemplate.queryForList(query);
		return getRow;	
	}

	@SuppressWarnings("unchecked")
	public List<VendorBean> checkVendorName(String vendorName) {
		
		String query = "select VendorName from assentisk_vendor where VendorName = '"+vendorName+"'";
		List<VendorBean> getRow = jdbcTemplate.queryForList(query);
		return getRow;
	}

	@SuppressWarnings("unchecked")
	public List<EmployeeBean> checkResponsibleHead(String empName) {
		
		String query = "select EmpName from assentisk_userrecord where EmpUsername = '"+empName+"'";
		
		System.out.println("query: " + query);
		List<EmployeeBean> getRow = jdbcTemplate.queryForList(query);
		return getRow;
	}

	public void saveVendorContact(VendorContactBean contactBean) {
		int vendorID= jdbcTemplate
		.queryForInt("select max(id) from assentisk_vendor");
		for(int i=0; i<contactBean.getname().size();i++){
			String query = "insert into assentisk_vendor_contact (Name, Designation, Phone,Vendor_Id,email)" +
			"values('"+contactBean.getname().get(i)+"','"+contactBean.getDesignation().get(i)+"','"+contactBean.getPhone().get(i)+"','"+vendorID+"','"+contactBean.getemail().get(i)+"')";
			jdbcTemplate.execute(query);
		}	
		
	}
	public List<VendorContactBean> getVendorContact(int id) {
		List list = jdbcTemplate
		.queryForList("select * from assentisk_vendor_contact where Vendor_Id='"+id+"'");
		return list;
	}

	public void editVendorContact(VendorContactBean contactBean,int vendorID) {
		
		for(int i=0; i<contactBean.getname().size();i++){
			String query = "insert into assentisk_vendor_contact (Name, Designation, Phone,Vendor_Id,email)" +
			"values('"+contactBean.getname().get(i)+"','"+contactBean.getDesignation().get(i)+"','"+contactBean.getPhone().get(i)+"','"+vendorID+"','"+contactBean.getemail().get(i)+"')";
			jdbcTemplate.execute(query);
		}
	}
		public void deleteVendorContact(int id) {
		
		String	query="delete from assentisk_vendor_contact where ID='"+id+"'";
		jdbcTemplate.execute(query);
	}


		public List checkOldPassword(String password, String userID) {
			
			String query = "select EmpPassword from assentisk_userrecord where UserRecordID='"+userID+"' and EmpPassword='"+password+"'";
			List getRow = jdbcTemplate.queryForList(query);
			return getRow;
		}


	      @SuppressWarnings("unchecked")
	    	public List<CategoriesBean> getCategoryList() {
	    	
	    		//String query = "select asd.DepartmentID,asd.CompanyID,asd.BranchID,asd.DeptName,asd.DeptDesc,asd.CreatedDate,asd.CreatedBy,asd.ModifiedDate,asd.ModifiedBy,asd.IsActive, ac.CompanyName, acb.BranchName from assentisk_company_department asd join assentisk_company ac on asd.CompanyID = ac.CompanyID join assentisk_company_branch acb on asd.BranchID = acb.BranchID order by asd.DepartmentID";
	      	String query = "select * from assentisk_categories order by ID";
	    		List<CategoriesBean> catList = jdbcTemplate.queryForList(query);
	    		return catList;
	    	}
	      
	      
	      public List<BusinessProcessesBean> getBusinessList() {
		    	
	    		//String query = "select asd.DepartmentID,asd.CompanyID,asd.BranchID,asd.DeptName,asd.DeptDesc,asd.CreatedDate,asd.CreatedBy,asd.ModifiedDate,asd.ModifiedBy,asd.IsActive, ac.CompanyName, acb.BranchName from assentisk_company_department asd join assentisk_company ac on asd.CompanyID = ac.CompanyID join assentisk_company_branch acb on asd.BranchID = acb.BranchID order by asd.DepartmentID";
	      	String query = "select * from assentisk_businessprocess order by BusinessProcessID";
	    		List<BusinessProcessesBean> busiList = jdbcTemplate.queryForList(query);
	    		return busiList;
	    	}
	      
	      
	      public List<ApplicationsBean> getAppList() {
		    	
	    		//String query = "select asd.DepartmentID,asd.CompanyID,asd.BranchID,asd.DeptName,asd.DeptDesc,asd.CreatedDate,asd.CreatedBy,asd.ModifiedDate,asd.ModifiedBy,asd.IsActive, ac.CompanyName, acb.BranchName from assentisk_company_department asd join assentisk_company ac on asd.CompanyID = ac.CompanyID join assentisk_company_branch acb on asd.BranchID = acb.BranchID order by asd.DepartmentID";
	      		String query = "select * from assentisk_applications order by ApplicationID";
	    		List<ApplicationsBean> appList = jdbcTemplate.queryForList(query);
	    		return appList;
	    	}
	      
	      @SuppressWarnings("unchecked")
			public String getAppByName(String applicationName,String currentTime,int userId) {
				String ApplicationID = "";
				String query="select ApplicationID from assentisk_applications where ApplicationName IN ('"+applicationName+"')";
				List<ApplicationsBean> getRow = jdbcTemplate.queryForList(query);
				if(getRow.size()>0)
				{
					Map m = (Map)getRow.get(0);
					ApplicationID = m.get("ApplicationID").toString();
				}
				else
				{
					query = "insert into assentisk_applications(ApplicationName, LocationID, DivisionID, EmployeeID, RequestDate, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy, IsActive,DepartmentID) values('"+applicationName+"','0','0','0','"+currentTime+"','"+currentTime+"','"+userId+"','"+currentTime+"','"+userId+"','1','0')";
					jdbcTemplate.execute(query);
					
					query="select ApplicationID from assentisk_applications order by ApplicationID desc limit 1";
					List getMaxId=jdbcTemplate.queryForList(query);
					if(getMaxId.size()>0){
						Map mp = (Map)getMaxId.get(0);
						ApplicationID = mp.get("ApplicationID").toString();
					}
				}
				return ApplicationID;
			}
			
	  	

		@SuppressWarnings("unchecked")
		public String getApplicationByName(String applicationName) {
			String ApplicationID = "";
			String query="select ifnull(group_Concat(ApplicationID,''),'0') as ApplicationID from assentisk_applications where ApplicationName IN ('"+applicationName+"')";
			List<ApplicationsBean> getRow = jdbcTemplate.queryForList(query);
			if(getRow.size()>0)
			{
				Map m = (Map)getRow.get(0);
				ApplicationID = m.get("ApplicationID").toString();
			}
			
			return ApplicationID;
		}
		
		@SuppressWarnings("unchecked")
		public String getBusinessByName(String businesName,String currentTime,int userId) {
			String BusinessProcessID = "";
			
			String query="select  BusinessProcessID from assentisk_businessprocess where BusinessProcessName IN ('"+businesName+"')";
			List<BusinessProcessesBean> getRow = jdbcTemplate.queryForList(query);
			if(getRow.size()>0)
			{
				Map m = (Map)getRow.get(0);
				BusinessProcessID = m.get("BusinessProcessID").toString();
			}
			else
			{
				query = "insert into assentisk_businessprocess(BusinessProcessName, LocationID, DivisionID, EmployeeID, RequestDate, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy, IsActive,DepartmentID) values('"+businesName+"','0','0','0','"+currentTime+"','"+currentTime+"','"+userId+"','"+currentTime+"','"+userId+"','1','0')";
				jdbcTemplate.execute(query);
				query="select BusinessProcessID from assentisk_businessprocess order by BusinessProcessID desc limit 1";
				List getMaxId=jdbcTemplate.queryForList(query);
				if(getMaxId.size()>0){
					Map mp = (Map)getMaxId.get(0);
					BusinessProcessID = mp.get("BusinessProcessID").toString();
				}
				
			}
			return BusinessProcessID;
		}
		
		@SuppressWarnings("unchecked")
		public String getCategoryByName(String categoryName,String currentTime,int userId) {
			String ID = "";
			
		//	String query = "select LocationID from assentisk_company_locations where Name = '"+locationName+"'";
			String query="select  ID from assentisk_categories where cname IN ('"+categoryName+"')";
			List<ApplicationsBean> getRow = jdbcTemplate.queryForList(query);
			if(getRow.size()>0)
			{
				Map m = (Map)getRow.get(0);
				ID = m.get("ID").toString();
			}
			else
			{
				 query = "insert into assentisk_categories (cname, IsActive) values ('"+categoryName+"','1')";
				 jdbcTemplate.execute(query);
				 
				 query="select ID from assentisk_categories order by ID desc limit 1";
				 List getMaxId=jdbcTemplate.queryForList(query);
				 if(getMaxId.size()>0){
					Map mp = (Map)getMaxId.get(0);
					ID = mp.get("ID").toString();
				}
			}
			return ID;
		}

		public void saveAsset(String assetName, String categoryID,
				String locationID, String applicationID,
				String businessprocessID, String employee, String createdDate,
				int createdBy, String modifiedDate, int modifiedBy,
				String vendorID, String type, String initvalue, String quantity) {
			
			String query = "insert into assentisk_assets (aname, category, location, application, BP, employee, CreatedDate, CreatedBy, MoidifiedDate, ModifiedBy, vendorId, type,Initial_Values, quantity) values ('"+assetName+"','"+categoryID+"','"+locationID+"','"+applicationID+"','"+businessprocessID+"','"+employee+"','"+createdDate+"','"+createdBy+"','"+modifiedDate+"','"+modifiedBy+"','"+vendorID+"','"+type+"','"+initvalue+"','"+quantity+"')";
			jdbcTemplate.execute(query);
			
		}
		@SuppressWarnings("unchecked")
		public List getCountryData() {
			List list = jdbcTemplate.queryForList("select *from assentisk_country  order by CountryID");
			return list;
		}
		
		@SuppressWarnings("unchecked")
		public String getLocIdByName(String locationName,String currentTime,int userId,String country,String state,String city,String contact,String email) {
			String LocationID = "0";
			
			
		//	String query = "select LocationID from assentisk_company_locations where Name = '"+locationName+"'";
			String query="select  LocationID from assentisk_company_locations where Name IN ('"+locationName+"')";
			List<LocationsBean> getRow = jdbcTemplate.queryForList(query);
			if(getRow.size()>0)
			{
				Map m = (Map)getRow.get(0);
				LocationID = m.get("LocationID").toString();
			}
			else
			{
				if(!country.equals("") && !state.equals("") && !city.equals("") && !contact.equals("") && !email.equals("") )
				{
					query="select  CountryID from assentisk_country where CountryName IN ('"+country+"')";
				List getCountry=jdbcTemplate.queryForList(query);
				if(getCountry.size()>0){
					Map mp=(Map)getCountry.get(0);
					country=mp.get("CountryID").toString();
					
				}
				else
				{
					 query = "insert into assentisk_country(CountryName ,IsActive) values('"+country+"','1')";
					 jdbcTemplate.execute(query);
					 query="select CountryID from assentisk_country order by CountryID desc limit 1";
						List getMaxId=jdbcTemplate.queryForList(query);
						if(getMaxId.size()>0){
							Map mp = (Map)getMaxId.get(0);
							country = mp.get("CountryID").toString();
						}
				}
				
				
				query="select StateID from assentisk_state where StateName IN ('"+country+"') and CountryID='"+country+"'";
				List getState=jdbcTemplate.queryForList(query);
				if(getState.size()>0){
					Map mp=(Map)getState.get(0);
					state=mp.get("StateID").toString();
					
				}
				else
				{
					 query = "insert into assentisk_state(StateName, CountryID, IsActive) values('"+state+"','"+country+"','1')";
					 jdbcTemplate.execute(query);	
					 query="select StateID from assentisk_state order by StateID desc limit 1";
					 List getMaxId=jdbcTemplate.queryForList(query);
						if(getMaxId.size()>0){
							Map mp = (Map)getMaxId.get(0);
							state = mp.get("StateID").toString();
						}
				}
				
				query = "insert into assentisk_company_locations(CountryID, StateID, CityID, Name, Street, Address, Contactno, ZipCode, Phone1, Phone2, Email1, Email2, Fax1, Fax2, Url, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy, IsActive) values('"+country+"','"+state+"','"+city+"','"+locationName+"','','','"+contact+"','','','','"+email+"','','','','','"+currentTime+"','"+userId+"','"+currentTime+"','"+userId+"','1')";
				jdbcTemplate.execute(query);
				query="select LocationID from assentisk_company_locations order by LocationID desc limit 1";
				List getMaxId=jdbcTemplate.queryForList(query);
				if(getMaxId.size()>0){
					Map mp = (Map)getMaxId.get(0);
					LocationID = mp.get("LocationID").toString();
				}
				}
			}
			return LocationID;
		}

		
		@SuppressWarnings("unchecked")
		public String getDeparmentIdByName(String deptName,String currentTime,int userId) {
			String DepartmentID = "0";
			String query = "select DepartmentID  from assentisk_company_department where DeptName IN ('"+deptName+"')";
			List<DepartmentBean> getRow = jdbcTemplate.queryForList(query);
			if(getRow.size()>0)
			{
				Map m = (Map)getRow.get(0);
				DepartmentID = m.get("DepartmentID").toString();
			}
			else
			{
				query = "insert into assentisk_company_department(CompanyID,DeptName,DeptDesc,CreatedDate,CreatedBy,ModifiedDate,ModifiedBy,IsActive)values('0','"+deptName+"','0','"+currentTime+"','"+userId+"','"+currentTime+"','"+userId+"','1')";
				jdbcTemplate.execute(query);
				query="select DepartmentID from assentisk_company_department order by DepartmentID desc limit 1";
				List getMaxId=jdbcTemplate.queryForList(query);
				if(getMaxId.size()>0){
					Map mp = (Map)getMaxId.get(0);
					DepartmentID = mp.get("DepartmentID").toString();
				}
				
			}
			return DepartmentID;
		}

	 @SuppressWarnings("unchecked")
		 public List<AuditTrail> geAauditTrailList() {
		  List<AuditTrail> list = jdbcTemplate.queryForList("SELECT audit.AuditTrailID,audit.TableName,audit.ColumnName,audit.RowID,audit.OldValue,audit.NewValue,audit.Action,audit.ChangedDate,audit.ChangedBy,audit.IPAddress,user.EmpName from assentisk.assentisk_audittrail as audit inner join assentisk.assentisk_userrecord as user on audit.ChangedBy=user.UserRecordID");
		  return list;
		 }

		
		@SuppressWarnings("unchecked")
		public String getDivisionByName(String divisionName,String currentTime,int userId) {
			String divisionid = "0";
			String query = "select LegalEntityID  from assentisk_divisions where LegalEntityName IN ('"+divisionName+"')";
			List<LegalEntitiesBean> getRow = jdbcTemplate.queryForList(query);
			if(getRow.size()>0)
			{
				Map m = (Map)getRow.get(0);
				divisionid = m.get("LegalEntityID").toString();
			}
			else
			{
				 query = "insert into assentisk_divisions(LegalEntityName, LegalEntityDescription,DepartmentID,BranchID,CompanyPeriodID,CreatedDate,CreatedBy,MoidifiedDate,ModifiedBy,IsActive, EmployeeID)values('"+divisionName+"','','0','0','0','"+currentTime+"','"+userId+"','"+currentTime+"','"+userId+"','1','0')";
				 jdbcTemplate.execute(query);
				 query="select LegalEntityID from assentisk_divisions order by LegalEntityID desc limit 1";
					List getMaxId=jdbcTemplate.queryForList(query);
					if(getMaxId.size()>0){
						Map mp = (Map)getMaxId.get(0);
						divisionid = mp.get("LegalEntityID").toString();
					}
			}
			return divisionid;
		}

		public void saveCompanyLogo(String filename,String CompanyID)
		{
			String query = "update assentisk_company set CompanyLogo='"+filename+"' where CompanyID='"+ CompanyID + "' ";
					jdbcTemplate.execute(query);
		}
		

		public String saveEmployeedata(int userRecordID,String departmentID,
				String locationID, 	String empName,	String email, String ReportingTo, 
				String roleID,String requestDate,String createdDate,int createdBy, 	String modifiedDate,
				int modifiedBy, int isActive,String address,String city,String state,
				String country,	String zip,	String photo,
				String phone1,	String phone2,String divisions,	String email2) {
			String Licensevalue="0"; 
			if(userRecordID!=0){
				Licensevalue="1";
			}
			String duplicate="";
			String query="select * from assentisk_employees where DepartmentID='"+departmentID+"' and LocationID='"+locationID+"' and EmpName='"+empName+"' and Email='"+email+"' and address='"+address+"'  and  phone1='"+phone1+"' and phone2='"+phone2+"' and divisions='"+divisions+"' and email2='"+email2+"'";
			List getData=jdbcTemplate.queryForList(query);
			if(getData.size()>0){
				duplicate="true";
			}
			else{
				if(userRecordID==0){
					int maxVal=jdbcTemplate.queryForInt("select max(UserRecordID) from assentisk_userrecord");
					userRecordID=maxVal+1;
				}
			 query = "insert into assentisk_employees (UserRecordID,DepartmentID, LocationID, EmpName, Email, ReportingTo, RoleID, RequestDate, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy, IsActive, address, city, state, country, zip, photo, phone1, phone2, divisions, email2,isLicense)" +
					"values('"+userRecordID+"','"+departmentID+"','"+locationID+"','"+empName+"','"+email+"','"+ReportingTo+"','"+roleID+"','"+requestDate+"','"+createdDate+"','"+createdBy+"','"+modifiedDate+"','"+modifiedBy+"','"+isActive+"','"+address+"','"+city+"','"+state+"','"+country+"','"+zip+"','"+photo+"','"+phone1+"','"+phone2+"','"+divisions+"','"+email2+"','"+Licensevalue+"')";
			jdbcTemplate.execute(query);
			duplicate="false";
			query = "insert into assentisk_userrecord (EmpName,EmpUsername,EmpPassword,Email_ID,CreatedDate, ModifiedDate) values('"+empName+"','','','"+email+"', '"+createdDate+"','"+createdDate+"')";		
			jdbcTemplate.execute(query);
			
			}
			return duplicate;
			
		}
		public String saveAssetData(String assetName, String categoryID,
				String locationID, String applicationID,
				String businessprocessID, String employee, String createdDate,
				int createdBy, String modifiedDate, int modifiedBy,
				String vendorID, String type, String initvalue, String quantity) {
			String duplicate="";
			String query="select * from assentisk_assets where aname='"+assetName+"'";
			List getdata=jdbcTemplate.queryForList(query);
			if(getdata.size()>0){
				duplicate="true";
			}
			else
			{
			 query = "insert into assentisk_assets (aname, category, location, application, BP, employee, CreatedDate, CreatedBy, MoidifiedDate, ModifiedBy, vendorId, type,Initial_Values, quantity) values ('"+assetName+"','"+categoryID+"','"+locationID+"','"+applicationID+"','"+businessprocessID+"','"+employee+"','"+createdDate+"','"+createdBy+"','"+modifiedDate+"','"+modifiedBy+"','"+vendorID+"','"+type+"','"+initvalue+"','"+quantity+"')";
			jdbcTemplate.execute(query);
			duplicate="false";
			}
			return duplicate;
			
		}
		
		public String getUserId(String Username){
			String userID="";
			String query = "select UserRecordID from assentisk_userrecord where EmpUsername='"+Username+"'";			
			List getRow = jdbcTemplate.queryForList(query);
			if(getRow.size()>0){
				Map m=(Map)getRow.get(0);
				userID=m.get("UserRecordID").toString();
			}
			
			return (String) userID;
		}
		
		public String getuserDataConcat(String userId){
			String userConcat="";
			String query = "select concat(ae.EmpName,'(',au.EmpUsername,')') as username from assentisk_employees ae join assentisk_userrecord au "+
								" on ae.UserRecordID = au.UserRecordID where ae.UserRecordID = '"+userId+"'";	
			
			List getUserConcat=jdbcTemplate.queryForList(query);
			if(getUserConcat.size()>0){
				Map m=(Map)getUserConcat.get(0);
				userConcat=m.get("username").toString();
			}

			return userConcat;
		}
		public List<ControlCategoryBean> checkcontrolCatname(String controlname){
			
				
				String query = "select CtrlCategoryName from assentisk_controlcategory where CtrlCategoryName = '"+controlname+"'";
				System.out.println("query---"+query);
				List<ControlCategoryBean> getRow = jdbcTemplate.queryForList(query);
				return getRow;	
				
		}

		public List getTaskList(int parseInt){
			String query = "select * from assentisk_scheduler_activity where assignedTo="+parseInt+"";
			System.out.println("wcheck thiss>>"+query);
    		List taskList = jdbcTemplate.queryForList(query);
    		return taskList;
		}

		public List getEmpList(String rowId) {
			String query = "select * from assentisk_employees where EmployeeID != "+rowId+" and IsDeleted !=0";
			System.out.println("check thiss>>"+query);
    		List Empist = jdbcTemplate.queryForList(query);
    		return Empist;
		}
		
		public void updateTaskRecord(int empId, int rowId) {
			String query = "update assentisk_scheduler_activity set assignedTo='"+empId+"' where assignedTo='"+ rowId + "' ";
			System.out.println("now udapadring the record>"+query);
			jdbcTemplate.execute(query);
			
		}

}
