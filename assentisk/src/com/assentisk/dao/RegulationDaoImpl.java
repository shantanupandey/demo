package com.assentisk.dao;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import net.sf.cglib.core.EmitUtils;

import org.springframework.jdbc.core.JdbcTemplate;

import com.assentisk.bean.ApplicationsBean;
import com.assentisk.bean.BusinessProcessesBean;
import com.assentisk.bean.CityBean;
import com.assentisk.bean.CompanyBean;
import com.assentisk.bean.ControlCategoryBean;
import com.assentisk.bean.DepartmentBean;
import com.assentisk.bean.EmployeeBean;
import com.assentisk.bean.GroupBean;
import com.assentisk.bean.LanguageKeysBean;
import com.assentisk.bean.LegalEntitiesBean;
import com.assentisk.bean.LocationsBean;
import com.assentisk.bean.RiskBean;
import com.assentisk.bean.StateBean;
import com.assentisk.bean.UserRecordBean;
import com.assentisk.bean.VendorBean;
import com.assentisk.bean.VendorContactBean;
import com.assentisk.util.DBUtill;

import electric.xml.io.model.Group;

public class RegulationDaoImpl implements RegulationDao{

	DBUtill dbUtil = new DBUtill();
	
	JdbcTemplate jdbcTemplate = new JdbcTemplate();

	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	@SuppressWarnings("unchecked")
	public List<CompanyBean> getCompanyList() {
		List<CompanyBean> list = jdbcTemplate
				.queryForList("select * from assentisk_company order by CompanyID");
		return list;
	}

	public void addFields(String fileName, String controlID, String risk,
			String controlObjective, String controlDescription, String testSteps,int businessId, String controlCategory) {
		
		String query = "insert into riskdcoument(Doc_name, Control_ID, Risk, Control_Objective, Control_Description, Test_Steps,businessID,controlcategory) values("+
		fileName+","+controlID+","+risk+","+controlObjective+","+controlDescription+","+testSteps+","+businessId+","+controlCategory+")";
		System.out.println("check the query..."+query);
		jdbcTemplate.execute(query);
	
	}

	public List getFile(String fileName) {
		List<CompanyBean> list = jdbcTemplate
		.queryForList("select * from riskdcoument where Doc_name='"+fileName+"'");
         return list;
	}

	public void UpdateFields(String string, String string2, String string3,
			String string4, String string5, String string6) {
		// TODO Auto-generated method stub
		
	}

	public void removeFields(String fileName) {
		String query = "delete from riskdcoument where Doc_name = '"+fileName+"'";
		jdbcTemplate.execute(query);
		
	}

	public List<RiskBean> getRiskList(){
		List<RiskBean> list = jdbcTemplate
		.queryForList("SELECT DISTINCT Doc_name FROM riskdcoument where Doc_name!='SampleCopy'");
        return list;
	}

public List getFileDetail(String fileName) {
		
		//String query = "select Control_ID,Risk,Control_Objective,Control_Description, Test_Steps from riskdcoument where Doc_name='"+fileName+"'";
	String query="select rs.Control_ID,rs.Risk,rs.Control_Objective,rs.Control_Description, rs.Test_Steps,(select BusinessProcessName "+
				" from assentisk_businessprocess where BusinessProcessID=rs.businessID)as businessProcess,rs.controlcategory from riskdcoument as rs where "+
					" rs.Doc_name='"+fileName+"'"	;
	System.out.println("query---"+query);
		List list = jdbcTemplate.queryForList(query);
		
         return list;
	}


	public List<RiskBean> getControlsList(String riskLibrary) {
		List<RiskBean> list = jdbcTemplate
		.queryForList("SELECT DISTINCT rs.Doc_name,rs.id,rs.Control_ID,rs.Risk,rs.Control_Objective,rs.Control_Description," +
				" (select BusinessProcessName from assentisk_businessprocess where BusinessProcessID=rs.businessID) as business," +
				"rs.controlcategory FROM riskdcoument as rs where rs.Doc_name='"+riskLibrary+"' order by rs.Control_ID");
		
		
		System.out.println("SELECT DISTINCT Doc_name,id,Control_ID,Risk,Control_Objective,Control_Description  FROM riskdcoument where Doc_name='"+riskLibrary+"'");
		  if(list.size()>0){
	    	   for(int i=0;i<list.size();i++){
	    		   Map mp=(Map)list.get(i);
	    			String Risk1=mp.get("Risk").toString();
	    			Risk1 = Risk1.replaceAll("\\<.*?\\>", "");
	    			Risk1 = Risk1.replaceAll("\\&#39;", "'");
	       			
	       			((Map) list.get(i)).put("Risk1",Risk1);
	       			
	       			String Control_Objective1=mp.get("Control_Objective").toString();
	       			Control_Objective1 = Control_Objective1.replaceAll("\\<.*?\\>", "");
	       			Control_Objective1 = Control_Objective1.replaceAll("\\&#39;", "'");
	       			
	       			((Map) list.get(i)).put("Control_Objective1",Control_Objective1);
	       			
	       			String Control_Description1=mp.get("Control_Description").toString();
	       			Control_Description1 = Control_Description1.replaceAll("\\<.*?\\>", "");
	       			Control_Description1 = Control_Description1.replaceAll("\\&#39;", "'");
	       			
	       			((Map) list.get(i)).put("Control_Description1",Control_Description1);
	    	   }
	       }
		
		return list;
	}

	public List<RiskBean> getTestList(String riskLibrary) {
		List<RiskBean> list = jdbcTemplate
		.queryForList("select DISTINCT Doc_name,id,ifnull(Test_DocPath,'') as Test_DocPath,Control_ID,Test_Steps,IF(LENGTH(Test_Steps)>50,'true','false') as len,LEFT(Test_Steps, 100) as Test_Steps1,typedoc,filetypedoc from riskdcoument where Doc_name='"+riskLibrary+"'");
       if(list.size()>0){
    	   for(int i=0;i<list.size();i++){
    		   Map mp=(Map)list.get(i);
    		
   			String Test_Steps1=mp.get("Test_Steps").toString();
   			Test_Steps1 = Test_Steps1.replaceAll("\\<.*?\\>", "");
   			Test_Steps1 = Test_Steps1.replaceAll("\\&#39;", "'");
   			
   			((Map) list.get(i)).put("Test_Steps1",Test_Steps1);
    	   }
       }
		return list;
	}

	public List getFileDetail() {
		List list = jdbcTemplate
		.queryForList("SELECT DISTINCT Doc_name FROM riskdcoument");
        return list;
		
	}

	@SuppressWarnings("unchecked")
	public List<RiskBean> checkControlID(String controlID) {
		
		String query = "select Control_ID from riskdcoument where Control_ID  = '"+controlID+"'";
		List<RiskBean> getRow = jdbcTemplate.queryForList(query);
		return getRow;
	}

	public List<RiskBean> saveControler(String docName, String controlID,
			String risk, String controlObjective, String controlDescription,
			String testSteps,String controlcategory,String businessProc) {
		
		String query = "insert into riskdcoument(Doc_name, Control_ID, Risk, Control_Objective, Control_Description, " +
				"Test_Steps,businessID,controlcategory) values ('"+docName+"','"+controlID+"','"+risk+"'," +
						"'"+controlObjective+"','"+controlDescription+"','','"+businessProc+"','"+controlcategory+"')";
		System.out.println("query---"+query);
		jdbcTemplate.execute(query);
		return null;
	}

	@SuppressWarnings("unchecked")
	public List<RiskBean> getControlById(Integer id) {
		
		String query = "select rs.Doc_name,rs.Control_ID,(select BusinessProcessName from "+
                         " assentisk_businessprocess where BusinessProcessID = rs.businessID)as business, "+
                     " rs.Risk,rs.Control_Objective,rs.Control_Description,rs.Test_Steps,rs.id,rs.Test_DocPath,rs.typedoc,rs.filetypedoc," +
                     "rs.controlcategory  from riskdcoument as rs where rs.id = '"+id+"'";
		List<RiskBean> getRow = jdbcTemplate.queryForList(query);
		return getRow;
	}

	public List<RiskBean> updateControler(String id, String docName,
			String controlID, String risk, String controlObjective,
			String controlDescription, String testSteps,String controlcategory,String businessProc) {
		
		String query = "update riskdcoument set Doc_name='"+docName+"', Control_ID='"+controlID+"'," +
				" Risk='"+risk+"', Control_Objective='"+controlObjective+"', " +
						"Control_Description='"+controlDescription+"',controlcategory='"+controlcategory+"'," +
								"businessID='"+businessProc+"' where id='"+id+"'";
		System.out.println("query-----"+query);
		jdbcTemplate.execute(query);
		return null;
	}

	public void deleteControlById(Integer id) {
		
		String query = "delete from riskdcoument where id='"+id+"'";
		jdbcTemplate.execute(query);
		
	}

	@SuppressWarnings("unchecked")
	public List<RiskBean> getControlListByDoc(String library) {
		
		String query = "select distinct Control_ID from riskdcoument where Doc_name='"+library+"'";
		System.out.println("query: " + query);
		List<RiskBean> getList = jdbcTemplate.queryForList(query);
		return getList;
	}

	public void saveTest(String library, String controlID,
			String testStep) {
		
		String query = "insert into riskdcoument (Doc_name, Control_ID, Risk, Control_Objective, Control_Description,Test_Steps) values('"+library+"','"+controlID+"','','','','"+testStep+"')";
		jdbcTemplate.execute(query);
		
	}

	public void deleteTestById(Integer id) {
		
		String query = "delete from riskdcoument where id='"+id+"'";
		jdbcTemplate.execute(query);
		
	}

	public void uploadTestDoc(Integer testid, String filename,String filetype,String type) {
		
		String query = "update riskdcoument set Test_DocPath = '"+filename+"',typedoc='"+type+"',filetypedoc='"+filetype+"' where id='"+testid+"'";
		jdbcTemplate.execute(query);
	}
	
	public List updateTest(String id){
		String query = "select * from riskdcoument where id='"+id+"'";
		List getList = jdbcTemplate.queryForList(query);
		return getList;
	}
	
	public void updateTestbyID(String id, String controlID,
			String testStep) {
		
		String query = "update riskdcoument set Control_ID='"+controlID+"',Test_Steps='"+testStep+"' where id='"+id+"'";
	System.out.println("query--"+query);
		jdbcTemplate.execute(query);
		
	}

	public List getTest(String id) {
		String query = "select Test_Steps from riskdcoument where id='"+id+"'";
		List getList = jdbcTemplate.queryForList(query);
		return getList;
	}

	public void savecontrolCategory(String controlCategory,
			String buisnessProcess, String parent, String userId) {
		
		System.out.println("hi inside query....");
		int parentVal=0;
		
		
		java.util.Date dt = new java.util.Date();
		java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat(
				"yyyy-MM-dd HH:mm:ss");
		java.text.SimpleDateFormat sdf1 = new java.text.SimpleDateFormat(
		"yyyy-MM-dd");
		String currentTime = sdf.format(dt);
		int buisnessProcessId= Integer.parseInt(buisnessProcess);
		String currentTimeupdate = sdf1.format(dt);
		int userIdVal= Integer.parseInt(userId);
		String query = "insert into assentisk_controlcategory (CtrlCategoryName, BusinessProcessID, CtrlCategory_Parent, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy, IsActive,treeNodeId) values ('"+controlCategory+"','"+buisnessProcessId+"','"+parentVal+"','"+currentTime+"','"+userIdVal+"','"+currentTime+"','"+userIdVal+"','1','"+parent+"')";
		System.out.println("query---"+query);
		jdbcTemplate.execute(query);
		
		
	}


	public List<ControlCategoryBean> getControlCategoryList(){
		String query = "SELECT  * from assentisk_controlcategory";
		List<ControlCategoryBean> controlCategoryBeans = jdbcTemplate.queryForList(query);
		return controlCategoryBeans;
	}

	public List<BusinessProcessesBean> getBusinessProcessesList() {

		String query = "select aa.BusinessProcessID, aa.LocationID,aa.DivisionID,aa.BusinessProcessName,aa.LocationID,aa.DivisionID,aa.EmployeeID,aa.DepartmentID,aa.RequestDate,aa.CreatedDate,aa.CreatedBy, aa.ModifiedDate,aa.ModifiedBy, aa.IsActive, acl.Name , ad.LegalEntityName,ae.EmpName from assentisk_businessprocess aa left outer join assentisk_company_locations acl on acl.LocationID = aa.LocationID left outer join assentisk_divisions ad on ad.LegalEntityID = aa.DivisionID left outer join assentisk_userrecord ae on ae.UserRecordID = aa.EmployeeID";
		
		System.out.println("query>>>"+query);
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

	public List<ControlCategoryBean> getcontrolCategoryParentList() {
		String query = "SELECT * FROM `assentisk_controlcategory` WHERE `CtrlCategory_Parent` = 0;";
		List<ControlCategoryBean> controlCategoryBeans = jdbcTemplate.queryForList(query);
		return controlCategoryBeans;
	}

	public List<ControlCategoryBean> getControlChildsList(
			String ctrlCategoryName) {
		String query = "SELECT t1.CtrlCategoryName AS lev1, t2.CtrlCategoryName as CtrlCategoryName FROM assentisk_controlcategory AS t1 " +
				"LEFT JOIN assentisk_controlcategory AS t2 ON t2.CtrlCategory_Parent = t1.CtrlCategory_ID WHERE t1.CtrlCategoryName = '"+ctrlCategoryName+"';";
		List<ControlCategoryBean> controlCategoryBeans = jdbcTemplate.queryForList(query);
		return controlCategoryBeans;
	}

	public void updatecontrolCategory(String controlCategory,
			String buisnessProcess, String parent, String userId, String id) {
		String query = "delete from assentisk_controlcategory where CtrlCategory_ID="+id+"";
		jdbcTemplate.execute(query);
	
		
	}
	public String getbusinesProcID(String businessProc){
		String businesID="";
			String query = "select BusinessProcessID from assentisk_businessprocess where BusinessProcessName='"+businessProc+"'";
			List<BusinessProcessesBean> getID = jdbcTemplate.queryForList(query);
			if(getID.size()>0){
				Map m=(Map)getID.get(0);
				businesID=m.get("BusinessProcessID").toString();
			}
		return businesID;
	}

	public void updatecontCategory(String controlCategory,
			String buisnessProcess, String parent, String userId, String id) {
		String query = "update assentisk_controlcategory set CtrlCategoryName = '"+controlCategory+"',BusinessProcessID='"+buisnessProcess+"' where CtrlCategory_ID='"+id+"'";
		System.out.println("check this..query"+query);
		jdbcTemplate.execute(query);
		
	}



	public void savecontrolTreeCategory(String controlCategory,
			String buisnessProcess, String parent, String id) {
	
		String query = "update assentisk_controlcategory set CtrlCategoryName = '"+controlCategory+"',BusinessProcessID='"+buisnessProcess+"',CtrlCategory_Parent = '"+parent+"' where CtrlCategory_ID='"+id+"'";
		System.out.println("check this..query"+query);
		jdbcTemplate.execute(query);
		
	}

	public List getControlCategoryById(String id) {
		String query = "SELECT * FROM `assentisk_controlcategory` WHERE `CtrlCategory_Parent` = "+id+";";
		System.out.println("check this..query"+query);
		List getList = jdbcTemplate.queryForList(query);
		return getList;
			
	}

	public int getMaxId(){
		String query = "select max(CtrlCategory_ID) from assentisk_controlcategory";
		int getID= jdbcTemplate.queryForInt(query);
		return getID;
	}

	public List getTreeValue() {
		String query = "SELECT * FROM `assentisk_tree`";
		System.out.println("check this..query"+query);
		List getList = jdbcTemplate.queryForList(query);
		return getList;
	}

	public void saveTree(String treeValue) {
		String data=treeValue.replaceAll("'", "singleQuoto");
		data=data.replaceAll("[<](/)?img[^>]*[>]", "");
		
		String query = "update assentisk_tree set textdata = '"+data+"' where id='1'";
		System.out.println("check this..query"+query);
		jdbcTemplate.execute(query);
		
	}

	public void updatecontrolCategory(String controlCategory, String treeNodeId) {
		String query = "update assentisk_controlcategory set CtrlCategoryName = '"+controlCategory+"' where treeNodeId='"+treeNodeId+"'";
		System.out.println("check this.update.query"+query);
		jdbcTemplate.execute(query);
		
	}

	public void deleteControlCategoryNode(String id){
		String query = "delete from assentisk_controlcategory where treeNodeId='"+id+"'";
		System.out.println("check this.update.query"+query);
		jdbcTemplate.execute(query);
		
	}

}
