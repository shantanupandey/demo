package com.assentisk.dao;

import java.util.List;

import com.assentisk.bean.*;

public interface AssestsDao {

	public List<CategoriesBean> getCategoryList();
	
	public void addCategory(String categoryName, Integer isActive);
	
	public void updateCategory(Integer categoryID, String categoryName, Integer isActive);
	
	public void deleteCategory(Integer categoryID);
	
	public List<CategoriesBean> getCategoryDetailsById(Integer categoryid);
	
	public List<AssetsBean> getAssetsList();
	
	public List<VendorBean> getVendorList();
	
	public List<AssetsBean> getAssetDetailsById(Integer assetID);
	
	public void saveAsset(String assetName, Integer categoryID, Integer locationID, Integer applicationID, Integer businessprocessID, String employee, String createdDate, Integer createdBy, String modifiedDate, Integer modifiedBy, String vendorID, String type,String initvalue, String quantity);
	
	public void updateAsset(String assetName, Integer categoryID, Integer locationID, Integer applicationID, Integer businessprocessID, String employee,String modifiedDate, Integer modifiedBy, String vendorID, String assestID, String type,String initvalue, String quantity);
	
	public void deleteAsset(Integer assetID);
	
	public void saveAmcAsset(String amcName, Integer vendorID, String fromDate, String toDate, Integer assetID, String responsibleHead,String scheduledata);
	
	public void updateAmcAsset(String amcName, Integer vendorID, String fromDate, String toDate, Integer assetID, Integer id, String responsibleHead,String scheduledata);
	
	public int getAmcAssetID();
	
	public List<AssetsBean> getAmcDetailsByAsset(Integer assetsID);
	
	public String getVendorIdByName(String vendors);

	public List<VendorBean> getVendorDetailsById(String string);

	public void saveScheduler(String assetid, String startTime, String endTime,
			String duration, String recurPattern, String recurOccurence,
			String weekid, String dateStart, String endDate,
			String endoccurence, String endRangePat,String userId,String status,
			String schedulerID,String dailyRadio,String dailyrecur,String monthlyRadio,String daymonthlyrecur,String monthlyrecurmon,
			String monthsection,String monthWeeksection,String daymonthlyyearrecur,String yearmonthlyRadio,String yearsection,
			String ONyearrecur,String yearmonthsection,String yearmonthWeeksection);

	public List<TimeBean> getTimeList();
	
	public List<SchedulerBean> getSchedulerList(String assetID);
	
	
	public List<MonthSectionBean> getMonthSectionList();

	public List<WeekdayBean> getWeekdayList();

	public List<YearSectionBean> getYearSectionList();


	public List<TimeBean> endTimeList(String startId);

	public String gettime(String startID);
	
	public List<WeekdayBean> getday(String weekId);
	
	public String getMonthSection(String monthsection);
	
	public String getWeeksection(String Weeksection);
	
	public String getYearSection(String yearSection);
	
	public String getTimedata(String startTime);

	public List<AmcAssetBean> getAMCdataList(String userId,String getsevenAfterDate);
	
	public List<CategoriesBean> checkCategoryName(String categoryName);
	
	public List<AssetsBean> checkAssetName(String assetName);
	
	public String getUserId(String Username);
	public String getuserDataConcat(String userId);

	public void insertDaily(String assetid, String scheduledata);

	public String getDayBetween(String assetid);

	public String getEndDate(String dateStart);

	public String getEndAfterDate(String dateStart);

	public String getWeeks(String weekid);
	
	public int getWeekCount(String weekid);

	public void insertSchedulerData(String assetid, List<String> dateList,
			String scheduledata, String amcname, String strDater,String assignedTo,String assignedBy,String startTime,String endTimer,String todate);

	public String getsevenAfterDate();

	public String getTime(String time);

	public void cancelSchedulerData(String assetid);

	public String getFlagTochange(String assetid, String startTime,
			String endTimer, String duration, String recurPattern,
			String recurOccurence, String weekid, String dateStart,
			String endDater, String endoccurence, String endRangePat,
			String userId, String status, String schedulerID,
			String dailyRadio, String dailyrecur, String monthlyRadio,
			String daymonthlyrecur, String monthlyrecurmon,
			String monthsection, String monthWeeksection,
			String daymonthlyyearrecur, String yearmonthlyRadio,
			String yearsection, String oNyearrecur, String yearmonthsection,
			String yearmonthWeeksection);

	public String getMonth(String monthval);

	public String getYearEndDate(String dateStart);

	public String getToday(String dateStart);

	public List<taskBean> gettaskList(String userId,String getsevenAfterDate);

	public List<taskBean> gettaskScheduler(int parseInt);

	public List<SchedulerBean> gettaskSchedulerList(String id);

	public String updatetaskSchedule(String taskname, String fromdate,
			String todate, int parseInt, String employee, String scheduledata);

	public String getTaskFlagTochange(String taskid, String startTime,
			String endTimer, String duration, String recurPattern,
			String recurOccurence, String weekid, String dateStart,
			String endDater, String endoccurence, String endRangePat,
			String userId, String status, String schedulerID,
			String dailyRadio, String dailyrecur, String monthlyRadio,
			String daymonthlyrecur, String monthlyrecurmon,
			String monthsection, String monthWeeksection,
			String daymonthlyyearrecur, String yearmonthlyRadio,
			String yearsection, String oNyearrecur, String yearmonthsection,
			String yearmonthWeeksection);

	public void savetaskScheduler(int taskID, String startTime,
			String endTimer, String duration, String recurPattern,
			String recurOccurence, String weekid, String dateStart,
			String endDater, String endoccurence, String endRangePat,
			String userId, String status, String schedulerID,
			String dailyRadio, String dailyrecur, String monthlyRadio,
			String daymonthlyrecur, String monthlyrecurmon,
			String monthsection, String monthWeeksection,
			String daymonthlyyearrecur, String yearmonthlyRadio,
			String yearsection, String oNyearrecur, String yearmonthsection,
			String yearmonthWeeksection);

	public void canceltaskSchedulerData(int taskid);

	public void inserttaskSchedulerData(int taskid, List<String> dateList,
			String scheduledata, String taskname, String fromdate,
			String assignedTo, String assignedBy, String startTime,
			String endTimer, String todate);

	public String inserttaskSchedule(String taskname, String fromdate,
			String todate, String employee, String scheduledata);

	
	public int getLastTaskID();

	public void deleteTask(int taskID);

	public void deleteSchedulerTask(int taskID);

	public void deleteSchedulerDetailTask(int taskID);

	public void deleteAMCTask(int taskID);

	public void deleteAMCSchedulerTask(int taskID);

	public void deleteAMCSchedulerDetailTask(int taskID);

	public List<supportBean> getSupportList();

	public List<priorityBean> getPriorityList();

	public void addTicket(String title, String priority, String detail,
			String responsiblehead, String currentTime,String catList);

	public List<supportBean> getSupportTicketList(String ticketId);

	public void updateTicket(String title, String priority, String detail,
			String responsiblehead, String currentFormatTime, String ticketID,String catList);

	public void deleteSupportTicket(int ticketID);

	public void inserttaskticketSchedulerData(String currentTime,
			String currentTime2, String title, String currentTime3,
			String responsiblehead, String assignedBy, String string,
			String string2, String currentTime4);

	public void updatetaskticketSchedulerData(String currentTime,
			String currentTime2, String title, String currentTime3,
			String responsiblehead, String assignedBy, String string,
			String string2, String currentTime4, String ticketID);

	public List<ticketCategoryBean> getTicketCategory();

	public void inserttaskManualSchedulerData(String currentFormatTime,
			String currentFormatTime2, String taskname,
			String currentFormatTime3, String employee, String userId,
			String string, String string2, String currentTime);

	public void updatetaskManualSchedulerData(String currentFormatTime,
			String currentFormatTime2, String taskname, String fromdate,
			String employee, String userId, String string, String string2,
			String todate, int taskID);

	public String checktask(String taskname, String fromdate, String todate,
			String employeedata);

	public String checkedittask(String taskname, String fromdate,
			String todate, String employee, String taskid);

	public List<taskBean> gettasksingleScheduler(int parseInt);

	public void updatesingletaskData(String taskid, String taskname,
			String fromdate, String todate, String dateSchedule, String employee,String assignedBy);

	public String checkeditsingletask(String taskname, String fromdate,
			String todate, String employee, String dateSchedule, String taskid);

	public void deletesingleSchedulerDetailTask(int taskid);

	public List<taskBean> gettasksingleAMCScheduler(int parseInt);

	public void updatetaskassetSchedulerData(String amcname, String fromdate,
			String employee, String userId, String todate, String assetid);

	public List<ticketCatBean> getticketCatList();

	public List<ticketCatBean> checkTicketCategoryName(String catname);

	public void saveTicketCat(String ticketCatname, int status);

	public List<ticketCatBean> getTicketCatById(String ticketid);

	public void updateticketCat(String tcatid, String ticketCatname, int status);

	public void deleteTicketCategory(String ticketCatId);
}
