package com.assentisk.dao;

import java.util.List;


public interface HomeDao {

	public List authenticate(String username, String password);
	public List getList(String groupID);
	public void updateExpandValue(String status,String UserId);
	public List getGroupPermission(String groupIDs);
	public void updateRiskValue(String riskID,String UserId);
	
	public List getTaskByEmployeeID(Integer employeeID);
	
	public List getLanguageList();
	public void savecomment(String scheduleid,String status,String comment);
	
	public List getcomment(String id);
	List getFileDetail();
	public List getAMCdataList(String userID,String getsevenAfterDate);
	public String getsevenAfterDate();
	public List piechartValue(String userId,String Date);
	public List getPolicy(String policy);
	
	public List getPolicyStatus(String policyID,String empID);
	public void updatePolicyApproverStatus(String policyID, String empID,
			String data);

}
