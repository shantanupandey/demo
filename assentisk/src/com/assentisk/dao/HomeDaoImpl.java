package com.assentisk.dao;


import java.util.List;
import java.util.Map;

import org.springframework.jdbc.core.JdbcTemplate;

import com.assentisk.bean.AmcAssetBean;
import com.assentisk.util.DBUtill;

public class HomeDaoImpl implements HomeDao {

	DBUtill dbUtil = new DBUtill();

	JdbcTemplate jdbcTemplate = new JdbcTemplate();

	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
	
	public List authenticate(String username, String password) {
		
		
		String query = "select u.EmpName,u.riskID,u.EmpUsername,u.UserRecordID,expandBar,(select RoleID from assentisk_employees where UserRecordID=u.UserRecordID) as groupID"+
						" from assentisk_userrecord  u join assentisk_employees ae on ae.UserRecordID=u.UserRecordID where u.EmpUsername COLLATE latin1_general_cs = '"+username+"' and u.EmpPassword COLLATE latin1_general_cs = '"+password+"' " +
								" and ae.isLicense='1' and ae.IsDeleted='1'";
		List getList= jdbcTemplate.queryForList(query);
		//System.out.println(query+"---size--"+getList.size());
				
		
		return getList;
		
	}
	
	public List getList(String query){
		List List=jdbcTemplate.queryForList(query);
		
		return List;
	}
	public void updateExpandValue(String status,String userId){
		jdbcTemplate.execute("update assentisk_userrecord set expandBar='"+status+"' where UserRecordID='"+userId+"'");
		
		
	}
	public List getGroupPermission(String groupIDs) {
		String query = "select sum(view_mod) as view_mod,sum(add_mod) as add_mod,sum(edit_mod)as edit_mod,sum(delete_mod) as delete_mod,"
				+ "sum(per_mod) as per_mod,sum(sch_mod) as sch_mod,sum(copy_mod) as copy_mod,moduleId from assentisk_grouppermission where groupId IN ("+groupIDs+") group by moduleId";
		//System.out.println("query--"+query);
		List getList = jdbcTemplate.queryForList(query);
		return getList;
	}
	public void updateRiskValue(String riskID,String userId){
		jdbcTemplate.execute("update assentisk_userrecord set riskID='"+riskID+"' where UserRecordID='"+userId+"'");	
	}

	public List getTaskByEmployeeID(Integer employeeID) {
		
		String query = "select (select time from assentisk_time where id=asch.endTimeID) as endTimeID, asch.endDate,asch.assetID,ass.aname,ass.employee,asch.id, asch.assignedBy, ae.EmpName, asch.status from assentisk_scheduler asch join assentisk_assets ass on ass.ID = asch.assetID join assentisk_employees ae on ae.EmployeeID = asch.assignedBy where ass.employee = "+employeeID+"";		
		List getDetails = jdbcTemplate.queryForList(query);
		return getDetails;
	}

	public List getLanguageList() {
		
		String query = "select *from assentisk_language order by id";
		List getList = jdbcTemplate.queryForList(query);
		return getList;
	}
	
	public List getFileDetail() {
		List list = jdbcTemplate
		.queryForList("SELECT DISTINCT Doc_name FROM riskdcoument where Doc_name!='SampleCopy'");
        return list;
}
	public List<AmcAssetBean> getAMCdataList(String userId,String getsevenAfterDate) {
		
		String query = "select count(act.id) as size  from assentisk_scheduler_activity  as act where (act.assignedTo='"+userId+"' "+
						" and act.dateSchedule<='"+getsevenAfterDate+"' and (act.status='Created' or act.status='Pending')) or (act.assignedBy='"+userId+"' "+
							" and act.dateSchedule<='"+getsevenAfterDate+"' and act.status='Completed') order by act.dateSchedule";
		//System.out.println("query0----"+query);
		//String query="select count(*)as size from assentisk_tasks ,assentisk_amc_assets ,assentisk_support";
		List<AmcAssetBean> amcList = jdbcTemplate.queryForList(query);		
		return amcList;
	}
	public void savecomment(String id,String status,String comment){
		if(status.equals("")){
			jdbcTemplate.execute("update assentisk_scheduler_activity set comment='"+comment+"' where id='"+id+"'");
		}
		else
		{
			jdbcTemplate.execute("update assentisk_scheduler_activity set status='"+status+"',comment='"+comment+"' where id='"+id+"'");
		}
	
	}
	
	public List getcomment(String id){
		String query = "select act.id,act.assetID,act.amcname,act.schedule,act.startdate,act.enddate,act.comment,"+
						"act.status,act.assignedBy,(select EmpName from assentisk_employees where UserRecordID=act.assignedBy)as empname,"+
							"act.dateSchedule,act.assignedTo,act.startTime,act.endTime from assentisk_scheduler_activity"+
								" as act where id = '"+id+"'";
		//System.out.println("query----"+query);
		List getList = jdbcTemplate.queryForList(query);
		return getList;
	}
	
	public String getsevenAfterDate(){
		String date="";
	//	String query="SELECT DATE_FORMAT(DATE_ADD(DATE_FORMAT(now(),'%Y-%m-%d'),INTERVAL 7 day),'%Y-%m-%d') as dateval";
		String query="SELECT DATE_FORMAT(DATE_ADD(DATE_FORMAT(now(),'%Y-%m-%d'),INTERVAL  1 year),'%Y-%m-%d') as dateval";
		List getDate=jdbcTemplate.queryForList(query);
		if(getDate.size()>0){
			Map m=(Map)getDate.get(0);
			date=m.get("dateval").toString();
		}
		return date;
		
	}
	public List piechartValue(String UserId,String dateval){
		String query="select (select count(*) from assentisk_scheduler_activity where generatedBy='System' and (assignedBy='"+UserId+"') and status='Completed' and dateSchedule<='"+dateval+"') as sysComplete, "+
						" (select count(*) from assentisk_scheduler_activity where generatedBy='System' and (assignedTo='"+UserId+"') and status='Pending' and dateSchedule<='"+dateval+"') as sysPending, "+
							" (select count(*) from assentisk_scheduler_activity where generatedBy='System' and (assignedTo='"+UserId+"') and status='Created' and dateSchedule<='"+dateval+"') as sysCreated, "+
							" (select count(*) from assentisk_scheduler_activity where generatedBy='Manual' and (assignedBy='"+UserId+"') and status='Completed' and dateSchedule<='"+dateval+"') as manComplete, "+
							" (select count(*) from assentisk_scheduler_activity where generatedBy='Manual' and (assignedTo='"+UserId+"') and status='Pending' and dateSchedule<='"+dateval+"') as manPending, "+
							" (select count(*) from assentisk_scheduler_activity where generatedBy='Manual' and (assignedTo='"+UserId+"') and status='Created' and dateSchedule<='"+dateval+"') as manCreated, "+
							" (select count(*) from assentisk_scheduler_activity where generatedBy='Support Ticket' and (assignedBy='"+UserId+"') and status='Completed' and dateSchedule<='"+dateval+"') as supComplete, "+
							" (select count(*) from assentisk_scheduler_activity where generatedBy='Support Ticket' and (assignedTo='"+UserId+"') and status='Pending' and dateSchedule<='"+dateval+"') as supPending, "+
							" (select count(*) from assentisk_scheduler_activity where generatedBy='Support Ticket' and (assignedTo='"+UserId+"') and status='Created' and dateSchedule<='"+dateval+"') as supCreated";
		
		//System.out.println(query);
		List getRow=jdbcTemplate.queryForList(query);
		return getRow;
	}
	
	public List getPolicy(String policy){
		String query="select * from assentisk_policy where id='"+policy+"'";
		//System.out.println("query---"+query);
		List getRow=jdbcTemplate.queryForList(query);
		return getRow;
	}
	
	public List getPolicyStatus(String policyID,String empID){
		String query="select * from assentisk_policylog where policyID='"+policyID+"' and EmpID='"+empID+"'";
		List getrow=jdbcTemplate.queryForList(query);
		return getrow;
		
	}
	
	public void updatePolicyApproverStatus(String policyID,String empID,String data){
		String query="update assentisk_policylog set status='"+data+"' where policyID='"+policyID+"' and EmpID='"+empID+"'";
		jdbcTemplate.execute(query);
	}
	

}
