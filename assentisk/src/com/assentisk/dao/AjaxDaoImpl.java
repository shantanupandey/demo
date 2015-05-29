package com.assentisk.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.jdbc.core.JdbcTemplate;

import com.assentisk.bean.BusinessProcessesBean;
import com.assentisk.bean.CityBean;
import com.assentisk.bean.ControlCategoryBean;
import com.assentisk.bean.DepartmentBean;
import com.assentisk.bean.EmployeeBean;
import com.assentisk.bean.GroupBean;
import com.assentisk.bean.LegalEntitiesBean;
import com.assentisk.bean.LocationsBean;
import com.assentisk.bean.StateBean;
import com.assentisk.bean.VendorBean;
import com.assentisk.util.DBUtill;

public class AjaxDaoImpl implements AjaxDao {

	DBUtill dbUtil = new DBUtill();

	JdbcTemplate jdbcTemplate = new JdbcTemplate();

	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	@SuppressWarnings("unchecked")
	public List<StateBean> getStateByCountryID(Integer countryid) {

		String query = "select *from assentisk_state where CountryID = '"
				+ countryid + "'";
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

	@SuppressWarnings("unchecked")
	public List<String> getEmployeeNamesListByName(String employeename,String userId) {
		
		List<String> returnMatchName = new ArrayList<String>();
		String query = "select ae.EmpName,au.EmpUsername from assentisk_employees ae join assentisk_userrecord au on ae.UserRecordID = au.UserRecordID where ae.EmpName like '"+employeename+"%' order by ae.EmployeeID";	
		System.out.println("check this query>>"+query);
		List<EmployeeBean> getEmployeeList = jdbcTemplate.queryForList(query);
		if(getEmployeeList.size()>0)
		{
			for (int i = 0; i < getEmployeeList.size(); i++) {
				
				Map m = (Map)getEmployeeList.get(i);
				if (m.get("EmpName").toString().toUpperCase().indexOf(m.get("EmpName").toString().toUpperCase())!= -1) {
			        returnMatchName.add(m.get("EmpName").toString());
			        }
			}
			
		}
		
		
		return returnMatchName;
	}

	@SuppressWarnings("unchecked")
	public List<String> getLocationsByName(String locationname) {
		
		List<String> returnMatchName = new ArrayList<String>();
		String query = "select `Name` from assentisk_company_locations where Name like '"+locationname+"%' order by LocationID";	
		
		List<LocationsBean> getLocationList = jdbcTemplate.queryForList(query);
		if(getLocationList.size()>0)
		{
			for (int i = 0; i < getLocationList.size(); i++) {
				
				Map m = (Map)getLocationList.get(i);
				if (m.get("Name").toString().toUpperCase().indexOf(m.get("Name").toString().toUpperCase())!= -1) {
			        returnMatchName.add(m.get("Name").toString());
			        }
			}
			
		}
		
		
		return returnMatchName;
	}

	public List<String> getdivisionsByName(String legalEntityName) {
		List<String> returnMatchName = new ArrayList<String>();
		String query = "select LegalEntityName from assentisk_divisions where LegalEntityName like '"+legalEntityName+"%' order by LegalEntityID";		
		System.out.println("query----"+query);
		List<LegalEntitiesBean> getDivisionList = jdbcTemplate.queryForList(query);
		if(getDivisionList.size()>0)
		{
			for (int i = 0; i < getDivisionList.size(); i++) {
				
				Map m = (Map)getDivisionList.get(i);
				if (m.get("LegalEntityName").toString().toUpperCase().indexOf(m.get("LegalEntityName").toString().toUpperCase())!= -1) {
			        returnMatchName.add(m.get("LegalEntityName").toString());
			        }
			}
			
		}
		
		
		return returnMatchName;
	}
	
	public List<String> getVendorByName(String vendorName) {
		List<String> returnMatchName = new ArrayList<String>();
		String query = "select VendorName from assentisk_vendor where VendorName like '"+vendorName+"%' order by id";		
		System.out.println("query---"+query);
		List<VendorBean> getVendorList = jdbcTemplate.queryForList(query);
		if(getVendorList.size()>0)
		{
			for (int i = 0; i < getVendorList.size(); i++) {
				
				Map m = (Map)getVendorList.get(i);
				if (m.get("VendorName").toString().toUpperCase().indexOf(m.get("VendorName").toString().toUpperCase())!= -1) {
			        returnMatchName.add(m.get("VendorName").toString());
			        }
			}
			
		}
		
		
		return returnMatchName;
	}
	
	public List<String> getGroupByName(String groupName) {
		List<String> returnMatchName = new ArrayList<String>();
		String query = "select Gname from assentisk_group where Gname like '"+groupName+"%' order by GroupID";		
	
		List<GroupBean> getGroupList = jdbcTemplate.queryForList(query);
		if(getGroupList.size()>0)
		{
			for (int i = 0; i < getGroupList.size(); i++) {
				
				Map m = (Map)getGroupList.get(i);
				if (m.get("Gname").toString().toUpperCase().indexOf(m.get("Gname").toString().toUpperCase())!= -1) {
			        returnMatchName.add(m.get("Gname").toString());
			        }
			}
			
		}
		
		
		return returnMatchName;
	}
	
	public List<String> getDepartmentByName(String depName) {
		List<String> returnMatchName = new ArrayList<String>();
		String query = "select DeptName from assentisk_company_department where DeptName like '"+depName+"%' order by DepartmentID";
		System.out.println(query);
		List<DepartmentBean> getDepList = jdbcTemplate.queryForList(query);
		if(getDepList.size()>0)
		{
			for (int i = 0; i < getDepList.size(); i++) {
				
				Map m = (Map)getDepList.get(i);
				if (m.get("DeptName").toString().toUpperCase().indexOf(m.get("DeptName").toString().toUpperCase())!= -1) {
			        returnMatchName.add(m.get("DeptName").toString());
			        }
			}
			
		}
		
		
		return returnMatchName;
	}
	
	
	@SuppressWarnings("unchecked")
	public List<String> getEmployeeNamesBracketListByName(String employeename,String userId) {
		
		List<String> returnMatchName = new ArrayList<String>();
		String query = "select ae.EmpName,au.EmpUsername from assentisk_employees ae join assentisk_userrecord au on ae.UserRecordID = au.UserRecordID where ae.EmpName like '"+employeename+"%'   and isLicense='1' order by ae.EmployeeID";		
	System.out.println("query---"+query);
		List<EmployeeBean> getEmployeeList = jdbcTemplate.queryForList(query);
		if(getEmployeeList.size()>0)
		{
			for (int i = 0; i < getEmployeeList.size(); i++) {
				
				Map m = (Map)getEmployeeList.get(i);
				if (m.get("EmpName").toString().toUpperCase().indexOf(m.get("EmpName").toString().toUpperCase())!= -1) {
			        returnMatchName.add(m.get("EmpName").toString()+"" + "(" + m.get("EmpUsername").toString()+")");
			        }
			}
			
		}
		
		
		return returnMatchName;
	}
	
	@SuppressWarnings("unchecked")
	public List<String> getEmployeeNamesselfnotBracketListByName(String employeename,String userId) {
		
		List<String> returnMatchName = new ArrayList<String>();
		String query = "";
		
		if(userId!=null)
		{
			query = "select ae.EmpName,au.EmpUsername from assentisk_employees ae join assentisk_userrecord au on ae.UserRecordID = au.UserRecordID where ae.EmpName like '"+employeename+"%' and ae.UserRecordID!='"+userId+"' and isLicense='1' order by ae.EmployeeID";			
		}
		else
		{
			query = "select ae.EmpName,au.EmpUsername from assentisk_employees ae join assentisk_userrecord au on ae.UserRecordID = au.UserRecordID where ae.EmpName like '"+employeename+"%' and isLicense='1' order by ae.EmployeeID";	
		}
		
		System.out.println("queryy>>>"+query);
		List<EmployeeBean> getEmployeeList = jdbcTemplate.queryForList(query);
		if(getEmployeeList.size()>0)
		{
			for (int i = 0; i < getEmployeeList.size(); i++) {
				
				Map m = (Map)getEmployeeList.get(i);
				if (m.get("EmpName").toString().toUpperCase().indexOf(m.get("EmpName").toString().toUpperCase())!= -1) {
			        returnMatchName.add(m.get("EmpName").toString()+"" + "(" + m.get("EmpUsername").toString()+")");
			        }
			}
			
		}
		
		
		return returnMatchName;
	}

	
	
	public List<String> getBusinessByName(String businessName) {
		List<String> returnMatchName = new ArrayList<String>();
		String query = "select BusinessProcessName from assentisk_businessprocess where BusinessProcessName like '"+businessName+"%' order by BusinessProcessID";
		System.out.println(query);
		List<BusinessProcessesBean> getBusinessList = jdbcTemplate.queryForList(query);
		if(getBusinessList.size()>0)
		{
			for (int i = 0; i < getBusinessList.size(); i++) {
				
				Map m = (Map)getBusinessList.get(i);
				if (m.get("BusinessProcessName").toString().toUpperCase().indexOf(m.get("BusinessProcessName").toString().toUpperCase())!= -1) {
			        returnMatchName.add(m.get("BusinessProcessName").toString());
			        }
			}
			
		}
		
		
		return returnMatchName;
	}
	
	public List<String> getBusinessByNameAudit(String businessName,String auditid) {
		List<String> returnMatchName = new ArrayList<String>();
		String businessProc="";
		String query="select ifnull(group_concat(distinct(BusinessProcessID)),'0') as business from assentisk_auditmilesstone where auditID ='"+auditid+"'";
		List getBP=jdbcTemplate.queryForList(query);
		if(getBP.size()>0){
			Map m=(Map)getBP.get(0);
			businessProc=m.get("business").toString();
		}
		System.out.println("query---"+query);
		query = "select BusinessProcessName from assentisk_businessprocess where BusinessProcessName like '"+businessName+"%' and "+
						" BusinessProcessID  NOT IN ("+businessProc+") ";
		System.out.println(query);
		List<BusinessProcessesBean> getBusinessList = jdbcTemplate.queryForList(query);
		if(getBusinessList.size()>0)
		{
			for (int i = 0; i < getBusinessList.size(); i++) {
				
				Map m = (Map)getBusinessList.get(i);
				if (m.get("BusinessProcessName").toString().toUpperCase().indexOf(m.get("BusinessProcessName").toString().toUpperCase())!= -1) {
			        returnMatchName.add(m.get("BusinessProcessName").toString());
			        }
			}
			
		}
		
		
		return returnMatchName;
	}
	
	public List<String> controlCatList(String term){
		List<String> returnMatchName = new ArrayList<String>();
		String query = "select CtrlCategoryName from assentisk_controlcategory where CtrlCategoryName like  '"+term+"%' order by CtrlCategoryName";
		System.out.println(query);
		List<ControlCategoryBean> getControlList = jdbcTemplate.queryForList(query);
		if(getControlList.size()>0)
		{
			for (int i = 0; i < getControlList.size(); i++) {
				
				Map m = (Map)getControlList.get(i);
				if (m.get("CtrlCategoryName").toString().toUpperCase().indexOf(m.get("CtrlCategoryName").toString().toUpperCase())!= -1) {
			        returnMatchName.add(m.get("CtrlCategoryName").toString());
			        }
			}
			
		}
		
		
		return returnMatchName;
	}
	
	@SuppressWarnings("unchecked")
	public List<String> getEmployeeNamesBracketListByNameunique(String employeename,String userId) {
		
		List<String> returnMatchName = new ArrayList<String>();
		String query = "select ae.EmpName,au.EmpUsername from assentisk_employees ae join assentisk_userrecord au on ae.UserRecordID = au.UserRecordID where ae.EmpName like '"+employeename+"%' and ae.UserRecordID!='"+userId+"'  and isLicense='1' order by ae.EmployeeID";		
		System.out.println("query----"+query);
		List<EmployeeBean> getEmployeeList = jdbcTemplate.queryForList(query);
		if(getEmployeeList.size()>0)
		{
			for (int i = 0; i < getEmployeeList.size(); i++) {
				
				Map m = (Map)getEmployeeList.get(i);
				if (m.get("EmpName").toString().toUpperCase().indexOf(m.get("EmpName").toString().toUpperCase())!= -1) {
			        returnMatchName.add(m.get("EmpName").toString()+"" + "(" + m.get("EmpUsername").toString()+")");
			        }
			}
			
		}
		
		
		return returnMatchName;
	}

}
