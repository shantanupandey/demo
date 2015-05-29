package com.assentisk.controller;


import java.io.BufferedOutputStream;
import java.io.BufferedWriter;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.net.InetAddress;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Iterator;
import java.io.BufferedReader;  
import java.io.DataInputStream;  
import java.io.File;  
import java.io.FileInputStream;  
import java.io.FileOutputStream;  
import java.io.InputStreamReader;  
import com.itextpdf.text.Document;  
import com.itextpdf.text.Element;  
import com.itextpdf.text.Font;  
import com.itextpdf.text.Paragraph;  
import com.itextpdf.text.pdf.PdfWriter;
import java.util.TimeZone;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.ModelMap;
import org.springframework.validation.BindException;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;

import com.assentisk.dao.AssessmentDao;
import com.assentisk.dao.GroupDao;
import com.assentisk.dao.MasterDao;
import com.assentisk.dao.OrganizationDao;
import com.assentisk.dao.AssessmentDao;

import com.assentisk.bean.ApplicationsBean;
import com.assentisk.bean.AuditPlan;
import com.assentisk.bean.AuditPlanMiles;
import com.assentisk.bean.BusinessProcessesBean;
import com.assentisk.bean.CityBean;
import com.assentisk.bean.CompanyBean;
import com.assentisk.bean.CountryBean;
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
import com.assentisk.bean.VendorCategoryBean;
import com.assentisk.bean.VendorContactBean;
import com.assentisk.bean.employeesBean;
import com.assentisk.bean.priorityBean;
import com.assentisk.bean.ticketCategoryBean;
import com.assentisk.util.Files;
import com.assentisk.util.FilesService;
import com.assentisk.util.SendMailUtill;
import com.assentisk.util.UrlUtill;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import com.sun.xml.internal.bind.v2.runtime.Location;
import java.io.File;
import java.io.FileInputStream;


import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Row;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.xssf.usermodel.*;

import uk.ltd.getahead.dwrdemo.test.TestBean;

import uk.ltd.getahead.dwrdemo.test.TestBean;

public class AssessmentController extends SimpleFormController {

	protected AssessmentDao assessmentDao;
	protected MasterDao masterDao;
	protected GroupDao groupDao;
	protected FilesService filesService;

	ModelAndView modelAndView;
	PrintWriter out;
	ModelMap map;
	private VendorContactBean contactBean;

	

	public AssessmentDao getAssessmentDao() {
		return assessmentDao;
	}

	public void setAssessmentDao(AssessmentDao assessmentDao) {
		this.assessmentDao = assessmentDao;
	}

	public ModelAndView getModelAndView() {
		return modelAndView;
	}

	public void setModelAndView(ModelAndView modelAndView) {
		this.modelAndView = modelAndView;
	}

	public PrintWriter getOut() {
		return out;
	}

	public void setOut(PrintWriter out) {
		this.out = out;
	}

	public ModelMap getMap() {
		return map;
	}

	public void setMap(ModelMap map) {
		this.map = map;
	}

	public VendorContactBean getContactBean() {
		return contactBean;
	}

	public void setContactBean(VendorContactBean contactBean) {
		this.contactBean = contactBean;
	}

	public MasterDao getMasterDao() {
		return masterDao;
	}

	public void setMasterDao(MasterDao masterDao) {
		this.masterDao = masterDao;
	}

	public GroupDao getGroupDao() {
		return groupDao;
	}

	public void setGroupDao(GroupDao groupDao) {
		this.groupDao = groupDao;
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
		
		if (url.equals("auditplan")) {
			modelAndView = new ModelAndView("assessment/auditplan");
		} else if (url.equals("auditplanList")){
			return auditplanList(req, res);
		} 
		else if(url.equals("addauditplan")){
			return addauditplan(req, res);
		}
		else if(url.equals("editauditplan")){
			return editauditplan(req,res);
		}
		else if(url.equals("auditplandetails")){
			return auditplandetails(req,res);
		}
		else if(url.equals("setAssignTo")){
			return setAssignTo(req,res);
		}
		else if(url.equals("setSingleAssignTo")){
			return setSingleAssignTo(req,res);
		}
		else if(url.equals("totalControlsPerbp")){
			return totalControlsPerbp(req,res);
		}else if(url.equals("ganttChart")){
			return ganttChart(req,res);
		}
		else if(url.equals("historyDetails")){
			return historyDetails(req,res);		
		}
		else if(url.equals("policyhistoryDetails")){
			return policyhistoryDetails(req,res);		
		}
		else if(url.equals("sendforapprover")){
			return sendforapprover(req,res);
		}
		else if(url.equals("approve")){
			return approve(req,res);
		}
		else if(url.equals("test")){
			modelAndView = new ModelAndView("assessment/test");
		}
		else if(url.equals("testListdata")){
			return testListdata(req,res);
		}
		else if(url.equals("policy")){
			modelAndView = new ModelAndView("policy/policies");
		}
		else if(url.equals("policyList")){
			return policyList(req,res);
		}
		else if(url.equals("addpolicy")){
			return addpolicy(req,res);
		}
		else if(url.equals("editpolicy")){
			return editpolicy(req,res);
		}
		else if(url.equals("setTimeChange")){
			return setTimeChange(req,res);
		}
		else if(url.equals("circular")){
			modelAndView = new ModelAndView("policy/circular");
			
		}
		else if(url.equals("circularList")){
			return circularList(req,res);
		}
		else if(url.equals("circularEmpID")){
			return circularEmpID(req,res);
		}
	
		else if(url.equals("logdetails")){
			return logdetails(req,res);
		}
		else if(url.equals("showassignedpolicy")){
			return showassignedpolicy(req,res);
		}
		else if(url.equals("approvedPolicyAssigned")){
			return approvedPolicyAssigned(req,res);
		}
		return modelAndView;
	}


	

	protected ModelAndView onSubmit(HttpServletRequest req,
			HttpServletResponse res, Object cmd, BindException errors)
			throws Exception {
		String url = UrlUtill.UrlName(req.getRequestURI());
		if(url.equals("saveauditplan")){
			return saveauditplan(req, res);
		}
		else if(url.equals("updateauditplan")){
			return updateauditplan(req,res);
		}
		else if(url.equals("addauditplandetails")){
			return addauditplandetails(req,res);
		}
		else if(url.equals("savepolicy")){
			return savepolicy(req,res);
		}
		else if(url.equals("updatepolicy")){
			return updatepolicy(req,res);
		}
		return null;

	}





	private ModelAndView auditplanList(HttpServletRequest req,
			HttpServletResponse res) {
		try {
			out = res.getWriter();
			String userId = (String) req.getSession().getAttribute(
			"UserRecordID");
			List<AuditPlan> auditplanList = assessmentDao.getassessmentList(userId);
			PersonJsonObject personJsonObject = new PersonJsonObject();
			personJsonObject.setAuditPlans(auditplanList);
			Gson gson = new GsonBuilder().setPrettyPrinting().create();
			String json2 = gson.toJson(personJsonObject);	
			out.print(json2);
		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return null;
	}
	
	public ModelAndView addauditplan(HttpServletRequest req,
			HttpServletResponse res){
		try{
			
			
			modelAndView = new ModelAndView("assessment/addauditplan");			
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndView;
	}
	
	public ModelAndView saveauditplan(HttpServletRequest req,
			HttpServletResponse res) {

		try {

			int status = 0;
			java.util.Date dt = new java.util.Date();
			java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat(
					"yyyy-MM-dd HH:mm:ss");
			java.text.SimpleDateFormat sdf1 = new java.text.SimpleDateFormat(
			"yyyy-MM-dd");
			String currentTime = sdf.format(dt);
			String currentTimeupdate = sdf1.format(dt);
			String auditname = req.getParameter("auditname");
			String location = req.getParameter("location");
			String isactive = req.getParameter("isactive");
			
			InetAddress ip = InetAddress.getLocalHost();
			String userId = (String) req.getSession().getAttribute(
					"UserRecordID");

	
			if (isactive.equals("true")) {
				status = 1;
			}
			
			if (location.equals("")) {
				location = "0";
			}
			masterDao.userAuditTrail("assentisk_auditplan", "1", "add",
					currentTimeupdate, Integer.parseInt(userId), ip.getHostAddress());
			assessmentDao.saveAuditPlan(auditname, assessmentDao.getLocationIdByName(location),
					currentTime,  Integer.parseInt(userId), status);

		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return null;
	}
	
	public ModelAndView editauditplan(HttpServletRequest req,
			HttpServletResponse res){
		try{
			
			map = new ModelMap();
			String auditid=req.getParameter("auditid");
			map.addObject("auditid", auditid);
			List<AuditPlan> auditplanList = assessmentDao.getauditlistById(auditid);
			if(auditplanList.size()>0){
				Map m=(Map)auditplanList.get(0);
				map.addObject("auditName", m.get("auditName").toString());
				map.addObject("location",  m.get("Name").toString());
			}
			modelAndView = new ModelAndView("assessment/editauditplan",map);			
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndView;
	}
	
	public ModelAndView updateauditplan(HttpServletRequest req,
			HttpServletResponse res) {

		try {

			int status = 0;
			java.util.Date dt = new java.util.Date();
			java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat(
			"yyyy-MM-dd HH:mm:ss");
			java.text.SimpleDateFormat sdf1 = new java.text.SimpleDateFormat(
			"yyyy-MM-dd");
			String currentTime = sdf.format(dt);
			String currentTimeupdate = sdf1.format(dt);
			String auditid = req.getParameter("auditid");
			String auditname = req.getParameter("auditname");
			String location = req.getParameter("location");
			String isactive = req.getParameter("isactive");
			
			InetAddress ip = InetAddress.getLocalHost();
			String userId = (String) req.getSession().getAttribute(
					"UserRecordID");

	
			if (isactive.equals("true")) {
				status = 1;
			}
			
			if (location.equals("")) {
				location = "0";
			}
			masterDao.userAuditTrail("assentisk_auditplan", "1", "update",
					currentTime, Integer.parseInt(userId), ip.getHostAddress());
			assessmentDao.updateAuditPlan(auditid,auditname, assessmentDao.getLocationIdByName(location),
					currentTimeupdate,  Integer.parseInt(userId), status);

		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return null;
	}

	public ModelAndView auditplandetails(HttpServletRequest req,
			HttpServletResponse res) {

		try {
			map = new ModelMap();
		
			String auditid = req.getParameter("auditid");
			String userId = (String) req.getSession().getAttribute(
			"UserRecordID");
			map.addObject("auditid", auditid);
			List<AuditPlan> auditplanList = assessmentDao.getauditlistById(auditid);
			if(auditplanList.size()>0){
				Map m=(Map)auditplanList.get(0);
				map.addObject("auditName", m.get("auditName").toString());
				map.addObject("location",  m.get("Name").toString());
			}
			List<AuditPlan> audit_milestone_planList = assessmentDao.getauditmilestonelistById(auditid);
			if(audit_milestone_planList.size()>0){
				map.addObject("milestoneList", audit_milestone_planList);
				List<AuditPlan> audit_milestone_Details_planList = assessmentDao.getauditmilestoneDetailslistById(auditid);
				if(audit_milestone_Details_planList.size()>0){
					map.addObject("milestoneDetailsList", audit_milestone_Details_planList);
					map.addObject("auditSize", "true");
					
				}
				else
				{
					map.addObject("auditSize", "false");
					
				}
				List<AuditPlan> getassignTo=assessmentDao.getDistinctAssign(auditid);
				if(getassignTo.size()>0){
					map.addObject("auditAssign", getassignTo);
				}
				
				List<AuditPlan> getButtonApproveData=assessmentDao.getstatus(auditid);
				if(getButtonApproveData.size()>0){
					Map mk=(Map)getButtonApproveData.get(0);
					map.addObject("buttonApprover",  mk.get("approver").toString());
					map.addObject("buttonCreated",mk.get("createdBy").toString());
					map.addObject("status", mk.get("status").toString());
				}
				else
				{
					List<AuditPlan> getfreshdat=assessmentDao.getfreshStatus(auditid);
					if(getfreshdat.size()>0){
						Map mll=(Map)getfreshdat.get(0);
						map.addObject("buttonApprover", mll.get("approver").toString());
						map.addObject("buttonCreated", mll.get("createdBy").toString());
						map.addObject("status", mll.get("status").toString());
					}
				}
				
				
			}
			
			List getEmployeeNamesBracketListByName=assessmentDao.getEmployeeNamesBracketListByName();
			if(getEmployeeNamesBracketListByName.size()>0){
				map.addObject("userList", getEmployeeNamesBracketListByName);
			}
			
			
			modelAndView = new ModelAndView("assessment/auditplandetails",map);	
		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return modelAndView;
	}
	
	public ModelAndView addauditplandetails(HttpServletRequest req,
			HttpServletResponse res) {
		map = new ModelMap();
		try {
			java.util.Date dt = new java.util.Date();
			
			java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat(
			"yyyy-MM-dd");
			String currentTime = sdf.format(dt);
			String userId = (String) req.getSession().getAttribute(
			"UserRecordID");
			String auditid = req.getParameter("auditid");
			
			String location=req.getParameter("location");
			String businessProcess=req.getParameter("businessProcess");
			String assignTo=req.getParameter("assignTo");
			String startdate=req.getParameter("startdate");
			String estimatedDay=req.getParameter("estimatedDay");
			
			
			assessmentDao.getinsertlistById(auditid,assessmentDao.getBusinessProcByID(businessProcess),assignTo,startdate,estimatedDay,currentTime,userId);
			map.addObject("auditid", auditid);
			List<AuditPlan> auditplanList = assessmentDao.getauditlistById(auditid);
			if(auditplanList.size()>0){
				Map m=(Map)auditplanList.get(0);
				map.addObject("auditName", m.get("auditName").toString());
				map.addObject("location",  m.get("Name").toString());
			}
			modelAndView = new ModelAndView("redirect:/auditplandetails.assess.htm?auditid="+ auditid + "");
		}catch (Exception exception) {
			exception.printStackTrace();
		}
		return modelAndView;
		}
	
	public ModelAndView setAssignTo(HttpServletRequest req,
			HttpServletResponse res) {
		map = new ModelMap();
		try {
			
			String milestoneID=req.getParameter("milestoneID");
			String AssignTo=req.getParameter("AssignTo");
			assessmentDao.getUpdateAssignTo(milestoneID,AssignTo);
			String userId = (String) req.getSession().getAttribute("UserRecordID");
			java.util.Date dt = new java.util.Date();
			java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd");
			String currentTime = sdf.format(dt);
			assessmentDao.updateAssignAll(milestoneID,AssignTo,userId,currentTime);
			
		}catch (Exception exception) {
			exception.printStackTrace();
		}
		return null;
		}
	
	public ModelAndView setSingleAssignTo(HttpServletRequest req,
			HttpServletResponse res) {
		map = new ModelMap();
		try {
			
			String detailID=req.getParameter("detailID");
			String AssignTo=req.getParameter("AssignTo");
			String auditid=req.getParameter("auditid");
			
			assessmentDao.getUpdateSingleAssignTo(detailID,AssignTo,auditid);
			String userId = (String) req.getSession().getAttribute("UserRecordID");
			java.util.Date dt = new java.util.Date();
			java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd");
			String currentTime = sdf.format(dt);
			assessmentDao.updateStartDate(detailID,userId,currentTime);
			
			
		}catch (Exception exception) {
			exception.printStackTrace();
		}
		return null;
		}
	
	
	
	public ModelAndView totalControlsPerbp(HttpServletRequest req,
			HttpServletResponse res) {

		try {
			PrintWriter out = res.getWriter();
			String businessProc = req.getParameter("businessProc");
			int getsize = assessmentDao.totalControls(businessProc);
			String total=Integer.toString(getsize);
			
			out.write(total);
			

		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return null;
	}
	
	private ModelAndView ganttChart(HttpServletRequest req,
			HttpServletResponse res) {

	try{
		map = new ModelMap();
		String auditid=req.getParameter("auditid");
		
		List<AuditPlan> audit_milestone_planList = assessmentDao.getauditmilestonelistById(auditid);
		String data="";
		int id=0;
		int mileStoneId=0;
		int parentId=0;
		String startDate="";
		String endDate="";
		String sd;
		Date sdate;
		Date edate;
		Date d1 = null;
		Date d2 = null;
		List<AuditPlan> auditplanList = assessmentDao.getauditlistById(auditid);
		//System.out.println("check this>>auditplanList>"+auditplanList);
		
		//System.out.println("check audit list>>>"+audit_milestone_planList);
		
		for(int i=0;i<audit_milestone_planList.size();i++){
			id=id-1;
			
			System.out.println("chjeck this sizee>>>"+audit_milestone_planList.size());
			if(i == audit_milestone_planList.size()-1 &&  audit_milestone_planList.size()!= 1){
				data=data+",";	
			}
			
			if(i != 0){
				parentId=id+1;
				parentId=-parentId;	
			}
			
			
			Map m=(Map)audit_milestone_planList.get(i);
			
			startDate=m.get("startDate").toString();
			endDate=m.get("endDate").toString();
			
			SimpleDateFormat sdft = new SimpleDateFormat("yyyy-MM-dd");
			sdft.setTimeZone(TimeZone.getTimeZone("UTC"));
			sdate = sdft.parse(startDate);
			/*Date date = new Date();
			sdate = sdft.parse(sdft.format(date));*/
			edate = sdft.parse(endDate);
			
			Calendar cal = Calendar.getInstance();
			cal.setTime(sdate);
			cal.add(Calendar.DATE, -3);
			Date dateBefore5Days = cal.getTime();
			
			//System.out.println("dateBefore30Days>>>>>>>>>>"+dateBefore5Days);
 
			
			//in milliseconds
			long diff = edate.getTime() - sdate.getTime();
			long diffDays = diff / (24 * 60 * 60 * 1000);
 
			//System.out.println("check this>>diffDaysdff>"+diffDays);
			data=data+"{\"id\":"+id+",\"name\":\""+m.get("BusinessProcessName").toString().replaceAll("\\s","")+"\",\"code\":\"\",\"level\":0,\"status\":\"STATUS_ACTIVE\",\"canWrite\":true,\"start\":"+sdate.getTime()+",\"duration\":"+diffDays+",\"end\":"+edate.getTime()+",\"startIsMilestone\":true,\"endIsMilestone\":false,\"collapsed\":false,\"assigs\":[],\"hasChild\":true},";
			List<AuditPlan> audit_milestone_Details_planList = assessmentDao.getauditmilestoneDetails(auditid,m.get("auditmilesID").toString());
		//	//System.out.println("check this>>mile list>"+audit_milestone_Details_planList);
			
			if(audit_milestone_Details_planList.size()>0){
				
				for(int ie=0;ie<audit_milestone_Details_planList.size();ie++){
					id=id-1;
					parentId=parentId+1;
					Map me=(Map)audit_milestone_Details_planList.get(ie);
					startDate=me.get("startDate").toString();
					endDate=me.get("endDate").toString();
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
					sdate = sdf.parse(startDate);
					edate = sdf.parse(endDate);
					//in milliseconds
					long difference = edate.getTime() - sdate.getTime();
					long difDays = difference / (24 * 60 * 60 * 1000);
		 
					
					data=data+"{\"id\":"+id+",\"name\":\""+me.get("controlID").toString().replaceAll("\\s","")+"\",\"code\":\"\",\"level\":1,\"status\":\"STATUS_ACTIVE\",\"canWrite\":true,\"start\":"+sdate.getTime()+",\"duration\":"+difDays+",\"end\":"+edate.getTime()+",\"startIsMilestone\":false,\"endIsMilestone\":false,\"collapsed\":false,\"assigs\":[],\"depends\":\""+parentId+"\",\"description\":\"\",\"progress\":0,\"hasChild\":false}";
					if(ie != audit_milestone_Details_planList.size()-1){
						data=data+",";	
					}
					
				}
				
			}
			
		}
	
		//System.out.println("check this>mile>>"+data);
		map.addObject("data", data);
		modelAndView = new ModelAndView("assessment/ganttChart",map);			
	}
	catch(Exception exception){
		exception.printStackTrace();
	}
	return modelAndView;
	
	}
		
	
	public ModelAndView historyDetails(HttpServletRequest req,
			HttpServletResponse res) {

		try {
			PrintWriter out = res.getWriter();
			StringBuilder data = new StringBuilder();
			map = new ModelMap();
			String auditid = req.getParameter("auditid");
			map.addObject("auditid", auditid);
			data.append("<table id='history' width='100%' style='color:black' cellspacing='1' cellpadding='1' class='display'><thead><tr>");
			data.append("<th><strong>Version</strong></th>");
			data.append("<th><strong>Creator</strong></th>");
			data.append("<th><strong>Approver</strong></th>");
			data.append("<th><strong>Start Date</strong></th>");
			data.append("<th><strong>End Date</strong></th>");
			data.append("<th><strong>Status</strong></th></tr></thead><tbody>");
			List<AuditPlanMiles> historyPlanSize = assessmentDao.historyDetails(auditid);
			if(historyPlanSize.size()>0){
				for(int i=0;i<historyPlanSize.size();i++){
					Map m=(Map)historyPlanSize.get(i);
					data.append("<tr><td>"+m.get("versions").toString()+"</td>");
					data.append("<td>"+m.get("createdBy").toString()+"</td>");
					data.append("<td>"+m.get("approveBy").toString()+"</td>");
					data.append("<td>"+m.get("startDate").toString()+"</td>");
					data.append("<td>"+m.get("endDate").toString()+"</td>");
					data.append("<td>"+m.get("status").toString()+"</td></tr>");
				}
			}
			data.append("</tbody></table>");
			out.write(data.toString());

			
		}
		catch (Exception exception) {
			exception.printStackTrace();
		}
		return null;
		}
	
	
	public ModelAndView sendforapprover(HttpServletRequest req,
			HttpServletResponse res) {

		try {
			
			map = new ModelMap();
			String auditid = req.getParameter("auditid");
			String approver=req.getParameter("approver");
		
			if(!approver.equals("")){
				int firstBracket = approver.indexOf('(');
				String UserName = approver.substring(firstBracket + 1, approver.indexOf(')', firstBracket));
				approver=assessmentDao.getUserId(UserName);
			}
		    assessmentDao.sendForApprover(auditid,approver);
		}
		catch (Exception exception) {
			exception.printStackTrace();
		}
		return modelAndView;
		}
	
	public ModelAndView approve(HttpServletRequest req,
			HttpServletResponse res) {

		try {
		
			map = new ModelMap();
			String auditid = req.getParameter("auditid");
			
			
		    assessmentDao.approve(auditid);
		}
		catch (Exception exception) {
			exception.printStackTrace();
		}
		return modelAndView;
		}
	
	
	private ModelAndView testListdata(HttpServletRequest req,
			HttpServletResponse res) {
		try {
			out = res.getWriter();
			String userId = (String) req.getSession().getAttribute(
			"UserRecordID");
			String username=assessmentDao.getUserIddata(userId);
			String miles=assessmentDao.getMilesVal(username);
			List<TestAssessment> auditplanList = assessmentDao.getMileTest(username,miles);
			
			PersonJsonObject personJsonObject = new PersonJsonObject();
			personJsonObject.setTestAssesment(auditplanList);
			Gson gson = new GsonBuilder().setPrettyPrinting().create();
			String json2 = gson.toJson(personJsonObject);	
			////System.out.println(json2);
			out.print(json2);
		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return null;
	}
	

	private ModelAndView policyList(HttpServletRequest req,
			HttpServletResponse res) {
		try {
			out = res.getWriter();
			String userId = (String) req.getSession().getAttribute("UserRecordID");
			String empID=assessmentDao.getEmpID(userId);
			List<PolicyBean> policyListdata = assessmentDao.getPolicyList(userId,empID);
			PersonJsonObject personJsonObject = new PersonJsonObject();
			personJsonObject.setPolicyBeans(policyListdata);
			Gson gson = new GsonBuilder().setPrettyPrinting().create();
			String json2 = gson.toJson(personJsonObject);	
			////System.out.println(json2);
			out.print(json2);
		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return null;
	}

	@SuppressWarnings("unchecked")
	public ModelAndView addpolicy(HttpServletRequest req,
			HttpServletResponse res) {

		try {
			map = new ModelMap();
			
			List<LocationsBean> getLocation = assessmentDao.getLocationsGroupList();
			if (getLocation.size() > 0) {
				Map mp = (Map) getLocation.get(0);
				map.addObject("getLocations", mp.get("locations").toString());
			}

			
			List<DepartmentBean> getDepartment = assessmentDao.getDepartmentGroupList();
			if (getDepartment.size() > 0) {
				Map mp = (Map) getDepartment.get(0);
				map.addObject("getDepartments", mp.get("DeptName").toString());
			}

		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return new ModelAndView("policy/addpolicy", map);
	}
		
	public ModelAndView savepolicy(HttpServletRequest req,
			HttpServletResponse res) {
		map = new ModelMap();
		try {
			java.util.Date dt = new java.util.Date();
			InetAddress ip = InetAddress.getLocalHost();

			java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat(
			"yyyy-MM-dd");
			String currentTime = sdf.format(dt);
			String userId = (String) req.getSession().getAttribute(
			"UserRecordID");
			String title = req.getParameter("title");
			////System.out.println("title----"+title);
			String department=req.getParameter("departmentdataval");
			////System.out.println("department----"+department);

			String location=req.getParameter("locationdataval");
			////System.out.println("location----"+location);
		
			String textdata=req.getParameter("textvalue");
			////System.out.println("textdata----"+textdata);
			
			String responsiblehead=req.getParameter("responsiblehead");
			
			int firstBracket = responsiblehead.indexOf('(');
			String UserName="0";
			System.out.println("firstBracket---"+firstBracket);
			if(firstBracket>0){
			  UserName = responsiblehead.substring(firstBracket + 1,
					  responsiblehead.indexOf(')', firstBracket));
			} 			 
			department=department.replace("<a class=\"aclass\" href=\"javascript:void(0);\"><span class=\"remove\">X</span></a>", "");
			location=location.replace("<a class=\"aclass\" href=\"javascript:void(0);\"><span class=\"remove\">X</span></a>", "");

			UserName = assessmentDao.checkResponsibleHead(UserName);
			assessmentDao.updatePolicy(title, assessmentDao.getDepIdByName(department),userId, 
					assessmentDao.getLocationIdByName(location),textdata,currentTime,UserName);
			masterDao.userAuditTrail("assentisk_policy", "1", "add",currentTime, Integer.parseInt(userId), ip
							.getHostAddress());
		
		}catch (Exception exception) {
			exception.printStackTrace();
		}
		return modelAndView;
		}
	
	@SuppressWarnings("unchecked")
	public ModelAndView editpolicy(HttpServletRequest req,
			HttpServletResponse res) {

		try {
			map = new ModelMap();
			String policyno=req.getParameter("policyno");
			map.addObject("policyno", policyno);

			List<PolicyBean> getList = assessmentDao.getPolicyData(policyno);
			if(getList.size()>0){
				Map m=(Map)getList.get(0);
				map.addObject("title", m.get("title").toString());
				String text=m.get("textdataval").toString();
				text=text.replace("XXsingleXX", "'");
				map.addObject("textdata", text);
				String LocationList = assessmentDao.getLocationGroupById(m.get("location").toString());
				map.addObject("editLocationList", LocationList);
				
				String DeptList = assessmentDao.getDeptDataById(m.get("department").toString());
				map.addObject("editDeptList", DeptList);
				
				
				String responsiblehead = m.get("assignedTo").toString();
				responsiblehead = 	assessmentDao.getuserDataConcat(responsiblehead);
				map.addObject("responsibleHead", responsiblehead);
			}
			List<LocationsBean> getLocation = assessmentDao.getLocationsGroupList();
			if (getLocation.size() > 0) {
				Map mp = (Map) getLocation.get(0);
				map.addObject("getLocations", mp.get("locations").toString());
			}

			
			List<DepartmentBean> getDepartment = assessmentDao.getDepartmentGroupList();
			if (getDepartment.size() > 0) {
				Map mp = (Map) getDepartment.get(0);
				map.addObject("getDepartments", mp.get("DeptName").toString());
			}

		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return new ModelAndView("policy/editpolicy", map);
	}
	
	
	public ModelAndView updatepolicy(HttpServletRequest req,
			HttpServletResponse res) {
		map = new ModelMap();
		try {
			java.util.Date dt = new java.util.Date();
			InetAddress ip = InetAddress.getLocalHost();

			java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat(
			"yyyy-MM-dd");
			String currentTime = sdf.format(dt);
			String userId = (String) req.getSession().getAttribute(
			"UserRecordID");
			String policyno = req.getParameter("policyno");
			////System.out.println("policyno----"+policyno);
			String title = req.getParameter("title");
			////System.out.println("title----"+title);
			String department=req.getParameter("departmentdataval");
			////System.out.println("department----"+department);

			String location=req.getParameter("locationdataval");
			////System.out.println("location----"+location);
		
			String textdata=req.getParameter("textvalue");
			////System.out.println("textdata----"+textdata);
			String responsiblehead=req.getParameter("responsiblehead");
			int firstBracket = responsiblehead.indexOf('(');
			String UserName="0";
			System.out.println("firstBracket---"+firstBracket);
			if(firstBracket>0){
			  UserName = responsiblehead.substring(firstBracket + 1,
					  responsiblehead.indexOf(')', firstBracket));
			} 			 
			department=department.replace("<a class=\"aclass\" href=\"javascript:void(0);\"><span class=\"remove\">X</span></a>", "");
			location=location.replace("<a class=\"aclass\" href=\"javascript:void(0);\"><span class=\"remove\">X</span></a>", "");

			UserName = assessmentDao.checkResponsibleHead(UserName);
			assessmentDao.editPolicy(policyno,title, assessmentDao.getDepIdByName(department),userId, 
					assessmentDao.getLocationIdByName(location),textdata,currentTime,UserName);
			masterDao.userAuditTrail("assentisk_policy", "1", "add",currentTime, Integer.parseInt(userId), ip
							.getHostAddress());
		
		}catch (Exception exception) {
			exception.printStackTrace();
		}
		return modelAndView;
		}
	
	public ModelAndView setTimeChange(HttpServletRequest req,
			HttpServletResponse res) {
		map = new ModelMap();
		try {
			
			String milestoneID=req.getParameter("milestoneID");
			String AssignTo=req.getParameter("AssignTo");
			InetAddress ip = InetAddress.getLocalHost();

			assessmentDao.getUpdateAssignTo(milestoneID,AssignTo);
			String userId = (String) req.getSession().getAttribute("UserRecordID");
			java.util.Date dt = new java.util.Date();
			java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd");
			String currentTime = sdf.format(dt);
			String detailID = req.getParameter("detailID");
			String milesID = req.getParameter("milesID");
			String auditid = req.getParameter("auditid");
			String time = req.getParameter("time");
			assessmentDao.updatetime(detailID,time);
		
			assessmentDao.updateStartDate(detailID,userId,currentTime);
			
			masterDao.userAuditTrail("assentisk_auditplanmilesstonedetails", "1", "update",currentTime, Integer.parseInt(userId), ip
					.getHostAddress());
		}catch (Exception exception) {
			exception.printStackTrace();
		}
		return null;
		}
	
	
	public ModelAndView circularList(HttpServletRequest req,
			HttpServletResponse res){
		try{
			out = res.getWriter();
			String policyno=req.getParameter("policy");
			String userId = (String) req.getSession().getAttribute("UserRecordID");

			List<EmployeeBean> employeeList = assessmentDao.getEmployeeList(policyno,userId);

			PersonJsonObject personJsonObject = new PersonJsonObject();
			personJsonObject.setEmpBeans(employeeList);

			Gson gson = new GsonBuilder().setPrettyPrinting().create();
			String json2 = gson.toJson(personJsonObject);
			//System.out.println(json2);
			out.print(json2);
			
			
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return null;
	}
	
	
	
	public ModelAndView circularEmpID(HttpServletRequest req,
			HttpServletResponse res) {
		map = new ModelMap();
		try {
			java.util.Date dt = new java.util.Date();
			InetAddress ip = InetAddress.getLocalHost();
			SendMailUtill mail = new SendMailUtill();
			java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat(
			"yyyy-MM-dd");
			String currentTime = sdf.format(dt);
			String userId = (String) req.getSession().getAttribute(
			"UserRecordID");
			
			
			String EmpIDs=req.getParameter("employeeID");
			String policyID=req.getParameter("policyno");
			
			//System.out.println(EmpIDs);
			//System.out.println("policyID---"+policyID);
			List<PolicyBean> policyData= assessmentDao.getPolicyData(policyID);
			
			//Writing text file 
			if(policyData.size()>0){
				//System.out.println("check context path>>>"+req.getRealPath(""));
				//System.out.println("check context path>>>"+req.getContextPath());
				Map m = (Map) policyData.get(0);
				String content = m.get("textdata").toString();	
				File file = new File(req.getRealPath("").toString()+"samplePolicy.txt");
				 
				// if file doesnt exists, then create it
				if (!file.exists()) {
					file.createNewFile();
				}
	 
				FileWriter fw = new FileWriter(file.getAbsoluteFile());
				BufferedWriter bw = new BufferedWriter(fw);
				bw.write(content);
				bw.close();
				  if(convertTextToPDF(file,req.getRealPath("").toString())){
		                ////System.out.println("Text file successfully converted to PDF");
		            }
			}
			
			List<PolicyBean> getPolicyList=assessmentDao.getPolicyByID(policyID,EmpIDs);
			if(getPolicyList.size()>0){
				for(int i=0;i<getPolicyList.size();i++){
					Map m=(Map)getPolicyList.get(i);
					mail.sendMessage(req,m.get("Email").toString(), "Policy Circular", 
					"Dear "
					 + ""+m.get("EmpName").toString()+ ""+
					 "\n\nYou recently requested a reminder of your Policy Approval.\n\nPlease click on the link for viewing policy and their approval:" +
					 "\n\nhttp://182.74.178.179:8080/assentisk-qa/policyapproval.htm?ID="+policyID+'_'+m.get("EmployeeID").toString()+""+
					 "\n\nPlease contact your system administrator if you have any further queries.\n\nRegards\nAssentisk Team\n\nPlease do not reply to this email address as it is not monitored.");
				}
				
			}
			
		assessmentDao.insertPolicyByID(policyID,EmpIDs,currentTime,userId);
		
			
			
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return modelAndView;
	}
	
	
	public static boolean convertTextToPDF(File file,String path) throws Exception  
    {  
       ////System.out.println("inside>>>>>");
        FileInputStream fis=null;  
        DataInputStream in=null;  
        InputStreamReader isr=null;  
        BufferedReader br=null;  
 
        try {  
 
            Document pdfDoc = new Document();  
            String output_file =path+"policy.pdf";  
            PdfWriter writer=PdfWriter.getInstance(pdfDoc,new FileOutputStream(output_file));  
            pdfDoc.open();  
            pdfDoc.setMarginMirroring(true);  
            pdfDoc.setMargins(36, 72, 108,180);  
            pdfDoc.topMargin();  
            Font myfont = new Font();  
            Font bold_font = new Font();  
            bold_font.setStyle(Font.BOLD);  
            bold_font.setSize(10);  
            myfont.setStyle(Font.NORMAL);  
            myfont.setSize(10);  
            pdfDoc.add(new Paragraph("\n"));  
 
            if(file.exists()){  
 
                fis = new FileInputStream(file);  
                in = new DataInputStream(fis);  
                isr=new InputStreamReader(in);  
                br = new BufferedReader(isr);  
                String strLine;  
 
                while ((strLine = br.readLine()) != null)  {  
 
                    Paragraph para =new Paragraph(strLine+"\n",myfont);  
                    para.setAlignment(Element.ALIGN_JUSTIFIED);  
                    pdfDoc.add(para);  
                }  
            }     
            else {  
 
                ////System.out.println("no such file exists!");  
                return false;  
            }  
            pdfDoc.close();   
        }  
 
        catch(Exception e) {  
            ////System.out.println("Exception: " + e.getMessage());  
        }  
        finally {  
 
            if(br!=null)  
            {  
                br.close();  
            }  
            if(fis!=null)  
            {  
                fis.close();  
            }  
            if(in!=null)  
            {  
                in.close();  
            }  
            if(isr!=null)  
            {  
                isr.close();  
            }  
 
        }  
 
        return true;  
    } 

	
	
	public ModelAndView logdetails(HttpServletRequest req,
			HttpServletResponse res) {

		try {
			PrintWriter out = res.getWriter();
			StringBuilder data = new StringBuilder();
			map = new ModelMap();
			String policyID = req.getParameter("policy");
			data.append("<h4 style='color: black;'>Policy Approval Status</h4>");
			data.append("<table id='details' width='100%' border='1' style='color:black' cellspacing='1' cellpadding='1' class='table table-striped table-condensed table-hover'><thead><tr>");
			data.append("<th style='background-image:none!important;'><strong style='font-weight: bold !important;'>Employee Name</strong></th>");
			data.append("<th style='background-image:none!important;'><strong style='font-weight: bold !important;'>Created By</strong></th>");
			data.append("<th style='background-image:none!important;'><strong style='font-weight: bold !important;'>Created Date</strong></th>");
			data.append("<th style='background-image:none!important;'><strong style='font-weight: bold !important;'>Status</strong></th></tr></thead><tbody>");
			List<AuditPlanMiles> historyPlanSize = assessmentDao.logDetails(policyID);
			data.append("<tr style='display:none'><td> <input type='hidden' name='sizedata' id='sizedata' value='"+historyPlanSize.size()+"'/></td>");
			if(historyPlanSize.size()>0){
				for(int i=0;i<historyPlanSize.size();i++){
					Map m=(Map)historyPlanSize.get(i);
					data.append("<tr><td>"+m.get("employee").toString()+"</td>");
					data.append("<td>"+m.get("createBy").toString()+"</td>");
					data.append("<td>"+m.get("CreatedDate").toString()+"</td>");
					data.append("<td>"+m.get("status").toString()+"</td>");
				}
			}
			data.append("</tbody></table>");
			out.write(data.toString());

			
		}
		catch (Exception exception) {
			exception.printStackTrace();
		}
		return null;
		}
	
	
	public ModelAndView policyhistoryDetails(HttpServletRequest req,
			HttpServletResponse res) {

		try {
			PrintWriter out = res.getWriter();
			StringBuilder data = new StringBuilder();
			map = new ModelMap();
			String policyid = req.getParameter("policyid");
			map.addObject("policyid", policyid);
			data.append("<table id='history' width='100%' style='color:black' cellspacing='1' cellpadding='1' class='display'><thead><tr>");
			data.append("<th><strong>Title</strong></th>");
			data.append("<th><strong>Version</strong></th>");
			data.append("<th><strong>Created By</strong></th>");
			data.append("<th><strong>Created Date</strong></th>");
		
			data.append("</tr></thead><tbody>");
			List<AuditPlanMiles> historyPlanSize = assessmentDao.policyhistoryDetails(policyid);
			if(historyPlanSize.size()>0){
				for(int i=0;i<historyPlanSize.size();i++){
					Map m=(Map)historyPlanSize.get(i);
					data.append("<tr><td>"+m.get("title").toString()+"</td>");
					data.append("<td>"+m.get("version").toString()+"</td>");
					data.append("<td>"+m.get("createdBy").toString()+"</td>");
					data.append("<td>"+m.get("CreatedDate").toString()+"</td></tr>");
					
				}
			}
			data.append("</tbody></table>");
			out.write(data.toString());

			
		}
		catch (Exception exception) {
			exception.printStackTrace();
		}
		return null;
		}
	
	
	public ModelAndView showassignedpolicy(HttpServletRequest req,HttpServletResponse res){
		try {
		map = new ModelMap();
		String policyno = req.getParameter("policyno");
		map.addObject("policyno", policyno);
		
		List<PolicyBean> getPolicy=assessmentDao.getPolicyByID(policyno);
		if(getPolicy.size()>0){
			Map m=(Map)getPolicy.get(0);
			map.addObject("title", m.get("title").toString());
			String data=m.get("textdata").toString();
			
			
			data=data.replaceAll("XXsingleXX", "'");
			data = data.replaceAll("\\<.*?\\>", "");
			data = data.replaceAll("\\&#39;", "'");
			
			map.addObject("textdata", data);
			map.addObject("status", m.get("status").toString());
		}
		modelAndView = new ModelAndView("policy/policyAssignedTo",map);	
		}
		catch (Exception exception) {
			exception.printStackTrace();
		}
		return modelAndView;
	}
	
	public ModelAndView approvedPolicyAssigned(HttpServletRequest req,HttpServletResponse res)
	{
		try {
			String policyID = req.getParameter("policyID");
			String status= req.getParameter("status");
			System.out.println("status>>>"+status);
			assessmentDao.updatePolicyStatus(policyID,status);
		}
		catch (Exception exception) {
			exception.printStackTrace();
		}
		return modelAndView;
	}
	
		

}
