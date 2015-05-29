package com.assentisk.dao;

import java.util.List;

import com.assentisk.bean.ApplicationsBean;
import com.assentisk.bean.AuditPlan;
import com.assentisk.bean.AuditPlanMiles;
import com.assentisk.bean.BusinessProcessesBean;
import com.assentisk.bean.CityBean;
import com.assentisk.bean.CompanyBean;
import com.assentisk.bean.DepartmentBean;
import com.assentisk.bean.EmployeeBean;
import com.assentisk.bean.GroupBean;
import com.assentisk.bean.LanguageKeysBean;
import com.assentisk.bean.LegalEntitiesBean;
import com.assentisk.bean.LocationsBean;
import com.assentisk.bean.PolicyBean;
import com.assentisk.bean.RiskBean;
import com.assentisk.bean.StateBean;
import com.assentisk.bean.TestAssessment;
import com.assentisk.bean.UserRecordBean;
import com.assentisk.bean.VendorBean;
import com.assentisk.bean.VendorContactBean;
import com.assentisk.bean.employeesBean;
import com.assentisk.bean.testAuditPlanMiles;

public interface AssessmentDao {
	
	public List<LocationsBean> getLocationsGroupList();
	
	List<AuditPlan> getassessmentList(String userId);
	
	public String getLocationIdByName(String locationName);
	
	public void  saveAuditPlan(String auditname, String location,String currentTime, int userId,int status);
	
	List<AuditPlan> getauditlistById(String auditId);
	
	public void  updateAuditPlan(String auditID,String auditname, String location,String currentTime, int userId,int status);
	
	public String getBusinessProcByID(String businessProcess);
	
	public void getinsertlistById(String auditid, String businessProcByID,String assignTo, String startdate, String estimatedDay,String currentTime,String userId) throws Exception;
	
	List<AuditPlan> getauditmilestonelistById(String auditId);
	
	List<AuditPlan> getauditmilestoneDetailslistById(String auditId);

	public List getEmployeeNamesBracketListByName();
	
	public void getUpdateAssignTo(String milestoneID,String AssignTo);
	
	public void getUpdateSingleAssignTo(String detailID,String AssignTo,String auditid);

	public int totalControls(String businessProc);

	public List<AuditPlan> getDistinctAssign(String auditid);

	public List<AuditPlan> getauditmilestoneDetails(String auditid,String object);
	

	public void updateStartDate(String detailID,String userId,String currentTime);

	public void updateAssignAll(String milestoneID, String assignTo,String userId,String currentTime);
	
	public List<AuditPlanMiles> historyDetails(String auditid);

	public void sendForApprover(String auditid, String approver);

	public String getUserId(String userName);

	public List<AuditPlan> getstatus(String auditid);

	public List<AuditPlan> getfreshStatus(String auditid);

	public void approve(String auditid);

	public String getUserIddata(String userId);

	public List<TestAssessment> getMileTest(String username,String miles);

	public String getMilesVal(String username);
	
	public List<PolicyBean> getPolicyList(String userId,String empID);

	public List<DepartmentBean> getDepartmentGroupList();

	public void updatePolicy(String title, String department, String userId,
			String location, String textdata, String currentTime,String responsiblehead);

	public String getDepIdByName(String department);

	public List<PolicyBean> getPolicyData(String policyno);

	public String getLocationGroupById(String string);

	public String getDeptDataById(String string);

	public void editPolicy(String policyno, String title, String depIdByName,
			String userId, String locationIdByName, String textdata,
			String currentTime,String responsiblehead);
	public void updatetime(String detailID,String time);

	public List<EmployeeBean> getEmployeeList(String policyno,String userId);

	public List<PolicyBean> getPolicyByID(String policyID,String EmpIDs);

	public void insertPolicyByID(String policyID, String empIDs,String currentTime,String userId);
	
	
	public List<AuditPlanMiles> logDetails(String policyID);
	
	public List<AuditPlanMiles> policyhistoryDetails(String policyid);
	
	public String checkResponsibleHead(String empName);
	
	public String getuserDataConcat(String userId);

	public String getEmpID(String userId);
	
	public List<PolicyBean> getPolicyByID(String policyno);
	
	public void updatePolicyStatus(String policyID,String status);
}

	

