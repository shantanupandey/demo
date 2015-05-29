package com.assentisk.controller;

import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.ModelMap;
import org.springframework.validation.BindException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;

import com.assentisk.bean.CityBean;
import com.assentisk.bean.CountryBean;
import com.assentisk.bean.MasterBean;
import com.assentisk.bean.StateBean;
import com.assentisk.bean.VendorCategoryBean;
import com.assentisk.dao.MasterDao;
import com.assentisk.util.UrlUtill;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import java.net.InetAddress;


public class MasterController extends SimpleFormController {

	protected MasterDao masterDao;
	ModelAndView modelAndView;
	PrintWriter out;
	ModelMap map;
	
	public MasterDao getMasterDao() {
		return masterDao;
	}

	public void setMasterDao(MasterDao masterDao) {
		this.masterDao = masterDao;
	}

	protected ModelAndView showForm(HttpServletRequest req,
			HttpServletResponse res, BindException ex) throws Exception {

		String url = UrlUtill.UrlName(req.getRequestURI());	
		
		if (url.equals("country")) {
			modelAndView = new ModelAndView("country");
		} else if (url.equals("addcountry")) {
			modelAndView = new ModelAndView("addcountry");
		}
		else if (url.equals("state")) {
			modelAndView = new ModelAndView("state");
		}
		else if (url.equals("city")) {
			modelAndView = new ModelAndView("city");
		}
		else if (url.equals("addstate")) {
			return addState(req,res);
		} else if (url.equals("countryList")) {			
			return countryList(req, res);
		}
		else if(url.equals("stateList"))
		{			
			return stateList(req, res);
		}
		else if(url.equals("cityList"))
		{			
			return cityList(req, res);
		}
		else if(url.equals("editstate"))
		{			
			return editState(req,res);
		}
		else if(url.equals("editcountry"))
		{			
			return editCountry(req,res);
		}
		else if(url.equals("editcity"))
		{						
			return editCity(req,res);
		}
		
		else if (url.equals("addcity")) {
			return addCity(req,res);
		}
		else if (url.equals("deleteCountry")) {	
			return deleteCountry(req,res);
		}
		else if (url.equals("deleteCity")) {			
			return deleteCity(req,res);
		}
		else if (url.equals("deleteState")) {			
			return deleteState(req,res);
		}
		else if (url.equals("vendorcategory")) {
			modelAndView = new ModelAndView("masters/vendorcategory");
		}
		else if(url.equals("vendorcategorylist"))
		{
			return vendorCatList(req,res);
		}
		else if(url.equals("addvendorcat")){
			modelAndView = new ModelAndView("masters/addvendorcategory");
		}
		else if(url.equals("editvendorcat")){
			return editVendorCat(req,res);
		}
		else if(url.equals("deletevendorcat")){
			return deleteVendorCategory(req,res);
		}
		else if(url.equals("checkcountry")){
			return checkcountry(req,res);
		}
		else if(url.equals("checkstate")){
			return checkstate(req,res);
		}
		else if(url.equals("checkvendorcategoryname")){
			return checkVendorCategoryName(req,res);
		}
		
		return modelAndView;
	}

	protected ModelAndView onSubmit(HttpServletRequest req,
			HttpServletResponse res, Object cmd, BindException errors)
			throws Exception {

		String url = UrlUtill.UrlName(req.getRequestURI());
		if (url.equals("savestate")) {			
			return savestate(req, res);
		} 
		else if (url.equals("updatestate")) {
			return updateState(req, res);
		}
		else if (url.equals("savecountry")) {			
			return saveCountry(req, res);
		}
		else if (url.equals("updatecountry")) {			
			return updateCountry(req, res);
		}
		
		else if (url.equals("updatecity")) {			
			return updateCity(req, res);
		}
		else if (url.equals("savecity")) {			
			return saveCity(req, res);
		}
		else if(url.equals("savevendorcat")){
			return saveVendorCategory(req,res);
		}
		else if(url.equals("updatevendorcat")){
			return updateVendorCatogory(req,res);
		}
		return null;
	}

	public ModelAndView countryList(HttpServletRequest req,
			HttpServletResponse res) {

		try {
			out = res.getWriter();
			List<MasterBean> getCountryList = masterDao.getList();
			PersonJsonObject personJsonObject = new PersonJsonObject();
			personJsonObject.setMasterBean(getCountryList);

			Gson gson = new GsonBuilder().setPrettyPrinting().create();
			String json2 = gson.toJson(personJsonObject);			
			out.print(json2);

		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return null;
	}
	

	public ModelAndView stateList(HttpServletRequest req,
			HttpServletResponse res) {

		try {
			out = res.getWriter();
			List<StateBean> getStateList = masterDao.getStateList();
			PersonJsonObject personJsonObject = new PersonJsonObject();
			personJsonObject.setStateBean(getStateList);

			Gson gson = new GsonBuilder().setPrettyPrinting().create();
			String json2 = gson.toJson(personJsonObject);			
			out.print(json2);

		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return null;
	}

	public ModelAndView cityList(HttpServletRequest req,
			HttpServletResponse res) {

		try {
			out = res.getWriter();
			List<CityBean> getCityList = masterDao.getCityList();
			PersonJsonObject personJsonObject = new PersonJsonObject();
			personJsonObject.setCityBean(getCityList);

			Gson gson = new GsonBuilder().setPrettyPrinting().create();
			String json2 = gson.toJson(personJsonObject);			
			out.print(json2);

		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return null;
	}
	
	public ModelAndView addState(HttpServletRequest req,
			HttpServletResponse res) {		
		try
		{	
			map = new ModelMap();			
			List getCountryList = masterDao.getCountryList();
			map.addObject("countryList",getCountryList);
			modelAndView = new ModelAndView("addstate", map);			
			
		}
		catch(Exception exception)
		{
			exception.printStackTrace();
		}
		return modelAndView;
	}
	public ModelAndView editState(HttpServletRequest req,
			HttpServletResponse res) {		
		try
		{	
			String stateid = req.getParameter("stateid");
			map = new ModelMap();			
			List getCountryList = masterDao.getCountryList();							
			List<StateBean> getRow = masterDao.getStateById(Integer.parseInt(stateid));
			if (getRow.size()>0) {
				
				Map m = (Map)getRow.get(0);
				map.addObject("StateID", m.get("StateID"));
				map.addObject("StateName", m.get("StateName"));
				map.addObject("CountryID", m.get("CountryID"));
				map.addObject("IsActive", m.get("IsActive"));
			}
			map.addObject("countryList",getCountryList);						
			modelAndView = new ModelAndView("editstate", map);			
			
		}
		catch(Exception exception)
		{
			exception.printStackTrace();
		}
		return modelAndView;
	}
	
	public ModelAndView editCountry(HttpServletRequest req,
			HttpServletResponse res) {		
		try
		{	
			map = new ModelMap();
			String countryid = req.getParameter("countryid");
			List<CountryBean> getRow = masterDao.getCountryById(Integer.parseInt(countryid));
			if(getRow.size()>0)
			{
				Map m = (Map)getRow.get(0);
				map.addObject("CountryID", m.get("CountryID"));
				map.addObject("CountryName", m.get("CountryName"));
				map.addObject("IsActive", m.get("IsActive"));
				
			}
			modelAndView = new ModelAndView("editcountry", map);			
			
		}
		catch(Exception exception)
		{
			exception.printStackTrace();
		}
		return modelAndView;
	}
	
	
	public ModelAndView savestate(HttpServletRequest req,
			HttpServletResponse res) {
		
		try
		{

			java.util.Date dt = new java.util.Date();
			java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String currentTime = sdf.format(dt);
						
			String statename = req.getParameter("statename");
			String countryid = req.getParameter("countryid");
			String isactive = req.getParameter("isactive");
			int status=0;
			if(isactive.equals("true")){
				status=1;
			}	
			InetAddress ip = InetAddress.getLocalHost();
			String userId = (String) req.getSession().getAttribute("UserRecordID");
			
			masterDao.savestate(statename, Integer.parseInt(countryid), status);
			masterDao.userAuditTrail("assentisk_state", "1", "add", currentTime, Integer.parseInt(userId), ip.getHostAddress());
			
		}
		catch(Exception exception)
		{
			exception.printStackTrace();
		}
		return null;
	}

	public ModelAndView updateState(HttpServletRequest req,
			HttpServletResponse res) {		
		try
		{	

			java.util.Date dt = new java.util.Date();
			java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String currentTime = sdf.format(dt);
			
			int status = 0;
			String stateid = req.getParameter("stateid");
			String statename = req.getParameter("statename");
			String countryid = req.getParameter("countryid");
			String isactive = req.getParameter("isactive");	
			
			InetAddress ip = InetAddress.getLocalHost();
			String userId = (String) req.getSession().getAttribute("UserRecordID");
			
			if(isactive.equals("true"))
			{
				status = 1;
			}
			
			masterDao.updatestate(Integer.parseInt(stateid), statename, Integer.parseInt(countryid), status);
			masterDao.userAuditTrail("assentisk_state", "1", "update", currentTime, Integer.parseInt(userId), ip.getHostAddress());
		}
		catch(Exception exception)
		{
			exception.printStackTrace();
		}
		return modelAndView;
	}
	
	public ModelAndView saveCountry(HttpServletRequest req,
			HttpServletResponse res) {
		
		try
		{
			int status = 0;
			java.util.Date dt = new java.util.Date();
			java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String currentTime = sdf.format(dt);
			
			String countryname = req.getParameter("countryname");
			String isactive = req.getParameter("isactive");			
			InetAddress ip = InetAddress.getLocalHost();
			String userId = (String) req.getSession().getAttribute("UserRecordID");
			
			if(isactive.equals("true"))
			{
				status = 1;
			}
			
				
			masterDao.saveCountry(countryname, status);
			masterDao.userAuditTrail("assentisk_country", "1", "add", currentTime, Integer.parseInt(userId), ip.getHostAddress());

		}
		catch(Exception exception)
		{
			exception.printStackTrace();
		}
		return null;
	}
	
	public ModelAndView updateCountry(HttpServletRequest req,
			HttpServletResponse res) {
		
		try
		{
			int status = 0;
			String countryid = req.getParameter("countryid");
			String countryname = req.getParameter("countryname");
			String isactive = req.getParameter("isactive");
			InetAddress ip = InetAddress.getLocalHost();
			String userId = (String) req.getSession().getAttribute("UserRecordID");
			
			java.util.Date dt = new java.util.Date();
			java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String currentTime = sdf.format(dt);
			
			if(isactive.equals("true"))
			{
				status = 1;
			}
			
			masterDao.updateCountry(Integer.parseInt(countryid),countryname, status);
			masterDao.userAuditTrail("assentisk_country", "1", "update", currentTime, Integer.parseInt(userId), ip.getHostAddress());

		}
		catch(Exception exception)
		{
			exception.printStackTrace();
		}
		return null;
	}
	
	@SuppressWarnings("unchecked")
	public ModelAndView addCity(HttpServletRequest req,
			HttpServletResponse res) {		
		try
		{	
			map = new ModelMap();	
			List getRow = masterDao.getCountryList();
			List<StateBean> getStateList = masterDao.getStateList();
			
			map.addObject("countryList", getRow);
			map.addObject("stateList", getStateList);
			modelAndView = new ModelAndView("addcity", map);			
			
		}
		catch(Exception exception)
		{
			exception.printStackTrace();
		}
		return modelAndView;
	}

	
	public ModelAndView saveCity(HttpServletRequest req,
			HttpServletResponse res) {
		
		try
		{
			java.util.Date dt = new java.util.Date();
			java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String currentTime = sdf.format(dt);
			
			InetAddress ip = InetAddress.getLocalHost();
			String userId = (String) req.getSession().getAttribute("UserRecordID");
			
			int status = 0;
			String cityname = req.getParameter("cityname");
			String stateid = req.getParameter("stateid");
			String countryid = req.getParameter("countryid");
			String isactive = req.getParameter("isactive");
			
			if(isactive.equals("true"))
			{
				status = 1;
			}
			
			masterDao.saveCity(cityname, Integer.parseInt(stateid), Integer.parseInt(countryid), status);
			masterDao.userAuditTrail("assentisk_city", "1", "add", currentTime, Integer.parseInt(userId), ip.getHostAddress());
		}
		catch(Exception exception)
		{
			exception.printStackTrace();
		}
		return null;
	}
	
	public ModelAndView editCity(HttpServletRequest req,
			HttpServletResponse res) {		
		try
		{	
			
			map = new ModelMap();
			String cityid = req.getParameter("cityid");
			List countryList = masterDao.getCountryList();
			List<StateBean> getStateList = masterDao.getStateList();
			List<CityBean> getRow = masterDao.getCityById(Integer.parseInt(cityid));
			if(getRow.size()>0)
			{
				Map m = (Map)getRow.get(0);
				map.addObject("CityID", m.get("CityID"));
				map.addObject("CityName", m.get("CityName"));
				map.addObject("StateID", m.get("StateID"));
				map.addObject("CountryID", m.get("CountryID"));
				map.addObject("IsActive", m.get("IsActive"));
				
			}
			map.addObject("countryList", countryList);
			map.addObject("stateList", getStateList);
			modelAndView = new ModelAndView("editcity", map);			
			
		}
		catch(Exception exception)
		{
			exception.printStackTrace();
		}
		return modelAndView;
	}
	
	public ModelAndView updateCity(HttpServletRequest req,
			HttpServletResponse res) {		
		try
		{	
			int status = 0;
			String cityid = req.getParameter("cityid");
			String cityname = req.getParameter("cityname");
			String countryid = req.getParameter("countryid");
			String stateid = req.getParameter("stateid");
			String isactive = req.getParameter("isactive");	
			
			InetAddress ip = InetAddress.getLocalHost();
			String userId = (String) req.getSession().getAttribute("UserRecordID");
			
			java.util.Date dt = new java.util.Date();
			java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String currentTime = sdf.format(dt);
			
			if(isactive.equals("true"))
			{
				status = 1;
			}
			
			masterDao.updateCity(Integer.parseInt(cityid), cityname, Integer.parseInt(stateid), Integer.parseInt(countryid), status);
			masterDao.userAuditTrail("assentisk_city", "1", "update", currentTime, Integer.parseInt(userId), ip.getHostAddress());
		}
		catch(Exception exception)
		{
			exception.printStackTrace();
		}
		return modelAndView;
	}
	public ModelAndView deleteCountry(HttpServletRequest req,HttpServletResponse res)
	{		
		try
		{		
			java.util.Date dt = new java.util.Date();
			java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String currentTime = sdf.format(dt);
			
			InetAddress ip = InetAddress.getLocalHost();
			String userId = (String) req.getSession().getAttribute("UserRecordID");
			
			String id = req.getParameter("id");
			masterDao.deleteCountry((Integer.parseInt(id)));

			masterDao.userAuditTrail("assentisk_country", "1", "delete", currentTime, Integer.parseInt(userId), ip.getHostAddress());
			
		}
		catch(Exception exception)
		{
			exception.printStackTrace();
		}
		return null;
	}
	
	public ModelAndView deleteCity(HttpServletRequest req,HttpServletResponse res)
	{		
		try
		{
			java.util.Date dt = new java.util.Date();
			java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String currentTime = sdf.format(dt);
			
			InetAddress ip = InetAddress.getLocalHost();
			String userId = (String) req.getSession().getAttribute("UserRecordID");
			
			String id = req.getParameter("id");
			masterDao.deleteCity((Integer.parseInt(id)));
			masterDao.userAuditTrail("assentisk_city", "1", "delete", currentTime, Integer.parseInt(userId), ip.getHostAddress());
			
		}
		catch(Exception exception)
		{
			exception.printStackTrace();
		}
		return null;
	}

	public ModelAndView deleteState(HttpServletRequest req,HttpServletResponse res)
	{		
		try
		{

			java.util.Date dt = new java.util.Date();
			java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String currentTime = sdf.format(dt);
			
			InetAddress ip = InetAddress.getLocalHost();
			String userId = (String) req.getSession().getAttribute("UserRecordID");
			
			String id = req.getParameter("id");
			masterDao.deleteState((Integer.parseInt(id)));
			masterDao.userAuditTrail("assentisk_state", "1", "delete", currentTime, Integer.parseInt(userId), ip.getHostAddress());
			
		}
		catch(Exception exception)
		{
			exception.printStackTrace();
		}
		return null;
	}
	public ModelAndView vendorCatList(HttpServletRequest req,
			HttpServletResponse res) {

		try {
			out = res.getWriter();
			List<VendorCategoryBean> getVandorCatList = masterDao.getVendorCatList();
			PersonJsonObject personJsonObject = new PersonJsonObject();
			personJsonObject.setVendorCategoryBeans(getVandorCatList);

			Gson gson = new GsonBuilder().setPrettyPrinting().create();
			String json2 = gson.toJson(personJsonObject);	
			out.print(json2);

		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return null;
	}
	
	public ModelAndView saveVendorCategory(HttpServletRequest req,
			HttpServletResponse res) {
		
		try
		{
			int status = 0;
			java.util.Date dt = new java.util.Date();
			java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String currentTime = sdf.format(dt);
			
			String vendorCatname = req.getParameter("catname");
			String isactive = req.getParameter("isactive");			
			InetAddress ip = InetAddress.getLocalHost();
			String userId = (String) req.getSession().getAttribute("UserRecordID");
			
			if(isactive.equals("true"))
			{
				status = 1;
			}
			
				
			masterDao.saveVendorCat(vendorCatname, status);
			masterDao.userAuditTrail("assentisk_vendorcat", "1", "add", currentTime, Integer.parseInt(userId), ip.getHostAddress());

		}
		catch(Exception exception)
		{
			exception.printStackTrace();
		}
		return null;
	}
	
	public ModelAndView editVendorCat(HttpServletRequest req,
			HttpServletResponse res) {		
		try
		{	
			map = new ModelMap();
			String vendorid = req.getParameter("vendorid");
			List<VendorCategoryBean> getRow = masterDao.getVendorCatById(vendorid);
			if(getRow.size()>0)
			{
				Map m = (Map)getRow.get(0);
				map.addObject("VendorCatID", m.get("id"));
				map.addObject("VendorCatName", m.get("VendorCatName"));
				map.addObject("IsActive", m.get("IsActive"));
				
			}
			modelAndView = new ModelAndView("masters/editvendorcategory", map);			
			
		}
		catch(Exception exception)
		{
			exception.printStackTrace();
		}
		return modelAndView;
	}
	
	
	public ModelAndView updateVendorCatogory(HttpServletRequest req,
			HttpServletResponse res) {
		
		try
		{
			int status = 0;
			java.util.Date dt = new java.util.Date();
			java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String currentTime = sdf.format(dt);
			String vcatid = req.getParameter("vcatid");
			String vendorCatname = req.getParameter("catname");
			String isactive = req.getParameter("isactive");			
			InetAddress ip = InetAddress.getLocalHost();
			String userId = (String) req.getSession().getAttribute("UserRecordID");
			
			if(isactive.equals("true"))
			{
				status = 1;
			}
			
				
			masterDao.updateVendorCat(vcatid,vendorCatname,status);
			masterDao.userAuditTrail("assentisk_vendorcat", "1", "update", currentTime, Integer.parseInt(userId), ip.getHostAddress());

		}
		catch(Exception exception)
		{
			exception.printStackTrace();
		}
		return null;
	}
	
	public ModelAndView deleteVendorCategory(HttpServletRequest req,HttpServletResponse res)
	{		
		try
		{

			java.util.Date dt = new java.util.Date();
			java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String currentTime = sdf.format(dt);
			
			InetAddress ip = InetAddress.getLocalHost();
			String userId = (String) req.getSession().getAttribute("UserRecordID");
			
			String vendorCatId = req.getParameter("id");
			masterDao.deleteVendorCategory(vendorCatId);
			masterDao.userAuditTrail("assentisk_vendorcat", "1", "delete", currentTime, Integer.parseInt(userId), ip.getHostAddress());
			
		}
		catch(Exception exception)
		{
			exception.printStackTrace();
		}
		return null;
	}
	
	public ModelAndView checkcountry(HttpServletRequest req,HttpServletResponse res)
	{	
		
		try
		{
			PrintWriter out = res.getWriter();
			String countryname = req.getParameter("countryname");
			List<CountryBean> checksize = masterDao.checkCountryName(countryname);
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
	
	public ModelAndView checkstate(HttpServletRequest req,HttpServletResponse res)
	{	
		
		try
		{
			PrintWriter out = res.getWriter();
			String statename = req.getParameter("statename");
			String countryid = req.getParameter("countryid");
			List<StateBean> checksize = masterDao.checkStateName(statename, Integer.parseInt(countryid));
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
	public ModelAndView checkVendorCategoryName(HttpServletRequest req,HttpServletResponse res)
	{	
		
		try
		{
			PrintWriter out = res.getWriter();
			String catname = req.getParameter("catname");			
			List<VendorCategoryBean> checksize = masterDao.checkVendorCategoryName(catname);
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
}
