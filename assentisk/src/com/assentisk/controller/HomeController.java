
package com.assentisk.controller;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.ModelMap;
import org.springframework.validation.BindException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;

import com.assentisk.dao.HomeDao;
import com.assentisk.dao.OrganizationDao;
import com.assentisk.util.UrlUtill;
import com.assentisk.bean.*;


public class HomeController extends SimpleFormController {


	protected HomeDao homeDao;
	protected OrganizationDao organizationDao;
	UserRecordBean userbean;
	ModelAndView modelAndView;
	ModelMap map;
	
	
	public HomeDao getHomeDao() {
		return homeDao;
	}

	public void setHomeDao(HomeDao homeDao) {
		this.homeDao = homeDao;
	}

	
	public OrganizationDao getOrganizationDao() {
		return organizationDao;
	}

	public void setOrganizationDao(OrganizationDao organizationDao) {
		this.organizationDao = organizationDao;
	}

	protected ModelAndView showForm(HttpServletRequest req,
			HttpServletResponse res, BindException ex) throws Exception {

		String url = UrlUtill.UrlName(req.getRequestURI());

		if (url.equals("dashboard")) {
			return dashboard(req, res);
		}
		else if (url.equals("login")) {
			return login(req, res);
		}
		else if (url.equals("logout")) {			
			return logout(req,res);
		}
		else if(url.equals("setSess")){
			return setSessionValue(req, res);
		}
		else if(url.equals("setRisk")){
			return setRisk(req,res);
		}
		else if(url.equals("addcomment")){
			return addcomment(req,res);
		}
		else if(url.equals("getcommentValue")){
			return getcomment(req,res);
		}
		else if(url.equals("changeloginpage"))
		{
			return changeloginpage(req, res);
		}
		else if(url.equals("pendingStatus")){
			return pendingStatus(req,res);
		}
		else if(url.equals("policyapproval")){
			return policyapproval(req,res);
		}
		else if(url.equals("approvedPolicy")){
			return approvedPolicy(req,res);
		}
		return null;
	}

	protected ModelAndView onSubmit(HttpServletRequest req,
			HttpServletResponse res, Object cmd, BindException errors)
			throws Exception {

		String url = UrlUtill.UrlName(req.getRequestURI());

		if (url.equals("verify")) {
			return authenticate(req, res);
		}

		return null;
	}

	public ModelAndView authenticate(HttpServletRequest req,
			HttpServletResponse res) {

		try {
			userbean=new UserRecordBean() ;
			map = new ModelMap();
			PrintWriter out = res.getWriter();
			String uname = req.getParameter("uname");
			String pword = req.getParameter("pword");
			String language = req.getParameter("language");
						
			req.getSession().setAttribute("languageVal",language);
			
			
			Cookie cookie = new Cookie("language",language);
			
			res.addCookie(cookie);
			
			List getRiskLibrary = homeDao.getFileDetail();
			req.getSession().setAttribute("riskList",getRiskLibrary);
			
			List getUserInfo = homeDao.authenticate(uname, pword);
			System.out.println("getuserInfo--"+getUserInfo.size());
			if(getUserInfo.size() == 0)
			{	
				List list = homeDao.getLanguageList();
				map.addObject("languagelist", list);
				map.addObject("action", "error");
				modelAndView = new ModelAndView("login", map);
				
			}
			else if (getUserInfo.size() > 0) {
								
				Map m = (Map) getUserInfo.get(0);
				String group = m.get("groupID").toString();
				String status= m.get("expandBar").toString();
				req.getSession().setAttribute("UserRecordID",m.get("UserRecordID").toString());
				req.getSession().setAttribute("EmpUsername",m.get("EmpUsername").toString());
				req.getSession().setAttribute("EmpName12",m.get("EmpName").toString());
				req.getSession().setAttribute("riskID",m.get("riskID").toString());
				userbean.setUserRecordID(Integer.parseInt(m.get("UserRecordID").toString()));
				String getsevenAfterDate=homeDao.getsevenAfterDate();
				List pending=homeDao.getAMCdataList(m.get("UserRecordID").toString(),getsevenAfterDate);
				if(pending.size()>0){
					Map mp=(Map)pending.get(0);
					req.getSession().setAttribute("pendingTask", mp.get("size").toString());
				}
				piechart(req, res);
				 if(status.equals("1")){
				    	req.getSession().setAttribute("toggle", "1");
						req.getSession().setAttribute("bodyClass","nav-parent nav-active leftpanel-collapsed");
				    }
				    else
				    {
				    	req.getSession().setAttribute("toggle", "0");
						req.getSession().setAttribute("bodyClass","nav-parent nav-active");			   
				    }
				 
				 int count = 0;
					List getPermission = homeDao.getGroupPermission(group);
					if (getPermission.size() > 0) {
						for (int i = 0; i < getPermission.size(); i++) {
						
							
							Map gp = (Map) getPermission.get(i);
							int size=Integer.parseInt(gp.get("moduleId").toString());
							count = size;
							double view = Double.parseDouble(gp.get("view_mod").toString());
							if (view > 0) {
								req.getSession().setAttribute(
										"view_mod_" + count + "",
										1);
							} else {
								req.getSession().setAttribute(
										"view_mod_" + count + "", 0);

							}

							double add = Double.parseDouble(gp.get("add_mod").toString());
							if (add > 0) {
								req.getSession().setAttribute(
										"add_mod_" + count + "", 1);
							} else {
								req.getSession().setAttribute(
										"add_mod_" + count + "", 0);

							}

							double edit = Double.parseDouble(gp.get("edit_mod").toString());
							if (edit > 0) {
								req.getSession().setAttribute(
										"edit_mod_" + count + "",
										1);
							} else {
								req.getSession().setAttribute(
										"edit_mod_" + count + "", 0);

							}
							double delete = Double.parseDouble(gp.get("delete_mod").toString());
							if (delete > 0) {
								req.getSession().setAttribute(
										"delete_mod_" + count + "",
										1);
							} else {
								req.getSession().setAttribute(
										"delete_mod_" + count + "", 0);

							}

							double per = Double.parseDouble(gp.get("per_mod").toString());
							if (per > 0) {
								req.getSession().setAttribute(
										"per_mod_" + count + "", 1);
							} else {
								req.getSession().setAttribute(
										"per_mod_" + count + "", 0);

							}
							
							double sch = Double.parseDouble(gp.get("sch_mod").toString());
							if (sch > 0) {
								req.getSession().setAttribute(
										"sch_mod_" + count + "", 1);
							} else {
								req.getSession().setAttribute(
										"sch_mod_" + count + "", 0);

							}
							
							double copy = Double.parseDouble(gp.get("copy_mod").toString());
							if (copy > 0) {
								req.getSession().setAttribute(
										"copy_mod_" + count + "", 1);
							} else {
								req.getSession().setAttribute(
										"copy_mod_" + count + "", 0);

							}
						}
					}
				 
	

				req.getSession().setAttribute("password", "true");
								
				List getLanguageKey = organizationDao.getLaungageKey(language);
								
				if (getLanguageKey.size() > 0) {
					
					for (int i = 0; i < getLanguageKey.size(); i++) {

						Map mapVal = (Map) getLanguageKey.get(i);							
						req.getSession().setAttribute(mapVal.get("CFG_KEY").toString(), mapVal.get("CFG_VALUE").toString());
					}

				}
				
				out.write("success");
				modelAndView = new ModelAndView("redirect:/dashboard.htm", map);
			} else {
				out.write("failed");

			}

		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return modelAndView;
	}
	
	public ModelAndView logout(HttpServletRequest req,
			HttpServletResponse res) {
		
		try
		{
			res.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
		    res.setHeader("Pragma", "no-cache");
		    res.setDateHeader("Expiresponse", 0);
			req.getSession().invalidate();
		}
		catch(Exception exception)
		{
			exception.printStackTrace();
		}
		return new ModelAndView("redirect:/login.htm");
	}
	
	public ModelAndView setSessionValue(HttpServletRequest req,
			HttpServletResponse res) {

			try {
				String userId= userbean.getUserRecordID().toString();
			
			    String status=req.getParameter("status");
			  //  System.out.println("status---"+status);
			    if(status.equals("1")){
			    	req.getSession().setAttribute("toggle", "1");
					req.getSession().setAttribute("bodyClass","nav-parent nav-active leftpanel-collapsed");
					homeDao.updateExpandValue(status,userId);
			    }
			    else
			    {
			    	req.getSession().setAttribute("toggle", "0");
					req.getSession().setAttribute("bodyClass","nav-parent nav-active");
					homeDao.updateExpandValue(status,userId);
			   
			    }
			}
		 catch (Exception exception) {
				exception.printStackTrace();
			}
			return null;
		}
	
	
	
	public ModelAndView setRisk(HttpServletRequest req,
			HttpServletResponse res) {

			try {
				String userId= userbean.getUserRecordID().toString();
			    String riskID=req.getParameter("riskID");
			    req.getSession().setAttribute("riskID",riskID);
			  
			    
				homeDao.updateRiskValue(riskID,userId);
					
			}
		 catch (Exception exception) {
				exception.printStackTrace();
			}
			return null;
		}
	
	
	public ModelAndView dashboard(HttpServletRequest req,
			HttpServletResponse res) {
		
		
		try
		{
			String userId = (String) req.getSession().getAttribute("UserRecordID");
			map = new ModelMap();
			List getTaskList = homeDao.getTaskByEmployeeID(Integer.parseInt(userId));
			if(getTaskList.size()>0)
			{
				map.addObject("taskList", getTaskList);
			}
		}
		catch(Exception exception)
		{
			exception.printStackTrace();
		}
		return new ModelAndView("dashboard", map);
	}
	
	public ModelAndView login(HttpServletRequest req,
			HttpServletResponse res) {
		
		try
		{		
			
			String language = "";
			map = new ModelMap();
			List list = homeDao.getLanguageList();
			map.addObject("languagelist", list);
			Cookie[] cookies = req.getCookies();
			
			if(cookies!=null)
			{
			  for(Cookie cookie : cookies){
				  
				  if("language".equals(cookie.getName())){				        				        
						 language = cookie.getValue();
				    }	 
				 
			  }
			}
			else
			{				
				language = "English";
			}
			
			List getLanguageKey = organizationDao.getLaungageKey(language);
			Cookie cookie = new Cookie("language","English");			
			res.addCookie(cookie);
			if (getLanguageKey.size() > 0) {
				
				for (int i = 0; i < getLanguageKey.size(); i++) {

					Map mapVal = (Map) getLanguageKey.get(i);							
					req.getSession().setAttribute(mapVal.get("CFG_KEY").toString(), mapVal.get("CFG_VALUE").toString());
				}

			}
		}
		catch(Exception exception)
		{
			exception.printStackTrace();
		}
		return new ModelAndView("login", map);
	}
	
	public ModelAndView addcomment(HttpServletRequest req,
			HttpServletResponse res) {
		
		try
		{
	     String id=req.getParameter("id");
	     String status=req.getParameter("status");
	     String comment=req.getParameter("comment");
	     if(status.equals("3")){
	    	 status="Cancelled";
	     }
	      else  if(status.equals("2")){
	    	 status="Completed";
	     }
	     else if(status.equals("1")){
	    	 status="Approved";
	     }
	     
	     else
	     {
	    	 status=""; 
	     }
	    
	     homeDao.savecomment(id, status,comment);
		}
		catch(Exception exception)
		{
			exception.printStackTrace();
		}
		return null;
	}
	
	public ModelAndView getcomment(HttpServletRequest req,
			HttpServletResponse res) {
		
		try
		{
	     String amcid=req.getParameter("id");
	     String type=req.getParameter("type");
	     String userId = (String) req.getSession().getAttribute("UserRecordID");    
	    List getcomment= homeDao.getcomment(amcid);
	    map.addObject("type", type);
	    if(getcomment.size()>0){
	    	Map m=(Map)getcomment.get(0);
	    	map.addObject("status", m.get("status").toString());
	    	map.addObject("comment", m.get("comment").toString());
	    	map.addObject("amcname", m.get("amcname").toString());
	    	map.addObject("empname", m.get("empname").toString());
	    	map.addObject("dateSchedule", m.get("dateSchedule").toString());
	    	map.addObject("startTime", m.get("startTime").toString());
	    	map.addObject("endTime", m.get("endTime").toString());
	    	map.addObject("assignedBy", m.get("assignedBy").toString());
	    	map.addObject("assignedTo", m.get("assignedTo").toString());
	    	map.addObject("userId", userId);
	    
	    }
	    modelAndView = new ModelAndView("ajaxresponse/comment", map);			
		}
		catch(Exception exception)
		{
			exception.printStackTrace();
		}
		return modelAndView;
	}
	
	public ModelAndView changeloginpage(HttpServletRequest req,
			HttpServletResponse res) {
		
		try
		{
			String language = req.getParameter("language");									
			Cookie cookie = new Cookie("language", language);
			res.addCookie(cookie);
		}
		catch(Exception exception)
		{
			exception.printStackTrace();
		}
		return new ModelAndView("redirect:/login.htm");
	}
	
	public ModelAndView pendingStatus(HttpServletRequest req,
			HttpServletResponse res) {
		try
		{
			String userId = (String) req.getSession().getAttribute("UserRecordID");
			
			String getsevenAfterDate=homeDao.getsevenAfterDate();
			List pending=homeDao.getAMCdataList(userId,getsevenAfterDate);
			if(pending.size()>0){
				Map mp=(Map)pending.get(0);
				req.getSession().setAttribute("pendingTask", mp.get("size").toString());
			}
			piechart(req, res);
		}
		catch(Exception exception)
		{
			exception.printStackTrace();
		}
		return null;
	}
	
	public ModelAndView piechart(HttpServletRequest req,
			HttpServletResponse res) {

			try {
				String userId= userbean.getUserRecordID().toString();
			
			    String status=req.getParameter("status");
			    String getsevenAfterDate=homeDao.getsevenAfterDate();
				List getPiechartValue=homeDao.piechartValue(userId,getsevenAfterDate);
				if(getPiechartValue.size()>0){
					Map m=(Map)getPiechartValue.get(0);
					req.getSession().setAttribute("systemPending", m.get("sysPending").toString());
					req.getSession().setAttribute("systemComplete", m.get("sysComplete").toString());
					req.getSession().setAttribute("systemCreated", m.get("sysCreated").toString());
					req.getSession().setAttribute("manualPending", m.get("manPending").toString());
					req.getSession().setAttribute("manualComplete", m.get("manComplete").toString());
					req.getSession().setAttribute("manualCreated", m.get("manCreated").toString());
					req.getSession().setAttribute("supportPending", m.get("supPending").toString());
					req.getSession().setAttribute("supportComplete", m.get("supComplete").toString());
					req.getSession().setAttribute("supportCreated", m.get("supCreated").toString());
					
				}
			   
			}
		 catch (Exception exception) {
				exception.printStackTrace();
			}
			return null;
		}
	
	public ModelAndView policyapproval(HttpServletRequest req,
			HttpServletResponse res) {

			try {
				System.out.println("policy approval-----");
				String userId=  (String) req.getSession().getAttribute("UserRecordID");
			    String policy=req.getParameter("ID");
			    String str[]=policy.split("_");
			    String policyID=str[0];
			    String empID=str[1];
			    map.addObject("policy", policy);
			    List policyList = homeDao.getPolicy(policyID);
			   if(policyList.size()>0){
				   Map m=(Map)policyList.get(0);
				   map.addObject("title", m.get("title").toString());
				 //  System.out.println("title----"+m.get("title").toString());
				   
					String data=m.get("textdata").toString();
					data=data.replaceAll("XXsingleXX", "'");
					data = data.replaceAll("\\<.*?\\>", "");
					data = data.replaceAll("\\&#39;", "'");

				   map.addObject("textdata",data);
				 //  System.out.println("textdata----"+m.get("textdata").toString());
			   }
			   
			   List getStatus=homeDao.getPolicyStatus(policyID,empID);
			   if(getStatus.size()>0){
				   Map mp=(Map)getStatus.get(0);
				   map.addObject("status", mp.get("status").toString());
			   }
			   modelAndView = new ModelAndView("policy/approval", map);			
			}
		 catch (Exception exception) {
				exception.printStackTrace();
			}
			return modelAndView;
		}
	

	public ModelAndView approvedPolicy(HttpServletRequest req,
			HttpServletResponse res){
		try{
			map = new ModelMap();
			String policyID=req.getParameter("policyID");
			String empID=req.getParameter("empID");
			String data=req.getParameter("data");
			homeDao.updatePolicyApproverStatus(policyID,empID,data);
					
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return null;
	}
}
