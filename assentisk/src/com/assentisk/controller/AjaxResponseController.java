package com.assentisk.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.ModelMap;
import org.springframework.validation.BindException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;

import com.assentisk.bean.CityBean;
import com.assentisk.bean.CompanyBean;
import com.assentisk.bean.EmployeeBean;
import com.assentisk.bean.StateBean;
import com.assentisk.dao.AjaxDao;
import com.assentisk.util.UrlUtill;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public class AjaxResponseController extends SimpleFormController {

	PrintWriter out;
	ModelMap map;

	protected AjaxDao ajaxDao;

	public AjaxDao getAjaxDao() {
		return ajaxDao;
	}

	public void setAjaxDao(AjaxDao ajaxDao) {
		this.ajaxDao = ajaxDao;
	}

	protected ModelAndView showForm(HttpServletRequest req,
			HttpServletResponse res, BindException ex) throws Exception {

		String url = UrlUtill.UrlName(req.getRequestURI());
		System.out.println(url);
		if (url.equals("statelist")) {
			return stateList(req, res);
		} else if (url.equals("cityList")) {
			return cityList(req, res);
		} else if (url.equals("employeeList")) {
			return employeeList(req, res);
		}
		else if (url.equals("employeeBracketList")) {
			return employeeBracketList(req, res);
		}
		else if (url.equals("employeeselfnotBracketList")) {
			return employeeselfnotBracketList(req, res);
		}
		else if (url.equals("locationList")) {
			return locationList(req, res);
		}
		else if (url.equals("divisionList")) {			
			return divisionList(req, res);
		}
		else if(url.equals("vendorList")){
			return vendorList(req, res);
		}
		else if(url.equals("groupList")){
			return groupList(req, res);
		}
		else if(url.equals("departmentList")){
			return departmentList(req, res);
		}
		else if(url.equals("businessProcessList")){
			return businessProcessList(req, res);
		}
		else if(url.equals("businessProcessListdata")){
			return businessProcessListdata(req,res);
		}
		else if(url.equals("controlCatList")){
			return controlCatList(req,res);
		}
		else if (url.equals("employeeBracketListunique")) {
			return employeeBracketListunique(req, res);
		}
		return null;
	}

	public ModelAndView stateList(HttpServletRequest req,
			HttpServletResponse res) {

		try {
			String countryId = req.getParameter("countryid");
			map = new ModelMap();
			boolean flag = false;

			List<StateBean> stateList = ajaxDao.getStateByCountryID(Integer
					.parseInt(countryId));
			if (stateList.size() > 0) {
				flag = true;
				map.addObject("stateList", stateList);
			} else {
				flag = false;
			}
			map.addObject("flag", flag);

		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return new ModelAndView("ajaxresponse/stateList", map);
	}

	public ModelAndView cityList(HttpServletRequest req, HttpServletResponse res) {

		try {
			String stateid = req.getParameter("stateid");
			String countryid = req.getParameter("countryid");

			map = new ModelMap();
			boolean flag = false;

			List<CityBean> cityList = ajaxDao.getCityByStateCountryID(Integer
					.parseInt(stateid), Integer.parseInt(countryid));
			if (cityList.size() > 0) {
				flag = true;
				map.addObject("cityList", cityList);
			} else {
				flag = false;
			}
			map.addObject("flag", flag);

		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return new ModelAndView("ajaxresponse/cityList", map);
	}

	public ModelAndView employeeList(HttpServletRequest req,
			HttpServletResponse res) {

		try {
			
			String term = req.getParameter("term");
			out = res.getWriter();
			String userId = (String) req.getSession().getAttribute("UserRecordID");
			List<String> getEmployeeList = ajaxDao.getEmployeeNamesListByName(term,userId);
			PersonJsonObject personJsonObject = new PersonJsonObject();
			personJsonObject.setEmployeeBeans(getEmployeeList);

			Gson gson = new GsonBuilder().setPrettyPrinting().create();
			String json2 = gson.toJson(getEmployeeList);			
			out.print(json2);
			
		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return null;
	}

	
	public ModelAndView locationList(HttpServletRequest req,
			HttpServletResponse res) {

		try {

			String term = req.getParameter("term");
			out = res.getWriter();

			List<String> getLocationList = ajaxDao.getLocationsByName(term);
			Gson gson = new GsonBuilder().setPrettyPrinting().create();
			String json2 = gson.toJson(getLocationList);			
			out.print(json2);
			
		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return null;
	}

	
	public ModelAndView divisionList(HttpServletRequest req,
			HttpServletResponse res) {

		try {	
			System.out.println("inside division ;list");
			String term = req.getParameter("term");
			out = res.getWriter();

			List<String> getdivisionList = ajaxDao.getdivisionsByName(term);
			Gson gson = new GsonBuilder().setPrettyPrinting().create();
			String json2 = gson.toJson(getdivisionList);			
			out.print(json2);
			
		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return null;
	}
	
	
	public ModelAndView vendorList(HttpServletRequest req,
			HttpServletResponse res) {

		try {

			String term = req.getParameter("term");
			out = res.getWriter();

			List<String> getVendorList = ajaxDao.getVendorByName(term);
			Gson gson = new GsonBuilder().setPrettyPrinting().create();
			String json2 = gson.toJson(getVendorList);			
			out.print(json2);
			
		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return null;
	}

	public ModelAndView groupList(HttpServletRequest req,
			HttpServletResponse res) {

		try {

			String term = req.getParameter("term");
			out = res.getWriter();

			List<String> getGroupList = ajaxDao.getGroupByName(term);
			Gson gson = new GsonBuilder().setPrettyPrinting().create();
			String json2 = gson.toJson(getGroupList);			
			out.print(json2);
			
		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return null;
	}
	public ModelAndView departmentList(HttpServletRequest req,
			HttpServletResponse res) {

		try {

			String term = req.getParameter("term");
			out = res.getWriter();

			List<String> getDepartmentList = ajaxDao.getDepartmentByName(term);
			Gson gson = new GsonBuilder().setPrettyPrinting().create();
			String json2 = gson.toJson(getDepartmentList);			
			out.print(json2);
			
		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return null;
	}
	
	public ModelAndView employeeBracketList(HttpServletRequest req,
			HttpServletResponse res) {

		try {
			
			String term = req.getParameter("term");
			String userId = (String) req.getSession().getAttribute("UserRecordID");
			
			out = res.getWriter();

			List<String> getEmployeeList = ajaxDao.getEmployeeNamesBracketListByName(term,userId);
			PersonJsonObject personJsonObject = new PersonJsonObject();
			personJsonObject.setEmployeeBeans(getEmployeeList);

			Gson gson = new GsonBuilder().setPrettyPrinting().create();
			String json2 = gson.toJson(getEmployeeList);			
			out.print(json2);
			
		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return null;
	}

	public ModelAndView employeeselfnotBracketList(HttpServletRequest req,
			HttpServletResponse res) {

		try {
			
			String term = req.getParameter("term");
			String userId = (String) req.getSession().getAttribute("UserRecordID");
			String empID = req.getParameter("empID");
			
			out = res.getWriter();
            System.out.println("empID"+empID);
			List<String> getEmployeeList = ajaxDao.getEmployeeNamesselfnotBracketListByName(term, userId);
			PersonJsonObject personJsonObject = new PersonJsonObject();
			personJsonObject.setEmployeeBeans(getEmployeeList);

			Gson gson = new GsonBuilder().setPrettyPrinting().create();
			String json2 = gson.toJson(getEmployeeList);			
			out.print(json2);
			
		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return null;
	}
	
	public ModelAndView businessProcessList(HttpServletRequest req,
			HttpServletResponse res) {

		try {

			String term = req.getParameter("term");
			out = res.getWriter();

			List<String> getBusinessList = ajaxDao.getBusinessByName(term);
			Gson gson = new GsonBuilder().setPrettyPrinting().create();
			String json2 = gson.toJson(getBusinessList);			
			out.print(json2);
			
		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return null;
	}
	
	public ModelAndView businessProcessListdata(HttpServletRequest req,
			HttpServletResponse res) {

		try {

			String term = req.getParameter("term");
			String auditid=req.getParameter("auditid");
			System.out.println("auditid----"+auditid);
			out = res.getWriter();

			List<String> getBusinessList = ajaxDao.getBusinessByNameAudit(term,auditid);
			Gson gson = new GsonBuilder().setPrettyPrinting().create();
			String json2 = gson.toJson(getBusinessList);			
			out.print(json2);
			
		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return null;
	}
	

	public ModelAndView controlCatList(HttpServletRequest req,
			HttpServletResponse res) {

		try {

			String term = req.getParameter("term");
			
			out = res.getWriter();

			List<String> getcontrolCatList = ajaxDao.controlCatList(term);
			Gson gson = new GsonBuilder().setPrettyPrinting().create();
			String json2 = gson.toJson(getcontrolCatList);			
			out.print(json2);
			
		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return null;
	}
	

	public ModelAndView employeeBracketListunique(HttpServletRequest req,
			HttpServletResponse res) {

		try {
			
			String term = req.getParameter("term");
			String userId = (String) req.getSession().getAttribute("UserRecordID");
			
			out = res.getWriter();

			List<String> getEmployeeList = ajaxDao.getEmployeeNamesBracketListByNameunique(term,userId);
			PersonJsonObject personJsonObject = new PersonJsonObject();
			personJsonObject.setEmployeeBeans(getEmployeeList);

			Gson gson = new GsonBuilder().setPrettyPrinting().create();
			String json2 = gson.toJson(getEmployeeList);			
			out.print(json2);
			
		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return null;
	}
	
}
