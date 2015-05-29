package com.assentisk.controller;


import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.*;


import java.io.IOException;

import java.io.PrintWriter;
import java.net.InetAddress;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.ModelMap;
import org.springframework.validation.BindException;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;

import com.assentisk.bean.AmcAssetBean;
import com.assentisk.bean.ApplicationsBean;
import com.assentisk.bean.AssetsBean;
import com.assentisk.bean.BusinessProcessesBean;
import com.assentisk.bean.CategoriesBean;
import com.assentisk.bean.EmployeeBean;
import com.assentisk.bean.LocationsBean;
import com.assentisk.bean.MonthSectionBean;
import com.assentisk.bean.SchedulerBean;
import com.assentisk.bean.TimeBean;
import com.assentisk.bean.VendorBean;
import com.assentisk.bean.VendorCategoryBean;
import com.assentisk.bean.priorityBean;
import com.assentisk.bean.supportBean;
import com.assentisk.bean.ticketCatBean;
import com.assentisk.bean.ticketCategoryBean;

import com.assentisk.bean.WeekdayBean;
import com.assentisk.bean.YearSectionBean;
import com.assentisk.bean.taskBean;
import com.assentisk.dao.AssestsDao;
import com.assentisk.dao.MasterDao;
import com.assentisk.dao.OrganizationDao;
import com.assentisk.util.Files;
import com.assentisk.util.FilesService;
import com.assentisk.util.UrlUtill;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;


public class AssestsController extends SimpleFormController {

	protected AssestsDao assestsDao;
	protected OrganizationDao organizationDao;
	protected MasterDao masterDao;
	protected FilesService filesService;

	ModelAndView modelAndView = null;
	ModelMap map;
	PrintWriter out;

	public AssestsDao getAssestsDao() {
		return assestsDao;
	}

	public void setAssestsDao(AssestsDao assestsDao) {
		this.assestsDao = assestsDao;
	}

	public OrganizationDao getOrganizationDao() {
		return organizationDao;
	}

	public void setOrganizationDao(OrganizationDao organizationDao) {
		this.organizationDao = organizationDao;
	}

	public MasterDao getMasterDao() {
		return masterDao;
	}

	public void setMasterDao(MasterDao masterDao) {
		this.masterDao = masterDao;
	}

	
	public FilesService getFilesService() {
		return filesService;
	}

	public void setFilesService(FilesService filesService) {
		this.filesService = filesService;
	}

	protected ModelAndView showForm(HttpServletRequest req,
			HttpServletResponse res, BindException ex) throws Exception {

		String url = UrlUtill.UrlName(req.getRequestURI());
		if (url.equals("categories")) {

			return new ModelAndView("assests/categories");
		}

		else if (url.equals("categoryList")) {

			return categoryList(req, res);
		}

		else if (url.equals("addcategory")) {

			return new ModelAndView("assests/addcategory");
		} else if (url.equals("editcategory")) {

			return editCategory(req, res);
		} else if (url.equals("deletecategory")) {

			return deleteCategory(req, res);
		} else if (url.equals("assetsList")) {

			return assetsList(req, res);
		} else if (url.equals("assets")) {

			return new ModelAndView("assests/assets");
		} else if (url.equals("addasset")) {

			return addAsset(req, res);
		}
		else if (url.equals("editasset")) {

			return editAsset(req, res);
		}
		else if (url.equals("deleteasset")) {

			return deleteAsset(req, res);
		}
		else if (url.equals("schedule")) {

			return schedule(req, res);
		}
		else if(url.equals("addScheduler")){
			return addScheduler(req,res);
		}
		else if(url.equals("callEndTime")){
			return callEndTime(req,res);
		}
		else if(url.equals("callDiffernce")){
			return callDiffernce(req,res);
		}
		else if(url.equals("amcList")){
			return amcList(req,res);
		}
		else if(url.equals("checkcategoryname")){
			return checkCategoryName(req,res);
		}
		else if(url.equals("checkassetname")){
			return checkAssetName(req,res);
		}
		else if (url.equals("task")) {
			return new ModelAndView("task/task");
		}
		else if(url.equals("taskList")){
			return taskList(req,res);
		}
		else if(url.equals("edittask")){
			return edittask(req,res);
		}
		else if(url.equals("addtask")){
			return addtask(req,res);
		}
		else if(url.equals("deletetask")){
			return deletetask(req,res);
		}
		else if(url.equals("editAMC")){
			return editAMC(req,res);
		}
		else if(url.equals("ticket")){
			return new ModelAndView("task/ticket");
		}
		else if(url.equals("supportList")){
			return supportList(req,res);
		}
		else if(url.equals("addticket")){
			return addticket(req,res);
		}
		else if(url.equals("editticket")){
			return editticket(req,res);
		}
		else if(url.equals("editSupportTask")){
			return editSupportTask(req,res);
		}
		else if(url.equals("deleteticket")){
			return deleteticket(req,res);
		}
		else if(url.equals("checktask")){
			
			return checktask(req,res);
		}
			else if(url.equals("checkedittask")){
			
			return checkedittask(req,res);
		}
			else if(url.equals("singleedittask")){
				return singleedittask(req,res);
				
			}
			else if(url.equals("checksingleedittask")){
				
				return checksingleedittask(req,res);
			}
			else if(url.equals("editsingleAMC")){
				return editsingleAMC(req,res);
			}
			else if(url.equals("ticketcategory")){
				modelAndView = new ModelAndView("task/ticketcategory");
				
			}
			else if(url.equals("ticketcategorylist")){
				return ticketcategorylist(req,res);
			}
			else if(url.equals("addticketcat")){
				
				modelAndView = new ModelAndView("task/addticketcategory");
			}
			else if(url.equals("checkticketcategoryname")){
				return checkticketcategoryname(req,res);
			}
			else if(url.equals("editticketcat")){
				return editticketcat(req,res);
			}
			else if(url.equals("deleteticketcat")){
				return deleteticketcat(req,res);
			}
		return modelAndView;
	}

	protected ModelAndView onSubmit(HttpServletRequest req,
			HttpServletResponse res, Object cmd, BindException errors)
			throws Exception {

		String url = UrlUtill.UrlName(req.getRequestURI());
		if (url.equals("savecategory")) {

			return saveCategory(req, res);
		} else if (url.equals("updatecategory")) {

			return updateCategory(req, res);
		} else if (url.equals("saveasset")) {

			return saveAsset(req, res);
		}
		else if (url.equals("updateasset")) {

			return updateAsset(req, res);
		}
		else if (url.equals("saveschedule")) {
			return saveSchedule(req, res);
		}
		else if (url.equals("updateTaskschedule")) {
			return updateTaskschedule(req, res);
		}
		else if (url.equals("addTaskschedule")) {
			return addTaskschedule(req, res);
		}
		else if(url.equals("saveticket")){
			return saveticket(req,res);
		}
		else if(url.equals("updateticket")){
			return updateticket(req,res);
		}
		else if(url.equals("updatesingleTaskschedule")){
			return updatesingleTaskschedule(req,res);
		}
		else if(url.equals("updateSAMCschedule")){
			return updateSAMCschedule(req,res);
		}
		else if(url.equals("saveticketcat")){
			return saveticketcat(req,res);
		}
		else if(url.equals("updateticketcat")){
			return updateticketcat(req,res);
		}
		return null;
	}

	public ModelAndView categoryList(HttpServletRequest req,
			HttpServletResponse res) {

		try {
			out = res.getWriter();
			List<CategoriesBean> getCategoryList = assestsDao.getCategoryList();
			PersonJsonObject personJsonObject = new PersonJsonObject();
			personJsonObject.setCategoriesBeans(getCategoryList);

			Gson gson = new GsonBuilder().setPrettyPrinting().create();
			String json2 = gson.toJson(personJsonObject);
			out.print(json2);

		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return null;
	}

	public ModelAndView saveCategory(HttpServletRequest req,
			HttpServletResponse res) {

		try {
			
			InetAddress ip = InetAddress.getLocalHost();
			String userId = (String) req.getSession().getAttribute(
					"UserRecordID");

			java.util.Date dt = new java.util.Date();
			java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat(
					"yyyy-MM-dd HH:mm:ss");
			
			String currentTime = sdf.format(dt);
			
			int status = 0;
			String categoryname = req.getParameter("categoryname");
			String isactive = req.getParameter("isactive");
			if (isactive.equals("true")) {
				status = 1;
			}
			assestsDao.addCategory(categoryname, status);
			masterDao.userAuditTrail("assentisk_categories", "1", "1", currentTime,
					Integer.parseInt(userId), ip.getHostAddress());
			
		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return null;
	}

	@SuppressWarnings("unchecked")
	public ModelAndView editCategory(HttpServletRequest req,
			HttpServletResponse res) {

		try {
			map = new ModelMap();
			String categoryID = req.getParameter("categoryid");
			List<CategoriesBean> categoryList = assestsDao
					.getCategoryDetailsById(Integer.parseInt(categoryID));
			if (categoryList.size() > 0) {
				Map m = (Map) categoryList.get(0);
				map.addObject("ID", m.get("ID"));
				map.addObject("cname", m.get("cname"));
				map.addObject("IsActive", m.get("IsActive"));
			}

		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return new ModelAndView("assests/editcategory", map);
	}

	public ModelAndView updateCategory(HttpServletRequest req,
			HttpServletResponse res) {

		try {
			
			InetAddress ip = InetAddress.getLocalHost();
			String userId = (String) req.getSession().getAttribute(
					"UserRecordID");

			java.util.Date dt = new java.util.Date();
			java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat(
					"yyyy-MM-dd HH:mm:ss");
			
			String currentTime = sdf.format(dt);
			
			int status = 0;
			String categoryid = req.getParameter("categoryid");
			String categoryname = req.getParameter("categoryname");
			String isactive = req.getParameter("isactive");
			if (isactive.equals("true")) {
				status = 1;
			}
			assestsDao.updateCategory(Integer.parseInt(categoryid),
					categoryname, status);
			masterDao.userAuditTrail("assentisk_categories", "1", "1", currentTime,
					Integer.parseInt(userId), ip.getHostAddress());
			
		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return null;
	}

	public ModelAndView deleteCategory(HttpServletRequest req,
			HttpServletResponse res) {

		try {
			
			InetAddress ip = InetAddress.getLocalHost();
			String userId = (String) req.getSession().getAttribute(
					"UserRecordID");

			java.util.Date dt = new java.util.Date();
			java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat(
					"yyyy-MM-dd HH:mm:ss");
			
			String currentTime = sdf.format(dt);
			
			String categoryid = req.getParameter("id");
			assestsDao.deleteCategory(Integer.parseInt(categoryid));
			masterDao.userAuditTrail("assentisk_categories", "1", "1", currentTime,
					Integer.parseInt(userId), ip.getHostAddress());
			
		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return null;
	}

	public ModelAndView assetsList(HttpServletRequest req,
			HttpServletResponse res) {

		try {
			out = res.getWriter();
			List<AssetsBean> assetsList = assestsDao.getAssetsList();
			PersonJsonObject personJsonObject = new PersonJsonObject();
			personJsonObject.setAssetsBeans(assetsList);

			Gson gson = new GsonBuilder().setPrettyPrinting().create();
			String json2 = gson.toJson(personJsonObject);
			
			out.print(json2);

		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return null;
	}

	public ModelAndView addAsset(HttpServletRequest req, HttpServletResponse res) {

		try {
			map = new ModelMap();
			List<CategoriesBean> categoryList = assestsDao.getCategoryList();
			List<LocationsBean> locationList = organizationDao
					.getLocationsList();
			List<ApplicationsBean> applicationList = organizationDao
					.getApplicationsList();
			List<BusinessProcessesBean> businessProcessList = organizationDao
					.getBusinessProcessesList();
			List<EmployeeBean> employeeList = organizationDao.getEmployeeList();
			List<VendorBean> vendorList = assestsDao.getVendorList();

			map.addObject("categoryList", categoryList);
			map.addObject("locationList", locationList);
			map.addObject("applicationList", applicationList);
			map.addObject("businessProcessList", businessProcessList);
			map.addObject("employeeList", employeeList);
			map.addObject("vendorList", vendorList);
		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return new ModelAndView("assests/addasset", map);
	}

	public ModelAndView saveAsset(HttpServletRequest req,
			HttpServletResponse res) {

		try {
			InetAddress ip = InetAddress.getLocalHost();
			String userId = (String) req.getSession().getAttribute(
					"UserRecordID");

			java.util.Date dt = new java.util.Date();
			java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat(
					"yyyy-MM-dd HH:mm:ss");
			String currentTime = sdf.format(dt);

			String assetname = req.getParameter("assetname");			
			String categoryID = req.getParameter("category");
			String locationID = req.getParameter("location");
			String applicationID = req.getParameter("application");
			String businessprocessID = req.getParameter("businessprocess");
			String employee = req.getParameter("employee");
			String vendors=req.getParameter("vendors");			
		
			
			if(locationID.equals(""))
			{
				locationID="0";
			}
			if(applicationID.equals(""))
			{
				applicationID="0";
			}
			if(businessprocessID.equals(""))
			{
				businessprocessID="0";
			}
			String type = req.getParameter("type");
			String initvalue = req.getParameter("initvalue");
			String quantity = req.getParameter("quantity");
			
			assestsDao.saveAsset(assetname, Integer.parseInt(categoryID),
					Integer.parseInt(locationID), Integer
							.parseInt(applicationID), Integer
							.parseInt(businessprocessID), employee, currentTime, Integer
							.parseInt(userId), currentTime, Integer
							.parseInt(userId),  vendors, type, initvalue, quantity);
			masterDao.userAuditTrail("assentisk_assets", "1", "1", currentTime,
					Integer.parseInt(userId), ip.getHostAddress());

		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return null;
	}
	public ModelAndView editAsset(HttpServletRequest req, HttpServletResponse res) {

		try {
			map = new ModelMap();
			
			String assetID = req.getParameter("assetid");
			List<CategoriesBean> categoryList = assestsDao.getCategoryList();
			List<LocationsBean> locationList = organizationDao
					.getLocationsList();
			List<ApplicationsBean> applicationList = organizationDao
					.getApplicationsList();
			List<BusinessProcessesBean> businessProcessList = organizationDao
					.getBusinessProcessesList();
			List<EmployeeBean> employeeList = organizationDao.getEmployeeList();
			List<VendorBean> vendorList = assestsDao.getVendorList();

			List<AssetsBean> assetDetails = assestsDao.getAssetDetailsById(Integer.parseInt(assetID));
			if(assetDetails.size()>0)
			{
				Map m = (Map)assetDetails.get(0);
				map.addObject("ID", m.get("ID"));
				map.addObject("aname", m.get("aname"));
				map.addObject("category", m.get("category"));
				if(m.get("location").toString().equals("0"))
				{
					map.addObject("location", "");
				}
				else
				{
					map.addObject("location", m.get("location"));
				}
				if(m.get("application").toString().equals("0"))
				{
					map.addObject("application", "");
				}
				else
				{
					map.addObject("application", m.get("application"));
				}
				if(m.get("BP").toString().equals("0"))
				{
					map.addObject("BP", "");
				}
				else
				{
					map.addObject("BP", m.get("BP"));
				}		
				map.addObject("employee", m.get("employee"));
				map.addObject("type", m.get("type"));
				map.addObject("Initial_Values", m.get("Initial_Values"));
				map.addObject("quantity", m.get("quantity"));
				map.addObject("vendorId", m.get("vendorId"));
		
				
			}
			
			map.addObject("categoryList", categoryList);
			map.addObject("locationList", locationList);
			map.addObject("applicationList", applicationList);
			map.addObject("businessProcessList", businessProcessList);
			map.addObject("employeeList", employeeList);
			
			
		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return new ModelAndView("assests/editasset", map);
	}
	
	public ModelAndView updateAsset(HttpServletRequest req,
			HttpServletResponse res) {

		try {
			InetAddress ip = InetAddress.getLocalHost();
			String userId = (String) req.getSession().getAttribute(
					"UserRecordID");

			java.util.Date dt = new java.util.Date();
			java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat(
					"yyyy-MM-dd HH:mm:ss");
			String currentTime = sdf.format(dt);

			String assetID = req.getParameter("assetID");
			String assetName = req.getParameter("assetname");
			String categoryID = req.getParameter("category");
			String locationID = req.getParameter("location");
			String applicationID = req.getParameter("application");
			String businessprocessID = req.getParameter("businessprocess");
			String employee = req.getParameter("employee");
			String vendors=req.getParameter("vendors");
			String type = req.getParameter("type");
			String initvalue = req.getParameter("initvalue");
			String quantity = req.getParameter("quantity");

			
			if(locationID.equals(""))
			{
				locationID="0";
			}
			if(applicationID.equals(""))
			{
				applicationID="0";
			}
			if(businessprocessID.equals(""))
			{
				businessprocessID="0";
			}
			if(type.equals("undefined")){
				type="";
			}
			assestsDao.updateAsset(assetName,  Integer.parseInt(categoryID),  Integer.parseInt(locationID),  Integer.parseInt(applicationID),  Integer.parseInt(businessprocessID),  employee, currentTime, Integer.parseInt(userId), vendors, assetID, type, initvalue, quantity);
			masterDao.userAuditTrail("assentisk_assets", "1", "1", currentTime,
					Integer.parseInt(userId), ip.getHostAddress());

		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return null;
	}

	
	public ModelAndView deleteAsset(HttpServletRequest req,
			HttpServletResponse res) {

		try {
			InetAddress ip = InetAddress.getLocalHost();
			String userId = (String) req.getSession().getAttribute(
					"UserRecordID");
			
			java.util.Date dt = new java.util.Date();
			java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat(
					"yyyy-MM-dd HH:mm:ss");
			String currentTime = sdf.format(dt);
			
			String assetID = req.getParameter("id");
			assestsDao.deleteAsset(Integer.parseInt(assetID));
			
			masterDao.userAuditTrail("assentisk_assets", "1", "1", currentTime,
					Integer.parseInt(userId), ip.getHostAddress());
			
		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return null;
	}
	public ModelAndView schedule(HttpServletRequest req,
			HttpServletResponse res) {
	
		try
		{
			String id = req.getParameter("id");					
			map = new ModelMap();
			
			List<AssetsBean> assetDetail = assestsDao.getAmcDetailsByAsset(Integer.parseInt(id));
			List<VendorBean> vendorList = assestsDao.getVendorList();
			List<TimeBean> timeList = assestsDao.getTimeList();
			List<AssetsBean> assetList = assestsDao.getAssetsList();
			List<MonthSectionBean> monthsectionList = assestsDao.getMonthSectionList();
			List<WeekdayBean> weekdayList = assestsDao.getWeekdayList();
			List<YearSectionBean> yearsectionList=assestsDao.getYearSectionList();
			
			if(assetDetail.size()>0)
			{
				Map m = (Map)assetDetail.get(0);
				map.addObject("ID", m.get("ID"));
				map.addObject("AMC_CName", m.get("AMC_CName"));
				map.addObject("VendorID", m.get("VendorID"));
				map.addObject("FromDate", m.get("FromDate"));
				map.addObject("ToDate", m.get("ToDate"));
				map.addObject("assetID", m.get("assetID"));
				String responsiblehead=m.get("responsibleHead").toString();
				responsiblehead =assestsDao.getuserDataConcat(responsiblehead);
				map.addObject("responsibleHead", responsiblehead);
				map.addObject("schdulerderdata", m.get("scheduler"));
				
			}
			
			List<SchedulerBean> schedulerList = assestsDao.getSchedulerList(id);
			if(schedulerList.size()>0){
				Map mp = (Map)schedulerList.get(0);
				map.addObject("getScheduler",true);
				map.addObject("startTimeID", mp.get("startTimeID"));
				map.addObject("endTimeID", mp.get("endTimeID"));
				map.addObject("duration", mp.get("duration"));
				map.addObject("recurPattern", mp.get("recurPattern"));
				map.addObject("recurOccurence", mp.get("recurOccurence"));
				map.addObject("weekid", mp.get("weekid"));
				String weekid=mp.get("weekid").toString();
				String []week=weekid.split(",");
				String sun="0",mon="0",tues="0",wed="0",thrus="0",fri="0",sat="0";
				for(int i=0;i<week.length;i++){
					if(week[i].equals("1")){
						sun="1";
					}
					if(week[i].equals("2")){
						mon="2";
					}
					if(week[i].equals("3")){
						tues="3";
					}
					if(week[i].equals("4")){
						wed="4";
					}
					if(week[i].equals("5")){
						thrus="5";
					}
					if(week[i].equals("6")){
						fri="6";
					}
					if(week[i].equals("7")){
						sat="7";
					}
				}
			
	
				map.addObject("sun",sun);
				map.addObject("mon",mon);
				map.addObject("tues",tues);
				map.addObject("wed",wed);
				map.addObject("thrus",thrus);
				map.addObject("fri",fri);
				map.addObject("sat",sat);
				map.addObject("dateStart", mp.get("dateStart"));
				map.addObject("endDate", mp.get("endDate"));
				map.addObject("endRangePat", mp.get("endRangePat"));
				map.addObject("endoccurence", mp.get("endoccurence"));
				map.addObject("schedulerID", mp.get("id"));				
				map.addObject("dailyRadio", mp.get("dailyRadio"));
				map.addObject("dailyRecur", mp.get("dailyRecur"));
				map.addObject("monthRadio", mp.get("monthRadio"));
				map.addObject("monthdayRecur", mp.get("monthdayRecur"));
				map.addObject("monthRecur", mp.get("monthRecur"));
				map.addObject("monthSection", mp.get("monthSection"));
				map.addObject("monthWeekend", mp.get("monthWeekend"));
				map.addObject("yearlyRecur", mp.get("yearlyRecur"));
				map.addObject("yearlyMonthSection", mp.get("yearlyMonthSection"));
				map.addObject("yearlyMonthWeek", mp.get("yearlyMonthWeek"));
				map.addObject("yearlySection", mp.get("yearlySection"));
				map.addObject("yearlyMonthRecur", mp.get("yearlyMonthRecur"));
				map.addObject("yearlyRadio", mp.get("yearlyRadio"));
				
				
			}
			else
			{
				map.addObject("getScheduler",false);
				map.addObject("dailyRecur", "1");
				map.addObject("recurOccurence", "1");
				map.addObject("endoccurence","1");
				map.addObject("monthdayRecur", "1");
				map.addObject("monthRecur","1");
				map.addObject("yearlyRecur", "1");
				map.addObject("yearlyMonthRecur", "1");
			}
			List<EmployeeBean> employeeList = organizationDao.getEmployeeList();
			
			map.addObject("employeeList", employeeList);
			map.addObject("vendorList", vendorList);
			map.addObject("timeList",timeList);
			map.addObject("monthsectionList", monthsectionList);
			map.addObject("weekdayList",weekdayList);
			map.addObject("yearsectionList", yearsectionList);
			
			
			
			
			
		}
		catch(Exception exception)
		{
			exception.printStackTrace();
		}
		return new ModelAndView("assests/schedule", map);
	}
	public ModelAndView saveSchedule(HttpServletRequest req,
			HttpServletResponse res) {
	
		try
		{
			
			InetAddress ip = InetAddress.getLocalHost();
			String userId = (String) req.getSession().getAttribute(
					"UserRecordID");
			
			java.util.Date dt = new java.util.Date();
			java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat(
					"yyyy-MM-dd HH:mm:ss");
			String currentTime = sdf.format(dt);
			String tasktype=req.getParameter("tasktype");
			
			String assetid = req.getParameter("assetiddata");
			String id = req.getParameter("id");
			String amcname = req.getParameter("amcname");
			String vendor = req.getParameter("vendor");
			String fromdate = req.getParameter("fromdate");
			String todate = req.getParameter("todate");
			String scheduledata=req.getParameter("scheduledataval");

			String employee = req.getParameter("responsiblehead");
			if(!employee.equals("")){
			int firstBracket = employee.indexOf('(');
			String UserName = employee.substring(firstBracket + 1, employee.indexOf(')', firstBracket));
			employee=assestsDao.getUserId(UserName);
			}
			
			MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) req;
			MultipartFile multipartFile = multipartRequest.getFile("doc");
			Files file = new Files();
			file.setFile(multipartFile.getBytes());
			
			int vendorval = 0;
			
			if(vendor.equals("select"))
			{				
				vendorval = 0;
			}
			else
			{
				vendorval = Integer.parseInt(vendor);
			}
			
			if(id.equals(""))
			{
				assestsDao.saveAmcAsset(amcname, vendorval,fromdate, todate, Integer.parseInt(assetid),employee,scheduledata);
				int rowID = assestsDao.getAmcAssetID();
				filesService.save(file, "update assentisk_amc_assets set DocUpload=? where ID="+rowID+"");
			}
			else
			{
				
				assestsDao.updateAmcAsset(amcname, vendorval, fromdate, todate, Integer.parseInt(assetid), Integer.parseInt(id),employee,scheduledata);
				filesService.save(file, "update assentisk_amc_assets set DocUpload=? where ID="+id+"");
			}

			masterDao.userAuditTrail("assentisk_amc_assets", "1", "Edit", currentTime,Integer.parseInt(userId), ip.getHostAddress());

			
		
			String startTime = req.getParameter("startTime12");
			
			String endTimer = req.getParameter("endTime12");
		
			String duration = req.getParameter("duration12");
			
			String recurPattern = req.getParameter("oRadio12");
			
			String recurOccurence = req.getParameter("recur12");
			
			String weekid = req.getParameter("weekid12");
		
			String dateStart = req.getParameter("dateStart12");
			
			String endDater = req.getParameter("endDate12");
			
			String endoccurence = req.getParameter("endoccurence12");
			
			String endRangePat = req.getParameter("endRadio12");
			
			String schedulerID=req.getParameter("schedulerID12");
			
			String status="Created";
			
			
			
			String dailyRadio=req.getParameter("dailyRadio12");
			String dailyrecur=req.getParameter("dailyrecur12");
			
			
			String monthlyRadio=req.getParameter("monthlyRadio12");
			String daymonthlyrecur=req.getParameter("daymonthlyrecur12");
			String monthlyrecurmon=req.getParameter("monthlyrecurmon12");
			String monthsection=req.getParameter("monthsection12");
			String monthWeeksection=req.getParameter("monthWeeksection12");
			
			
			
			String daymonthlyyearrecur=req.getParameter("daymonthlyyearrecur12");
			String yearmonthlyRadio=req.getParameter("yearmonthlyRadio12");
			String yearsection=req.getParameter("yearsection12");
			String ONyearrecur=req.getParameter("ONyearrecur12");
			String yearmonthsection=req.getParameter("yearmonthsection12");
			String yearmonthWeeksection=req.getParameter("yearmonthWeeksection12");
			
			
			
			String flagdata=assestsDao.getFlagTochange(assetid,startTime,endTimer,duration,recurPattern,
					recurOccurence,weekid,dateStart,endDater,endoccurence,endRangePat,
					userId,status,schedulerID,dailyRadio,dailyrecur,monthlyRadio,daymonthlyrecur,monthlyrecurmon,
					monthsection,monthWeeksection,daymonthlyyearrecur,yearmonthlyRadio,yearsection,
					ONyearrecur,yearmonthsection,yearmonthWeeksection);
		
			assestsDao.saveScheduler(assetid,startTime,endTimer,duration,recurPattern,
					recurOccurence,weekid,dateStart,endDater,endoccurence,endRangePat,
					userId,status,schedulerID,dailyRadio,dailyrecur,monthlyRadio,daymonthlyrecur,monthlyrecurmon,
					monthsection,monthWeeksection,daymonthlyyearrecur,yearmonthlyRadio,yearsection,
					ONyearrecur,yearmonthsection,yearmonthWeeksection);
			masterDao.userAuditTrail("assentisk_scheduler", "1", "1", currentTime,
					Integer.parseInt(userId), ip.getHostAddress());
			
			
			List<String> dateList=new ArrayList<String>();
		//----Insert for daily basis------------------
			if(flagdata.equals("1")){
				assestsDao.updatetaskassetSchedulerData( amcname,  fromdate, employee,  userId,   todate, assetid);

			}
			else if(flagdata.equals("0")){
			
			
			String startDatenew=assestsDao.getToday(dateStart);
			
			dateStart=startDatenew;
			assestsDao.cancelSchedulerData(assetid);
		
			if(recurPattern.equals("1")){	
			
				
						if(endRangePat.equals("1")){
							//----Insert for daily basis on end date------------------	
									List<Date> dates = new ArrayList<Date>();
									
									int recurrence = 1;
									if(dailyRadio.equals("1")){
											if(!dailyrecur.equals("") || !dailyrecur.equals("0"))
											{
												recurrence=Integer.parseInt(dailyrecur);
											}
									}
									else if(dailyRadio.equals("2")){
										recurrence=7;
									}
					
									
												//String str_date = dateStart;
									String getenddate=assestsDao.getEndDate(dateStart);
								
									String[] startval=dateStart.split("-");
									String str_dater=startval[2]+"/"+startval[1]+"/"+startval[0];
									
									
									String[] endval=getenddate.split("-");
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
												Date  endDate = null;
												        try {
												            endDate = (Date)formatter.parse(end_date);
												        } catch (Exception ex) {
												        }
												long interval = recurrence*(24*1000 * 60 * 60); // 1 hour in millis
												long endTime =endDate.getTime() ; // create your endtime here, possibly using Calendar or Date
												long curTime = startDate.getTime();
												while (curTime <= endTime) {
												    dates.add(new Date(curTime));
												    curTime += interval;
												}
												DateFormat format2=new SimpleDateFormat("EEEE"); 
												for(int i=0;i<dates.size();i++){
												    Date lDate =(Date)dates.get(i);
												    String finalDay=format2.format(lDate);
												    
												    String ds = formatter.format(lDate);   
												    
												    
												    dateList.add(ds);
												    
												}
				}
				else if(endRangePat.equals("2")){
					//----Insert for daily basis on end After------------------	
					List<Date> dates = new ArrayList<Date>();
					
					int recurrence = 1;
					if(dailyRadio.equals("1")){
							if(!dailyrecur.equals("") || !dailyrecur.equals("0"))
							{
								recurrence=Integer.parseInt(dailyrecur);
							}
					}
					else if(dailyRadio.equals("2")){
						recurrence=7;
					}
	
					
								//String str_date = dateStart;
					String getenddate=assestsDao.getEndAfterDate(dateStart);
					String[] startval=dateStart.split("-");
					String str_dater=startval[2]+"/"+startval[1]+"/"+startval[0];
					
					
					String[] endval=getenddate.split("-");
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
								Date  endDate = null;
								        try {
								            endDate = (Date)formatter.parse(end_date);
								        } catch (Exception ex) {
								        }
								long interval = recurrence*(24*1000 * 60 * 60); // 1 hour in millis
								long endTime =endDate.getTime() ; // create your endtime here, possibly using Calendar or Date
								long curTime = startDate.getTime();
								while (curTime <= endTime) {
								    dates.add(new Date(curTime));
								    curTime += interval;
								}
								DateFormat format2=new SimpleDateFormat("EEEE"); 
								int limit= Integer.parseInt(endoccurence);
								for(int i=0;i < limit;i++){
								    Date lDate =(Date)dates.get(i);
								    String finalDay=format2.format(lDate);
								    
								    String ds = formatter.format(lDate);   
								    
								    
								    dateList.add(ds);
								}
				}
				if(endRangePat.equals("3")){
					//----Insert for daily basis on end Date------------------	
							List<Date> dates = new ArrayList<Date>();
							
							int recurrence = 1;
							if(dailyRadio.equals("1")){
									if(!dailyrecur.equals("") || !dailyrecur.equals("0"))
									{
										recurrence=Integer.parseInt(dailyrecur);
									}
							}
							else if(dailyRadio.equals("2")){
								recurrence=7;
							}
							
										//String str_date = dateStart;
							String[] startval=dateStart.split("-");
							String str_dater=startval[2]+"/"+startval[1]+"/"+startval[0];
							
							String[] endval=endDater.split("-");
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
										Date  endDate = null;
										        try {
										            endDate = (Date)formatter.parse(end_date);
										        } catch (Exception ex) {
										        }
										long interval = recurrence*(24*1000 * 60 * 60); // 1 hour in millis
										long endTime =endDate.getTime() ; // create your endtime here, possibly using Calendar or Date
										long curTime = startDate.getTime();
										while (curTime <= endTime) {
										    dates.add(new Date(curTime));
										    curTime += interval;
										}
										DateFormat format2=new SimpleDateFormat("EEEE"); 
										for(int i=0;i<dates.size();i++){
										    Date lDate =(Date)dates.get(i);
										    String finalDay=format2.format(lDate);
										    
										    String ds = formatter.format(lDate);   
										    
										    
										    dateList.add(ds);
										}
					}
			}
			else if(recurPattern.equals("2")){	
			
				//---------Insert record  weekly --------------------
				if(endRangePat.equals("1")){
					//----Insert for weekly basis on end date(default 1 year)------------------	
				int recurrence=1;
					if(!recurOccurence.equals("") || !recurOccurence.equals("0"))
					{
						recurrence=Integer.parseInt(recurOccurence);
					}
					if(weekid.equals("")){
						weekid="0";
					}
					
					String weekday=assestsDao.getWeeks(weekid);
					
					int weekcount=assestsDao.getWeekCount(weekid);
				
					List<Date> dates = new ArrayList<Date>();
					
								//String str_date = dateStart;
					String getenddate=assestsDao.getEndDate(dateStart);
					String[] startval=dateStart.split("-");
					String str_dater=startval[2]+"/"+startval[1]+"/"+startval[0];
					
					
					String[] endval=getenddate.split("-");
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
								Date  endDate = null;
								        try {
								            endDate = (Date)formatter.parse(end_date);
								        } catch (Exception ex) {
								        }
								        double interval;
								    	
								    		 interval = (24*1000 * 60 * 60);
								    	
								 // 1 hour in millis
								long endTime =endDate.getTime() ; // create your endtime here, possibly using Calendar or Date
								long curTime = startDate.getTime();
								while (curTime <= endTime) {
								    dates.add(new Date(curTime));
								    curTime += interval;
								}
								
									
								DateFormat format2=new SimpleDateFormat("EEEE");
								
								int j=1;
								for(int i=0;i<dates.size();i++){
								    Date lDate =(Date)dates.get(i);
								    String finalDay=format2.format(lDate);
								    
								    String ds = formatter.format(lDate); 
									
									if(!weekday.equals("")){
										 if(weekday.contains(finalDay)){
											 j++;
									    	 	
											    
											    											    
											    dateList.add(ds);
											    if(j== weekcount+1){
											    	i= i + (recurrence * 7);
											    	j=1;
											    }
											    else if(finalDay.equals("Sunday") && i < 7){
											    	i= i + (recurrence * 7);
											    	j=1;
											    }
											   
									    }
									}
									else
									{
										
									 	dateList.add(ds);
										i= i + (recurrence * 7);

									}

								}
				}
				else if(endRangePat.equals("2")){
					//----Insert for weekly basis on end date(default 1 year)------------------	
					int recurrence=1;
						if(!recurOccurence.equals("") || !recurOccurence.equals("0"))
						{
							recurrence=Integer.parseInt(recurOccurence);
						}
						if(weekid.equals("")){
							weekid="0";
						}
						
						String weekday=assestsDao.getWeeks(weekid);
						
						int weekcount=assestsDao.getWeekCount(weekid);
					
						List<Date> dates = new ArrayList<Date>();
						
									//String str_date = dateStart;
						String getenddate=assestsDao.getEndAfterDate(dateStart);
						String[] startval=dateStart.split("-");
						String str_dater=startval[2]+"/"+startval[1]+"/"+startval[0];
						
						String[] endval=getenddate.split("-");
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
									Date  endDate = null;
									        try {
									            endDate = (Date)formatter.parse(end_date);
									        } catch (Exception ex) {
									        }
									        double interval;
									    	
									        interval = (24*1000 * 60 * 60);
									    	
									 // 1 hour in millis
									long endTime =endDate.getTime() ; // create your endtime here, possibly using Calendar or Date
									long curTime = startDate.getTime();
									while (curTime <= endTime) {
									    dates.add(new Date(curTime));
									    curTime += interval;
									}
									
										
									DateFormat format2=new SimpleDateFormat("EEEE");
									int limit= Integer.parseInt(endoccurence);
									int occLimit=0;
									int j=1;
									for(int i=0;i<dates.size();i++){
									    Date lDate =(Date)dates.get(i);
									    String finalDay=format2.format(lDate);
									    
									    String ds = formatter.format(lDate); 
										
										if(!weekday.equals("")){
											 if(weekday.contains(finalDay)){
												 j++;
												    dateList.add(ds);
													occLimit++;
												    if(j== weekcount+1){
												    	i= i + (recurrence * 7);
												    	j=1;
												    }
												    else if(finalDay.equals("Sunday") && i < 7){
												    	i= i + (recurrence * 7);
												    	j=1;
												    }
												   
										    }
										}
										else
										{
											j++;
											
										    dateList.add(ds);
											occLimit++;
											i= i + (recurrence * 7);

										}
											
											 
									
										if(occLimit==limit){
											break;
										}
										
										
									   
									   
									    
									}
					}
				else if(endRangePat.equals("3")){
					//----Insert for weekly basis on end date(default 1 year)------------------	
				int recurrence=1;
					if(!recurOccurence.equals("") || !recurOccurence.equals("0"))
					{
						recurrence=Integer.parseInt(recurOccurence);
					}
					if(weekid.equals("")){
						weekid="0";
					}
					
					String weekday=assestsDao.getWeeks(weekid);
					
					int weekcount=assestsDao.getWeekCount(weekid);
				
					List<Date> dates = new ArrayList<Date>();
					
								//String str_date = dateStart;
					String[] startval=dateStart.split("-");
					String str_dater=startval[2]+"/"+startval[1]+"/"+startval[0];
					
					String[] endval=endDater.split("-");
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
								Date  endDate = null;
								        try {
								            endDate = (Date)formatter.parse(end_date);
								        } catch (Exception ex) {
								        }
								        double interval;
								    	
								    		 interval = (24*1000 * 60 * 60);
								    	
								 // 1 hour in millis
								long endTime =endDate.getTime() ; // create your endtime here, possibly using Calendar or Date
								long curTime = startDate.getTime();
								while (curTime <= endTime) {
								    dates.add(new Date(curTime));
								    curTime += interval;
								}
								
									
								DateFormat format2=new SimpleDateFormat("EEEE");
								
								int j=1;
								for(int i=0;i<dates.size();i++){
								    Date lDate =(Date)dates.get(i);
								    String finalDay=format2.format(lDate);
								    
								    String ds = formatter.format(lDate); 
									
									if(!weekday.equals("")){
										 if(weekday.contains(finalDay)){
											 j++;
									    	 	
											    dateList.add(ds);
											    if(j== weekcount+1){
											    	i= i + (recurrence * 7);
											    	j=1;
											    }
											    else if(finalDay.equals("Sunday") && i < 7){
											    	i= i + (recurrence * 7);
											    	j=1;
											    }
											   
									    }
									}
									else
									{
										
										
									    dateList.add(ds);
										i= i + (recurrence * 7);

									}
										
														    
								}
				}
				
				
				

				
				
				
				
				
			}
			else if(recurPattern.equals("3")){	
				 
					 if(monthlyRadio.equals("1")){
						
						 List<Date> dates = new ArrayList<Date>();
							
							int daterec = 1;
							int monthrec = 1;
							if(daterec !=0){
								daterec=Integer.parseInt(daymonthlyrecur);
							}
							if(monthrec!=0){
								monthrec=Integer.parseInt(monthlyrecurmon);
							}
							DecimalFormat decimalFormat = new DecimalFormat("00");
							String dateoccurence=decimalFormat.format(daterec);
										//String str_date = dateStart;
							String getenddate="";
							int limit=0;
							 if(endRangePat.equals("2")){
								     getenddate=assestsDao.getEndAfterDate(dateStart);
								     if(endoccurence.equals("0") || endoccurence.equals("")){
								    	 limit = 1;
								     }
								     else
								     {
								    	 limit= Integer.parseInt(endoccurence);
								     }
							 	}
							 else if(endRangePat.equals("3")){
								 	  getenddate = endDater;
								 	 
							 	}
							 else
							 {
								  getenddate=assestsDao.getEndDate(dateStart);
							 }
							String[] startval=dateStart.split("-");
							String str_dater=startval[2]+"/"+startval[1]+"/"+startval[0];
							
							
							String[] endval=getenddate.split("-");
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
										Date  endDate = null;
										        try {
										            endDate = (Date)formatter.parse(end_date);
										        } catch (Exception ex) {
										        }
										long interval = (24*1000 * 60 * 60); // 1 hour in millis
										long endTime =endDate.getTime() ; // create your endtime here, possibly using Calendar or Date
										long curTime = startDate.getTime();
										while (curTime <= endTime) {
										    dates.add(new Date(curTime));
										    curTime += interval;
										}
										DateFormat format2=new SimpleDateFormat("EEEE"); 
										DateFormat formatdate=new SimpleDateFormat("dd"); 
										DateFormat formatmonth=new SimpleDateFormat("MMMM"); 
										int countmonth=1;
										int limitoccur=1;
										
										for(int i=0;i<dates.size();i++){
										    Date lDate =(Date)dates.get(i);
										    String finalDay=format2.format(lDate);
										    String Date=formatdate.format(lDate);
										    String Month=formatmonth.format(lDate);
										    String ds = formatter.format(lDate);
										    if(Date.equals(dateoccurence))	{
										    		if(countmonth == 1){					
															
															 dateList.add(ds);
															if(limit!=0){
																if(limitoccur == limit ){
																	break;
																}
																limitoccur=limitoccur+1;
															}
																
										    		}
										    		countmonth = countmonth + 1;
										    		if(countmonth == (monthrec+1)){
										    			countmonth=1;
										    		}
										    		
												  
										    }
										   
										    
										}
					 }
					 else if(monthlyRadio.equals("2")){
						 List<Date> dates = new ArrayList<Date>();
							
							int monthrec = 1;
							String weekSection = "1";
							//String monthsection=req.getParameter("monthsection12");
							if(monthrec!=0){
								monthrec=Integer.parseInt(monthlyrecurmon);
							}
							if(!weekSection.equals("0") || !weekSection.equals("")){
								weekSection=monthWeeksection;
							}
							String weekDay=assestsDao.getWeeks(weekSection);
							DecimalFormat decimalFormat = new DecimalFormat("00");
										//String str_date = dateStart;
							String getenddate="";
							int limit=0;
							 if(endRangePat.equals("2")){
								     getenddate=assestsDao.getEndAfterDate(dateStart);
								     if(endoccurence.equals("0") || endoccurence.equals("")){
								    	 limit = 1;
								     }
								     else
								     {
								    	 limit= Integer.parseInt(endoccurence);
								     }
							 	}
							 else if(endRangePat.equals("3")){
								 	  getenddate = endDater;
								 	 
							 	}
							 else
							 {
								  getenddate=assestsDao.getEndDate(dateStart);
							 }
							String[] startval=dateStart.split("-");
							String str_dater=startval[2]+"/"+startval[1]+"/"+startval[0];
							
							
							String[] endval=getenddate.split("-");
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
										Date  endDate = null;
										        try {
										            endDate = (Date)formatter.parse(end_date);
										        } catch (Exception ex) {
										        }
										long interval = (24*1000 * 60 * 60); // 1 hour in millis
										long endTime =endDate.getTime() ; // create your endtime here, possibly using Calendar or Date
										long curTime = startDate.getTime();
										while (curTime <= endTime) {
										    dates.add(new Date(curTime));
										    curTime += interval;
										}
										DateFormat format2=new SimpleDateFormat("EEEE"); 
										DateFormat formatdate=new SimpleDateFormat("dd"); 
										DateFormat formatmonth=new SimpleDateFormat("MMMM"); 
										int startSectionLimit,endSectionLimit;
										if(monthsection.equals("2")){
											startSectionLimit=8;
											endSectionLimit=14;
										}
										else if(monthsection.equals("3")){
											startSectionLimit=15;
											endSectionLimit=21;
										}
										else if(monthsection.equals("4")){
											startSectionLimit=22;
											endSectionLimit=28;
										}
										else if(monthsection.equals("5")){
											startSectionLimit=29;
											endSectionLimit=31;
										}
										else{
											startSectionLimit=1;
											endSectionLimit=7;

										}
										int countmonth=1;
										int limitoccur=1;
										for(int i=0;i<dates.size();i++){
										    Date lDate =(Date)dates.get(i);
										    String finalDay=format2.format(lDate);
										    String Date=formatdate.format(lDate);
										    String Month=formatmonth.format(lDate);
										    String ds = formatter.format(lDate); 
										    int dateInt=Integer.parseInt(Date);
										    if(finalDay.equals(weekDay))	{
										    	if(dateInt>=startSectionLimit && dateInt <=endSectionLimit){
										    		
										    		if(countmonth == 1){
										    				
															
															
															 dateList.add(ds);
															if(limit!=0){
																if(limitoccur == limit ){
																	break;
																}
																limitoccur=limitoccur+1;
															}
															
										    		}
										    		countmonth = countmonth + 1;
										    		if(countmonth == (monthrec+1)){
										    			countmonth=1;
										    		}
										    		
										    	 														
										    		
										    	}
												  
										    }
										   
										    
										}
					 }

					 
					 
					
					 
				
			}
			else if(recurPattern.equals("4")){	
				
				if(yearmonthlyRadio.equals("1")){
				
					List<Date> dates = new ArrayList<Date>();
					
					int recurrence = 1;
					String dayyear="1";
					String monthval="1";
					int yearrecur=1;
						if(!ONyearrecur.equals("") || !ONyearrecur.equals("0")){
							dayyear=ONyearrecur;
						}
						
						DecimalFormat decimalFormat = new DecimalFormat("00");
						String dayyearv=decimalFormat.format(Integer.parseInt(dayyear));
						dayyear=dayyearv;
					if(!yearsection.equals("") || !yearsection.equals("")){
						monthval=yearsection;
					}
					if(!daymonthlyyearrecur.equals("") || !daymonthlyyearrecur.equals("0")){
						yearrecur=Integer.parseInt(daymonthlyyearrecur);
					}
					String getmonth=assestsDao.getMonth(monthval);
					//String str_date = dateStart;
					String getenddate="";
					int limit=0;
					 if(endRangePat.equals("2")){
						     getenddate=assestsDao.getEndAfterDate(dateStart);
						     if(endoccurence.equals("0") || endoccurence.equals("")){
						    	 limit = 1;
						     }
						     else
						     {
						    	 limit= Integer.parseInt(endoccurence);
						     }
					 	}
					 else if(endRangePat.equals("3")){
						 	  getenddate = endDater;
						 	 
					 	}
					 else
					 {
						  getenddate=assestsDao.getYearEndDate(dateStart);
					 }
					
					String[] startval=dateStart.split("-");
					String str_dater=startval[2]+"/"+startval[1]+"/"+startval[0];
					
					
					String[] endval=getenddate.split("-");
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
								Date  endDate = null;
								        try {
								            endDate = (Date)formatter.parse(end_date);
								        } catch (Exception ex) {
								        }
								long interval = recurrence*(24*1000 * 60 * 60); // 1 hour in millis
								long endTime =endDate.getTime() ; // create your endtime here, possibly using Calendar or Date
								long curTime = startDate.getTime();
								while (curTime <= endTime) {
								    dates.add(new Date(curTime));
								    curTime += interval;
								}
								DateFormat format2=new SimpleDateFormat("EEEE"); 
								DateFormat formatdate=new SimpleDateFormat("dd"); 
								DateFormat formatmonth=new SimpleDateFormat("MMMM"); 
								int countYear=1;
								int limitoccur=1;
								for(int i=0;i<dates.size();i++){
								    Date lDate =(Date)dates.get(i);
								    String finalDay=format2.format(lDate);
								   
								    String ds = formatter.format(lDate);   
								    String Date=formatdate.format(lDate);
								    String month=formatmonth.format(lDate);
								
								    if(month.equals(getmonth)){
								    	 if(Date.equals(dayyear))	{
								    		 if(countYear==1){
											    	 
											    	 
											    	
											    	 dateList.add(ds);
											    	 if(limit!=0){
															if(limitoccur == limit ){
																break;
															}
														
															limitoccur=limitoccur+1;
														}
								    		 }
								    		 countYear = countYear + 1;
								    		
									    		if(countYear == (yearrecur+1)){
									    			countYear = 1;
									    		}
									    		
									    }
								    }
								   
								   
								    dateList.add(ds);
								    
								}
					
				}
				else if(yearmonthlyRadio.equals("2")){
					//----Insert for daily basis on end date------------------	
					List<Date> dates = new ArrayList<Date>();
					
					int yearrecur=1;
					String monthval="1";
					String weekSection = "1";
					
					if(!daymonthlyyearrecur.equals("") || !daymonthlyyearrecur.equals("0")){
						yearrecur=Integer.parseInt(daymonthlyyearrecur);
					}
					

					if(!yearsection.equals("") || !yearsection.equals("")){
											monthval=yearsection;
					}
					
					if(!yearmonthWeeksection.equals("0") || !yearmonthWeeksection.equals("")){
						weekSection=yearmonthWeeksection;
					}
					String weekDay=assestsDao.getWeeks(weekSection);
					String getmonth=assestsDao.getMonth(monthval);
								//String str_date = dateStart;
					int limit=0;
					String getenddate="";
					 if(endRangePat.equals("2")){
						     getenddate=assestsDao.getEndAfterDate(dateStart);
						     if(endoccurence.equals("0") || endoccurence.equals("")){
						    	 limit = 1;
						     }
						     else
						     {
						    	 limit= Integer.parseInt(endoccurence);
						     }
					 	}
					 else if(endRangePat.equals("3")){
						 	  getenddate = endDater;
						 	 
					 	}
					 else
					 {
						  getenddate=assestsDao.getYearEndDate(dateStart);
					 }
					String[] startval=dateStart.split("-");
					String str_dater=startval[2]+"/"+startval[1]+"/"+startval[0];
					
					
					String[] endval=getenddate.split("-");
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
								Date  endDate = null;
								        try {
								            endDate = (Date)formatter.parse(end_date);
								        } catch (Exception ex) {
								        }
								long interval = 24*1000 * 60 * 60; // 1 hour in millis
								long endTime =endDate.getTime() ; // create your endtime here, possibly using Calendar or Date
								long curTime = startDate.getTime();
								int startSectionLimit,endSectionLimit;
								while (curTime <= endTime) {
								    dates.add(new Date(curTime));
								    curTime += interval;
								}
								DateFormat format2=new SimpleDateFormat("EEEE"); 
								DateFormat formatmonth=new SimpleDateFormat("MMMM"); 
								DateFormat formatdate=new SimpleDateFormat("dd"); 
								if(yearmonthsection.equals("2")){
									startSectionLimit=8;
									endSectionLimit=14;
								}
								else if(yearmonthsection.equals("3")){
									startSectionLimit=15;
									endSectionLimit=21;
								}
								else if(yearmonthsection.equals("4")){
									startSectionLimit=22;
									endSectionLimit=28;
								}
								else if(yearmonthsection.equals("5")){
									startSectionLimit=29;
									endSectionLimit=31;
								}
								else{
									startSectionLimit=1;
									endSectionLimit=7;

								}
								int countYear=1;
								int limitoccur=1;
								for(int i=0;i<dates.size();i++){
								    Date lDate =(Date)dates.get(i);
								    String finalDay=format2.format(lDate);
								    String month=formatmonth.format(lDate);
								    String Date=formatdate.format(lDate);
								    int dateInt=Integer.parseInt(Date);
								    if(month.equals(getmonth)){
								    	
								    	 if(finalDay.equals(weekDay))	{
								    		 if(dateInt>=startSectionLimit && dateInt <=endSectionLimit){
								    			
								    			 if(countYear==1){
								    			 
												    String ds = formatter.format(lDate);   
												    
												    
												    dateList.add(ds);
												    if(limit!=0){
														if(limitoccur == limit ){
															break;
														}
													
														limitoccur=limitoccur+1;
													}
								    		 }
								    		 countYear = countYear + 1;
									    		
									    		if(countYear == (yearrecur+1)){
									    			countYear = 1;
									    		}
								    		 }
								    	 }
								    	
								    }
								   
								    //dateList.add(ds);
								    
								}
				}
				
				
			}
			String[] startval=dateStart.split("-");
			String str_dater=startval[2]+"/"+startval[1]+"/"+startval[0];
			String assignedTo=employee;
			String assignedBy=(String) req.getSession().getAttribute("UserRecordID");
			
			
			startTime=assestsDao.getTime(startTime);
			endTimer=assestsDao.getTime(endTimer);
			assestsDao.insertSchedulerData(assetid,dateList,scheduledata,amcname,fromdate,assignedTo,assignedBy,startTime,endTimer,todate);
			
		}
		
			if(tasktype.equals("amc")){
				modelAndView = new ModelAndView("task/task");
			}
			else if(tasktype.equals("system")){
				modelAndView = new ModelAndView("assests/assets");
			}
			else
			{
				modelAndView = new ModelAndView("assests/assets");
			}
			
		

			
			
			
		}
		catch(Exception exception)
		{
			exception.printStackTrace();
		}
		return modelAndView;
	}
	
	
	public ModelAndView addScheduler(HttpServletRequest req,
			HttpServletResponse res) {

		try {
			PrintWriter out= res.getWriter();
			InetAddress ip = InetAddress.getLocalHost();
			String userId = (String) req.getSession().getAttribute(
					"UserRecordID");

			java.util.Date dt = new java.util.Date();
			java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat(
					"yyyy-MM-dd HH:mm:ss");
			
			String currentTime = sdf.format(dt);
			
		
			String assetid = req.getParameter("assetid");
		
			String startTime = req.getParameter("startTime");
			
			String endTime = req.getParameter("endTime");
		
			String duration = req.getParameter("duration");
			
			String recurPattern = req.getParameter("oRadio");
			
			String recurOccurence = req.getParameter("recur");
			
			String weekid = req.getParameter("weekid");
		
			String dateStart = req.getParameter("dateStart");
			
			String endDate = req.getParameter("endDate");
			
			String endoccurence = req.getParameter("endoccurence");
			
			String endRangePat = req.getParameter("endRadio");
			
			String schedulerID=req.getParameter("schedulerID");
			
			String status="Created";
			
			String schdulerderdata="";
			
			String dailyRadio=req.getParameter("dailyRadio");
			String dailyrecur=req.getParameter("dailyrecur");
			String monthlyRadio=req.getParameter("monthlyRadio");
			String daymonthlyrecur=req.getParameter("daymonthlyrecur");
			String monthlyrecurmon=req.getParameter("monthlyrecurmon");
			String monthsection=req.getParameter("monthsection");
			String monthWeeksection=req.getParameter("monthWeeksection");
			String daymonthlyyearrecur=req.getParameter("daymonthlyyearrecur");
			String yearmonthlyRadio=req.getParameter("yearmonthlyRadio");
			String yearsection=req.getParameter("yearsection");
			String ONyearrecur=req.getParameter("ONyearrecur");
			String yearmonthsection=req.getParameter("yearmonthsection");
			String yearmonthWeeksection=req.getParameter("yearmonthWeeksection");
			

			if(recurPattern.equals("1")){
				schdulerderdata +="Occurs  ";
				if(dailyRadio.equals("1")){
					schdulerderdata+= " every day ";
				}
				else if(dailyRadio.equals("2")){
						schdulerderdata+=" every weekday ";
					}
				}
			else if(recurPattern.equals("2")){
				schdulerderdata +="Occurs every ";
				if(weekid!=""){
					List weekday=assestsDao.getday(weekid);
					if(weekday.size()>0){
						Map m=(Map)weekday.get(0);
						schdulerderdata +="  "+m.get("mname").toString();
					}
				}
				
			}
			else if(recurPattern.equals("3")){
				schdulerderdata +="Occurs ";
				if(monthlyRadio.equals("1")){
					schdulerderdata+=" Day "+daymonthlyrecur +" of every "+monthlyrecurmon+" month(s)";
				}
				else if(monthlyRadio.equals("2")){
					schdulerderdata+=" the "+assestsDao.getMonthSection(monthsection)+" "+ assestsDao.getWeeksection(monthWeeksection)+" of every "+monthlyrecurmon+" month(s)";
				}
			}
			else if(recurPattern.equals("4")){
				schdulerderdata +="Occurs ";
				if(yearmonthlyRadio.equals("1")){
					schdulerderdata+=" every  "+assestsDao.getYearSection(yearsection) +"  "+ONyearrecur;
				}
				else if(yearmonthlyRadio.equals("2")){
					schdulerderdata+=" the "+assestsDao.getMonthSection(yearmonthsection) +"  "+ assestsDao.getWeeksection(yearmonthWeeksection)+" of "+assestsDao.getYearSection(yearsection) +" month(s)";
				}
			}
			
			if(endRangePat.equals("2")){
				if(endoccurence.equals("1")){
					schdulerderdata+=" effective "+dateStart+" for "+endoccurence+" time ";
				}
				else
				{
					schdulerderdata+=" effective "+dateStart+" for "+endoccurence+" times ";
				}
				

			}
			else if(endRangePat.equals("3")){
				schdulerderdata+=" effective "+dateStart+" until "+endDate;

			}
			else {
				schdulerderdata+=" effective "+dateStart;

			}
			
			if(!startTime.equals("")){
				schdulerderdata +=" from "+assestsDao.getTimedata(startTime) +" to "+assestsDao.getTimedata(endTime);
			}
			
			
			out.print(schdulerderdata);
			
		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return null;
	}
	
	
	public ModelAndView callEndTime(HttpServletRequest req,
			HttpServletResponse res) {		
		try
		{	
			map = new ModelMap();			
			String startId=req.getParameter("startId");
			
			List<TimeBean> timeList = assestsDao.endTimeList(startId);
			map.addObject("timeList",timeList);
			modelAndView = new ModelAndView("ajaxresponse/endTimeList", map);			
			
		}
		catch(Exception exception)
		{
			exception.printStackTrace();
		}
		return modelAndView;
	}
	

	public ModelAndView callDiffernce(HttpServletRequest req,
			HttpServletResponse res) {		
		try
		{	
			PrintWriter out= res.getWriter();
			map = new ModelMap();			
			String startID=req.getParameter("startID");
			String endID=req.getParameter("endID");
			
			String getTimeStart = assestsDao.gettime(startID);	
			String getTimeEnd = assestsDao.gettime(endID);	
			
			String start[]=getTimeStart.split(":");
			String end[]=getTimeEnd.split(":");
			
			//int beforeColon= Integer.parseInt(end[0]) -Integer.parseInt(start[0]) ;
			//int afterColon=Integer.parseInt(end[1]) - Integer.parseInt(start[1]);
			
			int starttotal=Integer.parseInt(start[0]) *60 + Integer.parseInt(start[1]);
			int endtotal=Integer.parseInt(end[0]) *60 + Integer.parseInt(end[1]);
			
			int diff=endtotal-starttotal;
			int beforeColon = diff / 60;
			int afterColon = diff % 60;
			String finalTime;
		    if(afterColon== 0)
		    {
		    	finalTime=beforeColon +":00";
		    }
		    else
		    {
		    	finalTime=beforeColon +":"+afterColon;
		    }
			
			out.write(finalTime);
			
		}
		catch(Exception exception)
		{
			exception.printStackTrace();
		}
		return null;
	}
	
	public ModelAndView amcList(HttpServletRequest req,
			HttpServletResponse res) {

		try {
			out = res.getWriter();
			String userId = (String) req.getSession().getAttribute("UserRecordID");
			String getsevenAfterDate=assestsDao.getsevenAfterDate();
			List<AmcAssetBean> amcList = assestsDao.getAMCdataList(userId,getsevenAfterDate);
			PersonJsonObject personJsonObject = new PersonJsonObject();
			personJsonObject.setAmcAssetBeans(amcList);

			Gson gson = new GsonBuilder().setPrettyPrinting().create();
			String json2 = gson.toJson(personJsonObject);
			out.print(json2);

		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return null;
	}

	public ModelAndView checkCategoryName(HttpServletRequest req,HttpServletResponse res)
	{	
		
		try
		{
			PrintWriter out = res.getWriter();
			String categoryname = req.getParameter("categoryname");			
			List<CategoriesBean> checksize = assestsDao.checkCategoryName(categoryname);
			if(checksize.size()>0)
			{
				out.write("exist");
			}
			else
			{
				out.write("notexist");
			}
			
		}
		catch(Exception exception)
		{
			exception.printStackTrace();
		}
		return null;
	}
	
	public ModelAndView checkAssetName(HttpServletRequest req,HttpServletResponse res)
	{	
		
		try
		{
			PrintWriter out = res.getWriter();
			String assetname = req.getParameter("assetname");			
			List<AssetsBean> checksize = assestsDao.checkAssetName(assetname);
			if(checksize.size()>0)
			{
				out.write("exist");
			}
			else
			{
				out.write("notexist");
			}
			
		}
		catch(Exception exception)
		{
			exception.printStackTrace();
		}
		return null;
	}
	
	public ModelAndView taskList(HttpServletRequest req,
			HttpServletResponse res) {

		try {
			out = res.getWriter();
			String userId = (String) req.getSession().getAttribute("UserRecordID");

			String getsevenAfterDate=assestsDao.getsevenAfterDate();
	
			List<taskBean> amcList = assestsDao.gettaskList(userId,getsevenAfterDate);
			PersonJsonObject personJsonObject = new PersonJsonObject();
			personJsonObject.setTaskBeans(amcList);
			Gson gson = new GsonBuilder().setPrettyPrinting().create();
			String json2 = gson.toJson(personJsonObject);
			out.print(json2);
			

		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return null;
	}
	
	public ModelAndView edittask(HttpServletRequest req,
			HttpServletResponse res){
		try{
			
			String id = req.getParameter("taskid");					
			map = new ModelMap();
			
			List<TimeBean> timeList = assestsDao.getTimeList();
			List<MonthSectionBean> monthsectionList = assestsDao.getMonthSectionList();
			List<WeekdayBean> weekdayList = assestsDao.getWeekdayList();
			List<YearSectionBean> yearsectionList=assestsDao.getYearSectionList();
			List<taskBean> taskDetail = assestsDao.gettaskScheduler(Integer.parseInt(id));

			if(taskDetail.size()>0)
			{
				Map m = (Map)taskDetail.get(0);
				map.addObject("ID", m.get("TaskID"));
				map.addObject("taskName", m.get("taskName"));
				map.addObject("FromDate", m.get("fromDate"));
				map.addObject("ToDate", m.get("toDate"));
				String responsiblehead=m.get("responsiblePerson").toString();
				responsiblehead =assestsDao.getuserDataConcat(responsiblehead);
				map.addObject("responsibleHead", responsiblehead);
				map.addObject("schdulerderdata", m.get("scheduler"));
				map.addObject("taskid", m.get("taskid"));
				
			}
			
			List<SchedulerBean> schedulerList = assestsDao.gettaskSchedulerList(id);
			if(schedulerList.size()>0){
				Map mp = (Map)schedulerList.get(0);
				map.addObject("getScheduler",true);
				map.addObject("startTimeID", mp.get("startTimeID"));
				map.addObject("endTimeID", mp.get("endTimeID"));
				map.addObject("duration", mp.get("duration"));
				map.addObject("recurPattern", mp.get("recurPattern"));
				map.addObject("recurOccurence", mp.get("recurOccurence"));
				map.addObject("weekid", mp.get("weekid"));
				String weekid=mp.get("weekid").toString();
				String []week=weekid.split(",");
				String sun="0",mon="0",tues="0",wed="0",thrus="0",fri="0",sat="0";
				for(int i=0;i<week.length;i++){
					if(week[i].equals("1")){
						sun="1";
					}
					if(week[i].equals("2")){
						mon="2";
					}
					if(week[i].equals("3")){
						tues="3";
					}
					if(week[i].equals("4")){
						wed="4";
					}
					if(week[i].equals("5")){
						thrus="5";
					}
					if(week[i].equals("6")){
						fri="6";
					}
					if(week[i].equals("7")){
						sat="7";
					}
				}
			
	
				map.addObject("sun",sun);
				map.addObject("mon",mon);
				map.addObject("tues",tues);
				map.addObject("wed",wed);
				map.addObject("thrus",thrus);
				map.addObject("fri",fri);
				map.addObject("sat",sat);
				map.addObject("dateStart", mp.get("dateStart"));
				map.addObject("endDate", mp.get("endDate"));
				map.addObject("endRangePat", mp.get("endRangePat"));
				map.addObject("endoccurence", mp.get("endoccurence"));
				map.addObject("schedulerID", mp.get("id"));				
				map.addObject("dailyRadio", mp.get("dailyRadio"));
				map.addObject("dailyRecur", mp.get("dailyRecur"));
				map.addObject("monthRadio", mp.get("monthRadio"));
				map.addObject("monthdayRecur", mp.get("monthdayRecur"));
				map.addObject("monthRecur", mp.get("monthRecur"));
				map.addObject("monthSection", mp.get("monthSection"));
				map.addObject("monthWeekend", mp.get("monthWeekend"));
				map.addObject("yearlyRecur", mp.get("yearlyRecur"));
				map.addObject("yearlyMonthSection", mp.get("yearlyMonthSection"));
				map.addObject("yearlyMonthWeek", mp.get("yearlyMonthWeek"));
				map.addObject("yearlySection", mp.get("yearlySection"));
				map.addObject("yearlyMonthRecur", mp.get("yearlyMonthRecur"));
				map.addObject("yearlyRadio", mp.get("yearlyRadio"));
				
				
			}
			else
			{
				map.addObject("getScheduler",false);
				map.addObject("dailyRecur", "1");
				map.addObject("recurOccurence", "1");
				map.addObject("endoccurence","1");
				map.addObject("monthdayRecur", "1");
				map.addObject("monthRecur","1");
				map.addObject("yearlyRecur", "1");
				map.addObject("yearlyMonthRecur", "1");
			}
			
			map.addObject("timeList",timeList);
			map.addObject("monthsectionList", monthsectionList);
			map.addObject("weekdayList",weekdayList);
			map.addObject("yearsectionList", yearsectionList);
			modelAndView = new ModelAndView("task/editTask", map);			
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndView;
	}

	
	public ModelAndView updateTaskschedule(HttpServletRequest req,
			HttpServletResponse res) {
	
		try
		{
			
			InetAddress ip = InetAddress.getLocalHost();
			String userId = (String) req.getSession().getAttribute(
					"UserRecordID");
			
			java.util.Date dt = new java.util.Date();
			java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat(
					"yyyy-MM-dd HH:mm:ss");
			java.text.SimpleDateFormat sdf1 = new java.text.SimpleDateFormat(
			"yyyy-MM-dd");
			String currentTime = sdf.format(dt);
			
			String currentFormatTime = sdf1.format(dt);
			
			
			String taskid = req.getParameter("taskid");
			String taskname = req.getParameter("taskname");
			String vendor = req.getParameter("vendor");
			String fromdate = req.getParameter("fromdate");
			String todate = req.getParameter("todate");
			String scheduledata=req.getParameter("scheduledataval");
			String scheduletask=req.getParameter("scheduletask");
			String employee = req.getParameter("responsiblehead");
			
			System.out.println("employee: " + employee);
			if (!employee.equals("")) {
				System.out.println("inside!!!!!");
				int firstBracket = employee.indexOf('(');
				// String UserName = reporting.substring(firstBracket + 1,
				// reporting.indexOf(')', firstBracket));
				String UserName = employee
						.substring(0, employee.indexOf('('));
				System.out.println("UserName: " + UserName);
				employee = assestsDao.getUserId(UserName);
			}
			
//			if(!employee.equals("")){
//				System.out.println("inside!!!!!9999999999999999");
//				int firstBracket = employee.indexOf('(');
//				//String UserName = employee.substring(firstBracket + 1, employee.indexOf(')', firstBracket));
//				//employee=assestsDao.getUserId(UserName);
//				String UserName = employee.substring(0, employee.indexOf('('));				
//				employee=assestsDao.getUserId(UserName);
//				
//				}
			
			MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) req;
			MultipartFile multipartFile = multipartRequest.getFile("doc");
			Files file = new Files();
			file.setFile(multipartFile.getBytes());
			

			
			
			String updateSchedule=assestsDao.updatetaskSchedule(taskname,  fromdate, todate, Integer.parseInt(taskid),employee,scheduledata);
			if(updateSchedule.equals("true")){
			filesService.save(file, "update assentisk_tasks set DocUpload=? where TaskID="+taskid+"");
			

			masterDao.userAuditTrail("assentisk_tasks", "1", "Edit", currentTime,Integer.parseInt(userId), ip.getHostAddress());

			if(scheduletask.equals("true")){
				assestsDao.updatetaskManualSchedulerData(currentFormatTime,currentFormatTime,taskname,fromdate,employee,userId,"0","0",todate,Integer.parseInt(taskid));
				masterDao.userAuditTrail("assentisk_scheduler_activity", "1", "Insert",
						currentTime, Integer.parseInt(userId), ip.getHostAddress());
			}
			else if(scheduletask.equals("false")){
		
			String startTime = req.getParameter("startTime12");
			
			String endTimer = req.getParameter("endTime12");
		
			String duration = req.getParameter("duration12");
			
			String recurPattern = req.getParameter("oRadio12");
			
			String recurOccurence = req.getParameter("recur12");
			
			String weekid = req.getParameter("weekid12");
		
			String dateStart = req.getParameter("dateStart12");
			
			String endDater = req.getParameter("endDate12");
			
			String endoccurence = req.getParameter("endoccurence12");
			
			String endRangePat = req.getParameter("endRadio12");
			
			String schedulerID=req.getParameter("schedulerID12");
			
			String status="Created";
			
			
			
			String dailyRadio=req.getParameter("dailyRadio12");
			String dailyrecur=req.getParameter("dailyrecur12");
			
			
			String monthlyRadio=req.getParameter("monthlyRadio12");
			String daymonthlyrecur=req.getParameter("daymonthlyrecur12");
			String monthlyrecurmon=req.getParameter("monthlyrecurmon12");
			String monthsection=req.getParameter("monthsection12");
			String monthWeeksection=req.getParameter("monthWeeksection12");
			
			
			
			String daymonthlyyearrecur=req.getParameter("daymonthlyyearrecur12");
			String yearmonthlyRadio=req.getParameter("yearmonthlyRadio12");
			String yearsection=req.getParameter("yearsection12");
			String ONyearrecur=req.getParameter("ONyearrecur12");
			String yearmonthsection=req.getParameter("yearmonthsection12");
			String yearmonthWeeksection=req.getParameter("yearmonthWeeksection12");
			
			
			
			String flagdata=assestsDao.getTaskFlagTochange(taskid,startTime,endTimer,duration,recurPattern,
					recurOccurence,weekid,dateStart,endDater,endoccurence,endRangePat,
					userId,status,schedulerID,dailyRadio,dailyrecur,monthlyRadio,daymonthlyrecur,monthlyrecurmon,
					monthsection,monthWeeksection,daymonthlyyearrecur,yearmonthlyRadio,yearsection,
					ONyearrecur,yearmonthsection,yearmonthWeeksection);
			
			
			assestsDao.savetaskScheduler(Integer.parseInt(taskid),startTime,endTimer,duration,recurPattern,
					recurOccurence,weekid,dateStart,endDater,endoccurence,endRangePat,
					userId,status,schedulerID,dailyRadio,dailyrecur,monthlyRadio,daymonthlyrecur,monthlyrecurmon,
					monthsection,monthWeeksection,daymonthlyyearrecur,yearmonthlyRadio,yearsection,
					ONyearrecur,yearmonthsection,yearmonthWeeksection);
			masterDao.userAuditTrail("assentisk_scheduler", "1", "1", currentTime,
					Integer.parseInt(userId), ip.getHostAddress());
			
			
			List<String> dateList=new ArrayList<String>();
		//----Insert for daily basis------------------
		if(flagdata.equals("0")){
			
			
			String startDatenew=assestsDao.getToday(dateStart);
			
			dateStart=startDatenew;
			assestsDao.canceltaskSchedulerData(Integer.parseInt(taskid));
		
			if(recurPattern.equals("1")){	
			
				
						if(endRangePat.equals("1")){
							//----Insert for daily basis on end date------------------	
									List<Date> dates = new ArrayList<Date>();
									
									int recurrence = 1;
									if(dailyRadio.equals("1")){
											if(!dailyrecur.equals("") || !dailyrecur.equals("0"))
											{
												recurrence=Integer.parseInt(dailyrecur);
											}
									}
									else if(dailyRadio.equals("2")){
										recurrence=7;
									}
					
									
												//String str_date = dateStart;
									String getenddate=assestsDao.getEndDate(dateStart);
								
									String[] startval=dateStart.split("-");
									String str_dater=startval[2]+"/"+startval[1]+"/"+startval[0];
									
									
									String[] endval=getenddate.split("-");
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
												Date  endDate = null;
												        try {
												            endDate = (Date)formatter.parse(end_date);
												        } catch (Exception ex) {
												        }
												long interval = recurrence*(24*1000 * 60 * 60); // 1 hour in millis
												long endTime =endDate.getTime() ; // create your endtime here, possibly using Calendar or Date
												long curTime = startDate.getTime();
												while (curTime <= endTime) {
												    dates.add(new Date(curTime));
												    curTime += interval;
												}
												DateFormat format2=new SimpleDateFormat("EEEE"); 
												for(int i=0;i<dates.size();i++){
												    Date lDate =(Date)dates.get(i);
												    String finalDay=format2.format(lDate);
												    
												    String ds = formatter.format(lDate);   
												    
												    
												    dateList.add(ds);
												    
												}
				}
				else if(endRangePat.equals("2")){
					//----Insert for daily basis on end After------------------	
					List<Date> dates = new ArrayList<Date>();
					
					int recurrence = 1;
					if(dailyRadio.equals("1")){
							if(!dailyrecur.equals("") || !dailyrecur.equals("0"))
							{
								recurrence=Integer.parseInt(dailyrecur);
							}
					}
					else if(dailyRadio.equals("2")){
						recurrence=7;
					}
	
					
								//String str_date = dateStart;
					String getenddate=assestsDao.getEndAfterDate(dateStart);
					String[] startval=dateStart.split("-");
					String str_dater=startval[2]+"/"+startval[1]+"/"+startval[0];
					
					
					String[] endval=getenddate.split("-");
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
								Date  endDate = null;
								        try {
								            endDate = (Date)formatter.parse(end_date);
								        } catch (Exception ex) {
								        }
								long interval = recurrence*(24*1000 * 60 * 60); // 1 hour in millis
								long endTime =endDate.getTime() ; // create your endtime here, possibly using Calendar or Date
								long curTime = startDate.getTime();
								while (curTime <= endTime) {
								    dates.add(new Date(curTime));
								    curTime += interval;
								}
								DateFormat format2=new SimpleDateFormat("EEEE"); 
								int limit= Integer.parseInt(endoccurence);
								for(int i=0;i < limit;i++){
								    Date lDate =(Date)dates.get(i);
								    String finalDay=format2.format(lDate);
								    
								    String ds = formatter.format(lDate);   
								    
								    
								    dateList.add(ds);
								}
				}
				if(endRangePat.equals("3")){
					//----Insert for daily basis on end Date------------------	
							List<Date> dates = new ArrayList<Date>();
							
							int recurrence = 1;
							if(dailyRadio.equals("1")){
									if(!dailyrecur.equals("") || !dailyrecur.equals("0"))
									{
										recurrence=Integer.parseInt(dailyrecur);
									}
							}
							else if(dailyRadio.equals("2")){
								recurrence=7;
							}
							
										//String str_date = dateStart;
							String[] startval=dateStart.split("-");
							String str_dater=startval[2]+"/"+startval[1]+"/"+startval[0];
							
							String[] endval=endDater.split("-");
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
										Date  endDate = null;
										        try {
										            endDate = (Date)formatter.parse(end_date);
										        } catch (Exception ex) {
										        }
										long interval = recurrence*(24*1000 * 60 * 60); // 1 hour in millis
										long endTime =endDate.getTime() ; // create your endtime here, possibly using Calendar or Date
										long curTime = startDate.getTime();
										while (curTime <= endTime) {
										    dates.add(new Date(curTime));
										    curTime += interval;
										}
										DateFormat format2=new SimpleDateFormat("EEEE"); 
										for(int i=0;i<dates.size();i++){
										    Date lDate =(Date)dates.get(i);
										    String finalDay=format2.format(lDate);
										    
										    String ds = formatter.format(lDate);   
										    
										    
										    dateList.add(ds);
										}
					}
			}
			else if(recurPattern.equals("2")){	
				
				//---------Insert record  weekly --------------------
				if(endRangePat.equals("1")){
					//----Insert for weekly basis on end date(default 1 year)------------------	
				int recurrence=1;
					if(!recurOccurence.equals("") || !recurOccurence.equals("0"))
					{
						recurrence=Integer.parseInt(recurOccurence);
					}
					if(weekid.equals("")){
						weekid="0";
					}
					
					String weekday=assestsDao.getWeeks(weekid);
					
					int weekcount=assestsDao.getWeekCount(weekid);
				
					List<Date> dates = new ArrayList<Date>();
					
								//String str_date = dateStart;
					String getenddate=assestsDao.getEndDate(dateStart);
					String[] startval=dateStart.split("-");
					String str_dater=startval[2]+"/"+startval[1]+"/"+startval[0];
					
					
					String[] endval=getenddate.split("-");
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
								Date  endDate = null;
								        try {
								            endDate = (Date)formatter.parse(end_date);
								        } catch (Exception ex) {
								        }
								        double interval;
								    	
								    		 interval = (24*1000 * 60 * 60);
								    	
								 // 1 hour in millis
								long endTime =endDate.getTime() ; // create your endtime here, possibly using Calendar or Date
								long curTime = startDate.getTime();
								while (curTime <= endTime) {
								    dates.add(new Date(curTime));
								    curTime += interval;
								}
								
									
								DateFormat format2=new SimpleDateFormat("EEEE");
								
								int j=1;
								for(int i=0;i<dates.size();i++){
								    Date lDate =(Date)dates.get(i);
								    String finalDay=format2.format(lDate);
								    
								    String ds = formatter.format(lDate); 
									
									if(!weekday.equals("")){
										 if(weekday.contains(finalDay)){
											 j++;
									    	 	
											    
											    											    
											    dateList.add(ds);
											    if(j== weekcount+1){
											    	i= i + (recurrence * 7);
											    	j=1;
											    }
											    else if(finalDay.equals("Sunday") && i < 7){
											    	i= i + (recurrence * 7);
											    	j=1;
											    }
											   
									    }
									}
									else
									{
										
									 	dateList.add(ds);
										i= i + (recurrence * 7);

									}

								}
				}
				else if(endRangePat.equals("2")){
					//----Insert for weekly basis on end date(default 1 year)------------------	
					int recurrence=1;
						if(!recurOccurence.equals("") || !recurOccurence.equals("0"))
						{
							recurrence=Integer.parseInt(recurOccurence);
						}
						if(weekid.equals("")){
							weekid="0";
						}
						
						String weekday=assestsDao.getWeeks(weekid);
						
						int weekcount=assestsDao.getWeekCount(weekid);
					
						List<Date> dates = new ArrayList<Date>();
						
									//String str_date = dateStart;
						String getenddate=assestsDao.getEndAfterDate(dateStart);
						String[] startval=dateStart.split("-");
						String str_dater=startval[2]+"/"+startval[1]+"/"+startval[0];
						
						String[] endval=getenddate.split("-");
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
									Date  endDate = null;
									        try {
									            endDate = (Date)formatter.parse(end_date);
									        } catch (Exception ex) {
									        }
									        double interval;
									    	
									        interval = (24*1000 * 60 * 60);
									    	
									 // 1 hour in millis
									long endTime =endDate.getTime() ; // create your endtime here, possibly using Calendar or Date
									long curTime = startDate.getTime();
									while (curTime <= endTime) {
									    dates.add(new Date(curTime));
									    curTime += interval;
									}
									
										
									DateFormat format2=new SimpleDateFormat("EEEE");
									int limit= Integer.parseInt(endoccurence);
									int occLimit=0;
									int j=1;
									for(int i=0;i<dates.size();i++){
									    Date lDate =(Date)dates.get(i);
									    String finalDay=format2.format(lDate);
									    
									    String ds = formatter.format(lDate); 
										
										if(!weekday.equals("")){
											 if(weekday.contains(finalDay)){
												 j++;
												    dateList.add(ds);
													occLimit++;
												    if(j== weekcount+1){
												    	i= i + (recurrence * 7);
												    	j=1;
												    }
												    else if(finalDay.equals("Sunday") && i < 7){
												    	i= i + (recurrence * 7);
												    	j=1;
												    }
												   
										    }
										}
										else
										{
											j++;
											
										    dateList.add(ds);
											occLimit++;
											i= i + (recurrence * 7);

										}
											
											 
									
										if(occLimit==limit){
											break;
										}
										
										
									   
									   
									    
									}
					}
				else if(endRangePat.equals("3")){
					//----Insert for weekly basis on end date(default 1 year)------------------	
				int recurrence=1;
					if(!recurOccurence.equals("") || !recurOccurence.equals("0"))
					{
						recurrence=Integer.parseInt(recurOccurence);
					}
					if(weekid.equals("")){
						weekid="0";
					}
					
					String weekday=assestsDao.getWeeks(weekid);
					
					int weekcount=assestsDao.getWeekCount(weekid);
				
					List<Date> dates = new ArrayList<Date>();
					
								//String str_date = dateStart;
					String[] startval=dateStart.split("-");
					String str_dater=startval[2]+"/"+startval[1]+"/"+startval[0];
					
					String[] endval=endDater.split("-");
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
								Date  endDate = null;
								        try {
								            endDate = (Date)formatter.parse(end_date);
								        } catch (Exception ex) {
								        }
								        double interval;
								    	
								    		 interval = (24*1000 * 60 * 60);
								    	
								 // 1 hour in millis
								long endTime =endDate.getTime() ; // create your endtime here, possibly using Calendar or Date
								long curTime = startDate.getTime();
								while (curTime <= endTime) {
								    dates.add(new Date(curTime));
								    curTime += interval;
								}
								
									
								DateFormat format2=new SimpleDateFormat("EEEE");
								
								int j=1;
								for(int i=0;i<dates.size();i++){
								    Date lDate =(Date)dates.get(i);
								    String finalDay=format2.format(lDate);
								    
								    String ds = formatter.format(lDate); 
									
									if(!weekday.equals("")){
										 if(weekday.contains(finalDay)){
											 j++;
									    	 	
											    dateList.add(ds);
											    if(j== weekcount+1){
											    	i= i + (recurrence * 7);
											    	j=1;
											    }
											    else if(finalDay.equals("Sunday") && i < 7){
											    	i= i + (recurrence * 7);
											    	j=1;
											    }
											   
									    }
									}
									else
									{
										
										
									    dateList.add(ds);
										i= i + (recurrence * 7);

									}
										
														    
								}
				}
				
				
				

				
				
				
				
				
			}
			else if(recurPattern.equals("3")){	
				 
					 if(monthlyRadio.equals("1")){
						
						 List<Date> dates = new ArrayList<Date>();
							
							int daterec = 1;
							int monthrec = 1;
							if(daterec !=0){
								daterec=Integer.parseInt(daymonthlyrecur);
							}
							if(monthrec!=0){
								monthrec=Integer.parseInt(monthlyrecurmon);
							}
							DecimalFormat decimalFormat = new DecimalFormat("00");
							String dateoccurence=decimalFormat.format(daterec);
										//String str_date = dateStart;
							String getenddate="";
							int limit=0;
							 if(endRangePat.equals("2")){
								     getenddate=assestsDao.getEndAfterDate(dateStart);
								     if(endoccurence.equals("0") || endoccurence.equals("")){
								    	 limit = 1;
								     }
								     else
								     {
								    	 limit= Integer.parseInt(endoccurence);
								     }
							 	}
							 else if(endRangePat.equals("3")){
								 	  getenddate = endDater;
								 	 
							 	}
							 else
							 {
								  getenddate=assestsDao.getEndDate(dateStart);
							 }
							String[] startval=dateStart.split("-");
							String str_dater=startval[2]+"/"+startval[1]+"/"+startval[0];
							
							
							String[] endval=getenddate.split("-");
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
										Date  endDate = null;
										        try {
										            endDate = (Date)formatter.parse(end_date);
										        } catch (Exception ex) {
										        }
										long interval = (24*1000 * 60 * 60); // 1 hour in millis
										long endTime =endDate.getTime() ; // create your endtime here, possibly using Calendar or Date
										long curTime = startDate.getTime();
										while (curTime <= endTime) {
										    dates.add(new Date(curTime));
										    curTime += interval;
										}
										DateFormat format2=new SimpleDateFormat("EEEE"); 
										DateFormat formatdate=new SimpleDateFormat("dd"); 
										DateFormat formatmonth=new SimpleDateFormat("MMMM"); 
										int countmonth=1;
										int limitoccur=1;
										
										for(int i=0;i<dates.size();i++){
										    Date lDate =(Date)dates.get(i);
										    String finalDay=format2.format(lDate);
										    String Date=formatdate.format(lDate);
										    String Month=formatmonth.format(lDate);
										    String ds = formatter.format(lDate);
										    if(Date.equals(dateoccurence))	{
										    		if(countmonth == 1){					
															
															 dateList.add(ds);
															if(limit!=0){
																if(limitoccur == limit ){
																	break;
																}
																limitoccur=limitoccur+1;
															}
																
										    		}
										    		countmonth = countmonth + 1;
										    		if(countmonth == (monthrec+1)){
										    			countmonth=1;
										    		}
										    		
												  
										    }
										   
										    
										}
					 }
					 else if(monthlyRadio.equals("2")){
						 List<Date> dates = new ArrayList<Date>();
							
							int monthrec = 1;
							String weekSection = "1";
							//String monthsection=req.getParameter("monthsection12");
							if(monthrec!=0){
								monthrec=Integer.parseInt(monthlyrecurmon);
							}
							if(!weekSection.equals("0") || !weekSection.equals("")){
								weekSection=monthWeeksection;
							}
							String weekDay=assestsDao.getWeeks(weekSection);
							DecimalFormat decimalFormat = new DecimalFormat("00");
										//String str_date = dateStart;
							String getenddate="";
							int limit=0;
							 if(endRangePat.equals("2")){
								     getenddate=assestsDao.getEndAfterDate(dateStart);
								     if(endoccurence.equals("0") || endoccurence.equals("")){
								    	 limit = 1;
								     }
								     else
								     {
								    	 limit= Integer.parseInt(endoccurence);
								     }
							 	}
							 else if(endRangePat.equals("3")){
								 	  getenddate = endDater;
								 	 
							 	}
							 else
							 {
								  getenddate=assestsDao.getEndDate(dateStart);
							 }
							String[] startval=dateStart.split("-");
							String str_dater=startval[2]+"/"+startval[1]+"/"+startval[0];
							
							
							String[] endval=getenddate.split("-");
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
										Date  endDate = null;
										        try {
										            endDate = (Date)formatter.parse(end_date);
										        } catch (Exception ex) {
										        }
										long interval = (24*1000 * 60 * 60); // 1 hour in millis
										long endTime =endDate.getTime() ; // create your endtime here, possibly using Calendar or Date
										long curTime = startDate.getTime();
										while (curTime <= endTime) {
										    dates.add(new Date(curTime));
										    curTime += interval;
										}
										DateFormat format2=new SimpleDateFormat("EEEE"); 
										DateFormat formatdate=new SimpleDateFormat("dd"); 
										DateFormat formatmonth=new SimpleDateFormat("MMMM"); 
										int startSectionLimit,endSectionLimit;
										if(monthsection.equals("2")){
											startSectionLimit=8;
											endSectionLimit=14;
										}
										else if(monthsection.equals("3")){
											startSectionLimit=15;
											endSectionLimit=21;
										}
										else if(monthsection.equals("4")){
											startSectionLimit=22;
											endSectionLimit=28;
										}
										else if(monthsection.equals("5")){
											startSectionLimit=29;
											endSectionLimit=31;
										}
										else{
											startSectionLimit=1;
											endSectionLimit=7;

										}
										int countmonth=1;
										int limitoccur=1;
										for(int i=0;i<dates.size();i++){
										    Date lDate =(Date)dates.get(i);
										    String finalDay=format2.format(lDate);
										    String Date=formatdate.format(lDate);
										    String Month=formatmonth.format(lDate);
										    String ds = formatter.format(lDate); 
										    int dateInt=Integer.parseInt(Date);
										    if(finalDay.equals(weekDay))	{
										    	if(dateInt>=startSectionLimit && dateInt <=endSectionLimit){
										    		
										    		if(countmonth == 1){
										    				
															
															
															 dateList.add(ds);
															if(limit!=0){
																if(limitoccur == limit ){
																	break;
																}
																limitoccur=limitoccur+1;
															}
															
										    		}
										    		countmonth = countmonth + 1;
										    		if(countmonth == (monthrec+1)){
										    			countmonth=1;
										    		}
										    		
										    	 														
										    		
										    	}
												  
										    }
										   
										    
										}
					 }

					 
					 
					
					 
				
			}
			else if(recurPattern.equals("4")){	
				
				if(yearmonthlyRadio.equals("1")){
				
					List<Date> dates = new ArrayList<Date>();
					
					int recurrence = 1;
					String dayyear="1";
					String monthval="1";
					int yearrecur=1;
						if(!ONyearrecur.equals("") || !ONyearrecur.equals("0")){
							dayyear=ONyearrecur;
						}
						
						DecimalFormat decimalFormat = new DecimalFormat("00");
						String dayyearv=decimalFormat.format(Integer.parseInt(dayyear));
						dayyear=dayyearv;
					if(!yearsection.equals("") || !yearsection.equals("")){
						monthval=yearsection;
					}
					if(!daymonthlyyearrecur.equals("") || !daymonthlyyearrecur.equals("0")){
						yearrecur=Integer.parseInt(daymonthlyyearrecur);
					}
					String getmonth=assestsDao.getMonth(monthval);
					//String str_date = dateStart;
					String getenddate="";
					int limit=0;
					 if(endRangePat.equals("2")){
						     getenddate=assestsDao.getEndAfterDate(dateStart);
						     if(endoccurence.equals("0") || endoccurence.equals("")){
						    	 limit = 1;
						     }
						     else
						     {
						    	 limit= Integer.parseInt(endoccurence);
						     }
					 	}
					 else if(endRangePat.equals("3")){
						 	  getenddate = endDater;
						 	 
					 	}
					 else
					 {
						  getenddate=assestsDao.getYearEndDate(dateStart);
					 }
					
					String[] startval=dateStart.split("-");
					String str_dater=startval[2]+"/"+startval[1]+"/"+startval[0];
					
					
					String[] endval=getenddate.split("-");
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
								Date  endDate = null;
								        try {
								            endDate = (Date)formatter.parse(end_date);
								        } catch (Exception ex) {
								        }
								long interval = recurrence*(24*1000 * 60 * 60); // 1 hour in millis
								long endTime =endDate.getTime() ; // create your endtime here, possibly using Calendar or Date
								long curTime = startDate.getTime();
								while (curTime <= endTime) {
								    dates.add(new Date(curTime));
								    curTime += interval;
								}
								DateFormat format2=new SimpleDateFormat("EEEE"); 
								DateFormat formatdate=new SimpleDateFormat("dd"); 
								DateFormat formatmonth=new SimpleDateFormat("MMMM"); 
								int countYear=1;
								int limitoccur=1;
								for(int i=0;i<dates.size();i++){
								    Date lDate =(Date)dates.get(i);
								    String finalDay=format2.format(lDate);
								   
								    String ds = formatter.format(lDate);   
								    String Date=formatdate.format(lDate);
								    String month=formatmonth.format(lDate);
								
								    if(month.equals(getmonth)){
								    	 if(Date.equals(dayyear))	{
								    		 if(countYear==1){
											    	 
											    	 
											    	 
											    	 dateList.add(ds);
											    	 if(limit!=0){
															if(limitoccur == limit ){
																break;
															}
														
															limitoccur=limitoccur+1;
														}
								    		 }
								    		 countYear = countYear + 1;
								    		
									    		if(countYear == (yearrecur+1)){
									    			countYear = 1;
									    		}
									    		
									    }
								    }
								   
								   
								    dateList.add(ds);
								    
								}
					
				}
				else if(yearmonthlyRadio.equals("2")){
					//----Insert for daily basis on end date------------------	
					List<Date> dates = new ArrayList<Date>();
					
					int yearrecur=1;
					String monthval="1";
					String weekSection = "1";
					
					if(!daymonthlyyearrecur.equals("") || !daymonthlyyearrecur.equals("0")){
						yearrecur=Integer.parseInt(daymonthlyyearrecur);
					}
					

					if(!yearsection.equals("") || !yearsection.equals("")){
											monthval=yearsection;
					}
					
					if(!yearmonthWeeksection.equals("0") || !yearmonthWeeksection.equals("")){
						weekSection=yearmonthWeeksection;
					}
					String weekDay=assestsDao.getWeeks(weekSection);
					String getmonth=assestsDao.getMonth(monthval);
								//String str_date = dateStart;
					int limit=0;
					String getenddate="";
					 if(endRangePat.equals("2")){
						     getenddate=assestsDao.getEndAfterDate(dateStart);
						     if(endoccurence.equals("0") || endoccurence.equals("")){
						    	 limit = 1;
						     }
						     else
						     {
						    	 limit= Integer.parseInt(endoccurence);
						     }
					 	}
					 else if(endRangePat.equals("3")){
						 	  getenddate = endDater;
						 	 
					 	}
					 else
					 {
						  getenddate=assestsDao.getYearEndDate(dateStart);
					 }
					String[] startval=dateStart.split("-");
					String str_dater=startval[2]+"/"+startval[1]+"/"+startval[0];
					
					
					String[] endval=getenddate.split("-");
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
								Date  endDate = null;
								        try {
								            endDate = (Date)formatter.parse(end_date);
								        } catch (Exception ex) {
								        }
								long interval = 24*1000 * 60 * 60; // 1 hour in millis
								long endTime =endDate.getTime() ; // create your endtime here, possibly using Calendar or Date
								long curTime = startDate.getTime();
								int startSectionLimit,endSectionLimit;
								while (curTime <= endTime) {
								    dates.add(new Date(curTime));
								    curTime += interval;
								}
								DateFormat format2=new SimpleDateFormat("EEEE"); 
								DateFormat formatmonth=new SimpleDateFormat("MMMM"); 
								DateFormat formatdate=new SimpleDateFormat("dd"); 
								if(yearmonthsection.equals("2")){
									startSectionLimit=8;
									endSectionLimit=14;
								}
								else if(yearmonthsection.equals("3")){
									startSectionLimit=15;
									endSectionLimit=21;
								}
								else if(yearmonthsection.equals("4")){
									startSectionLimit=22;
									endSectionLimit=28;
								}
								else if(yearmonthsection.equals("5")){
									startSectionLimit=29;
									endSectionLimit=31;
								}
								else{
									startSectionLimit=1;
									endSectionLimit=7;

								}
								int countYear=1;
								int limitoccur=1;
								for(int i=0;i<dates.size();i++){
								    Date lDate =(Date)dates.get(i);
								    String finalDay=format2.format(lDate);
								    String month=formatmonth.format(lDate);
								    String Date=formatdate.format(lDate);
								    int dateInt=Integer.parseInt(Date);
								    if(month.equals(getmonth)){
								    	
								    	 if(finalDay.equals(weekDay))	{
								    		 if(dateInt>=startSectionLimit && dateInt <=endSectionLimit){
								    			
								    			 if(countYear==1){
								    			 
												    String ds = formatter.format(lDate);   
												    
												   
												    dateList.add(ds);
												    if(limit!=0){
														if(limitoccur == limit ){
															break;
														}
													
														limitoccur=limitoccur+1;
													}
								    		 }
								    		 countYear = countYear + 1;
									    		
									    		if(countYear == (yearrecur+1)){
									    			countYear = 1;
									    		}
								    		 }
								    	 }
								    	
								    }
								   
								}
				}				
			}
			String[] startval=dateStart.split("-");
			String str_dater=startval[2]+"/"+startval[1]+"/"+startval[0];
			String assignedTo=employee;
			String assignedBy=(String) req.getSession().getAttribute("UserRecordID");
			
			
			startTime=assestsDao.getTime(startTime);
			endTimer=assestsDao.getTime(endTimer);
			assestsDao.inserttaskSchedulerData(Integer.parseInt(taskid),dateList,scheduledata,taskname,fromdate,assignedTo,assignedBy,startTime,endTimer,todate);
			masterDao.userAuditTrail("assentisk_scheduler_activity", "1", "insert",
					currentTime, Integer.parseInt(userId), ip.getHostAddress());
		}
			}
			}
		modelAndView = new ModelAndView("task/task");		
		}
		catch(Exception exception)
		{
			exception.printStackTrace();
		}
		return modelAndView;
	}
	
	
	public ModelAndView addtask(HttpServletRequest req,
			HttpServletResponse res){
		try{
			
			map = new ModelMap();
			List<TimeBean> timeList = assestsDao.getTimeList();
			List<MonthSectionBean> monthsectionList = assestsDao.getMonthSectionList();
			List<WeekdayBean> weekdayList = assestsDao.getWeekdayList();
			List<YearSectionBean> yearsectionList=assestsDao.getYearSectionList();

			map.addObject("timeList",timeList);
			map.addObject("monthsectionList", monthsectionList);
			map.addObject("weekdayList",weekdayList);
			map.addObject("yearsectionList", yearsectionList);
			modelAndView = new ModelAndView("task/addTask", map);			
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndView;
	}
	
	
	public ModelAndView addTaskschedule(HttpServletRequest req,
			HttpServletResponse res) {
	
		try
		{
			
			InetAddress ip = InetAddress.getLocalHost();
			String userId = (String) req.getSession().getAttribute(
					"UserRecordID");
			
			java.util.Date dt = new java.util.Date();
			java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat(
					"yyyy-MM-dd HH:mm:ss");
			java.text.SimpleDateFormat sdf1 = new java.text.SimpleDateFormat(
			"yyyy-MM-dd");
			String currentTime = sdf.format(dt);
			
			String currentFormatTime = sdf1.format(dt);
			
			
			String taskname = req.getParameter("taskname");
			String fromdate = req.getParameter("fromdate");
			String todate = req.getParameter("todate");
			String scheduledata=req.getParameter("scheduledataval");
			String scheduletask=req.getParameter("scheduletask");
			String employee = req.getParameter("responsiblehead");
			
			
			
			
	
			int firstBracket = employee.indexOf('(');
			//String UserName = employee.substring(firstBracket + 1, employee.indexOf(')', firstBracket));
			//employee=assestsDao.getUserId(UserName);
			String UserName = employee.substring(0, employee.indexOf('('));
			employee=assestsDao.getUserId(UserName);
			
			
			MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) req;
			MultipartFile multipartFile = multipartRequest.getFile("doc");
			Files file = new Files();
			file.setFile(multipartFile.getBytes());
	
		
			String updateschedule=assestsDao.inserttaskSchedule(taskname,  fromdate, todate,employee,scheduledata);
			if(updateschedule.equals("true")){
			int taskID = assestsDao.getLastTaskID();
			filesService.save(file, "update assentisk_tasks set DocUpload=? where TaskID="+taskID+"");
		
			masterDao.userAuditTrail("assentisk_tasks", "1", "Insert", currentTime,Integer.parseInt(userId), ip.getHostAddress());
			if(scheduletask.equals("true")){
				assestsDao.inserttaskManualSchedulerData(currentFormatTime,currentFormatTime,taskname,fromdate,employee,userId,"0","0",todate);
				masterDao.userAuditTrail("assentisk_scheduler_activity", "1", "Insert",
						currentTime, Integer.parseInt(userId), ip.getHostAddress());
			}
			else if(scheduletask.equals("false")){
			String startTime = req.getParameter("startTime12");
			
			String endTimer = req.getParameter("endTime12");
		
			String duration = req.getParameter("duration12");
			
			String recurPattern = req.getParameter("oRadio12");
			
			String recurOccurence = req.getParameter("recur12");
			
			String weekid = req.getParameter("weekid12");
		
			String dateStart = req.getParameter("dateStart12");
			
			String endDater = req.getParameter("endDate12");
			
			String endoccurence = req.getParameter("endoccurence12");
			
			String endRangePat = req.getParameter("endRadio12");
			
			String schedulerID=req.getParameter("schedulerID12");
			
			String status="Created";
			
			
			
			String dailyRadio=req.getParameter("dailyRadio12");
			String dailyrecur=req.getParameter("dailyrecur12");
			
			
			String monthlyRadio=req.getParameter("monthlyRadio12");
			String daymonthlyrecur=req.getParameter("daymonthlyrecur12");
			String monthlyrecurmon=req.getParameter("monthlyrecurmon12");
			String monthsection=req.getParameter("monthsection12");
			String monthWeeksection=req.getParameter("monthWeeksection12");
			
			
			
			String daymonthlyyearrecur=req.getParameter("daymonthlyyearrecur12");
			String yearmonthlyRadio=req.getParameter("yearmonthlyRadio12");
			String yearsection=req.getParameter("yearsection12");
			String ONyearrecur=req.getParameter("ONyearrecur12");
			String yearmonthsection=req.getParameter("yearmonthsection12");
			String yearmonthWeeksection=req.getParameter("yearmonthWeeksection12");
			
			
			
			assestsDao.savetaskScheduler(taskID,startTime,endTimer,duration,recurPattern,
					recurOccurence,weekid,dateStart,endDater,endoccurence,endRangePat,
					userId,status,schedulerID,dailyRadio,dailyrecur,monthlyRadio,daymonthlyrecur,monthlyrecurmon,
					monthsection,monthWeeksection,daymonthlyyearrecur,yearmonthlyRadio,yearsection,
					ONyearrecur,yearmonthsection,yearmonthWeeksection);
			masterDao.userAuditTrail("assentisk_scheduler", "1", "1", currentTime,
					Integer.parseInt(userId), ip.getHostAddress());
			
			
			List<String> dateList=new ArrayList<String>();
		//----Insert for daily basis------------------
		
		
			
			String startDatenew=assestsDao.getToday(dateStart);
			
			dateStart=startDatenew;
		
			if(recurPattern.equals("1")){	
			
				
						if(endRangePat.equals("1")){
							//----Insert for daily basis on end date------------------	
									List<Date> dates = new ArrayList<Date>();
									
									int recurrence = 1;
									if(dailyRadio.equals("1")){
											if(!dailyrecur.equals("") || !dailyrecur.equals("0"))
											{
												recurrence=Integer.parseInt(dailyrecur);
											}
									}
									else if(dailyRadio.equals("2")){
										recurrence=7;
									}
					
									
												//String str_date = dateStart;
									String getenddate=assestsDao.getEndDate(dateStart);
								
									String[] startval=dateStart.split("-");
									String str_dater=startval[2]+"/"+startval[1]+"/"+startval[0];
									
									
									String[] endval=getenddate.split("-");
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
												Date  endDate = null;
												        try {
												            endDate = (Date)formatter.parse(end_date);
												        } catch (Exception ex) {
												        }
												long interval = recurrence*(24*1000 * 60 * 60); // 1 hour in millis
												long endTime =endDate.getTime() ; // create your endtime here, possibly using Calendar or Date
												long curTime = startDate.getTime();
												while (curTime <= endTime) {
												    dates.add(new Date(curTime));
												    curTime += interval;
												}
												DateFormat format2=new SimpleDateFormat("EEEE"); 
												for(int i=0;i<dates.size();i++){
												    Date lDate =(Date)dates.get(i);
												    String finalDay=format2.format(lDate);
												    
												    String ds = formatter.format(lDate);   
												    
												    
												    dateList.add(ds);
												    
												}
				}
				else if(endRangePat.equals("2")){
					//----Insert for daily basis on end After------------------	
					List<Date> dates = new ArrayList<Date>();
					
					int recurrence = 1;
					if(dailyRadio.equals("1")){
							if(!dailyrecur.equals("") || !dailyrecur.equals("0"))
							{
								recurrence=Integer.parseInt(dailyrecur);
							}
					}
					else if(dailyRadio.equals("2")){
						recurrence=7;
					}
	
					
								//String str_date = dateStart;
					String getenddate=assestsDao.getEndAfterDate(dateStart);
					String[] startval=dateStart.split("-");
					String str_dater=startval[2]+"/"+startval[1]+"/"+startval[0];
					
					
					String[] endval=getenddate.split("-");
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
								Date  endDate = null;
								        try {
								            endDate = (Date)formatter.parse(end_date);
								        } catch (Exception ex) {
								        }
								long interval = recurrence*(24*1000 * 60 * 60); // 1 hour in millis
								long endTime =endDate.getTime() ; // create your endtime here, possibly using Calendar or Date
								long curTime = startDate.getTime();
								while (curTime <= endTime) {
								    dates.add(new Date(curTime));
								    curTime += interval;
								}
								DateFormat format2=new SimpleDateFormat("EEEE"); 
								int limit= Integer.parseInt(endoccurence);
								for(int i=0;i < limit;i++){
								    Date lDate =(Date)dates.get(i);
								    String finalDay=format2.format(lDate);
								    
								    String ds = formatter.format(lDate);   
								    
								    
								    dateList.add(ds);
								}
				}
				if(endRangePat.equals("3")){
					//----Insert for daily basis on end Date------------------	
							List<Date> dates = new ArrayList<Date>();
							
							int recurrence = 1;
							if(dailyRadio.equals("1")){
									if(!dailyrecur.equals("") || !dailyrecur.equals("0"))
									{
										recurrence=Integer.parseInt(dailyrecur);
									}
							}
							else if(dailyRadio.equals("2")){
								recurrence=7;
							}
							
										//String str_date = dateStart;
							String[] startval=dateStart.split("-");
							String str_dater=startval[2]+"/"+startval[1]+"/"+startval[0];
							
							String[] endval=endDater.split("-");
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
										Date  endDate = null;
										        try {
										            endDate = (Date)formatter.parse(end_date);
										        } catch (Exception ex) {
										        }
										long interval = recurrence*(24*1000 * 60 * 60); // 1 hour in millis
										long endTime =endDate.getTime() ; // create your endtime here, possibly using Calendar or Date
										long curTime = startDate.getTime();
										while (curTime <= endTime) {
										    dates.add(new Date(curTime));
										    curTime += interval;
										}
										DateFormat format2=new SimpleDateFormat("EEEE"); 
										for(int i=0;i<dates.size();i++){
										    Date lDate =(Date)dates.get(i);
										    String finalDay=format2.format(lDate);
										    
										    String ds = formatter.format(lDate);   
										    
										    
										    dateList.add(ds);
										}
					}
			}
			else if(recurPattern.equals("2")){	
				
				//---------Insert record  weekly --------------------
				if(endRangePat.equals("1")){
					//----Insert for weekly basis on end date(default 1 year)------------------	
				int recurrence=1;
					if(!recurOccurence.equals("") || !recurOccurence.equals("0"))
					{
						recurrence=Integer.parseInt(recurOccurence);
					}
					if(weekid.equals("")){
						weekid="0";
					}
					
					String weekday=assestsDao.getWeeks(weekid);
					
					int weekcount=assestsDao.getWeekCount(weekid);
				
					List<Date> dates = new ArrayList<Date>();
					
								//String str_date = dateStart;
					String getenddate=assestsDao.getEndDate(dateStart);
					String[] startval=dateStart.split("-");
					String str_dater=startval[2]+"/"+startval[1]+"/"+startval[0];
					
					
					String[] endval=getenddate.split("-");
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
								Date  endDate = null;
								        try {
								            endDate = (Date)formatter.parse(end_date);
								        } catch (Exception ex) {
								        }
								        double interval;
								    	
								    		 interval = (24*1000 * 60 * 60);
								    	
								 // 1 hour in millis
								long endTime =endDate.getTime() ; // create your endtime here, possibly using Calendar or Date
								long curTime = startDate.getTime();
								while (curTime <= endTime) {
								    dates.add(new Date(curTime));
								    curTime += interval;
								}
								
									
								DateFormat format2=new SimpleDateFormat("EEEE");
								
								int j=1;
								for(int i=0;i<dates.size();i++){
								    Date lDate =(Date)dates.get(i);
								    String finalDay=format2.format(lDate);
								    
								    String ds = formatter.format(lDate); 
									
									if(!weekday.equals("")){
										 if(weekday.contains(finalDay)){
											 j++;
									    	 	
											    
											    											    
											    dateList.add(ds);
											    if(j== weekcount+1){
											    	i= i + (recurrence * 7);
											    	j=1;
											    }
											    else if(finalDay.equals("Sunday") && i < 7){
											    	i= i + (recurrence * 7);
											    	j=1;
											    }
											   
									    }
									}
									else
									{
										
									 	dateList.add(ds);
										i= i + (recurrence * 7);

									}

								}
				}
				else if(endRangePat.equals("2")){
					//----Insert for weekly basis on end date(default 1 year)------------------	
					int recurrence=1;
						if(!recurOccurence.equals("") || !recurOccurence.equals("0"))
						{
							recurrence=Integer.parseInt(recurOccurence);
						}
						if(weekid.equals("")){
							weekid="0";
						}
						
						String weekday=assestsDao.getWeeks(weekid);
						
						int weekcount=assestsDao.getWeekCount(weekid);
					
						List<Date> dates = new ArrayList<Date>();
						
									//String str_date = dateStart;
						String getenddate=assestsDao.getEndAfterDate(dateStart);
						String[] startval=dateStart.split("-");
						String str_dater=startval[2]+"/"+startval[1]+"/"+startval[0];
						
						String[] endval=getenddate.split("-");
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
									Date  endDate = null;
									        try {
									            endDate = (Date)formatter.parse(end_date);
									        } catch (Exception ex) {
									        }
									        double interval;
									    	
									        interval = (24*1000 * 60 * 60);
									    	
									 // 1 hour in millis
									long endTime =endDate.getTime() ; // create your endtime here, possibly using Calendar or Date
									long curTime = startDate.getTime();
									while (curTime <= endTime) {
									    dates.add(new Date(curTime));
									    curTime += interval;
									}
									
										
									DateFormat format2=new SimpleDateFormat("EEEE");
									int limit= Integer.parseInt(endoccurence);
									int occLimit=0;
									int j=1;
									for(int i=0;i<dates.size();i++){
									    Date lDate =(Date)dates.get(i);
									    String finalDay=format2.format(lDate);
									    
									    String ds = formatter.format(lDate); 
										
										if(!weekday.equals("")){
											 if(weekday.contains(finalDay)){
												 j++;
												    dateList.add(ds);
													occLimit++;
												    if(j== weekcount+1){
												    	i= i + (recurrence * 7);
												    	j=1;
												    }
												    else if(finalDay.equals("Sunday") && i < 7){
												    	i= i + (recurrence * 7);
												    	j=1;
												    }
												   
										    }
										}
										else
										{
											j++;
											
										    dateList.add(ds);
											occLimit++;
											i= i + (recurrence * 7);

										}
											
											 
									
										if(occLimit==limit){
											break;
										}
										
										
									   
									   
									    
									}
					}
				else if(endRangePat.equals("3")){
					//----Insert for weekly basis on end date(default 1 year)------------------	
				int recurrence=1;
					if(!recurOccurence.equals("") || !recurOccurence.equals("0"))
					{
						recurrence=Integer.parseInt(recurOccurence);
					}
					if(weekid.equals("")){
						weekid="0";
					}
					
					String weekday=assestsDao.getWeeks(weekid);
					
					int weekcount=assestsDao.getWeekCount(weekid);
				
					List<Date> dates = new ArrayList<Date>();
					
								//String str_date = dateStart;
					String[] startval=dateStart.split("-");
					String str_dater=startval[2]+"/"+startval[1]+"/"+startval[0];
					
					String[] endval=endDater.split("-");
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
								Date  endDate = null;
								        try {
								            endDate = (Date)formatter.parse(end_date);
								        } catch (Exception ex) {
								        }
								        double interval;
								    	
								    		 interval = (24*1000 * 60 * 60);
								    	
								 // 1 hour in millis
								long endTime =endDate.getTime() ; // create your endtime here, possibly using Calendar or Date
								long curTime = startDate.getTime();
								while (curTime <= endTime) {
								    dates.add(new Date(curTime));
								    curTime += interval;
								}
								
									
								DateFormat format2=new SimpleDateFormat("EEEE");
								
								int j=1;
								for(int i=0;i<dates.size();i++){
								    Date lDate =(Date)dates.get(i);
								    String finalDay=format2.format(lDate);
								    
								    String ds = formatter.format(lDate); 
									
									if(!weekday.equals("")){
										 if(weekday.contains(finalDay)){
											 j++;
									    	 	
											    dateList.add(ds);
											    if(j== weekcount+1){
											    	i= i + (recurrence * 7);
											    	j=1;
											    }
											    else if(finalDay.equals("Sunday") && i < 7){
											    	i= i + (recurrence * 7);
											    	j=1;
											    }
											   
									    }
									}
									else
									{
										
										
									    dateList.add(ds);
										i= i + (recurrence * 7);

									}
										
														    
								}
				}
				
				
			}
			else if(recurPattern.equals("3")){	
				 
					 if(monthlyRadio.equals("1")){
						 
						 List<Date> dates = new ArrayList<Date>();
							
							int daterec = 1;
							int monthrec = 1;
							if(daterec !=0){
								daterec=Integer.parseInt(daymonthlyrecur);
							}
							if(monthrec!=0){
								monthrec=Integer.parseInt(monthlyrecurmon);
							}
							DecimalFormat decimalFormat = new DecimalFormat("00");
							String dateoccurence=decimalFormat.format(daterec);
										//String str_date = dateStart;
							String getenddate="";
							int limit=0;
							 if(endRangePat.equals("2")){
								     getenddate=assestsDao.getEndAfterDate(dateStart);
								     if(endoccurence.equals("0") || endoccurence.equals("")){
								    	 limit = 1;
								     }
								     else
								     {
								    	 limit= Integer.parseInt(endoccurence);
								     }
							 	}
							 else if(endRangePat.equals("3")){
								 	  getenddate = endDater;
								 	 
							 	}
							 else
							 {
								  getenddate=assestsDao.getEndDate(dateStart);
							 }
							String[] startval=dateStart.split("-");
							String str_dater=startval[2]+"/"+startval[1]+"/"+startval[0];
							
							
							String[] endval=getenddate.split("-");
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
										Date  endDate = null;
										        try {
										            endDate = (Date)formatter.parse(end_date);
										        } catch (Exception ex) {
										        }
										long interval = (24*1000 * 60 * 60); // 1 hour in millis
										long endTime =endDate.getTime() ; // create your endtime here, possibly using Calendar or Date
										long curTime = startDate.getTime();
										while (curTime <= endTime) {
										    dates.add(new Date(curTime));
										    curTime += interval;
										}
										DateFormat format2=new SimpleDateFormat("EEEE"); 
										DateFormat formatdate=new SimpleDateFormat("dd"); 
										DateFormat formatmonth=new SimpleDateFormat("MMMM"); 
										int countmonth=1;
										int limitoccur=1;
										
										for(int i=0;i<dates.size();i++){
										    Date lDate =(Date)dates.get(i);
										    String finalDay=format2.format(lDate);
										    String Date=formatdate.format(lDate);
										    String Month=formatmonth.format(lDate);
										    String ds = formatter.format(lDate);
										    if(Date.equals(dateoccurence))	{
										    		if(countmonth == 1){					
															
															 dateList.add(ds);
															if(limit!=0){
																if(limitoccur == limit ){
																	break;
																}
																limitoccur=limitoccur+1;
															}
																
										    		}
										    		countmonth = countmonth + 1;
										    		if(countmonth == (monthrec+1)){
										    			countmonth=1;
										    		}
										    		
												  
										    }
										   
										    
										}
					 }
					 else if(monthlyRadio.equals("2")){
						 List<Date> dates = new ArrayList<Date>();
							
							int monthrec = 1;
							String weekSection = "1";
							//String monthsection=req.getParameter("monthsection12");
							if(monthrec!=0){
								monthrec=Integer.parseInt(monthlyrecurmon);
							}
							if(!weekSection.equals("0") || !weekSection.equals("")){
								weekSection=monthWeeksection;
							}
							String weekDay=assestsDao.getWeeks(weekSection);
							DecimalFormat decimalFormat = new DecimalFormat("00");
										//String str_date = dateStart;
							String getenddate="";
							int limit=0;
							 if(endRangePat.equals("2")){
								     getenddate=assestsDao.getEndAfterDate(dateStart);
								     if(endoccurence.equals("0") || endoccurence.equals("")){
								    	 limit = 1;
								     }
								     else
								     {
								    	 limit= Integer.parseInt(endoccurence);
								     }
							 	}
							 else if(endRangePat.equals("3")){
								 	  getenddate = endDater;
								 	 
							 	}
							 else
							 {
								  getenddate=assestsDao.getEndDate(dateStart);
							 }
							String[] startval=dateStart.split("-");
							String str_dater=startval[2]+"/"+startval[1]+"/"+startval[0];
							
							
							String[] endval=getenddate.split("-");
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
										Date  endDate = null;
										        try {
										            endDate = (Date)formatter.parse(end_date);
										        } catch (Exception ex) {
										        }
										long interval = (24*1000 * 60 * 60); // 1 hour in millis
										long endTime =endDate.getTime() ; // create your endtime here, possibly using Calendar or Date
										long curTime = startDate.getTime();
										while (curTime <= endTime) {
										    dates.add(new Date(curTime));
										    curTime += interval;
										}
										DateFormat format2=new SimpleDateFormat("EEEE"); 
										DateFormat formatdate=new SimpleDateFormat("dd"); 
										DateFormat formatmonth=new SimpleDateFormat("MMMM"); 
										int startSectionLimit,endSectionLimit;
										if(monthsection.equals("2")){
											startSectionLimit=8;
											endSectionLimit=14;
										}
										else if(monthsection.equals("3")){
											startSectionLimit=15;
											endSectionLimit=21;
										}
										else if(monthsection.equals("4")){
											startSectionLimit=22;
											endSectionLimit=28;
										}
										else if(monthsection.equals("5")){
											startSectionLimit=29;
											endSectionLimit=31;
										}
										else{
											startSectionLimit=1;
											endSectionLimit=7;

										}
										int countmonth=1;
										int limitoccur=1;
										for(int i=0;i<dates.size();i++){
										    Date lDate =(Date)dates.get(i);
										    String finalDay=format2.format(lDate);
										    String Date=formatdate.format(lDate);
										    String Month=formatmonth.format(lDate);
										    String ds = formatter.format(lDate); 
										    int dateInt=Integer.parseInt(Date);
										    if(finalDay.equals(weekDay))	{
										    	if(dateInt>=startSectionLimit && dateInt <=endSectionLimit){
										    		
										    		if(countmonth == 1){
										    				
															
															
															 dateList.add(ds);
															if(limit!=0){
																if(limitoccur == limit ){
																	break;
																}
																limitoccur=limitoccur+1;
															}
															
										    		}
										    		countmonth = countmonth + 1;
										    		if(countmonth == (monthrec+1)){
										    			countmonth=1;
										    		}
										    		
										    	 														
										    		
										    	}
												  
										    }
										   
										    
										}
					 }

					 
					 
					
					 
				
			}
			else if(recurPattern.equals("4")){	
				
				if(yearmonthlyRadio.equals("1")){
				
					List<Date> dates = new ArrayList<Date>();
					
					int recurrence = 1;
					String dayyear="1";
					String monthval="1";
					int yearrecur=1;
						if(!ONyearrecur.equals("") || !ONyearrecur.equals("0")){
							dayyear=ONyearrecur;
						}
						
						DecimalFormat decimalFormat = new DecimalFormat("00");
						String dayyearv=decimalFormat.format(Integer.parseInt(dayyear));
						dayyear=dayyearv;
					if(!yearsection.equals("") || !yearsection.equals("")){
						monthval=yearsection;
					}
					if(!daymonthlyyearrecur.equals("") || !daymonthlyyearrecur.equals("0")){
						yearrecur=Integer.parseInt(daymonthlyyearrecur);
					}
					String getmonth=assestsDao.getMonth(monthval);
					//String str_date = dateStart;
					String getenddate="";
					int limit=0;
					 if(endRangePat.equals("2")){
						     getenddate=assestsDao.getEndAfterDate(dateStart);
						     if(endoccurence.equals("0") || endoccurence.equals("")){
						    	 limit = 1;
						     }
						     else
						     {
						    	 limit= Integer.parseInt(endoccurence);
						     }
					 	}
					 else if(endRangePat.equals("3")){
						 	  getenddate = endDater;
						 	 
					 	}
					 else
					 {
						  getenddate=assestsDao.getYearEndDate(dateStart);
					 }
					
					String[] startval=dateStart.split("-");
					String str_dater=startval[2]+"/"+startval[1]+"/"+startval[0];
					
					
					String[] endval=getenddate.split("-");
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
								Date  endDate = null;
								        try {
								            endDate = (Date)formatter.parse(end_date);
								        } catch (Exception ex) {
								        }
								long interval = recurrence*(24*1000 * 60 * 60); // 1 hour in millis
								long endTime =endDate.getTime() ; // create your endtime here, possibly using Calendar or Date
								long curTime = startDate.getTime();
								while (curTime <= endTime) {
								    dates.add(new Date(curTime));
								    curTime += interval;
								}
								DateFormat format2=new SimpleDateFormat("EEEE"); 
								DateFormat formatdate=new SimpleDateFormat("dd"); 
								DateFormat formatmonth=new SimpleDateFormat("MMMM"); 
								int countYear=1;
								int limitoccur=1;
								for(int i=0;i<dates.size();i++){
								    Date lDate =(Date)dates.get(i);
								    String finalDay=format2.format(lDate);
								   
								    String ds = formatter.format(lDate);   
								    String Date=formatdate.format(lDate);
								    String month=formatmonth.format(lDate);
								
								    if(month.equals(getmonth)){
								    	 if(Date.equals(dayyear))	{
								    		 if(countYear==1){
											    	 
											    	 
											    	
											    	 dateList.add(ds);
											    	 if(limit!=0){
															if(limitoccur == limit ){
																break;
															}
														
															limitoccur=limitoccur+1;
														}
								    		 }
								    		 countYear = countYear + 1;
								    		
									    		if(countYear == (yearrecur+1)){
									    			countYear = 1;
									    		}
									    		
									    }
								    }
								   
								   
								    dateList.add(ds);
								    
								}
					
				}
				else if(yearmonthlyRadio.equals("2")){
					//----Insert for daily basis on end date------------------	
					List<Date> dates = new ArrayList<Date>();
					
					int yearrecur=1;
					String monthval="1";
					String weekSection = "1";
					
					if(!daymonthlyyearrecur.equals("") || !daymonthlyyearrecur.equals("0")){
						yearrecur=Integer.parseInt(daymonthlyyearrecur);
					}
					

					if(!yearsection.equals("") || !yearsection.equals("")){
											monthval=yearsection;
					}
					
					if(!yearmonthWeeksection.equals("0") || !yearmonthWeeksection.equals("")){
						weekSection=yearmonthWeeksection;
					}
					String weekDay=assestsDao.getWeeks(weekSection);
					String getmonth=assestsDao.getMonth(monthval);
								//String str_date = dateStart;
					int limit=0;
					String getenddate="";
					 if(endRangePat.equals("2")){
						     getenddate=assestsDao.getEndAfterDate(dateStart);
						     if(endoccurence.equals("0") || endoccurence.equals("")){
						    	 limit = 1;
						     }
						     else
						     {
						    	 limit= Integer.parseInt(endoccurence);
						     }
					 	}
					 else if(endRangePat.equals("3")){
						 	  getenddate = endDater;
						 	 
					 	}
					 else
					 {
						  getenddate=assestsDao.getYearEndDate(dateStart);
					 }
					String[] startval=dateStart.split("-");
					String str_dater=startval[2]+"/"+startval[1]+"/"+startval[0];
					
					
					String[] endval=getenddate.split("-");
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
								Date  endDate = null;
								        try {
								            endDate = (Date)formatter.parse(end_date);
								        } catch (Exception ex) {
								        }
								long interval = 24*1000 * 60 * 60; // 1 hour in millis
								long endTime =endDate.getTime() ; // create your endtime here, possibly using Calendar or Date
								long curTime = startDate.getTime();
								int startSectionLimit,endSectionLimit;
								while (curTime <= endTime) {
								    dates.add(new Date(curTime));
								    curTime += interval;
								}
								DateFormat format2=new SimpleDateFormat("EEEE"); 
								DateFormat formatmonth=new SimpleDateFormat("MMMM"); 
								DateFormat formatdate=new SimpleDateFormat("dd"); 
								if(yearmonthsection.equals("2")){
									startSectionLimit=8;
									endSectionLimit=14;
								}
								else if(yearmonthsection.equals("3")){
									startSectionLimit=15;
									endSectionLimit=21;
								}
								else if(yearmonthsection.equals("4")){
									startSectionLimit=22;
									endSectionLimit=28;
								}
								else if(yearmonthsection.equals("5")){
									startSectionLimit=29;
									endSectionLimit=31;
								}
								else{
									startSectionLimit=1;
									endSectionLimit=7;

								}
								int countYear=1;
								int limitoccur=1;
								for(int i=0;i<dates.size();i++){
								    Date lDate =(Date)dates.get(i);
								    String finalDay=format2.format(lDate);
								    String month=formatmonth.format(lDate);
								    String Date=formatdate.format(lDate);
								    int dateInt=Integer.parseInt(Date);
								    if(month.equals(getmonth)){
								    	
								    	 if(finalDay.equals(weekDay))	{
								    		 if(dateInt>=startSectionLimit && dateInt <=endSectionLimit){
								    			
								    			 if(countYear==1){
								    			 
												    String ds = formatter.format(lDate);   
												    
												 
												    dateList.add(ds);
												    if(limit!=0){
														if(limitoccur == limit ){
															break;
														}
													
														limitoccur=limitoccur+1;
													}
								    		 }
								    		 countYear = countYear + 1;
									    		
									    		if(countYear == (yearrecur+1)){
									    			countYear = 1;
									    		}
								    		 }
								    	 }
								    	
								    }
								   
								}
				}				
			}
			String[] startval=dateStart.split("-");
			String str_dater=startval[2]+"/"+startval[1]+"/"+startval[0];
			String assignedTo=employee;
			String assignedBy=(String) req.getSession().getAttribute("UserRecordID");
			
			
			startTime=assestsDao.getTime(startTime);
			endTimer=assestsDao.getTime(endTimer);
			assestsDao.inserttaskSchedulerData(taskID,dateList,scheduledata,taskname,fromdate,assignedTo,assignedBy,startTime,endTimer,todate);
		}	
					
		}
		}
		catch(Exception exception)
		{
			exception.printStackTrace();
		}
		return new ModelAndView("task/task");
	}
	
	public ModelAndView deletetask(HttpServletRequest req,
			HttpServletResponse res) {

		try {
			InetAddress ip = InetAddress.getLocalHost();
			String userId = (String) req.getSession().getAttribute(
					"UserRecordID");

			java.util.Date dt = new java.util.Date();
			java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat(
					"yyyy-MM-dd HH:mm:ss");
			String currentTime = sdf.format(dt);

			String taskID = req.getParameter("id");
			String type= req.getParameter("type");
			String typeval= req.getParameter("typeval");
	
			if(type.equals("Manual")){
				if(typeval.equals("single")){
					assestsDao.deletesingleSchedulerDetailTask(Integer.parseInt(taskID));
					masterDao.userAuditTrail("assentisk_scheduler_activity", "1", "delete",
							currentTime, Integer.parseInt(userId), ip.getHostAddress());
				}
				else{
						assestsDao.deleteTask(Integer.parseInt(taskID));
						masterDao.userAuditTrail("assentisk_tasks", "1", "delete",
								currentTime, Integer.parseInt(userId), ip.getHostAddress());
						assestsDao.deleteSchedulerTask(Integer.parseInt(taskID));
						masterDao.userAuditTrail("assentisk_scheduler", "1", "delete",
								currentTime, Integer.parseInt(userId), ip.getHostAddress());
						assestsDao.deleteSchedulerDetailTask(Integer.parseInt(taskID));
						masterDao.userAuditTrail("assentisk_scheduler_activity", "1", "delete",
								currentTime, Integer.parseInt(userId), ip.getHostAddress());
				}
			}
			else if(type.equals("System")){
				if(typeval.equals("single")){
					assestsDao.deletesingleSchedulerDetailTask(Integer.parseInt(taskID));
					masterDao.userAuditTrail("assentisk_scheduler_activity", "1", "delete",
							currentTime, Integer.parseInt(userId), ip.getHostAddress());
				}
				else{
				assestsDao.deleteAMCTask(Integer.parseInt(taskID));
				masterDao.userAuditTrail("assentisk_amc_assets", "1", "delete",
						currentTime, Integer.parseInt(userId), ip.getHostAddress());
				
				
				assestsDao.deleteAMCSchedulerTask(Integer.parseInt(taskID));
				masterDao.userAuditTrail("assentisk_scheduler", "1", "delete",
						currentTime, Integer.parseInt(userId), ip.getHostAddress());
				assestsDao.deleteAMCSchedulerDetailTask(Integer.parseInt(taskID));
				masterDao.userAuditTrail("assentisk_scheduler_activity", "1", "delete",
						currentTime, Integer.parseInt(userId), ip.getHostAddress());
				}
			}
			else if(type.equals("Support Ticket")){
				assestsDao.deleteSupportTicket(Integer.parseInt(taskID));
				masterDao.userAuditTrail("assentisk_support", "1", "delete",
						currentTime, Integer.parseInt(userId), ip.getHostAddress());
				
				assestsDao.deleteSchedulerDetailTask(Integer.parseInt(taskID));
				masterDao.userAuditTrail("assentisk_scheduler_activity", "1", "delete",
						currentTime, Integer.parseInt(userId), ip.getHostAddress());
			}
		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return null;
	}


	
	public ModelAndView editAMC(HttpServletRequest req,
			HttpServletResponse res) {
	
		try
		{
			String id = req.getParameter("taskid");					
			map = new ModelMap();
			
			List<AssetsBean> assetDetail = assestsDao.getAmcDetailsByAsset(Integer.parseInt(id));
			List<VendorBean> vendorList = assestsDao.getVendorList();
			List<TimeBean> timeList = assestsDao.getTimeList();
			List<AssetsBean> assetList = assestsDao.getAssetsList();
			List<MonthSectionBean> monthsectionList = assestsDao.getMonthSectionList();
			List<WeekdayBean> weekdayList = assestsDao.getWeekdayList();
			List<YearSectionBean> yearsectionList=assestsDao.getYearSectionList();
			
			if(assetDetail.size()>0)
			{
				Map m = (Map)assetDetail.get(0);
				map.addObject("ID", m.get("ID"));
				map.addObject("AMC_CName", m.get("AMC_CName"));
				map.addObject("VendorID", m.get("VendorID"));
				map.addObject("FromDate", m.get("FromDate"));
				map.addObject("ToDate", m.get("ToDate"));
				map.addObject("assetID", m.get("assetID"));
				String responsiblehead=m.get("responsibleHead").toString();
				responsiblehead =assestsDao.getuserDataConcat(responsiblehead);
				map.addObject("responsibleHead", responsiblehead);
				map.addObject("schdulerderdata", m.get("scheduler"));
				
			}
			
			List<SchedulerBean> schedulerList = assestsDao.getSchedulerList(id);
			if(schedulerList.size()>0){
				Map mp = (Map)schedulerList.get(0);
				map.addObject("getScheduler",true);
				map.addObject("startTimeID", mp.get("startTimeID"));
				map.addObject("endTimeID", mp.get("endTimeID"));
				map.addObject("duration", mp.get("duration"));
				map.addObject("recurPattern", mp.get("recurPattern"));
				map.addObject("recurOccurence", mp.get("recurOccurence"));
				map.addObject("weekid", mp.get("weekid"));
				String weekid=mp.get("weekid").toString();
				String []week=weekid.split(",");
				String sun="0",mon="0",tues="0",wed="0",thrus="0",fri="0",sat="0";
				for(int i=0;i<week.length;i++){
					if(week[i].equals("1")){
						sun="1";
					}
					if(week[i].equals("2")){
						mon="2";
					}
					if(week[i].equals("3")){
						tues="3";
					}
					if(week[i].equals("4")){
						wed="4";
					}
					if(week[i].equals("5")){
						thrus="5";
					}
					if(week[i].equals("6")){
						fri="6";
					}
					if(week[i].equals("7")){
						sat="7";
					}
				}
			
	
				map.addObject("sun",sun);
				map.addObject("mon",mon);
				map.addObject("tues",tues);
				map.addObject("wed",wed);
				map.addObject("thrus",thrus);
				map.addObject("fri",fri);
				map.addObject("sat",sat);
				map.addObject("dateStart", mp.get("dateStart"));
				map.addObject("endDate", mp.get("endDate"));
				map.addObject("endRangePat", mp.get("endRangePat"));
				map.addObject("endoccurence", mp.get("endoccurence"));
				map.addObject("schedulerID", mp.get("id"));				
				map.addObject("dailyRadio", mp.get("dailyRadio"));
				map.addObject("dailyRecur", mp.get("dailyRecur"));
				map.addObject("monthRadio", mp.get("monthRadio"));
				map.addObject("monthdayRecur", mp.get("monthdayRecur"));
				map.addObject("monthRecur", mp.get("monthRecur"));
				map.addObject("monthSection", mp.get("monthSection"));
				map.addObject("monthWeekend", mp.get("monthWeekend"));
				map.addObject("yearlyRecur", mp.get("yearlyRecur"));
				map.addObject("yearlyMonthSection", mp.get("yearlyMonthSection"));
				map.addObject("yearlyMonthWeek", mp.get("yearlyMonthWeek"));
				map.addObject("yearlySection", mp.get("yearlySection"));
				map.addObject("yearlyMonthRecur", mp.get("yearlyMonthRecur"));
				map.addObject("yearlyRadio", mp.get("yearlyRadio"));
				
				
			}
			else
			{
				map.addObject("getScheduler",false);
				map.addObject("dailyRecur", "1");
				map.addObject("recurOccurence", "1");
				map.addObject("endoccurence","1");
				map.addObject("monthdayRecur", "1");
				map.addObject("monthRecur","1");
				map.addObject("yearlyRecur", "1");
				map.addObject("yearlyMonthRecur", "1");
			}
			List<EmployeeBean> employeeList = organizationDao.getEmployeeList();
			
			map.addObject("employeeList", employeeList);
			map.addObject("vendorList", vendorList);
			map.addObject("timeList",timeList);
			map.addObject("monthsectionList", monthsectionList);
			map.addObject("weekdayList",weekdayList);
			map.addObject("yearsectionList", yearsectionList);
			
			
			
			
			
		}
		catch(Exception exception)
		{
			exception.printStackTrace();
		}
		return new ModelAndView("task/amcschedule", map);
	}
	
	public ModelAndView supportList(HttpServletRequest req,
			HttpServletResponse res) {

		try {
			out = res.getWriter();
			List<supportBean> supportList = assestsDao.getSupportList();
			PersonJsonObject personJsonObject = new PersonJsonObject();
			personJsonObject.setSupportBeans(supportList);
			Gson gson = new GsonBuilder().setPrettyPrinting().create();
			String json2 = gson.toJson(personJsonObject);
			out.print(json2);
			

		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return null;
	}
	
	
	public ModelAndView addticket(HttpServletRequest req,
			HttpServletResponse res){
		try{
			
			map = new ModelMap();
			List<priorityBean> priorityList = assestsDao.getPriorityList();
			map.addObject("priorityList",priorityList);
			List<ticketCategoryBean> ticketCategory=assestsDao.getTicketCategory();
			map.addObject("categoryList", ticketCategory);
			modelAndView = new ModelAndView("task/addticket", map);			
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndView;
	}
	
	
	public ModelAndView saveticket(HttpServletRequest req,
			HttpServletResponse res) {

		try {
			
			InetAddress ip = InetAddress.getLocalHost();
			String userId = (String) req.getSession().getAttribute(
					"UserRecordID");

			java.util.Date dt = new java.util.Date();
			java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat(
					"yyyy-MM-dd HH:mm:ss");
			java.text.SimpleDateFormat sdf1 = new java.text.SimpleDateFormat(
			"yyyy-MM-dd");
			String currentTime = sdf.format(dt);
			
			String currentFormatTime = sdf1.format(dt);
			
			
			String title = req.getParameter("title");
			String priority = req.getParameter("priority");
			String detail = req.getParameter("detail");
			String responsiblehead = req.getParameter("responsiblehead");
			String catList= req.getParameter("catList");
			
			
			if (!responsiblehead.equals("")) {
//				int firstBracket = responsiblehead.indexOf('(');
//				String UserName = responsiblehead.substring(0, responsiblehead.indexOf('('));
//				responsiblehead = organizationDao.getUserId(UserName);
				int firstBracket = responsiblehead.indexOf('(');
				 String UserName = responsiblehead.substring(firstBracket + 1,
						 responsiblehead.indexOf(')', firstBracket));
				 responsiblehead=organizationDao.getUserId(UserName);
				
			}
			
			assestsDao.addTicket(title, priority,detail,responsiblehead,currentFormatTime,catList);
			masterDao.userAuditTrail("assentisk_support", "1", "Insert", currentTime,
					Integer.parseInt(userId), ip.getHostAddress());
			String assignedBy=(String) req.getSession().getAttribute("UserRecordID");
			
			assestsDao.inserttaskticketSchedulerData(currentFormatTime,currentFormatTime,title,currentFormatTime,responsiblehead,assignedBy,"0","0",currentFormatTime);
			
			masterDao.userAuditTrail("assentisk_scheduler_activity", "1", "Insert",
					currentTime, Integer.parseInt(userId), ip.getHostAddress());
			
			
		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return null;
	}
	
	public ModelAndView editticket(HttpServletRequest req,
			HttpServletResponse res){
		try{
			
			map = new ModelMap();
			String ticketId = req.getParameter("id");
			List<priorityBean> priorityList = assestsDao.getPriorityList();
			map.addObject("priorityList",priorityList);
			map.addObject("ticketId",ticketId);
			List<ticketCategoryBean> ticketCategory=assestsDao.getTicketCategory();
			map.addObject("categoryList", ticketCategory);
			List<supportBean> ticketList = assestsDao.getSupportTicketList(ticketId);
			if(ticketList.size()>0){
				Map m=(Map)ticketList.get(0);
				map.addObject("title", m.get("title").toString());
				map.addObject("details", m.get("details").toString());
				map.addObject("priority", m.get("priority").toString());
				String responsiblehead=m.get("assignedTo").toString();
				responsiblehead =assestsDao.getuserDataConcat(responsiblehead);
				map.addObject("assignedTo", responsiblehead);
				map.addObject("cat",  m.get("category").toString());
				
			}
			
			
			
			modelAndView = new ModelAndView("task/editticket", map);			
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndView;
	}
	
	
	public ModelAndView updateticket(HttpServletRequest req,
			HttpServletResponse res) {

		try {
			
			InetAddress ip = InetAddress.getLocalHost();
			String userId = (String) req.getSession().getAttribute(
					"UserRecordID");

			java.util.Date dt = new java.util.Date();
			java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat(
					"yyyy-MM-dd HH:mm:ss");
			java.text.SimpleDateFormat sdf1 = new java.text.SimpleDateFormat(
			"yyyy-MM-dd");
			String currentTime = sdf.format(dt);
			
			String currentFormatTime = sdf1.format(dt);
			
			String ticketID=req.getParameter("ticketID");
			String title = req.getParameter("title");
			String priority = req.getParameter("priority");
			String detail = req.getParameter("detail");
			String responsiblehead = req.getParameter("responsiblehead");
			String tasktype=req.getParameter("tasktype");
			String catList=req.getParameter("catList");
			if (!responsiblehead.equals("")) {
//				int firstBracket = responsiblehead.indexOf('(');
//				String UserName = responsiblehead.substring(0, responsiblehead.indexOf('('));
//				responsiblehead = organizationDao.getUserId(UserName);
				int firstBracket = responsiblehead.indexOf('(');
				 String UserName = responsiblehead.substring(firstBracket + 1,
						 responsiblehead.indexOf(')', firstBracket));
				 responsiblehead=organizationDao.getUserId(UserName);
				
			}
			
			assestsDao.updateTicket(title, priority,detail,responsiblehead,currentFormatTime,ticketID,catList);
			masterDao.userAuditTrail("assentisk_support", "1", "Edit", currentTime,
					Integer.parseInt(userId), ip.getHostAddress());
			String assignedBy=(String) req.getSession().getAttribute("UserRecordID");
			assestsDao.updatetaskticketSchedulerData(currentFormatTime,currentFormatTime,title,currentFormatTime,responsiblehead,assignedBy,"0","0",currentFormatTime,ticketID);
			
			masterDao.userAuditTrail("assentisk_scheduler_activity", "1", "Edit",
					currentTime, Integer.parseInt(userId), ip.getHostAddress());
			
			
		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return null;
	}
	
	
	public ModelAndView editSupportTask(HttpServletRequest req,
			HttpServletResponse res){
		try{
			
			map = new ModelMap();
			String ticketId = req.getParameter("taskid");
			List<priorityBean> priorityList = assestsDao.getPriorityList();
			map.addObject("priorityList",priorityList);
			map.addObject("ticketId",ticketId);
			List<supportBean> ticketList = assestsDao.getSupportTicketList(ticketId);
			if(ticketList.size()>0){
				Map m=(Map)ticketList.get(0);
				map.addObject("title", m.get("title").toString());
				map.addObject("details", m.get("details").toString());
				map.addObject("priority", m.get("priority").toString());
				String responsiblehead=m.get("assignedTo").toString();
				responsiblehead =assestsDao.getuserDataConcat(responsiblehead);
				map.addObject("assignedTo", responsiblehead);
				
			}
			
			
			
			modelAndView = new ModelAndView("task/editSupportticketTask", map);			
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndView;
	}
	
	public ModelAndView deleteticket(HttpServletRequest req,
			HttpServletResponse res) {

		try {
			InetAddress ip = InetAddress.getLocalHost();
			String userId = (String) req.getSession().getAttribute(
					"UserRecordID");
			
			java.util.Date dt = new java.util.Date();
			java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat(
					"yyyy-MM-dd HH:mm:ss");
			String currentTime = sdf.format(dt);
			
			String ticketID = req.getParameter("id");
			
			assestsDao.deleteSupportTicket(Integer.parseInt(ticketID));
			masterDao.userAuditTrail("assentisk_support", "1", "delete",
					currentTime, Integer.parseInt(userId), ip.getHostAddress());
			
			
			assestsDao.deleteSchedulerDetailTask(Integer.parseInt(ticketID));
			masterDao.userAuditTrail("assentisk_scheduler_activity", "1", "delete",
					currentTime, Integer.parseInt(userId), ip.getHostAddress());
			
		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return null;
	}
	public ModelAndView checktask(HttpServletRequest req,
			HttpServletResponse res) throws Exception {
		PrintWriter out = res.getWriter();
		try {

		
		String taskname = req.getParameter("taskname");
		String fromdate = req.getParameter("fromdate");
		String todate = req.getParameter("todate");
		String check="";
		String employee = req.getParameter("employeedata");
		
		
		if(!employee.equals("")){
			int firstBracket = employee.indexOf('(');
			String UserName="";
			if(firstBracket>0){
				UserName = employee.substring(0, employee.indexOf('('));
			}
			else{
				UserName=employee;
			}
			employee=assestsDao.getUserId(UserName);
			if(employee==""){
				check="wrong";
			}
			else{
				 check=assestsDao.checktask(taskname,  fromdate, todate,employee);
			}
			}
		out.write(check);
		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return null;
	}
	
	public ModelAndView checkedittask(HttpServletRequest req,
			HttpServletResponse res) throws Exception {
		PrintWriter out = res.getWriter();
		try {

	
		String taskname = req.getParameter("taskname");
		String fromdate = req.getParameter("fromdate");
		String todate = req.getParameter("todate");
		String taskid = req.getParameter("taskid");
		String check="";
		String employee = req.getParameter("employeedata");
		if(!employee.equals("")){
			int firstBracket = employee.indexOf('(');
			String UserName="";
			if(firstBracket>0){
				UserName = employee.substring(0, employee.indexOf('('));
			}
			else{
				UserName=employee;
			}
			employee=assestsDao.getUserId(UserName);
			if(employee==""){
				check="wrong";
			}
			else{
				 check=assestsDao.checkedittask(taskname,  fromdate, todate,employee,taskid);

				
			}
			}
		out.write(check);
		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return null;
	}
	public ModelAndView singleedittask(HttpServletRequest req,
			HttpServletResponse res){
		try{
			
			String id = req.getParameter("taskid");					
			map = new ModelMap();
			
			List<taskBean> taskDetail = assestsDao.gettasksingleScheduler(Integer.parseInt(id));

			if(taskDetail.size()>0)
			{
				Map m = (Map)taskDetail.get(0);
				map.addObject("ID", m.get("id"));
				map.addObject("taskName", m.get("amcname"));
				map.addObject("FromDate", m.get("startdate"));
				map.addObject("ToDate", m.get("enddate"));
				String responsiblehead=m.get("assignedTo").toString();
				responsiblehead =assestsDao.getuserDataConcat(responsiblehead);
				map.addObject("responsibleHead", responsiblehead);
				map.addObject("dateSchedule", m.get("dateSchedule"));
				map.addObject("taskid", m.get("taskID"));
				
			}
	
			modelAndView = new ModelAndView("task/singleeditTask", map);			
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndView;
	}
	
	public ModelAndView updatesingleTaskschedule(HttpServletRequest req,
			HttpServletResponse res) {
	
		try
		{
		
			InetAddress ip = InetAddress.getLocalHost();
			String userId = (String) req.getSession().getAttribute(
					"UserRecordID");
			
			java.util.Date dt = new java.util.Date();
			java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat(
					"yyyy-MM-dd HH:mm:ss");
			java.text.SimpleDateFormat sdf1 = new java.text.SimpleDateFormat(
			"yyyy-MM-dd");
			String currentTime = sdf.format(dt);
			
			String currentFormatTime = sdf1.format(dt);
			
			
			String singletaskid = req.getParameter("id");
			String taskname = req.getParameter("taskname");
			String fromdate = req.getParameter("fromdate");
			String todate = req.getParameter("todate");
			String dateSchedule=req.getParameter("dateSchedule");
			String employee = req.getParameter("responsiblehead");
			if(!employee.equals("")){
			int firstBracket = employee.indexOf('(');
			String UserName = employee.substring(firstBracket + 1, employee.indexOf(')', firstBracket));
			employee=assestsDao.getUserId(UserName);
			}
			
		
			assestsDao.updatesingletaskData(singletaskid,taskname,fromdate,todate,dateSchedule,employee,userId);
			masterDao.userAuditTrail("assentisk_scheduler_activity", "1", "update single task",
						currentTime, Integer.parseInt(userId), ip.getHostAddress());
			
			
			
				modelAndView = new ModelAndView("task/task");		
		}catch(Exception exception){
				exception.printStackTrace();
			}
			return modelAndView;
		}
		
	public ModelAndView checksingleedittask(HttpServletRequest req,
			HttpServletResponse res) throws Exception {
		PrintWriter out = res.getWriter();
		try {

	
		String taskname = req.getParameter("taskname");
	
		String fromdate = req.getParameter("fromdate");
		
		String todate = req.getParameter("todate");
		
		String taskid = req.getParameter("taskid");
		
		String dateSchedule=req.getParameter("dateSchedule");
	
		String check="";
		String employee = req.getParameter("employeedata");
		
		if(!employee.equals("")){
			int firstBracket = employee.indexOf('(');
			String UserName="";
			if(firstBracket>0){
				UserName = employee.substring(firstBracket + 1, employee.indexOf(')', firstBracket));
			}
			else{
				UserName=employee;
			}
			employee=assestsDao.getUserId(UserName);
			if(employee==""){
				check="wrong";
			}
			else{
				 check=assestsDao.checkeditsingletask(taskname,  fromdate, todate,employee,dateSchedule,taskid);
			}
			}
		out.write(check);
		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return null;
	}
	
	public ModelAndView editsingleAMC(HttpServletRequest req,
			HttpServletResponse res){
		try{
			
			String id = req.getParameter("taskid");					
			map = new ModelMap();
			
			List<taskBean> taskDetail = assestsDao.gettasksingleAMCScheduler(Integer.parseInt(id));

			if(taskDetail.size()>0)
			{
				Map m = (Map)taskDetail.get(0);
				map.addObject("ID", m.get("id"));
				map.addObject("taskName", m.get("amcname"));
				map.addObject("FromDate", m.get("startdate"));
				map.addObject("ToDate", m.get("enddate"));
				String responsiblehead=m.get("assignedTo").toString();
				responsiblehead =assestsDao.getuserDataConcat(responsiblehead);
				map.addObject("responsibleHead", responsiblehead);
				map.addObject("dateSchedule", m.get("dateSchedule"));
				map.addObject("taskid", m.get("taskID"));
				
			}
	
			modelAndView = new ModelAndView("task/singleEditAMCtask", map);			
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndView;
	}
	
	public ModelAndView updateSAMCschedule(HttpServletRequest req,
			HttpServletResponse res) {
	
		try
		{
			
			InetAddress ip = InetAddress.getLocalHost();
			String userId = (String) req.getSession().getAttribute(
					"UserRecordID");
			
			java.util.Date dt = new java.util.Date();
			java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat(
					"yyyy-MM-dd HH:mm:ss");
			java.text.SimpleDateFormat sdf1 = new java.text.SimpleDateFormat(
			"yyyy-MM-dd");
			String currentTime = sdf.format(dt);
			
			String currentFormatTime = sdf1.format(dt);
			
			
			String singletaskid = req.getParameter("id");
			String taskname = req.getParameter("taskname");
			String fromdate = req.getParameter("fromdate");
			String todate = req.getParameter("todate");
			String dateSchedule=req.getParameter("dateSchedule");
			String employee = req.getParameter("responsiblehead");
			if(!employee.equals("")){
			int firstBracket = employee.indexOf('(');
			String UserName = employee.substring(firstBracket + 1, employee.indexOf(')', firstBracket));
			employee=assestsDao.getUserId(UserName);
			}
			
		
			assestsDao.updatesingletaskData(singletaskid,taskname,fromdate,todate,dateSchedule,employee,userId);
			masterDao.userAuditTrail("assentisk_scheduler_activity", "1", "update single task",
						currentTime, Integer.parseInt(userId), ip.getHostAddress());
			
			
			
				modelAndView = new ModelAndView("task/task");		
		}catch(Exception exception){
				exception.printStackTrace();
			}
			return modelAndView;
		}
	
	public ModelAndView ticketcategorylist(HttpServletRequest req,
			HttpServletResponse res) {

		try {
			out = res.getWriter();
			List<ticketCatBean> getticketCategory = assestsDao.getticketCatList();
			PersonJsonObject personJsonObject = new PersonJsonObject();
			personJsonObject.setTicketCatBeans(getticketCategory);

			Gson gson = new GsonBuilder().setPrettyPrinting().create();
			String json2 = gson.toJson(personJsonObject);	
			out.print(json2);
		

		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return null;
	}
	
	public ModelAndView checkticketcategoryname(HttpServletRequest req,HttpServletResponse res)
	{	
		
		try
		{
			PrintWriter out = res.getWriter();
			String catname = req.getParameter("catname");			
			List<ticketCatBean> checksize = assestsDao.checkTicketCategoryName(catname);
			if(checksize.size()>0)
			{
				out.write("exist");
			}
			else
			{
				out.write("notexist");
			}
			
		}
		catch(Exception exception)
		{
			exception.printStackTrace();
		}
		return null;
	}
	
	public ModelAndView saveticketcat(HttpServletRequest req,
			HttpServletResponse res) {
		
		try
		{
			int status = 0;
			java.util.Date dt = new java.util.Date();
			java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String currentTime = sdf.format(dt);
			
			String ticketCatname = req.getParameter("catname");
			String isactive = req.getParameter("isactive");			
			InetAddress ip = InetAddress.getLocalHost();
			String userId = (String) req.getSession().getAttribute("UserRecordID");
			
			if(isactive.equals("true"))
			{
				status = 1;
			}
			
				
			assestsDao.saveTicketCat(ticketCatname, status);
			masterDao.userAuditTrail("assentisk_ticket_category", "1", "add", currentTime, Integer.parseInt(userId), ip.getHostAddress());

		}
		catch(Exception exception)
		{
			exception.printStackTrace();
		}
		return null;
	}
	public ModelAndView editticketcat(HttpServletRequest req,
			HttpServletResponse res) {		
		try
		{	
			map = new ModelMap();
			String ticketid = req.getParameter("ticketid");
			List<ticketCatBean> getRow = assestsDao.getTicketCatById(ticketid);
			if(getRow.size()>0)
			{
				Map m = (Map)getRow.get(0);
				map.addObject("ticketCatID", m.get("id"));
				map.addObject("ticketCatName", m.get("category"));
				map.addObject("IsActive", '0');
				
			}
			modelAndView = new ModelAndView("task/editticketcategory", map);			
			
		}
		catch(Exception exception)
		{
			exception.printStackTrace();
		}
		return modelAndView;
	}
	public ModelAndView updateticketcat(HttpServletRequest req,
			HttpServletResponse res) {
		
		try
		{
			int status = 0;
			java.util.Date dt = new java.util.Date();
			java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String currentTime = sdf.format(dt);
			String tcatid = req.getParameter("vcatid");
			String ticketCatname = req.getParameter("catname");
			String isactive = req.getParameter("isactive");			
			InetAddress ip = InetAddress.getLocalHost();
			String userId = (String) req.getSession().getAttribute("UserRecordID");
			
			if(isactive.equals("true"))
			{
				status = 1;
			}
			
				
			assestsDao.updateticketCat(tcatid,ticketCatname,status);
			masterDao.userAuditTrail("assentisk_ticket_category", "1", "update", currentTime, Integer.parseInt(userId), ip.getHostAddress());

		}
		catch(Exception exception)
		{
			exception.printStackTrace();
		}
		return null;
	}
	
	public ModelAndView deleteticketcat(HttpServletRequest req,HttpServletResponse res)
	{		
		try
		{

			java.util.Date dt = new java.util.Date();
			java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String currentTime = sdf.format(dt);
			
			InetAddress ip = InetAddress.getLocalHost();
			String userId = (String) req.getSession().getAttribute("UserRecordID");
			
			String ticketCatId = req.getParameter("id");
			assestsDao.deleteTicketCategory(ticketCatId);
			masterDao.userAuditTrail("assentisk_ticket_category", "1", "delete", currentTime, Integer.parseInt(userId), ip.getHostAddress());
			
		}
		catch(Exception exception)
		{
			exception.printStackTrace();
		}
		return null;
	}
}

