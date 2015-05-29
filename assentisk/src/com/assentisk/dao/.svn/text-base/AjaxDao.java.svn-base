package com.assentisk.dao;

import java.util.List;

import com.assentisk.bean.CityBean;
import com.assentisk.bean.EmployeeBean;
import com.assentisk.bean.StateBean;

public interface AjaxDao {

	public List<StateBean> getStateByCountryID(Integer countryid);
	
	public List<CityBean> getCityByStateCountryID(Integer stateid, Integer countryid);
	
	public List<String> getEmployeeNamesListByName(String employeename,String userID);
	
	public List<String> getLocationsByName(String locationname);
	
	public List<String> getdivisionsByName(String legalEntityName);

	public List<String> getVendorByName(String term);

	public List<String> getGroupByName(String term);

	public List<String> getDepartmentByName(String term);

	public List<String> getEmployeeNamesBracketListByName(String term,String userID);

	public List<String> getEmployeeNamesselfnotBracketListByName(String term,
			String userId);

	public List<String> getBusinessByName(String term);

	public List<String> getBusinessByNameAudit(String term, String auditid);

	public List<String> controlCatList(String term);

	public List<String> getEmployeeNamesBracketListByNameunique(String term,
			String userId);
	
}
