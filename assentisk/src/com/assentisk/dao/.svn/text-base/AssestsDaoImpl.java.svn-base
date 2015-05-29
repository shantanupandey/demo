package com.assentisk.dao;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Map;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.ui.ModelMap;

import com.assentisk.bean.AmcAssetBean;
import com.assentisk.bean.AssetsBean;
import com.assentisk.bean.AuditPlan;
import com.assentisk.bean.CategoriesBean;
import com.assentisk.bean.LocationsBean;
import com.assentisk.bean.MonthSectionBean;
import com.assentisk.bean.SchedulerBean;
import com.assentisk.bean.TimeBean;
import com.assentisk.bean.VendorBean;
import com.assentisk.bean.VendorCategoryBean;
import com.assentisk.bean.WeekdayBean;
import com.assentisk.bean.YearSectionBean;
import com.assentisk.bean.priorityBean;
import com.assentisk.bean.supportBean;
import com.assentisk.bean.taskBean;
import com.assentisk.bean.ticketCatBean;
import com.assentisk.bean.ticketCategoryBean;
import com.assentisk.util.DBUtill;

public class AssestsDaoImpl implements AssestsDao{

	DBUtill dbUtil = new DBUtill();
	
	JdbcTemplate jdbcTemplate = new JdbcTemplate();

	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
	
	public void addCategory(String categoryName, Integer isActive) {
		
		String query = "insert into assentisk_categories (cname, IsActive) values ('"+categoryName+"','"+isActive+"')";
		jdbcTemplate.execute(query);
		
	}

	public void deleteCategory(Integer categoryID) {
		
		String query = "delete from assentisk_categories where ID='"+categoryID+"'";
		jdbcTemplate.execute(query);
		
	}

	@SuppressWarnings("unchecked")
	public List<CategoriesBean> getCategoryList() {
		
		String query = "select ID,cname,IF(LENGTH(cname)>50,'true','false') as cnamelen,LEFT(cname, 100) as cname1,"+
						" IsActive from assentisk_categories order by ID";
		List<CategoriesBean> categoryList = jdbcTemplate.queryForList(query);		
		return categoryList;
	}

	public void updateCategory(Integer categoryID, String categoryName, Integer isActive) {
		
		String query = "update assentisk_categories set cname='"+categoryName+"', IsActive='"+isActive+"' where ID='"+categoryID+"'";
		jdbcTemplate.execute(query);
		
	}

	@SuppressWarnings("unchecked")
	public List<CategoriesBean> getCategoryDetailsById(Integer categoryid) {
		
		String query = "select *from assentisk_categories where ID='"+categoryid+"'";
		List<CategoriesBean> categoryList = jdbcTemplate.queryForList(query);	
		return categoryList;
	}

	@SuppressWarnings("unchecked")
	public List<AssetsBean> getAssetsList() {
		
		String query = "select ac.ID,ac.vendorId, ac.aname,ac.type,ac.Initial_Values,ac.quantity,acat.cname,acl.Name,aapp.ApplicationName ,ab.BusinessProcessName,IF(LENGTH(acat.cname)>50,'true','false') as cnamelen,LEFT(acat.cname, 50) as cname1 from assentisk_assets ac join assentisk_categories acat on ac.category = acat.ID left join assentisk_company_locations acl on acl.LocationID = ac.location left join assentisk_applications aapp on aapp.ApplicationID = ac.application left join assentisk_businessprocess ab on ab.BusinessProcessID = ac.BP order by ID";
		List<AssetsBean> assetsList = jdbcTemplate.queryForList(query);

		return assetsList;
	}

	@SuppressWarnings("unchecked")
	public List<VendorBean> getVendorList() {
		
		String query = "select *from assentisk_vendor order by id";
		List<VendorBean> vendorList = jdbcTemplate.queryForList(query);
		return vendorList;
	}

	public void saveAsset(String assetName, Integer categoryID,
			Integer locationID, Integer applicationID,
			Integer businessprocessID, String employee, String createdDate,
			Integer createdBy, String modifiedDate, Integer modifiedBy,
			String vendorID, String type,String initvalue, String quantity) {
		
		String query = "insert into assentisk_assets (aname, category, location, application, BP, employee, CreatedDate, CreatedBy, MoidifiedDate, ModifiedBy, vendorId, type,Initial_Values, quantity) values ('"+assetName+"','"+categoryID+"','"+locationID+"','"+applicationID+"','"+businessprocessID+"','"+employee+"','"+createdDate+"','"+createdBy+"','"+modifiedDate+"','"+modifiedBy+"','"+vendorID+"','"+type+"','"+initvalue+"','"+quantity+"')";
		jdbcTemplate.execute(query);
		
	}

	@SuppressWarnings("unchecked")
	public List<AssetsBean> getAssetDetailsById(Integer assetID) {
		
		String query = "select *from assentisk_assets where ID = '"+assetID+"'";
		List<AssetsBean> getRow = jdbcTemplate.queryForList(query);
		return getRow;
	}

	public void updateAsset(String assetName, Integer categoryID,
			Integer locationID, Integer applicationID,
			Integer businessprocessID, String employee, String modifiedDate,
			Integer modifiedBy, String vendorID, String assestID,String type,String initvalue, String quantity) {
		
		String query = "update assentisk_assets set aname='"+assetName+"', category='"+categoryID+"', location='"+locationID+"', application='"+applicationID+"', BP='"+businessprocessID+"', employee='"+employee+"', MoidifiedDate='"+modifiedDate+"', ModifiedBy='"+modifiedBy+"',vendorId='"+vendorID+"', type='"+type+"', Initial_Values='"+initvalue+"', quantity='"+quantity+"' where ID='"+assestID+"'";
		jdbcTemplate.execute(query);
	}

	public void deleteAsset(Integer assetID) {
		
		String query = "delete from assentisk_assets where ID='"+assetID+"'";
		jdbcTemplate.execute(query);
		
	}

	public void saveAmcAsset(String amcName, Integer vendorID, String fromDate, String toDate, Integer assetID, String responsibleHead,String schedulerdata) {
		
		String query = "insert into assentisk_amc_assets (AMC_CName, VendorID, FromDate, ToDate, assetID, responsibleHead,scheduler,status,comment) values('"+amcName+"','"+vendorID+"','"+fromDate+"','"+toDate+"','"+assetID+"','"+responsibleHead+"','"+schedulerdata+"','Created','')";
		jdbcTemplate.execute(query);
		
	}

	@SuppressWarnings("unchecked")
	public int getAmcAssetID() {
		
		int amcID = 0;
		String query = "select *from assentisk_amc_assets  order by ID desc limit 1";
		List<AssetsBean> getRow = jdbcTemplate.queryForList(query);
		if(getRow.size()>0)
		{
			Map m = (Map)getRow.get(0);
			amcID = Integer.parseInt(m.get("ID").toString());
		}
		return amcID;
	}
	
	@SuppressWarnings("unchecked")
	public List<AssetsBean> getAmcDetailsByAsset(Integer assetsID) {
		
		String query = "select *from assentisk_amc_assets where assetID='"+assetsID+"'";
		List<AssetsBean> getDetails = jdbcTemplate.queryForList(query);
		return getDetails;
	}

	public void updateAmcAsset(String amcName, Integer vendorID,
			String fromDate, String toDate, Integer assetID, Integer id, String responsibleHead,String schedulerdata) {
	
		String query = "update assentisk_amc_assets set AMC_CName='"+amcName+"', VendorID='"+vendorID+"', FromDate='"+fromDate+"', ToDate='"+toDate+"', assetID='"+assetID+"', responsibleHead='"+responsibleHead+"',scheduler='"+schedulerdata+"' where ID='"+id+"'";
		jdbcTemplate.execute(query);
		
	}
	@SuppressWarnings("unchecked")
	public String getVendorIdByName(String vendorName) {
		String id = "";
		
		String query="select group_Concat(id,'') as id from assentisk_vendor where VendorName IN ('"+vendorName+"')";
		List<VendorBean> getRow = jdbcTemplate.queryForList(query);
		if(getRow.size()>0)
		{
			Map m = (Map)getRow.get(0);
			id = m.get("id").toString();
			
		}
		return id;
	}
	@SuppressWarnings("unchecked")
	public List<VendorBean> getVendorDetailsById(String vendors){
		List list = jdbcTemplate
		.queryForList("select VendorName from assentisk_vendor where id IN ("+vendors+") ");
        return list;
	}
	
	public void saveScheduler(String assetid,String startTime,String endTime,String duration,String recurPattern,
			String recurOccurence,String weekid,String dateStart,String endDate,String endoccurence,String endRangePat,
			String userId,String status,String schedulerID,String dailyRadio,String dailyrecur,String monthlyRadio,String daymonthlyrecur,
			String monthlyrecurmon,String monthsection,String monthWeeksection,String daymonthlyyearrecur,String yearmonthlyRadio,
			String yearsection,String ONyearrecur,String yearmonthsection,String yearmonthWeeksection){
		
		String query="";
		List list = jdbcTemplate.queryForList("select * from assentisk_scheduler where assetID='"+assetid+"'");
		
		if(list.size()>0){
			query = "update assentisk_scheduler set  startTimeID='"+startTime+"', endTimeID='"+endTime+"', duration='"+duration+"', recurPattern='"+recurPattern+"'," +
			"recurOccurence='"+recurOccurence+"',weekid='"+weekid+"',dateStart='"+dateStart+"',endDate='"+endDate+"'," +
					"endRangePat='"+endRangePat+"',endoccurence='"+endoccurence+"',assignedBy='"+userId+"',status='"+status+"'," +
					" dailyRadio='"+dailyRadio+"',dailyRecur='"+dailyrecur+"',monthRadio='"+monthlyRadio+"'" +
					",monthdayRecur='"+daymonthlyrecur+"',monthRecur='"+monthlyrecurmon+"',monthSection='"+monthsection+"',monthWeekend='"+monthWeeksection+"'" +
				     ",yearlyRecur='"+daymonthlyyearrecur+"',yearlyMonthSection='"+yearmonthsection+"'," +
				     " yearlyMonthWeek='"+yearmonthWeeksection+"',yearlySection='"+yearsection+"',yearlyMonthRecur='"+ONyearrecur+"'" +
				     ",yearlyRadio='"+yearmonthlyRadio+"' where assetID='"+assetid+"'";
		
			

		}
		else
		{
			query = "insert into assentisk_scheduler (assetID, startTimeID, endTimeID, duration, recurPattern," +
			"recurOccurence,weekid,dateStart,endDate,endRangePat,endoccurence,assignedBy,status,dailyRadio," +
			"dailyRecur,monthRadio,monthdayRecur,monthRecur,monthSection,monthWeekend,yearlyRecur,yearlyMonthSection," +
			"yearlyMonthWeek,yearlySection,yearlyMonthRecur,yearlyRadio) values('"+assetid+"'," +
					"'"+startTime+"','"+endTime+"','"+duration+"','"+recurPattern+"'," +
						"'"+recurOccurence+"','"+weekid+"','"+dateStart+"','"+endDate+"','"+endRangePat+"'," +
						"'"+endoccurence+"','"+userId+"','"+status+"','"+dailyRadio+"','"+dailyrecur+"'," +
						"'"+monthlyRadio+"','"+daymonthlyrecur+"','"+monthlyrecurmon+"','"+monthsection+"'," +
						"'"+monthWeeksection+"','"+daymonthlyyearrecur+"','"+yearmonthsection+"'," +
						"'"+yearmonthWeeksection+"','"+yearsection+"','"+ONyearrecur+"','"+yearmonthlyRadio+"')";
			
		}
		
		jdbcTemplate.execute(query);
	}
	@SuppressWarnings("unchecked")
	public List getTimeList(){
		List list = jdbcTemplate
		.queryForList("select * from assentisk_time order by id");
        return list;
	}
	@SuppressWarnings("unchecked")
	public List<SchedulerBean> getSchedulerList(String assetId){
		List list = jdbcTemplate
		.queryForList("select * from assentisk_scheduler where assetID='"+assetId+"'");
        return list;
	}
	
	@SuppressWarnings("unchecked")
	public List<MonthSectionBean> getMonthSectionList()
	{
		List list = jdbcTemplate
		.queryForList("select * from assentisk_monthsection order by id");
        return list;
	}
	
	
	
	@SuppressWarnings("unchecked")
	public List<WeekdayBean> getWeekdayList()
	{
		List list = jdbcTemplate
		.queryForList("select * from assentisk_weekday order by id");
        return list;
	}
	
	
	
	@SuppressWarnings("unchecked")
	public List<YearSectionBean> getYearSectionList()
	{
		List list = jdbcTemplate
		.queryForList("select * from assentisk_yearsection order by id");
        return list;
	}
	
	
	@SuppressWarnings("unchecked")
	public List<TimeBean> endTimeList(String id)
	{
		List list = jdbcTemplate.queryForList("select * from assentisk_time where id> '"+id+"' order by id");
        return list;
	}
	
	public String gettime(String id){
		List list = jdbcTemplate.queryForList("select * from assentisk_time where id= '"+id+"'");
		String time="";
		if(list.size()>0){
			Map m=(Map)list.get(0);
			time=m.get("time").toString();
		}
        return (String) time;
	}
	
	public List<WeekdayBean> getday(String weekId){
		List list = jdbcTemplate.queryForList("select group_concat(mname,'') as mname from assentisk_weekday where id in ("+weekId+")");
		return list;
	}
	
	public String getMonthSection(String monthsection){
		List list = jdbcTemplate.queryForList("select name from assentisk_monthsection where id ="+monthsection+"");
		String month="";
		if(list.size()>0){
			Map m=(Map)list.get(0);
			month=m.get("name").toString();
			
		}
		return month;
	}
	
	public String getWeeksection(String Weeksection){
		List list = jdbcTemplate.queryForList("select mname from assentisk_weekday where id ="+Weeksection+"");
		String mname="";
		if(list.size()>0){
			Map m=(Map)list.get(0);
			mname=m.get("mname").toString();
			
		}
		return mname;
	}
	
	public String getYearSection(String yearSection){
		List list = jdbcTemplate.queryForList("select ymonth from assentisk_yearsection where id ="+yearSection+"");
		String ymonth="";
		if(list.size()>0){
			Map m=(Map)list.get(0);
			ymonth=m.get("ymonth").toString();
			
		}
		return ymonth;
	}
	
	public String getTimedata(String startTime){
		List list = jdbcTemplate.queryForList("select concat(time,'',AM_PM)as timedata from assentisk_time where id ="+startTime+"");
		String timedata="";
		if(list.size()>0){
			Map m=(Map)list.get(0);
			timedata=m.get("timedata").toString();
			
		}
		return timedata;
	}
	
	@SuppressWarnings("unchecked")
	public List<AmcAssetBean> getAMCdataList(String userId ,String getsevenAfterDate) {
		
		String query="update assentisk_scheduler_activity set  status='Pending' where assignedTo='"+userId+"' and status='Created' and dateSchedule < CURDATE()"; 
		jdbcTemplate.execute(query);
		
		
		 query = "select act.id,act.assetID,act.amcname,act.schedule,act.startdate,act.enddate,act.comment,"+
						" act.status,act.generatedBy,(select EmpName from assentisk_userrecord where UserRecordID=act.assignedBy)as assignedBy ,"+
						"(select EmpName from assentisk_userrecord where UserRecordID=act.assignedTo) as assignedTo,act.dateSchedule, "+
							"act.startTime,act.endTime  from assentisk_scheduler_activity "+
							" as act where ((assignedTo='"+userId+"' and (act.status='Created' or act.status='Pending'))  or (assignedBy='"+userId+"' and act.status='Completed')) and dateSchedule<='"+getsevenAfterDate+"' and act.status!='Approved' and act.status!='Cancelled' order by act.dateSchedule";

		
		 System.out.println("query: " + query);
		 List getDetails = jdbcTemplate.queryForList(query);
				return getDetails;
		
	}

	@SuppressWarnings("unchecked")
	public List<CategoriesBean> checkCategoryName(String categoryName) {
		
		String query = "select cname from assentisk_categories where cname='"+categoryName+"'";
		List<CategoriesBean> getRow = jdbcTemplate.queryForList(query);
		return getRow;
	}

	@SuppressWarnings("unchecked")
	public List<AssetsBean> checkAssetName(String assetName) {
		
		String query = "select aname from assentisk_assets where aname='"+assetName+"'";
		List<AssetsBean> getRow = jdbcTemplate.queryForList(query);
		return getRow;
	}
	public String getUserId(String Username){
		String userID="";
		String query = "select UserRecordID from assentisk_userrecord where EmpUsername='"+Username+"'";
		System.out.println("query: " + query);
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
	
	public void insertDaily(String assetid,String scheduledata,String days,String dailyrecur){
		//int loopvalue=
		
		for(int i=0;i<30;i++){
			String query = "insert into assentisk_scheduler_activity (assetID, status, schdule) values('"+assetid+"','"+scheduledata+"','Created')";
			jdbcTemplate.execute(query);
		}
		
	}
	
	public String getDayBetween(String AssetsID){
		
		String days="";
		String query = "SELECT DATEDIFF(DATE_ADD((select dateStart from assentisk_scheduler where assetID='"+AssetsID+"') "+
						" ,INTERVAL 6 MONTH),(select dateStart from assentisk_scheduler where assetID='"+AssetsID+"')) as dateval";
		List getdays=jdbcTemplate.queryForList(query);
		
		if(getdays.size()>0){
			Map m=(Map)getdays.get(0);
			days=m.get("dateval").toString();
		}

		return days;
	}
	
	public static List<Date> getDaysBetweenDates(Date startdate, Date enddate)
	{
	    List<Date> dates = new ArrayList<Date>();
	    Calendar calendar = new GregorianCalendar();
	    calendar.setTime(startdate);

	    while (calendar.getTime().before(enddate))
	    {
	        Date result = (Date) calendar.getTime();
	        dates.add(result);
	        calendar.add(Calendar.DATE, 1);
	    }
	    return dates;
	}

	public void insertDaily(String assetid, String scheduledata) {
		// TODO Auto-generated method stub
		
	}
	
	public String getEndDate(String startdate){
		String endDate="";
		//String query ="SELECT DATE_ADD('"+startdate+"',INTERVAL 1 Year) as dateval from dual";
		
		String query="SELECT CAST(('"+startdate+"' + INTERVAL 1 Year) AS Date) as dateval";
		List getEndDate=jdbcTemplate.queryForList(query);
		if(getEndDate.size()>0){
			Map m=(Map)getEndDate.get(0);
			
			endDate = m.get("dateval").toString();
			
		}
		return endDate;
	}
	public String getEndAfterDate(String startdate){
		String endDate="";
		String query="SELECT CAST(('"+startdate+"' + INTERVAL 2000 Year) AS Date) as dateval";
		//String query ="SELECT DATE_ADD('"+startdate+"',INTERVAL 2000 Year) as dateval";
		List getEndDate=jdbcTemplate.queryForList(query);
		if(getEndDate.size()>0){
			Map m=(Map)getEndDate.get(0);
			endDate=m.get("dateval").toString();
		}
		return endDate;
	}
	public String getWeeks(String weekid){
		String concatWeeks="";
		String query ="select ifnull(group_concat(mname,''),'')as weeks from assentisk_weekday where id IN ("+weekid+")";
		List getWeeks=jdbcTemplate.queryForList(query);
		if(getWeeks.size()>0){
			Map m=(Map)getWeeks.get(0);
			concatWeeks=m.get("weeks").toString();
		}
		return concatWeeks;
	}
	
	public int getWeekCount(String weekid){
		int countday=0;
		String query ="select count(*) as day from assentisk_weekday where id IN ("+weekid+")";
		List getWeeks=jdbcTemplate.queryForList(query);
		if(getWeeks.size()>0){
			Map m=(Map)getWeeks.get(0);
			countday=Integer.parseInt(m.get("day").toString());
		}
		return countday;
	}
	

	
	
	public void insertSchedulerData(String assetid, List<String> dateList,
			String scheduledata, String amcname, String startdate,
			String assignedTo, String assignedBy, String startTime,
			String endTimer, String todate) {
		if(!assignedTo.equals("") || !assignedTo.equals("0") ){
			if(dateList.size()>0){
					for(int i=0;i<dateList.size();i++){
						String []datemod=dateList.get(i).toString().split("/");
						String dateval = datemod[2]+"-"+datemod[1]+"-"+datemod[0];
								String query = "insert into assentisk_scheduler_activity (assetID, amcname, schedule,startdate,enddate,comment," +
										"status,assignedBy,assignedTo,dateSchedule,startTime,endTime,generatedBy,schedulerRelated) values('"+assetid+"','"+amcname+"','"+scheduledata+"'," +
										"'"+startdate+"','"+todate+"','','Created','"+assignedBy+"','"+assignedTo+"','"+dateval+"','"+startTime+"','"+endTimer+"','System','1')";
								jdbcTemplate.execute(query);
					}
			}
	}
		// TODO Auto-generated method stub
		
	}
	public void cancelSchedulerData(String assetID){
		String query="delete from assentisk_scheduler_activity  where assetID='"+assetID+"' and Status ='Created'";
		jdbcTemplate.execute(query);
		
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
	
	public String getTime(String time){
		String modTime="0";
		String query="select concat(time,' ',AM_PM) as timedata from assentisk_time where id='"+time+"'";
		List getTime=jdbcTemplate.queryForList(query);
		if(getTime.size()>0){
			Map m=(Map)getTime.get(0);
			modTime=m.get("timedata").toString();
		}
		
		
		return modTime;
	}
	public String getFlagTochange(String assetid,String startTime,String endTime,String duration,String recurPattern,
			String recurOccurence,String weekid,String dateStart,String endDate,String endoccurence,String endRangePat,
			String userId,String status,String schedulerID,String dailyRadio,String dailyrecur,String monthlyRadio,String daymonthlyrecur,
			String monthlyrecurmon,String monthsection,String monthWeeksection,String daymonthlyyearrecur,String yearmonthlyRadio,
			String yearsection,String ONyearrecur,String yearmonthsection,String yearmonthWeeksection){
		
		String flag="0";
		
		String query = "Select * from assentisk_scheduler where  startTimeID='"+startTime+"'and endTimeID='"+endTime+"' and duration='"+duration+"' and recurPattern='"+recurPattern+"' and" +
		" recurOccurence='"+recurOccurence+"' and weekid='"+weekid+"' and dateStart='"+dateStart+"' and endDate='"+endDate+"' and " +
				"endRangePat='"+endRangePat+"' and endoccurence='"+endoccurence+"' and assignedBy='"+userId+"' and status='"+status+"' and " +
				" dailyRadio='"+dailyRadio+"' and dailyRecur='"+dailyrecur+"' and monthRadio='"+monthlyRadio+"'" +
				" and monthdayRecur='"+daymonthlyrecur+"' and monthRecur='"+monthlyrecurmon+"' and monthSection='"+monthsection+"' and monthWeekend='"+monthWeeksection+"'" +
			     " and yearlyRecur='"+daymonthlyyearrecur+"' and yearlyMonthSection='"+yearmonthsection+"' and " +
			     " yearlyMonthWeek='"+yearmonthWeeksection+"' and yearlySection='"+yearsection+"' and yearlyMonthRecur='"+ONyearrecur+"'" +
			     " and yearlyRadio='"+yearmonthlyRadio+"' and assetID='"+assetid+"'";
		List getrange=jdbcTemplate.queryForList(query);
		if(getrange.size()>0){
			flag="1";
		}
		else
		{
			flag="0";
		}
		
		return flag;
		
	}
	
	public String getMonth(String monthval){
		String month="";
		String query="select ymonth from assentisk_yearsection where id='"+monthval+"'";
		List getMonth=jdbcTemplate.queryForList(query);
		if(getMonth.size()>0){
			Map m=(Map)getMonth.get(0);
			month=m.get("ymonth").toString();
		}
		
		return month;
	}
	public String getYearEndDate(String startdate){
		String endDate="";
	//	String query ="SELECT DATE_ADD('"+startdate+"',INTERVAL 100 Year) as dateval";
		String query="SELECT CAST(('"+startdate+"' + INTERVAL 100 Year) AS Date) as dateval";
		List getEndDate=jdbcTemplate.queryForList(query);
		if(getEndDate.size()>0){
			Map m=(Map)getEndDate.get(0);
			endDate=m.get("dateval").toString();
		}
		return endDate;
	}
	
	public String getToday(String dateStart)
	{
		String date="";
		String query="select ((DATE_FORMAT(now(),'%Y-%m-%d'))> '"+dateStart+"') as val,DATE_FORMAT(now(),'%Y-%m-%d')as odate";
		List getSize=jdbcTemplate.queryForList(query);
		if(getSize.size()>0){
			Map m=(Map)getSize.get(0);
			String flag=m.get("val").toString();
			if(flag.equals("1")){
				date=m.get("odate").toString();
			}
			else
			{
				date=dateStart;
			}
		}
		return date;
	}
	
	@SuppressWarnings("unchecked")
	public List<taskBean> gettaskList(String userId,String getsevenAfterDate) {
		
		//String query = "select at.taskName,at.TaskID,at.fromDate,at.toDate,at.responsiblePerson,(select EmpName from assentisk_employees where UserRecordID=at.responsiblePerson) as responsiblePerson from assentisk_tasks as at";
		/*String query="select at.TaskID,at.taskName,at.fromDate,at.toDate,(select EmpName from assentisk_employees "+
					" where UserRecordID=at.responsiblePerson) as responsiblePerson,'0' as assetID,'Manual' as tasktype from assentisk_tasks as at "+
						" UNION select ass.ID as TaskID,ass.AMC_CName as taskName,ass.FromDate as fromDate,ass.ToDate as toDate, "+
							" (select EmpName from assentisk_employees where UserRecordID=ass.responsibleHead) as responsiblePerson,ass.assetID,'System' as tasktype" +
							" from assentisk_amc_assets as ass UNION  select asup.id as TaskID,asup.title as taskName,asup.fromDate as " +
							" fromDate ,asup.toDate as toDate,(select EmpName from assentisk_employees where UserRecordID=asup.assignedTo) as " +
							" responsiblePerson,'0' as assetID,'Support Ticket' as tasktype  from assentisk_support as asup "; 
		
		*/
		String query="select act.taskID,act.id,act.assetID,act.amcname,act.schedule,act.startdate,act.enddate,act.comment, act.status,CASE    WHEN act.assignedBy = '"+userId+"' THEN true  ELSE false END as userlogin,act.generatedBy, "+
					"(select EmpName from assentisk_userrecord where UserRecordID=act.assignedBy)as assignedBy ,(select EmpName from assentisk_userrecord where UserRecordID=act.assignedTo) as assignedTo,act.dateSchedule, act.startTime,act.endTime,act.schedulerRelated  from assentisk_scheduler_activity "+
                    "as act where ((assignedTo='"+userId+"' and (act.status='Created' or act.status='Pending'))  or (assignedBy='"+userId+"')) "+
                    "and dateSchedule<='"+getsevenAfterDate+"' and act.status!='Approved'  order by act.dateSchedule";
		System.out.println("query: " + query);
		List getDetails = jdbcTemplate.queryForList(query);

				return getDetails;
		
	}
	
	@SuppressWarnings("unchecked")
	public List<AssetsBean> gettaskScheduler(Integer assetsID) {
		
		String query = "select *from assentisk_amc_assets where assetID='"+assetsID+"'";
		List<AssetsBean> getDetails = jdbcTemplate.queryForList(query);
		return getDetails;
	}

	public List<taskBean> gettaskScheduler(int taskID) {

		String query="select TaskID,taskName,fromDate,toDate,responsiblePerson,scheduler from assentisk_tasks where TaskID='"+taskID+"'";
		List<taskBean> getDetails = jdbcTemplate.queryForList(query);
		return getDetails;
	}
	
	@SuppressWarnings("unchecked")
	public List<SchedulerBean> gettaskSchedulerList(String taskID){
		List list = jdbcTemplate
		.queryForList("select * from assentisk_scheduler where taskID='"+taskID+"'");
        return list;
	}


	public String updatetaskSchedule(String taskname, String fromDate,
			String toDate, int taskid, String responsibleHead, String schedulerdata) {
		String updateschedule="";
		String query="select * from assentisk_tasks where taskName='"+taskname+"' and fromDate='"+fromDate+"' and toDate='"+toDate+"' and responsiblePerson='"+responsibleHead+"' and TaskID!='"+taskid+"'";
		List getdata=jdbcTemplate.queryForList(query);
		if(getdata.size()>0){
			updateschedule="false";
		}
		else{
			query = "update assentisk_tasks set taskName='"+taskname+"', fromDate='"+fromDate+"', toDate='"+toDate+"',  responsiblePerson='"+responsibleHead+"',scheduler='"+schedulerdata+"' where TaskID='"+taskid+"'";
					 jdbcTemplate.execute(query);
			query="update assentisk_scheduler_activity set amcname='"+taskname+"',startdate='"+fromDate+"',enddate='"+toDate+"',assignedTo='"+responsibleHead+"',schedule='"+schedulerdata+"' where taskID='"+taskid+"'";
					 jdbcTemplate.execute(query);
					 updateschedule="true";
		}
		return updateschedule;
		
	}
	
	public String getTaskFlagTochange(String taskid,String startTime,String endTime,String duration,String recurPattern,
			String recurOccurence,String weekid,String dateStart,String endDate,String endoccurence,String endRangePat,
			String userId,String status,String schedulerID,String dailyRadio,String dailyrecur,String monthlyRadio,String daymonthlyrecur,
			String monthlyrecurmon,String monthsection,String monthWeeksection,String daymonthlyyearrecur,String yearmonthlyRadio,
			String yearsection,String ONyearrecur,String yearmonthsection,String yearmonthWeeksection){
		
		String flag="0";
		
		String query = "Select * from assentisk_scheduler where  startTimeID='"+startTime+"'and endTimeID='"+endTime+"' and duration='"+duration+"' and recurPattern='"+recurPattern+"' and" +
		" recurOccurence='"+recurOccurence+"' and weekid='"+weekid+"' and dateStart='"+dateStart+"' and endDate='"+endDate+"' and " +
				"endRangePat='"+endRangePat+"' and endoccurence='"+endoccurence+"' and assignedBy='"+userId+"' and status='"+status+"' and " +
				" dailyRadio='"+dailyRadio+"' and dailyRecur='"+dailyrecur+"' and monthRadio='"+monthlyRadio+"'" +
				" and monthdayRecur='"+daymonthlyrecur+"' and monthRecur='"+monthlyrecurmon+"' and monthSection='"+monthsection+"' and monthWeekend='"+monthWeeksection+"'" +
			     " and yearlyRecur='"+daymonthlyyearrecur+"' and yearlyMonthSection='"+yearmonthsection+"' and " +
			     " yearlyMonthWeek='"+yearmonthWeeksection+"' and yearlySection='"+yearsection+"' and yearlyMonthRecur='"+ONyearrecur+"'" +
			     " and yearlyRadio='"+yearmonthlyRadio+"' and taskID='"+taskid+"' and assetID='0'";
	
		List getrange=jdbcTemplate.queryForList(query);
		if(getrange.size()>0){
			flag="1";
		}
		else
		{
			flag="0";
		}
		
		return flag;
		
	}
	
	public void savetaskScheduler(int taskid,String startTime,String endTime,String duration,String recurPattern,
			String recurOccurence,String weekid,String dateStart,String endDate,String endoccurence,String endRangePat,
			String userId,String status,String schedulerID,String dailyRadio,String dailyrecur,String monthlyRadio,String daymonthlyrecur,
			String monthlyrecurmon,String monthsection,String monthWeeksection,String daymonthlyyearrecur,String yearmonthlyRadio,
			String yearsection,String ONyearrecur,String yearmonthsection,String yearmonthWeeksection){
		
		String query="";
		List list = jdbcTemplate.queryForList("select * from assentisk_scheduler where taskID='"+taskid+"'");
		
		if(list.size()>0){
			query = "update assentisk_scheduler set  startTimeID='"+startTime+"', endTimeID='"+endTime+"', duration='"+duration+"', recurPattern='"+recurPattern+"'," +
			"recurOccurence='"+recurOccurence+"',weekid='"+weekid+"',dateStart='"+dateStart+"',endDate='"+endDate+"'," +
					"endRangePat='"+endRangePat+"',endoccurence='"+endoccurence+"',assignedBy='"+userId+"',status='"+status+"'," +
					" dailyRadio='"+dailyRadio+"',dailyRecur='"+dailyrecur+"',monthRadio='"+monthlyRadio+"'" +
					",monthdayRecur='"+daymonthlyrecur+"',monthRecur='"+monthlyrecurmon+"',monthSection='"+monthsection+"',monthWeekend='"+monthWeeksection+"'" +
				     ",yearlyRecur='"+daymonthlyyearrecur+"',yearlyMonthSection='"+yearmonthsection+"'," +
				     " yearlyMonthWeek='"+yearmonthWeeksection+"',yearlySection='"+yearsection+"',yearlyMonthRecur='"+ONyearrecur+"'" +
				     ",yearlyRadio='"+yearmonthlyRadio+"' where taskID='"+taskid+"'";
		
			

		}
		else
		{
			query = "insert into assentisk_scheduler (taskID, startTimeID, endTimeID, duration, recurPattern," +
			"recurOccurence,weekid,dateStart,endDate,endRangePat,endoccurence,assignedBy,status,dailyRadio," +
			"dailyRecur,monthRadio,monthdayRecur,monthRecur,monthSection,monthWeekend,yearlyRecur,yearlyMonthSection," +
			"yearlyMonthWeek,yearlySection,yearlyMonthRecur,yearlyRadio) values('"+taskid+"'," +
					"'"+startTime+"','"+endTime+"','"+duration+"','"+recurPattern+"'," +
						"'"+recurOccurence+"','"+weekid+"','"+dateStart+"','"+endDate+"','"+endRangePat+"'," +
						"'"+endoccurence+"','"+userId+"','"+status+"','"+dailyRadio+"','"+dailyrecur+"'," +
						"'"+monthlyRadio+"','"+daymonthlyrecur+"','"+monthlyrecurmon+"','"+monthsection+"'," +
						"'"+monthWeeksection+"','"+daymonthlyyearrecur+"','"+yearmonthsection+"'," +
						"'"+yearmonthWeeksection+"','"+yearsection+"','"+ONyearrecur+"','"+yearmonthlyRadio+"')";
			
		}
		jdbcTemplate.execute(query);
	}
	
	public void canceltaskSchedulerData(int taskID){
		String query="delete from assentisk_scheduler_activity  where taskID='"+taskID+"' and Status ='Created'";
		jdbcTemplate.execute(query);
		
	}
	
	public void inserttaskSchedulerData(int taskid, List<String> dateList,
			String scheduledata, String taskname, String startdate,
			String assignedTo, String assignedBy, String startTime,
			String endTimer, String todate) {
		if(!assignedTo.equals("") || !assignedTo.equals("0") ){
			if(dateList.size()>0){
					for(int i=0;i<dateList.size();i++){
						String []datemod=dateList.get(i).toString().split("/");
						String dateval = datemod[2]+"-"+datemod[1]+"-"+datemod[0];
								String query = "insert into assentisk_scheduler_activity (taskID, amcname, schedule,startdate,enddate,comment," +
										"status,assignedBy,assignedTo,dateSchedule,startTime,endTime,generatedBy,schedulerRelated) values('"+taskid+"','"+taskname+"','"+scheduledata+"'," +
										"'"+startdate+"','"+todate+"','','Created','"+assignedBy+"','"+assignedTo+"','"+dateval+"','"+startTime+"','"+endTimer+"','Manual','1')";
								jdbcTemplate.execute(query);
					}
			}
	}
	}
	
public String inserttaskSchedule(String taskname,String fromDate, String toDate,String responsibleHead,String schedulerdata) {
	String updateschedule="";	
	String query="select * from assentisk_tasks where taskName='"+taskname+"' and fromDate='"+fromDate+"' and toDate='"+toDate+"' and responsiblePerson='"+responsibleHead+"'";
	List getdata=jdbcTemplate.queryForList(query);
	if(getdata.size()>0){
		updateschedule="false";
	}
	else{
		 query = "insert into assentisk_tasks (taskName,fromDate,toDate,responsiblePerson,scheduler) values('"+taskname+"','"+fromDate+"','"+toDate+"','"+responsibleHead+"','"+schedulerdata+"')";
		jdbcTemplate.execute(query);
		updateschedule="true";
	}
	return 	updateschedule;
	}

public int getLastTaskID() {
	
	int taskID = 0;
	String query = "select *from assentisk_tasks  order by TaskID desc limit 1";
	List<taskBean> getRow = jdbcTemplate.queryForList(query);
	if(getRow.size()>0)
	{
		Map m = (Map)getRow.get(0);
		taskID = Integer.parseInt(m.get("TaskID").toString());
	}
	return taskID;
}



public void deleteSchedulerDetailTask(int taskID) {
	String query = "delete from assentisk_scheduler_activity where taskID = '"+taskID+"'";
	jdbcTemplate.execute(query);
	
}

public void deleteSchedulerTask(int taskID) {
	String query = "delete from assentisk_scheduler where taskID = '"+taskID+"'";
	jdbcTemplate.execute(query);
	
}

public void deleteTask(int taskID) {
	String query = "delete from assentisk_tasks where TaskID = '"+taskID+"'";
	jdbcTemplate.execute(query);
	
}


public void deleteAMCTask(int taskID) {
	String query = "delete from assentisk_amc_assets where assetID = '"+taskID+"'";
	jdbcTemplate.execute(query);
	
}

public void deleteAMCSchedulerTask(int taskID) {
	String query = "delete from assentisk_scheduler where assetID = '"+taskID+"'";
	jdbcTemplate.execute(query);
	
}



public void deleteSupportTicket(int taskID) {
	String query = "delete from assentisk_support where id = '"+taskID+"'";
	jdbcTemplate.execute(query);
	
}
public void deleteAMCSchedulerDetailTask(int taskID) {
	String query = "delete from assentisk_scheduler_activity where assetID = '"+taskID+"'";
	jdbcTemplate.execute(query);
	
}

public List<supportBean> getSupportList(){
	String query = "select asup.id,asup.title,asup.details,(select priority from assentisk_task_support_priority where "+
					" id=asup.priority) as priority,(select EmpName from assentisk_employees where "+
					" UserRecordID=asup.assignedTo and isLicense='1') as assignedTo from  assentisk_support as asup order by id";

	List<supportBean> getRow = jdbcTemplate.queryForList(query);
	return getRow;
}

public List<priorityBean> getPriorityList(){
	String query="select * from assentisk_task_support_priority order by id";
	List<priorityBean> getRow=jdbcTemplate.queryForList(query);
	return getRow;
}

public void addTicket(String title,String priority,String detail,String responsiblehead,String currentTime,String catList){
	String query = "insert into assentisk_support (title,details,priority,assignedTo,fromDate,toDate,category) values('"+title+"','"+detail+"','"+priority+"','"+responsiblehead+"','"+currentTime+"','"+currentTime+"','"+catList+"')";
	jdbcTemplate.execute(query);
}
public List<supportBean> getSupportTicketList(String ticketID){
	String query="select * from assentisk_support where id='"+ticketID+"'";
	List<supportBean> getRow=jdbcTemplate.queryForList(query);
	return getRow;
}
public void updateTicket(String title,String priority,String detail,String responsiblehead,String currentTime,String ticketID,String catList){
	String query = "update  assentisk_support set title='"+title+"',details='"+detail+"',priority='"+priority+"',assignedTo='"+responsiblehead+"',fromDate='"+currentTime+"',toDate='"+currentTime+"',category='"+catList+"' where id='"+ticketID+"'";
	jdbcTemplate.execute(query);
}
public void inserttaskticketSchedulerData(String dateList,
		String scheduledata, String taskname, String startdate,
		String assignedTo, String assignedBy, String startTime,
		String endTimer, String todate) {
	
	int taskid= jdbcTemplate.queryForInt("select max(id) from assentisk_support");
	
	String query = "insert into assentisk_scheduler_activity (taskID, amcname, schedule,startdate,enddate,comment," +
					"status,assignedBy,assignedTo,dateSchedule,startTime,endTime,generatedBy) values('"+taskid+"','"+taskname+"','"+scheduledata+"'," +
					"'"+startdate+"','"+todate+"','','Created','"+assignedBy+"','"+assignedTo+"','"+dateList+"','"+startTime+"','"+endTimer+"','Support Ticket')";
					jdbcTemplate.execute(query);
			
}


public void updatetaskticketSchedulerData(String dateList,
		String scheduledata, String taskname, String startdate,
		String assignedTo, String assignedBy, String startTime,
		String endTimer, String todate,String ticketID) {
	
	int taskid= jdbcTemplate.queryForInt("select max(id) from assentisk_support");
	
	String query = "update assentisk_scheduler_activity  set amcname='"+taskname+"',enddate='"+todate+"',comment=''," +
					"status='Created',assignedBy='"+assignedBy+"',assignedTo='"+assignedTo+"',dateSchedule='"+dateList+"',startTime='"+startTime+"',endTime='"+endTimer+"',generatedBy='Support Ticket' where taskID='"+ticketID+"'";
					jdbcTemplate.execute(query);
			
}

public List<ticketCategoryBean> getTicketCategory(){
	String query="select * from assentisk_ticket_category";
	List<ticketCategoryBean> getRow=jdbcTemplate.queryForList(query);
	return getRow;
}

public void inserttaskManualSchedulerData(String dateList,
		String scheduledata, String taskname, String startdate,
		String assignedTo, String assignedBy, String startTime,
		String endTimer, String todate) {
	
	int taskid= jdbcTemplate.queryForInt("select max(TaskID) from assentisk_tasks");
	
	String query = "insert into assentisk_scheduler_activity (taskID, amcname, schedule,startdate,enddate,comment," +
					"status,assignedBy,assignedTo,dateSchedule,startTime,endTime,generatedBy) values('"+taskid+"','"+taskname+"','"+scheduledata+"'," +
					"'"+startdate+"','"+todate+"','','Created','"+assignedBy+"','"+assignedTo+"','"+dateList+"','"+startTime+"','"+endTimer+"','Manual')";
	System.out.println("query---"+query);		
	jdbcTemplate.execute(query);
			
}
public void updatetaskManualSchedulerData(String dateList,
		String scheduledata, String taskname, String startdate,
		String assignedTo, String assignedBy, String startTime,
		String endTimer, String todate,int ticketID) {
	
	
	String query = "update assentisk_scheduler_activity  set amcname='"+taskname+"',enddate='"+todate+"',comment=''," +
					"status='Created',assignedBy='"+assignedBy+"',assignedTo='"+assignedTo+"',dateSchedule='"+dateList+"',startTime='"+startTime+"',endTime='"+endTimer+"',generatedBy='Manual' where taskID='"+ticketID+"'";
					jdbcTemplate.execute(query);
			
}
public String checktask(String taskname,String fromDate, String toDate,String responsibleHead) {
	String updateschedule="";	
	String query="select * from assentisk_tasks where taskName='"+taskname+"' and fromDate='"+fromDate+"' and toDate='"+toDate+"' and responsiblePerson='"+responsibleHead+"'";
	List getdata=jdbcTemplate.queryForList(query);
	if(getdata.size()>0){
		updateschedule="exist";
	}
	else{
		updateschedule="not";
	}
	return 	updateschedule;
	}


public String checkedittask(String taskname,String fromDate, String toDate,String responsibleHead,String taskid) {
	String updateschedule="";	
	String query="select * from assentisk_tasks where taskName='"+taskname+"' and fromDate='"+fromDate+"' and toDate='"+toDate+"' and responsiblePerson='"+responsibleHead+"' and TaskID!='"+taskid+"'";
	List getdata=jdbcTemplate.queryForList(query);
	if(getdata.size()>0){
		updateschedule="exist";
	}
	else{
		updateschedule="not";
	}
	return 	updateschedule;
	}

public List<taskBean> gettasksingleScheduler(int taskID) {

	String query="select *  from assentisk_scheduler_activity where id='"+taskID+"'";
	List<taskBean> getDetails = jdbcTemplate.queryForList(query);
	return getDetails;
}

public void updatesingletaskData(String taskid, String taskname,
		String fromdate, String todate, String dateSchedule, String employee,String assignedBy){
	String query = "update assentisk_scheduler_activity  set amcname='"+taskname+"',enddate='"+todate+"',comment=''," +
	"assignedBy='"+assignedBy+"',assignedTo='"+employee+"',dateSchedule='"+dateSchedule+"',startTime='0',endTime='0',generatedBy='Manual' where id='"+taskid+"'";
	System.out.println();
	jdbcTemplate.execute(query);
}


public String checkeditsingletask(String taskname,String fromDate, String toDate,String responsibleHead,String dateSchedule,String taskid) {
	String updateschedule="";	
	String query="select * from assentisk_scheduler_activity where amcname='"+taskname+"' and startdate='"+fromDate+"' and enddate='"+toDate+"' and assignedTo='"+responsibleHead+"' and taskID!='"+taskid+"' and dateSchedule='"+dateSchedule+"'";
	List getdata=jdbcTemplate.queryForList(query);
	if(getdata.size()>0){
		updateschedule="exist";
	}
	else{
		updateschedule="not";
	}
	return 	updateschedule;
	}

public void deletesingleSchedulerDetailTask(int taskID) {
	String query = "delete from assentisk_scheduler_activity where id = '"+taskID+"'";
	jdbcTemplate.execute(query);
	
}
public List<taskBean> gettasksingleAMCScheduler(int taskID) {

	String query="select *  from assentisk_scheduler_activity where id='"+taskID+"'";
	List<taskBean> getDetails = jdbcTemplate.queryForList(query);
	return getDetails;
}
public void updatetaskassetSchedulerData(String taskname, String startdate,
		String assignedTo, String assignedBy,  String todate,String ticketID) {
	
	int taskid= jdbcTemplate.queryForInt("select max(id) from assentisk_support");
	
	String query = "update assentisk_scheduler_activity  set amcname='"+taskname+"',startdate='"+startdate+"',enddate='"+todate+"'," +
					"assignedBy='"+assignedBy+"',assignedTo='"+assignedTo+"' where assetID='"+ticketID+"'";
					jdbcTemplate.execute(query);
			
}

@SuppressWarnings("unchecked")
public List<ticketCatBean> getticketCatList() {
	List<ticketCatBean> list = jdbcTemplate.queryForList("select *from assentisk_ticket_category order by id");
	return list;
}

public List<ticketCatBean> checkTicketCategoryName(
		String vendorCategoryName) {
	
	String query = "select category from assentisk_ticket_category where category='"+vendorCategoryName+"'";
	List<ticketCatBean> getRow = jdbcTemplate.queryForList(query);
	return getRow;
}

public void saveTicketCat(String ticketname, int isactive){
	String query = "insert into assentisk_ticket_category(category) values('"+ticketname+"')";
	jdbcTemplate.execute(query);
}

@SuppressWarnings("unchecked")
public List<ticketCatBean> getTicketCatById(String ticketId){
	List<ticketCatBean> list = jdbcTemplate.queryForList("select *from assentisk_ticket_category where id = '"+ticketId+"'");
	return list;
}


public void updateticketCat(String ticketcatID,String ticketname, int isactive){
	String query = "update assentisk_ticket_category set category='"+ticketname+"'  where id ='"+ticketcatID+"'";
	jdbcTemplate.execute(query);
}

public void deleteTicketCategory(String ticketCatId) {
	
	String query = "delete from assentisk_ticket_category where id = '"+ticketCatId+"'";
	jdbcTemplate.execute(query);
}

 	

}
