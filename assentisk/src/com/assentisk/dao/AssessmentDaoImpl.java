package com.assentisk.dao;

import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import net.sf.cglib.core.EmitUtils;

import org.springframework.jdbc.core.JdbcTemplate;

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
import com.assentisk.bean.testAuditPlanMiles;
import com.assentisk.bean.ticketCatBean;
import com.assentisk.util.DBUtill;

import electric.xml.io.model.Group;
import electric.xml.tools.Parse;

public class AssessmentDaoImpl implements AssessmentDao{

	DBUtill dbUtil = new DBUtill();
	
	JdbcTemplate jdbcTemplate = new JdbcTemplate();

	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}





	public List<AuditPlan> getassessmentList(String userId){

		String query="SELECT ap.ID,ap.auditName,loc.Name,DATE_FORMAT(ap.ModifiedDate,'%Y-%m-%d') as ModifiedDate,userRec.EmpName,  ap.createdBy, "+
					" (select CASE WHEN max(versions) < 1 THEN '' ELSE max(versions) END AS Result from assentisk_auditmilesstone where "+
					" auditID=ap.ID group by auditID) as versions, (select status from assentisk_auditmilesstone where auditID=ap.ID  and " +
					" status!='0' order by auditmilesID desc limit 1) as " +
					" statusdata,(select approver from assentisk_auditmilesstone where auditID=ap.ID   order by " +
					" auditmilesID desc limit 1) as approver FROM assentisk_auditplan  ap left outer join assentisk_company_locations loc on " +
					" loc.LocationID=ap.location left outer join  assentisk_userrecord  userRec on userRec.UserRecordID=ap.ModifiedBy " +
					" having (ap.createdBy='"+userId+"' or approver='"+userId+"')";
		
		List<AuditPlan> getRow = jdbcTemplate.queryForList(query);
        return getRow;
	}


	
	@SuppressWarnings("unchecked")
	public List<LocationsBean> getLocationsGroupList(){
		
		
		String query = "select concat(group_concat(Name,''),',') as locations from assentisk_company_locations order by LocationID";
		List<LocationsBean> getRow = jdbcTemplate.queryForList(query);
		return getRow;
	}

	
	@SuppressWarnings("unchecked")
	public String getLocationIdByName(String locationName) {
		String locationid = "";
		
		String query="select ifnull(group_Concat(LocationID,''),'0') as LocationID from assentisk_company_locations where Name IN ('"+locationName+"')";
		//////System.out.println("query for location---"+query);
		List<LocationsBean> getRow = jdbcTemplate.queryForList(query);
		if(getRow.size()>0)
		{
			Map m = (Map)getRow.get(0);
			locationid = m.get("LocationID").toString();
		}
		return locationid;
	}
	public void saveAuditPlan(String auditname, String location,String currentTime, int userId,int status){
		String query = "insert into assentisk_auditplan (auditName, location, CreatedBy,CreatedDate,ModifiedBy, ModifiedDate, status, version) values ('"+auditname+"','"+location+"','"+userId+"','"+currentTime+"','"+userId+"','"+currentTime+"','0','1')";
		//////System.out.println("query---"+query);
		jdbcTemplate.execute(query);
	}
	
	public List<AuditPlan> getauditlistById(String auditId){
		List<AuditPlan> list = jdbcTemplate.queryForList("SELECT ap.ID,ap.auditName,loc.Name,DATE_FORMAT(ap.ModifiedDate,'%Y-%m-%d') as ModifiedDate, "+
				" ap.version,ap.status FROM assentisk_auditplan  ap left outer join assentisk_company_locations loc on loc.LocationID=ap.location where  ID='"+auditId+"' ");
		return list;
		
	}
	
	public void updateAuditPlan(String auditId,String auditname, String location,String currentTime, int userId,int status){
		String query = "update assentisk_auditplan set auditName='"+auditname+"', location='"+location+"', ModifiedBy='"+userId+"', ModifiedDate='"+currentTime+"' where ID='"+auditId+"'";
		//////System.out.println("query---"+query);
		jdbcTemplate.execute(query);
	}
	public String getBusinessProcByID(String businessProcess){
		String query="select BusinessProcessID from assentisk_businessprocess where BusinessProcessName='"+businessProcess+"'";
		String businessID="";
		List<BusinessProcessesBean> getBusinessList = jdbcTemplate.queryForList(query);
		if(getBusinessList.size()>0){
			Map m=(Map)getBusinessList.get(0);
			businessID=m.get("BusinessProcessID").toString();
		}
		return businessID;
	}
	
	public void getinsertlistById(String auditid,String businessProcess,String assignTo,String startdate,String estimatedDay,String currentTime,String userId) throws Exception{
		
		int  miles= jdbcTemplate.queryForInt("select max(milestone) from assentisk_auditmilesstone where auditID='"+auditid+"'");
		int countControls= jdbcTemplate.queryForInt("select count(*) from riskdcoument where  businessID='"+businessProcess+"'");
		String oldendDate="";	
		double estimateTimeForEach = ( Double.parseDouble(estimatedDay) * 8) / countControls ;
		estimateTimeForEach = Double.parseDouble(new DecimalFormat("##.##").format(estimateTimeForEach));
		//////System.out.println("estimateTimeForEach---"+estimateTimeForEach);
		//////System.out.println("select max(milestone) from assentisk_auditMilesston where auditID='"+auditid+"'");
		String endDate="";
		String query="SELECT CAST(('"+startdate+"' + INTERVAL "+estimatedDay+" Day) AS Date) as dateval";
		List getEnd=jdbcTemplate.queryForList(query);
		if(getEnd.size()>0){
			Map m=(Map)getEnd.get(0);
			oldendDate=m.get("dateval").toString();
		}
		
		 query="SELECT CAST(('"+startdate+"' + INTERVAL 10 Year) AS Date) as dateval";
		List getEndDate=jdbcTemplate.queryForList(query);
		if(getEndDate.size()>0){
			Map m=(Map)getEndDate.get(0);
			endDate=m.get("dateval").toString();
		}
		miles=miles +1;
		 query="INSERT INTO assentisk_auditmilesstone(auditID,milestone,startDate,endDate,BusinessProcessID,createdBy,createdDate,updatedBy,updatedDate) " +
		 		"values('"+auditid+"','"+miles+"','"+startdate+"','"+oldendDate+"','"+businessProcess+"','"+userId+"','"+currentTime+"','"+userId+"','"+currentTime+"')";
		 jdbcTemplate.execute(query);
		 
		 int  auditmileID= jdbcTemplate.queryForInt("select max(auditmilesID) from assentisk_auditmilesstone where auditID='"+auditid+"'");
		 query = "INSERT INTO assentisk_auditplanmilesstonedetails (controlID,Risk,Control_Objective,assignedTo,auditID,auditMilesID,CreatedDate,CreatedBy,ModifiedDate,ModifiedBy,EstimatedTime)"+
						" SELECT Control_ID,Risk,Control_Objective,'"+assignTo+"','"+auditid+"','"+auditmileID+"','"+currentTime+"','"+userId+"','"+currentTime+"','"+userId+"','"+estimateTimeForEach+"' FROM riskdcoument where businessID='"+businessProcess+"'";
		 jdbcTemplate.execute(query);
		 
		 query="SELECT * FROM assentisk_auditplanmilesstonedetails where auditMilesID='"+auditmileID+"' order by detailID ";
		 List getControls=jdbcTemplate.queryForList(query);
		 
			List<Date> dates = new ArrayList<Date>();
			
			String[] startval=startdate.split("-");
			String str_dater=startval[2]+"/"+startval[1]+"/"+startval[0];
			
			
			String[] endval=endDate.split("-");
			String end_dater=endval[2]+"/"+endval[1]+"/"+endval[0];	
			
			String str_date = str_dater;
			String end_date = end_dater;
			DateFormat formatter ; 
			formatter = new SimpleDateFormat("dd/MM/yyyy");
			Date  startDate = null; 
	        try {
	            startDate = (Date)formatter.parse(str_date);
	        } catch (Exception ex) {
	        }
	        Date  endDated = null;
	        try {
	            endDated = (Date)formatter.parse(end_date);
	        } catch (Exception ex) {
	        }
	        long interval = (24*1000 * 60 * 60); // 1 hour in millis
			long endTime =endDated.getTime() ;
	        long curTime = startDate.getTime();
			while (curTime <= endTime) {
			    dates.add(new Date(curTime));
			    curTime += interval;
			}
			double temp = estimateTimeForEach;
			double total = estimateTimeForEach;
			DateFormat format2=new SimpleDateFormat("EEEE"); 
			
			String calstartDate=str_date;
			String calenddate=str_date;
			int countdate = countControls;
			double oldtemp=0;
			int flag=0;
			int check=0;
			int chkfirst=0;
			List<String> dateList=new ArrayList<String>();
			for(int i=0;i<dates.size();){
				////////System.out.println("i===="+i);
			    Date lDate =(Date)dates.get(i);
			    String finalDay=format2.format(lDate);
			  //  //////System.out.println("finalDay-----"+finalDay);
			    String ds = formatter.format(lDate);
			  //  //////System.out.println("ds-----"+ds);
			   
			  //  //////System.out.println("iiiiii====---"+i);
			    
			    
			    if(i==0){
			    	   if(finalDay.equals("Sunday")){
			    		   
			    		 i++;
			    		 Date lDate1 =(Date)dates.get(1);
						 String ds1 = formatter.format(lDate1);
						 calstartDate=ds1;
			    		 continue;
			    	   }
			    	   else if(  finalDay.equals("Saturday")){
			    		   	 Date lDate1 =(Date)dates.get(2);
							 String ds1 = formatter.format(lDate1);
							 calstartDate=ds1;
			    			 i++;
				    		 continue;
			    	   }
			    }
			    int whilecount=0; 
			 //   //////System.out.println("temp---"+temp);
			    while(temp>=8){
			    	  if( finalDay.equals("Saturday") || finalDay.equals("Sunday")){
			    	
			    		  whilecount = whilecount + 1;
			    		  lDate =(Date)dates.get(i);
						  finalDay=format2.format(lDate);
			    		 break;
			    		
			    	  }
			    	  else
			    	  {
			    		  	temp=temp - 8;
			    		  	whilecount = whilecount + 1;
			    	  }
			    	
			    	
			    }
			    if( finalDay.equals("Saturday") || finalDay.equals("Sunday")){
			  	    i=i+1;
			  	    whilecount = whilecount + 1;
			    	continue;
			    }
			    if(temp > 0){
			    //	//////System.out.println("temp---"+temp);
			    	  i = i + whilecount;
			    	//  //////System.out.println("whilecount---"+whilecount);
			    	//  //////System.out.println("i---"+i);
			    	  total = temp + estimateTimeForEach;
			    	  temp=total;
			    	  	 Date lDate1 =(Date)dates.get(i);
						 String ds1 = formatter.format(lDate1);
						 String finalDay1=format2.format(lDate1);
						 if( finalDay1.equals("Saturday")){
							  lDate1 =(Date)dates.get(i+2);
							  ds1 = formatter.format(lDate1);
							
						  }
						  if( finalDay1.equals("Sunday")){
							  lDate1 =(Date)dates.get(i+1);
							  ds1 = formatter.format(lDate1);
							  
						  }
						 calenddate=ds1;
						 
						// //////System.out.println("calstartDate--"+calstartDate);
				    	// //////System.out.println("calenddate---"+calenddate);
				    	 dateList.add(calstartDate+","+calenddate);
				    	 calstartDate=calenddate;
					//	//////System.out.println("total---"+total); 
			    	 
			    	 
			    	  countdate =countdate - 1;
			    	//	//////System.out.println("countdate---"+total); 
			    	  if(countdate<=0){
			    		  break;
			    	  }
			    	
			    }
			    else if(temp== 0 && estimateTimeForEach<=8){
			    	//////System.out.println("inside else");
			    	     Date lDate1 =(Date)dates.get(i);
						 String ds1 = formatter.format(lDate1);
						 String finalDay1=format2.format(lDate1);
						 if( finalDay1.equals("Saturday")){
							  lDate1 =(Date)dates.get(i+2);
							  ds1 = formatter.format(lDate1);
							
						  }
						  if( finalDay1.equals("Sunday")){
							  lDate1 =(Date)dates.get(i+1);
							  ds1 = formatter.format(lDate1);
							  
						  }
						 calenddate=ds1;
			    	//  //////System.out.println("calstartDate--"+calstartDate);
			    	 // //////System.out.println("calenddate---"+calenddate);
			    	  dateList.add(calstartDate+","+calenddate);
			    	      lDate1 =(Date)dates.get(i+1);
						  ds1 = formatter.format(lDate1);
						  finalDay1=format2.format(lDate1);
						  if( finalDay1.equals("Saturday")){
							  lDate1 =(Date)dates.get(i+3);
							  ds1 = formatter.format(lDate1);
							
						  }
						  if( finalDay1.equals("Sunday")){
							  lDate1 =(Date)dates.get(i+2);
							  ds1 = formatter.format(lDate1);
							  
						  }
						 calstartDate=ds1;
					 
						  i = i + whilecount;
				    	  total = temp + estimateTimeForEach;
				    	  temp=total;
			    	  countdate=countdate-1;
			    	  if(countdate<=0){
			    		  break;
			    	  }
			    	
			    }
			    else if(temp== 0) {
			   // 	//////System.out.println("temp---"+temp);
			    	  i = i + whilecount;
			    //	  //////System.out.println("whilecount---"+whilecount);
			    //	  //////System.out.println("i---"+i);
			    	  total = temp + estimateTimeForEach;
			    	  temp=total;
			    	  	 Date lDate1 =(Date)dates.get(i);
						 String ds1 = formatter.format(lDate1);
						 String finalDay1=format2.format(lDate1);
						 if( finalDay1.equals("Saturday")){
							  lDate1 =(Date)dates.get(i+2);
							  ds1 = formatter.format(lDate1);
							
						  }
						  if( finalDay1.equals("Sunday")){
							  lDate1 =(Date)dates.get(i+1);
							  ds1 = formatter.format(lDate1);
							  
						  }
						 calenddate=ds1;
						 
						// //////System.out.println("calstartDate--"+calstartDate);
				    	// //////System.out.println("calenddate---"+calenddate);
				    	 dateList.add(calstartDate+","+calenddate);
				    	// //////System.out.println("else condition on temp equal to zero");

							 calstartDate=ds1;
						////////System.out.println("total---"+total); 
			    	 countdate =countdate - 1;
			    	//	//////System.out.println("countdate---"+total); 
			    	  if(countdate<=0){
			    		  break;
			    	  }
			    	}

					}
			//////System.out.println("dateList---"+dateList);
		 if(getControls.size()>0){
			 for(int i=0;i<getControls.size();i++){
				 Map m=(Map)getControls.get(i);
				 String startdatevalue="";
				 String enddatevalue="";
				 String startmodify ="";
					String endmodify="";
					if(dateList.size()>0){	
						String []datemod=dateList.get(i).toString().split(",");
						
						
						//////System.out.println("list data---"+dateList.get(i).toString());
						//////System.out.println("length---"+datemod.length);
						 startdatevalue=datemod[0];
						 enddatevalue=datemod[1];
						 
						    String []datemod1=startdatevalue.split("/");
							startmodify = datemod1[2]+"-"+datemod1[1]+"-"+datemod1[0];
							String []datemod2=enddatevalue.split("/");
							endmodify = datemod2[2]+"-"+datemod2[1]+"-"+datemod2[0];
					}
				 query="update assentisk_auditplanmilesstonedetails set SerialNoPerMiles='"+(i+1)+"',dependencyNo='"+i+"',startDate='"+startmodify+"',endDate='"+endmodify+"' where detailID='"+m.get("detailID")+"'";
				 jdbcTemplate.execute(query);
			
			 }
		 }
		 
		 
		 
		 query="update assentisk_auditplan set ModifiedDate='"+currentTime+"',ModifiedBy='"+userId+"',version='"+miles+"' where ID='"+auditid+"'";
		 jdbcTemplate.execute(query);
		 String endvaldate = "";
		 query="select max(endDate)as endDate from assentisk_auditplanmilesstonedetails where auditMilesID='"+auditmileID+"'";
		 List getDateval=jdbcTemplate.queryForList(query);
		 if(getDateval.size()>0){
			 Map mp=(Map)getDateval.get(0);
			 endvaldate=mp.get("endDate").toString();
			 query="update assentisk_auditmilesstone set endDate='"+endvaldate+"'where auditmilesID='"+auditmileID+"'";
			 jdbcTemplate.execute(query);
			 
		 }
		 
		
	}
	
	public List<AuditPlan> getauditmilestonelistById(String auditId){
	//	String query = "select auditMile.auditmilesID,auditMile.auditID,auditMile.milestone,DATE_FORMAT(auditMile.startDate,'%Y-%m-%d') as startDate,DATE_FORMAT(auditMile.endDate,'%Y-%m-%d') as endDate,bp.BusinessProcessName from "+
	//					" assentisk_auditmilesstone auditMile left outer join assentisk_businessprocess bp on bp.BusinessProcessID= auditMile.BusinessProcessID where auditID='"+auditId+"' order by auditMile.milestone";
		
		String query="select auditMile.auditmilesID,auditMile.auditID,auditMile.milestone,DATE_FORMAT(auditMile.startDate,'%Y-%m-%d') as startDate,"+
					" DATE_FORMAT(auditMile.endDate,'%Y-%m-%d') as endDate,bp.BusinessProcessName,(select count(*) from assentisk_auditplanmilesstonedetails "+
					" where auditMilesID=auditMile.auditmilesID ) as countdata,(select assignedTo from assentisk_auditplanmilesstonedetails "+
					" limit 1) as assignTo from assentisk_auditmilesstone auditMile left outer join assentisk_businessprocess bp on "+
						" bp.BusinessProcessID= auditMile.BusinessProcessID where auditID='"+auditId+"' order by auditMile.milestone ";

		//////System.out.println("query---"+query);
		List<AuditPlan> getRow = jdbcTemplate.queryForList(query);
		return getRow;
	}

	
	public List<AuditPlan> getauditmilestoneDetailslistById(String auditId){
		String query = "select * from assentisk_auditplanmilesstonedetails where auditID='"+auditId+"' order by auditMilesID";
		//////System.out.println("query---"+query);
		List<AuditPlan> getRow = jdbcTemplate.queryForList(query);
		if(getRow.size()>0){
			for(int i=0;i<getRow.size();i++){
				Map m=(Map)getRow.get(i);
				String Risk1=m.get("Risk").toString();
    			Risk1 = Risk1.replaceAll("\\<.*?\\>", "");
    			Risk1 = Risk1.replaceAll("\\&#39;", "'");
       			
       			((Map) getRow.get(i)).put("Riskdata",Risk1);
       			String Control_Objective1=m.get("Control_Objective").toString();
       			Control_Objective1 = Control_Objective1.replaceAll("\\<.*?\\>", "");
       			Control_Objective1 = Control_Objective1.replaceAll("\\&#39;", "'");
       			
       			((Map) getRow.get(i)).put("Control_Objectivedata",Control_Objective1);
       			
			}
		}
		return getRow;
	}
	
	
	public List<AuditPlan> getDistinctAssign(String auditId){
		String query = "select count(distinct(assignedTo)) as datasize ,assignedTo,auditMilesID,auditID from assentisk_auditplanmilesstonedetails where "+
						" auditID='"+auditId+"' group by auditMilesID having datasize='1'";
		//////System.out.println("query---"+query);
		List<AuditPlan> getRow = jdbcTemplate.queryForList(query);
		
		return getRow;
	}
	public List getEmployeeNamesBracketListByName() {
		
		
		String query = "select concat(ae.EmpName,'(',au.EmpUsername,')') as username  from assentisk_employees ae join assentisk_userrecord au on ae.UserRecordID = au.UserRecordID where isLicense='1' order by ae.EmployeeID";		
		List<EmployeeBean> getEmployeeList = jdbcTemplate.queryForList(query);
		
		
		return getEmployeeList;
	}
	
	public void getUpdateAssignTo(String milestoneID,String AssignTo)
	{
		String query = "update assentisk_auditplanmilesstonedetails set assignedTo='"+AssignTo+"' where auditMilesID='"+milestoneID+"'";		
		jdbcTemplate.execute(query);
	}
	

	public void updateStartDate(String detailID,String userId,String currentTime){
		String query="select * from assentisk_auditplanmilesstonedetails where detailID='"+detailID+"'";
		List getDetailsData=jdbcTemplate.queryForList(query);
		if(getDetailsData.size()>0){
			Map m=(Map)getDetailsData.get(0);
			String milesID=m.get("auditMilesID").toString();
			List<String> dateList=new ArrayList<String>();
			query="select count(det.assignedTo) as countval,det.assignedTo,miles.startDate,miles.endDate,det.EstimatedTime from assentisk_auditplanmilesstonedetails det join "+
					" assentisk_auditmilesstone miles on miles.auditmilesID=  det.auditMilesID where det.auditMilesID='"+milesID+"' group by det.assignedTo";
			List getLimit=jdbcTemplate.queryForList(query);
			//////System.out.println("query---"+query);
			if(getLimit.size()>0){
				for(int j=0;j<getLimit.size();j++){
					Map mp=(Map)getLimit.get(j);
				
					String assignTo=mp.get("assignedTo").toString();
					String startdate = mp.get("startDate").toString();
					String enddatet= "";
					 query="SELECT CAST(('"+startdate+"' + INTERVAL 10 Year) AS Date) as dateval";
						//////System.out.println("query---"+query);	
					 List getEndDate=jdbcTemplate.queryForList(query);
						if(getEndDate.size()>0){
							Map mg=(Map)getEndDate.get(0);
							enddatet=mg.get("dateval").toString();
						}
						 query="SELECT * FROM assentisk_auditplanmilesstonedetails where auditMilesID='"+milesID+"' and assignedTo='"+assignTo+"' order by detailID";
						 System.out.println("query----"+query);
						 List getestimate=jdbcTemplate.queryForList(query);
						 System.out.println("sizeee----"+getestimate.size());
						 double[] estimateTimeForEach = new double[getestimate.size()];
						 if(getestimate.size()>0){
							 for(int k=0;k<getestimate.size();k++){
							 Map estimate=(Map)getestimate.get(k);
							 	estimateTimeForEach[k] = Double.parseDouble(estimate.get("EstimatedTime").toString());
							 }
						 }	
							int countdate = estimateTimeForEach.length;
							int oldcount=countdate;
					List<Date> dates = new ArrayList<Date>();
					
					String[] startval=startdate.split("-");
					String str_dater=startval[2]+"/"+startval[1]+"/"+startval[0];
					
					
					String[] endval=enddatet.split("-");
					String end_dater=endval[2]+"/"+endval[1]+"/"+endval[0];	
					
					String str_date = str_dater;
					String end_date = end_dater;
					DateFormat formatter ; 
					formatter = new SimpleDateFormat("dd/MM/yyyy");
					Date  startDate = null; 
			        try {
			            startDate = (Date)formatter.parse(str_date);
			        } catch (Exception ex) {
			        }
			        Date  endDated = null;
			        try {
			            endDated = (Date)formatter.parse(end_date);
			        } catch (Exception ex) {
			        }
			        long interval = (24*1000 * 60 * 60); // 1 hour in millis
					long endTime =endDated.getTime() ;
			        long curTime = startDate.getTime();
					while (curTime <= endTime) {
					    dates.add(new Date(curTime));
					    curTime += interval;
					}
					double temp = estimateTimeForEach[0];
					double total = estimateTimeForEach[0];
					DateFormat format2=new SimpleDateFormat("EEEE"); 
					
					String calstartDate=str_date;
					String calenddate=str_date;
					
					double oldtemp=0;
					int flag=0;
					int check=0;
					int chkfirst=0;
					////////////System.out.println("start------");
					int l=0;
					for(int i=0;i<dates.size();){
						//////////////System.out.println("i===="+i);
					    Date lDate =(Date)dates.get(i);
					    String finalDay=format2.format(lDate);
					  //  ////////////System.out.println("finalDay-----"+finalDay);
					    String ds = formatter.format(lDate);
					  //  ////////////System.out.println("ds-----"+ds);
					   
					  //  ////////////System.out.println("iiiiii====---"+i);
					    
					    
					    if(i==0){
					    	   if(finalDay.equals("Sunday")){
					    		   
					    		 i++;
					    		 Date lDate1 =(Date)dates.get(1);
								 String ds1 = formatter.format(lDate1);
								 calstartDate=ds1;
					    		 continue;
					    	   }
					    	   else if(  finalDay.equals("Saturday")){
					    		   	 Date lDate1 =(Date)dates.get(2);
									 String ds1 = formatter.format(lDate1);
									 calstartDate=ds1;
					    			 i++;
						    		 continue;
					    	   }
					    }
					    int whilecount=0; 
					 //   ////////////System.out.println("temp---"+temp);
					    while(temp>=8){
					    	  if( finalDay.equals("Saturday") || finalDay.equals("Sunday")){
					    	
					    		  whilecount = whilecount + 1;
					    		  lDate =(Date)dates.get(i);
								  finalDay=format2.format(lDate);
					    		 break;
					    		
					    	  }
					    	  else
					    	  {
					    		  	temp=temp - 8;
					    		  	whilecount = whilecount + 1;
					    	  }
					    	
					    	
					    }
					    if( finalDay.equals("Saturday") || finalDay.equals("Sunday")){
					  	    i=i+1;
					  	    whilecount = whilecount + 1;
					    	continue;
					    }
					    if(temp > 0){
					    //	////////////System.out.println("temp---"+temp);
					    	  i = i + whilecount;
					    	//  ////////////System.out.println("whilecount---"+whilecount);
					    	//  ////////////System.out.println("i---"+i);
					    	  if(countdate > 1){
						    		
					    		  l=l+1;  
					    	  }
					    	  
					    	  total = temp + estimateTimeForEach[l];
					    	  temp=total;
					    	  	 Date lDate1 =(Date)dates.get(i);
								 String ds1 = formatter.format(lDate1);
								 String finalDay1=format2.format(lDate1);
								 if( finalDay1.equals("Saturday")){
									  lDate1 =(Date)dates.get(i+2);
									  ds1 = formatter.format(lDate1);
									
								  }
								  if( finalDay1.equals("Sunday")){
									  lDate1 =(Date)dates.get(i+1);
									  ds1 = formatter.format(lDate1);
									  
								  }
								 calenddate=ds1;
								 
								 System.out.println("calstartDate--"+calstartDate);
						    	 System.out.println("calenddate---"+calenddate);
						    	 dateList.add(calstartDate+","+calenddate);
						    	 calstartDate=calenddate;
							//	////////////System.out.println("total---"+total); 
					    	 
					    	 
					    	  countdate =countdate - 1;
					    	//	////////////System.out.println("countdate---"+total); 
					    	  if(countdate==0){
					    		  break;
					    	  }
					    	
					    }
					    else if(temp== 0 && estimateTimeForEach[l]<=8){
					    	////////////System.out.println("inside else");
					    	     Date lDate1 =(Date)dates.get(i);
								 String ds1 = formatter.format(lDate1);
								 String finalDay1=format2.format(lDate1);
								 if( finalDay1.equals("Saturday")){
									  lDate1 =(Date)dates.get(i+2);
									  ds1 = formatter.format(lDate1);
									
								  }
								  if( finalDay1.equals("Sunday")){
									  lDate1 =(Date)dates.get(i+1);
									  ds1 = formatter.format(lDate1);
									  
								  }
								 calenddate=ds1;
					    	 System.out.println("calstartDate--"+calstartDate);
					    	 System.out.println("calenddate---"+calenddate);
					    	  dateList.add(calstartDate+","+calenddate);
					    	      lDate1 =(Date)dates.get(i+1);
								  ds1 = formatter.format(lDate1);
								  finalDay1=format2.format(lDate1);
								  if( finalDay1.equals("Saturday")){
									  lDate1 =(Date)dates.get(i+3);
									  ds1 = formatter.format(lDate1);
									
								  }
								  if( finalDay1.equals("Sunday")){
									  lDate1 =(Date)dates.get(i+2);
									  ds1 = formatter.format(lDate1);
									  
								  }
								 calstartDate=ds1;
							 
								  i = i + whilecount;
								  if(countdate > 1){
						    		
						    		  l=l+1;  
						    	  }



						    	  total = temp + estimateTimeForEach[l];
						    	  temp=total;
					    	  countdate=countdate-1;
					    	  if(countdate==0){
					    		  break;
					    	  }
					    	
					    }
					    else if(temp== 0) {
					   // 	////////////System.out.println("temp---"+temp);
					    	  i = i + whilecount;
					    //	  ////////////System.out.println("whilecount---"+whilecount);
					    //	  ////////////System.out.println("i---"+i);
					    	  if(countdate > 1){
						    		
					    		  l=l+1;  
					    	  }

					    	  total = temp + estimateTimeForEach[l];
					    	  temp=total;
					    	  	 Date lDate1 =(Date)dates.get(i);
								 String ds1 = formatter.format(lDate1);
								 String finalDay1=format2.format(lDate1);
								 if( finalDay1.equals("Saturday")){
									  lDate1 =(Date)dates.get(i+2);
									  ds1 = formatter.format(lDate1);
									
								  }
								  if( finalDay1.equals("Sunday")){
									  lDate1 =(Date)dates.get(i+1);
									  ds1 = formatter.format(lDate1);
									  
								  }
								 calenddate=ds1;
								 
								 System.out.println("calstartDate--"+calstartDate);
						    	 System.out.println("calenddate---"+calenddate);
						    	 dateList.add(calstartDate+","+calenddate);
						    	// ////////////System.out.println("else condition on temp equal to zero");

									 calstartDate=ds1;
								//////////////System.out.println("total---"+total); 
					    	 countdate =countdate - 1;
					    	//	////////////System.out.println("countdate---"+total); 
					    	  if(countdate==0){
					    		  break;
					    	  }
					    	}

							}
					////System.out.println("dateList----"+dateList);
					query="select * from assentisk_auditplanmilesstonedetails where auditMilesID='"+milesID+"' and assignedTo ='"+assignTo+"' order by detailID";
					////System.out.println("query---"+query);
					List getControls=jdbcTemplate.queryForList(query);
					for(int i=0;i<getControls.size();i++){
							 Map mpp=(Map)getControls.get(i);
							 String startdatevalue="";
							 String enddatevalue="";
							 String startmodify="";
							 String endmodify="";
								if(dateList.size()>0){	
									String []datemod=dateList.get(i).toString().split(",");
									////System.out.println("list data---"+dateList.get(i).toString());
									////System.out.println("length---"+datemod.length);
									 startdatevalue=datemod[0];
									 enddatevalue=datemod[1];
									 

									    String []datemod1=startdatevalue.split("/");
										startmodify = datemod1[2]+"-"+datemod1[1]+"-"+datemod1[0];
										String []datemod2=enddatevalue.split("/");
										endmodify = datemod2[2]+"-"+datemod2[1]+"-"+datemod2[0];
								}
							 query="update assentisk_auditplanmilesstonedetails set startDate='"+startmodify+"',endDate='"+endmodify+"' where detailID='"+mpp.get("detailID")+"'";
							 jdbcTemplate.execute(query);
						 }
					
							dateList.removeAll(dateList);
							String endvaldate="";
							 query="select max(endDate)as endDate from assentisk_auditplanmilesstonedetails where auditMilesID='"+milesID+"'";
							 List getDateval=jdbcTemplate.queryForList(query);
							 if(getDateval.size()>0){
								 Map mpu=(Map)getDateval.get(0);
								 endvaldate=mpu.get("endDate").toString();
								 query="update assentisk_auditmilesstone set endDate='"+endvaldate+"',updatedBy='"+userId+"',updatedDate='"+currentTime+"' where auditmilesID='"+milesID+"'";
								 jdbcTemplate.execute(query);
								 
							 }
					 
					
					
					
					
					
					
				}
				
			}
		}
		
		
		
	}
	
	
	public int totalControls(String businessProc){
	
		int  totalControls= jdbcTemplate.queryForInt("select count(*) from riskdcoument where businessID IN(select BusinessProcessID from  assentisk_businessprocess where BusinessProcessName='"+businessProc+"')");
		return totalControls;
	}

	public List<AuditPlan> getauditmilestoneDetails(String auditid,
			String auditMilesID){
		
		String query = "select * from assentisk_auditplanmilesstonedetails where auditID='"+auditid+"' and auditMilesID='"+auditMilesID+"'  order by auditMilesID";
		//////System.out.println("query---"+query);
		List<AuditPlan> getRow = jdbcTemplate.queryForList(query);
		return getRow;
		
	}
	

	public void updateAssignAll(String milestoneID, String assignTo,String userId,String currentTime){
		
		String query="select * from assentisk_auditmilesstone where auditmilesID='"+milestoneID+"'";
		List getList=jdbcTemplate.queryForList(query);
		String startdate="";
		String endDate="";
		if(getList.size()>0){
			Map nh=(Map)getList.get(0);
			startdate=nh.get("startDate").toString();
		//	endDate=nh.get("endDate").toString();
		}
		 query="SELECT CAST(('"+startdate+"' + INTERVAL 10 Year) AS Date) as dateval";
			List getEndDate=jdbcTemplate.queryForList(query);
			if(getEndDate.size()>0){
				Map m=(Map)getEndDate.get(0);
				endDate=m.get("dateval").toString();
			}
			
		 query="SELECT * FROM assentisk_auditplanmilesstonedetails where auditMilesID='"+milestoneID+"'";
		 System.out.println(query);
		 List getestimate=jdbcTemplate.queryForList(query);
		 double[] estimateTimeForEach = new double[getestimate.size()];
		 if(getestimate.size()>0){
			 for(int k=0;k<getestimate.size();k++){
			 Map estimate=(Map)getestimate.get(k);
			 	estimateTimeForEach[k] = Double.parseDouble(estimate.get("EstimatedTime").toString());
			 	System.out.println(estimateTimeForEach[k] +"-----k====="+k);
			 }
		 }

		
		
		 query="SELECT * FROM assentisk_auditplanmilesstonedetails where auditMilesID='"+milestoneID+"' order by detailID ";
		 List getControls=jdbcTemplate.queryForList(query);
		
		 int countControls=getControls.size();
		 
			List<Date> dates = new ArrayList<Date>();
			
			String[] startval=startdate.split("-");
			String str_dater=startval[2]+"/"+startval[1]+"/"+startval[0];
			
			
			String[] endval=endDate.split("-");
			String end_dater=endval[2]+"/"+endval[1]+"/"+endval[0];	
			
			String str_date = str_dater;
			String end_date = end_dater;
			DateFormat formatter ; 
			formatter = new SimpleDateFormat("dd/MM/yyyy");
			Date  startDate = null; 
	        try {
	            startDate = (Date)formatter.parse(str_date);
	        } catch (Exception ex) {
	        }
	        Date  endDated = null;
	        try {
	            endDated = (Date)formatter.parse(end_date);
	        } catch (Exception ex) {
	        }
	        long interval = (24*1000 * 60 * 60); // 1 hour in millis
			long endTime =endDated.getTime() ;
	        long curTime = startDate.getTime();
			while (curTime <= endTime) {
			    dates.add(new Date(curTime));
			    curTime += interval;
			}
			double temp = estimateTimeForEach[0];
			double total = estimateTimeForEach[0];
			int len=estimateTimeForEach.length;
			DateFormat format2=new SimpleDateFormat("EEEE"); 
			
			String calstartDate=str_date;
			String calenddate=str_date;
			int countdate = estimateTimeForEach.length;
			System.out.println("length---"+countdate);
			double oldtemp=0;
			int flag=0;
			int check=0;
			int chkfirst=0;
			List<String> dateList=new ArrayList<String>();
			//////System.out.println(dates.size());
			int l=0;
			for(int i=0;i<dates.size();){
				//////////////System.out.println("i===="+i);
			    Date lDate =(Date)dates.get(i);
			    String finalDay=format2.format(lDate);
			  //  ////////////System.out.println("finalDay-----"+finalDay);
			    String ds = formatter.format(lDate);
			  //  ////////////System.out.println("ds-----"+ds);
			   
			  //  ////////////System.out.println("iiiiii====---"+i);
			    
			    
			    if(i==0){
			    	   if(finalDay.equals("Sunday")){
			    		   
			    		 i++;
			    		 Date lDate1 =(Date)dates.get(1);
						 String ds1 = formatter.format(lDate1);
						 calstartDate=ds1;
			    		 continue;
			    	   }
			    	   else if(  finalDay.equals("Saturday")){
			    		   	 Date lDate1 =(Date)dates.get(2);
							 String ds1 = formatter.format(lDate1);
							 calstartDate=ds1;
			    			 i++;
				    		 continue;
			    	   }
			    }
			    int whilecount=0; 
			 //   ////////////System.out.println("temp---"+temp);
			    while(temp>=8){
			    	  if( finalDay.equals("Saturday") || finalDay.equals("Sunday")){
			    	
			    		  whilecount = whilecount + 1;
			    		  lDate =(Date)dates.get(i);
						  finalDay=format2.format(lDate);
			    		 break;
			    		
			    	  }
			    	  else
			    	  {
			    		  	temp=temp - 8;
			    		  	whilecount = whilecount + 1;
			    	  }
			    	
			    	
			    }
			    if( finalDay.equals("Saturday") || finalDay.equals("Sunday")){
			  	    i=i+1;
			  	    whilecount = whilecount + 1;
			    	continue;
			    }
			    if(temp > 0){
			    //	////////////System.out.println("temp---"+temp);
			    	  i = i + whilecount;
			    	//  ////////////System.out.println("whilecount---"+whilecount);
			    	//  ////////////System.out.println("i---"+i);
			    	  System.out.println( estimateTimeForEach[l]);
			    	  if(countdate > 1){
				    		
			    		  l=l+1;  
			    	  }
			    	 
			    	  System.out.println("llll-------"+l);
			    	  total = temp + estimateTimeForEach[l];
			    	  System.out.println("total----"+total+"----estimate----"+estimateTimeForEach[l]);
			    	  temp=total;
			    	  	 Date lDate1 =(Date)dates.get(i);
						 String ds1 = formatter.format(lDate1);
						 String finalDay1=format2.format(lDate1);
						 if( finalDay1.equals("Saturday")){
							  lDate1 =(Date)dates.get(i+2);
							  ds1 = formatter.format(lDate1);
							
						  }
						  if( finalDay1.equals("Sunday")){
							  lDate1 =(Date)dates.get(i+1);
							  ds1 = formatter.format(lDate1);
							  
						  }
						 calenddate=ds1;
						 
						System.out.println("calstartDate--"+calstartDate);
				    	System.out.println("calenddate---"+calenddate);
				    	 dateList.add(calstartDate+","+calenddate);
				    	 calstartDate=calenddate;
					//	////////////System.out.println("total---"+total); 
			    	 
			    	 
			    	  countdate =countdate - 1;
			    	//	////////////System.out.println("countdate---"+total); 
			    	  if(countdate<=0){
			    		  break;
			    	  }
			    	
			    }
			    else if(temp== 0 && estimateTimeForEach[l]<=8){
			    	////////////System.out.println("inside else");
			    	     Date lDate1 =(Date)dates.get(i);
						 String ds1 = formatter.format(lDate1);
						 String finalDay1=format2.format(lDate1);
						 if( finalDay1.equals("Saturday")){
							  lDate1 =(Date)dates.get(i+2);
							  ds1 = formatter.format(lDate1);
							
						  }
						  if( finalDay1.equals("Sunday")){
							  lDate1 =(Date)dates.get(i+1);
							  ds1 = formatter.format(lDate1);
							  
						  }
						 calenddate=ds1;
			    	System.out.println("calstartDate--"+calstartDate);
			    	 System.out.println("calenddate---"+calenddate);
			    	  dateList.add(calstartDate+","+calenddate);
			    	      lDate1 =(Date)dates.get(i+1);
						  ds1 = formatter.format(lDate1);
						  finalDay1=format2.format(lDate1);
						  if( finalDay1.equals("Saturday")){
							  lDate1 =(Date)dates.get(i+3);
							  ds1 = formatter.format(lDate1);
							
						  }
						  if( finalDay1.equals("Sunday")){
							  lDate1 =(Date)dates.get(i+2);
							  ds1 = formatter.format(lDate1);
							  
						  }
						 calstartDate=ds1;
					 
						  i = i + whilecount;
						  System.out.println( estimateTimeForEach[l]);
						  if(countdate > 1){
					    	
				    		  l=l+1;  
				    	  }

				    	  System.out.println("llll-------"+l);
				    	  total = temp + estimateTimeForEach[l];
				    	  System.out.println("total----"+total+"----estimate----"+estimateTimeForEach[l]);
						
				    	  temp=total;
			    	  countdate=countdate-1;
			    	  if(countdate<=0){
			    		  break;
			    	  }
			    	
			    }
			    else if(temp== 0) {
			   // 	////////////System.out.println("temp---"+temp);
			    	  i = i + whilecount;
			    //	  ////////////System.out.println("whilecount---"+whilecount);
			    //	  ////////////System.out.println("i---"+i);
			    	  
			    	  System.out.println( estimateTimeForEach[l]);
			    	  if(countdate > 1){
				    		
			    		  l=l+1;  
			    	  }
			    	  System.out.println("llll-------"+l);
			    	  total = temp + estimateTimeForEach[l];
			    	  System.out.println("total----"+total+"----estimate----"+estimateTimeForEach[l]);
					
			    	//  total = temp + estimateTimeForEach;
			    	  temp=total;
			    	  	 Date lDate1 =(Date)dates.get(i);
						 String ds1 = formatter.format(lDate1);
						 String finalDay1=format2.format(lDate1);
						 if( finalDay1.equals("Saturday")){
							  lDate1 =(Date)dates.get(i+2);
							  ds1 = formatter.format(lDate1);
							
						  }
						  if( finalDay1.equals("Sunday")){
							  lDate1 =(Date)dates.get(i+1);
							  ds1 = formatter.format(lDate1);
							  
						  }
						 calenddate=ds1;
						 
						System.out.println("calstartDate--"+calstartDate);
				   	System.out.println("calenddate---"+calenddate);
				    	 dateList.add(calstartDate+","+calenddate);
				    	// ////////////System.out.println("else condition on temp equal to zero");

							 calstartDate=ds1;
						//////////////System.out.println("total---"+total); 
			    	 countdate =countdate - 1;
			    	//	////////////System.out.println("countdate---"+total); 
			    	  if(countdate<=0){
			    		  break;
			    	  }
			    	}

					}
			
			
			
			
			System.out.println("dateList---"+dateList);
		 if(getControls.size()>0){
			 for(int i=0;i<getControls.size();i++){
				 Map m=(Map)getControls.get(i);
				 String startdatevalue="";
				 String enddatevalue="";
				 String startmodify="";
				 String endmodify="";
					if(dateList.size()>0){	
						String []datemod=dateList.get(i).toString().split(",");
						////////////System.out.println("list data---"+dateList.get(i).toString());
						////////////System.out.println("length---"+datemod.length);
						 startdatevalue=datemod[0];
						 enddatevalue=datemod[1];
						 
						    String []datemod1=startdatevalue.split("/");
							startmodify = datemod1[2]+"-"+datemod1[1]+"-"+datemod1[0];
							String []datemod2=enddatevalue.split("/");
							endmodify = datemod2[2]+"-"+datemod2[1]+"-"+datemod2[0];
					}
				 query="update assentisk_auditplanmilesstonedetails set SerialNoPerMiles='"+(i+1)+"',dependencyNo='"+i+"',startDate='"+startmodify+"',endDate='"+endmodify+"' where detailID='"+m.get("detailID")+"'";
				 jdbcTemplate.execute(query);
			
				 
			
			 }
		 }
		 
		 String endvaldate="";
		 query="select max(endDate)as endDate from assentisk_auditplanmilesstonedetails where auditMilesID='"+milestoneID+"'";
		 List getDateval=jdbcTemplate.queryForList(query);
		 if(getDateval.size()>0){
			 Map mpu=(Map)getDateval.get(0);
			 endvaldate=mpu.get("endDate").toString();
			 query="update assentisk_auditmilesstone set endDate='"+endvaldate+"',updatedBy='"+userId+"',updatedDate='"+currentTime+"' where auditmilesID='"+milestoneID+"'";
			 jdbcTemplate.execute(query);
			 
		 }
		 
		
	}

	public void getUpdateSingleAssignTo(String detailID,String AssignTo,String auditid)
	{
		String query="select * from assentisk_auditplanmilesstonedetails where detailID='"+detailID+"'";
		////////////System.out.println("query---"+query);
		List getDetailsData=jdbcTemplate.queryForList(query);
		if(getDetailsData.size()>0){
			Map m=(Map)getDetailsData.get(0);
			String milesID=m.get("auditMilesID").toString();
			String dependencyNo=m.get("dependencyNo").toString();
			String serialNo=m.get("SerialNoPerMiles").toString();
			String oldassign=m.get("assignedTo").toString();
			query="select * from assentisk_auditplanmilesstonedetails where assignedTo='"+AssignTo+"' and SerialNoPerMiles<"+serialNo+" and auditID='"+auditid+"' and auditMilesID= '"+milesID+"' "+
			" order by detailID DESC  Limit 0,1";
			////////////System.out.println("query---"+query);

			List getdata=jdbcTemplate.queryForList(query);
			if(getdata.size()>0){
				Map mp=(Map)getdata.get(0);
				query = "update assentisk_auditplanmilesstonedetails set assignedTo='"+AssignTo+"' , dependencyNo='"+mp.get("SerialNoPerMiles").toString()+"' where detailID='"+detailID+"' ";	
				////////////System.out.println("query---"+query);
				 jdbcTemplate.execute(query);
			}
			else
			{
				query = "update assentisk_auditplanmilesstonedetails set assignedTo='"+AssignTo+"' , dependencyNo='0' where detailID='"+detailID+"'";	
				////////////System.out.println("query---"+query);
				 jdbcTemplate.execute(query);
				 
				 query="update assentisk_auditplanmilesstonedetails set dependencyNo='"+serialNo+"'  where assignedTo='"+AssignTo+"' and SerialNoPerMiles>"+serialNo+" and auditID='"+auditid+"' and auditMilesID= '"+milesID+"' "+
					" order by SerialNoPerMiles Limit 1";
				 ////////////System.out.println("query---"+query);
				 jdbcTemplate.execute(query);
			}
			
			
			query="select * from assentisk_auditplanmilesstonedetails where  dependencyNo='"+serialNo+"' and auditMilesID='"+milesID+"' and auditID='"+auditid+"' and assignedTo='"+oldassign+"'";
			////////////System.out.println("query---"+query);
			List getdependency=jdbcTemplate.queryForList(query);
			if(getdependency.size()>0){
				Map mk=(Map)getdependency.get(0);
				String assignData=mk.get("assignedTo").toString();
				String serial=mk.get("SerialNoPerMiles").toString();
				String detailIDdata=mk.get("detailID").toString();
				query="select * from assentisk_auditplanmilesstonedetails where assignedTo='"+assignData+"' and SerialNoPerMiles<"+serial+" and auditMilesID='"+milesID+"' and auditID='"+auditid+"' "+
				" order by detailID DESC  Limit 0,1";
				////////////System.out.println("query---"+query);
				List getchangeDependency=jdbcTemplate.queryForList(query);
				if(getchangeDependency.size()>0){
					Map mg=(Map)getchangeDependency.get(0);
					query = "update assentisk_auditplanmilesstonedetails set dependencyNo='"+mg.get("SerialNoPerMiles").toString()+"' where detailID='"+detailIDdata+"'";	
					 jdbcTemplate.execute(query);
					 ////////////System.out.println("query---"+query);
				}
				else
				{
					query = "update assentisk_auditplanmilesstonedetails set dependencyNo='0' where detailID='"+detailIDdata+"'";	
					 jdbcTemplate.execute(query);
					 ////////////System.out.println("query---"+query);
				}
				
			}
			
			 
			 String endvaldate="";
			 query="select max(endDate)as endDate from assentisk_auditplanmilesstonedetails where auditMilesID='"+milesID+"'";
			 List getDateval=jdbcTemplate.queryForList(query);
			 if(getDateval.size()>0){
				 Map mpu=(Map)getDateval.get(0);
				 endvaldate=mpu.get("endDate").toString();
				 query="update assentisk_auditmilesstone set endDate='"+endvaldate+"' where auditmilesID='"+milesID+"'";
				 jdbcTemplate.execute(query);
				 
			 }
	
		}
		
		
		
	}
	
	
	public List<AuditPlanMiles> historyDetails(String auditid){
		String query="select a.auditmilesID,a.startDate,a.endDate,(select EmpName from assentisk_userrecord where UserRecordID =a.createdBy) " +
				" as createdBy,(select EmpName from assentisk_userrecord where UserRecordID =a.approver) as approveBy,a.status,a.versions from assentisk_auditmilesstone as a where a.auditID='"+auditid+"' group by a.versions";
		System.out.println("query---"+query);
		List getMiles=jdbcTemplate.queryForList(query);
		return getMiles;
		
	}
	
	public void sendForApprover(String auditid,String approver){
		List maxversion=jdbcTemplate.queryForList("select max(versions) as ver from assentisk_auditmilesstone where auditID='"+auditid+"'");
		int max=0;
		if(maxversion.size()>0){
			Map mj=(Map)maxversion.get(0);
			 max=Integer.parseInt(mj.get("ver").toString());
		}
		
		 max = max + 1;
		
		String query="update assentisk_auditmilesstone set status='Pending for Approval',approver='"+approver+"',versions='"+max+"' where auditID='"+auditid+"' and versions IN ('0')";
		jdbcTemplate.execute(query);
		 
	}
	public String getUserId(String Username){
		String userID="";
		String query = "select UserRecordID from assentisk_userrecord where EmpUsername='"+Username+"'";
		//System.out.println("query: " + query);
		List getRow = jdbcTemplate.queryForList(query);
		if(getRow.size()>0){
			Map m=(Map)getRow.get(0);
			userID=m.get("UserRecordID").toString();
		}
		
		return (String) userID;
	}
	public List<AuditPlan> getfreshStatus(String auditid){
		String query="select * from assentisk_auditmilesstone where auditID='"+auditid+"' and status='0' group by versions desc limit 1";
		List getRow=jdbcTemplate.queryForList(query);
		return getRow;
	}

	public List<AuditPlan> getstatus(String auditid){
 		String query = "select * from assentisk_auditmilesstone where auditID='"+auditid+"' and (status='Pending for Approval'  or status='Approved') group by versions desc limit 1";
 		//System.out.println("query----"+query);
 		List<AuditPlan> list = jdbcTemplate.queryForList(query);
 		return list;
 	}
	public void approve(String auditid){
		
		String query="update assentisk_auditmilesstone set status='Approved'  where auditID='"+auditid+"' and status='Pending for Approval'";
		 jdbcTemplate.execute(query);
	
		
	}
	public String getUserIddata(String userId){
		String username="";
		String query = "select concat(ae.EmpName,'(',au.EmpUsername,')') as userval from assentisk_employees ae join assentisk_userrecord au " +
				"on ae.UserRecordID = au.UserRecordID where  ae.UserRecordID='"+userId+"'   order by ae.EmployeeID	";		
		//System.out.println("query----"+query);
		List<EmployeeBean> getEmployeeList = jdbcTemplate.queryForList(query);
		if(getEmployeeList.size()>0)
		{
			Map m=(Map)getEmployeeList.get(0);
			username=m.get("userval").toString();
		}
		
		return username;
	}
	
	public List<TestAssessment> getMileTest(String username,String miles){
		
		String query="select d.detailID,d.controlID,d.Risk,d.Control_Objective,d.startDate,d.endDate,m.versions, "+
		"(select BusinessProcessName from assentisk_businessprocess where BusinessProcessID=m.BusinessProcessID) as" +
		" business from assentisk_auditplanmilesstonedetails  d join assentisk_auditmilesstone m on m.auditmilesID=d.auditMilesID "+
		" where d.assignedTo='"+username+"' and d.auditMilesID IN ("+miles+") order by d.detailID ";
		System.out.println("query---"+query);
		List<TestAssessment> getRowdat=jdbcTemplate.queryForList(query);
		if(getRowdat.size()>0){
			for(int i=0;i<getRowdat.size();i++){
				Map m=(Map)getRowdat.get(i);
				String Risk1=m.get("Risk").toString();
    			Risk1 = Risk1.replaceAll("\\<.*?\\>", "");
    			Risk1 = Risk1.replaceAll("\\&#39;", "'");
       			
       			((Map) getRowdat.get(i)).put("Risk1",Risk1);
       			
       			String Control_Objective1=m.get("Control_Objective").toString();
       			Control_Objective1 = Control_Objective1.replaceAll("\\<.*?\\>", "");
       			Control_Objective1 = Control_Objective1.replaceAll("\\&#39;", "'");
       			
       			((Map) getRowdat.get(i)).put("Control_Objective1",Control_Objective1);
       			
       		   
			}
		}
		return getRowdat;

	}
	
	public String getMilesVal(String username){
		String miles="";
		String query="select ifnull(group_concat(distinct(detail.auditMilesID)),'0') as milestone from assentisk_auditplanmilesstonedetails detail join " +
		" assentisk_auditmilesstone miles on miles.auditmilesID=detail.auditMilesID where assignedTo='"+username+"' and " +
		" miles.status='Approved'";
			List getRow=jdbcTemplate.queryForList(query);
			if(getRow.size()>0){
				Map m=(Map)getRow.get(0);
				 miles=m.get("milestone").toString();
			}
			return miles;
	}
	
	public List<PolicyBean> getPolicyList(String userId,String empID){
		String query="select p.id,p.number,p.title,p.location,p.department,p.createdBy,(select EmpName from assentisk_userrecord  "+
					" where UserRecordID=p.ModifiedBy ) as user,p.CreatedDate,p.ModifiedBy,p.ModifiedDate,p.version,p.status," +
					" ('"+empID+"' IN (select EmpID from  assentisk_policylog where policyID=p.id and status='Approved')) as circular," +
					"('"+userId+"' = (p.assignedTo)) as assignedapprove,('"+userId+"' = (p.createdBy)) as creator,(select ifnull(max(id),'') as " +
					"iddata from assentisk_policy where number = (select number from assentisk_policy where id=p.id) and status='Approved') as " +
					"oldpolicyID from  assentisk_policy as p where p.id IN (select max(id) as id from assentisk_policy group by number) and " +
					"('"+empID+"' IN (select EmpID from  assentisk_policylog where policyID=p.id and status='Approved') " +
							" or ('"+userId+"' = (p.createdBy)) or ('"+userId+"' = (p.assignedTo)) )" +
					" order by p.number  ";	
		System.out.println("query---"+query);
		List getRow=jdbcTemplate.queryForList(query);

		if(getRow.size()>0){
			for(int i=0;i<getRow.size();i++){
				Map mp=(Map)getRow.get(i);
				List<LocationsBean> list = jdbcTemplate.queryForList("select ifnull(GROUP_CONCAT(`Name`),'') as Locations from assentisk_company_locations where LocationID IN ("+mp.get("location").toString()+")");
				Map getLoc=(Map)list.get(0);
				String Locations=getLoc.get("Locations").toString();
				((Map) getRow.get(i)).put("LocationsData",Locations);
				
				List<DepartmentBean> listDivisions = jdbcTemplate.queryForList("select ifnull(GROUP_CONCAT(`DeptName`),'')as DeptName from assentisk_company_department where DepartmentID IN ("+mp.get("department").toString()+")");
				Map gdep=(Map)listDivisions.get(0);
				String departments=gdep.get("DeptName").toString();
				((Map) getRow.get(i)).put("departmentData",departments);
			}
		}
			
		return getRow;
	}
		
	
	@SuppressWarnings("unchecked")
	public List<DepartmentBean> getDepartmentGroupList(){
		String query = "select ifnull(concat(group_concat(DeptName,''),','),'') as DeptName from assentisk_company_department order by DepartmentID";
		List<DepartmentBean> getRow = jdbcTemplate.queryForList(query);
		return getRow;
	}
	
	public void updatePolicy(String title,String department,String userId,String location,String textdata,String currentTime,String assignedTo){
		int  number= jdbcTemplate.queryForInt("select max(number) from assentisk_policy");
		number =number + 1;
		String textvalue=textdata.replaceAll("'", "XXsingleXX");
		//textvalue="\"" +textvalue+"\"";
		String query="INSERT INTO assentisk_policy(number,title,location,department,textdata,createdBy,CreatedDate,ModifiedBy,ModifiedDate,status,assignedTo) " +
	 		"values('"+number+"','"+title+"','"+location+"','"+department+"','"+textvalue+"','"+userId+"','"+currentTime+"','"+userId+"','"+currentTime+"','Pending for Approval','"+assignedTo+"')";
		System.out.println("query----"+query);
	 jdbcTemplate.execute(query);
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
	
	public List<PolicyBean> getPolicyData(String policyno){
		String query="";
		query="select * from assentisk_policy where id='"+policyno+"'";
		List getRow=jdbcTemplate.queryForList(query);
		if(getRow.size()>0){
			for(int i=0;i<getRow.size();i++){
				Map m=(Map)getRow.get(i);
				String textdata=m.get("textdata").toString();
				textdata = textdata.replaceAll("\\<.*?\\>", "");
				textdata = textdata.replaceAll("\\&#39;", "'");
       			((Map) getRow.get(i)).put("textdataval",textdata);
			}
		}
		return getRow;
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
	
	public void editPolicy(String policyid,String title,String department,String userId,String location,String textdata,String currentTime,String responsiblehead){
		String textvalue=textdata.replaceAll("'", "XXsingleXX");
		
		//String query="update assentisk_policy set title='"+title+"',location='"+location+"',department='"+department+"'," +
		//		"ModifiedBy='"+userId+"',ModifiedDate='"+currentTime+"',textdata='"+textvalue+"' where number='"+policyno+"' ";
		int number=jdbcTemplate.queryForInt("select number from assentisk_policy where id='"+policyid+"' limit 1");
		System.out.println("select number from assentisk_policy where id='"+policyid+"' limit 1");
		int  version = jdbcTemplate.queryForInt("select max(version) from assentisk_policy where number='"+number+"'");
		System.out.println("select max(version) from assentisk_policy where number='"+number+"'");
		version = version + 1;
		String query="Insert into assentisk_policy(number,title,location,department,textdata,createdBy,CreatedDate,ModifiedBy,ModifiedDate,version,status,assignedTo)" +
				" values('"+number+"','"+title+"','"+location+"','"+department+"','"+textvalue+"','"+userId+"','"+currentTime+"','"+userId+"'," +
						"'"+currentTime+"','"+version+"','Pending for Approval','"+responsiblehead+"')";
    	 jdbcTemplate.execute(query);
	}
	
	public void updatetime(String detailID,String time){
		String query="update assentisk_auditplanmilesstonedetails set EstimatedTime='"+time+"' where detailID='"+detailID+"' ";
		jdbcTemplate.execute(query);
	}
	
	
	public List<EmployeeBean> getEmployeeList(String policyno,String userId){
		
		String query="select * from assentisk_policy where id='"+policyno+"' ";
		List getPolicy=jdbcTemplate.queryForList(query);
		List getRow=null;
		if(getPolicy.size()>0){
			Map m=(Map)getPolicy.get(0);
			String location=m.get("location").toString();
			String dep=m.get("department").toString();
			String policyVal=m.get("number").toString();
		 query="select p.number,p.title,p.location" +
				",p.department,p.textdata,e.EmpName,e.Email,e.EmployeeID from assentisk_policy as p," +
				" assentisk_employees  as e where  p.id='"+policyno+"' and e.DepartmentID IN ("+dep+") and e.LocationID IN ("+location+") and e.EmployeeID Not IN( "+
				" select concat(EmpID,',') as emp from assentisk_policylog where policyID='"+policyno+"') and e.EmployeeID!='"+userId+"'";
		 System.out.println("query---"+query);
		 getRow=jdbcTemplate.queryForList(query);
		}
		return getRow;
	}
	

	public List<PolicyBean> getPolicyByID(String policyID,String EmpIDs){
		String query="select * from assentisk_policy where id='"+policyID+"' ";
		List getPolicy=jdbcTemplate.queryForList(query);
		List getRow=null;
		if(getPolicy.size()>0){
			Map m=(Map)getPolicy.get(0);
			String location=m.get("location").toString();
			String dep=m.get("department").toString();
			 query="select p.id,p.number,p.title,p.location,p.department,p.textdata,e.EmpName,e.Email,e.EmployeeID from assentisk_policy as p, assentisk_employees "+
				" as e where p.id='"+policyID+"' and  e.DepartmentID IN ("+dep+") and e.LocationID IN ("+location+") and e.EmployeeID IN ("+EmpIDs+")";	
		
		 getRow=jdbcTemplate.queryForList(query);
	
		}
			return getRow;
	}
	
	
	public void insertPolicyByID(String policyID, String empIDs,String currentTime,String userId){
		String query="select * from assentisk_policy where id='"+policyID+"' ";
		List getPolicy=jdbcTemplate.queryForList(query);
		if(getPolicy.size()>0){
			Map m=(Map)getPolicy.get(0);
			String location=m.get("location").toString();
			String dep=m.get("department").toString();
			query="INSERT INTO assentisk_policylog (policyID,location,department,createdBy,CreatedDate,status,EmpID) SELECT p.id,p.location,p.department," +
				"'"+userId+"','"+currentTime+"','Pending For Approval',e.EmployeeID  from assentisk_policy as p, assentisk_employees "+
				" as e where p.id='"+policyID+"' and  e.DepartmentID IN ("+dep+") and e.LocationID IN ("+location+") and e.EmployeeID IN ("+empIDs+") ";
			System.out.println("query-----"+query);
			jdbcTemplate.execute(query);
	
		}
	}
	
	
	public void updatePolicyApproverStatus(String policyID,String empID,String data){
		String query="update assentisk_policylog set status='"+data+"' where policyID='"+policyID+"' and EmpID='"+empID+"'";
		jdbcTemplate.execute(query);
	}
	
	public List<AuditPlanMiles> logDetails(String policyID){
		String query="select p.id,p.policyID,p.location,p.department,p.createdBy,p.CreatedDate,p.status,(select EmpName from assentisk_employees " +
				" where EmployeeID= p.EmpID) as employee,(select EmpName from assentisk_employees where EmployeeID= p.createdBy) as createBy "+
				" from assentisk_policylog as p where policyID='"+policyID+"'";	
		System.out.println("query---"+query);
		List getRow=jdbcTemplate.queryForList(query);
		return getRow;
	}
	
	public List<AuditPlanMiles> policyhistoryDetails(String policyid){
		
			String query="select p.title,p.CreatedDate,p.version,(select EmpName from assentisk_employees where UserRecordID=p.createdBy ) as createdBy "+
							" from assentisk_policy as p where p.number IN (select number from assentisk_policy where id='"+policyid+"')";
			List getRow=jdbcTemplate.queryForList(query);
			return getRow;
	
		
	}
	
public String checkResponsibleHead(String empName) {
		
		String query = "select UserRecordID from assentisk_userrecord where EmpUsername = '"+empName+"'";
		System.out.println("query: " + query);
		String userID="";
		List<EmployeeBean> getRow = jdbcTemplate.queryForList(query);
		if(getRow.size()>0){
			Map m=(Map)getRow.get(0);
			userID=m.get("UserRecordID").toString();
		}
		return userID;
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

public String getEmpID(String userId){

	String query = "select EmployeeID  from assentisk_employees where UserRecordID='"+userId+"'";
	System.out.println("query: " + query);
	String empID="";
	List<EmployeeBean> getRow = jdbcTemplate.queryForList(query);
	if(getRow.size()>0){
		Map m=(Map)getRow.get(0);
		empID=m.get("EmployeeID").toString();
	}
	return empID;
}
public List getPolicyByID(String policyno){
	String query="select * from assentisk_policy where id='"+policyno+"'";
	List<PolicyBean> getRow=jdbcTemplate.queryForList(query);
	return getRow;
}

public void updatePolicyStatus(String policyID){
	String query="update  assentisk_policy set status='Approved' where id='"+policyID+"'";
	jdbcTemplate.execute(query);
}

public void updatePolicyStatus(String policyID, String status) {
	String query="update  assentisk_policy set status='"+status+"' where id='"+policyID+"'";
	jdbcTemplate.execute(query);
	
}
}
