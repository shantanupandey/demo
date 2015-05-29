package com.assentisk.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.net.InetAddress;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.DataFormatter;
import org.apache.poi.ss.usermodel.Row;
import org.springframework.ui.ModelMap;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.xssf.usermodel.*;

import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import org.springframework.validation.BindException;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;

import com.assentisk.dao.GroupDao;
import com.assentisk.dao.MasterDao;
import com.assentisk.dao.OrganizationDao;

import com.assentisk.bean.*;
import com.assentisk.util.Files;
import com.assentisk.util.FilesService;
import com.assentisk.util.UrlUtill;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import com.sun.xml.internal.bind.v2.runtime.Location;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

public class OrganizationController extends SimpleFormController {

	private static final String UPLOAD_DIRECTORY = "uploads";
	protected OrganizationDao organizationDao;
	protected MasterDao masterDao;
	protected GroupDao groupDao;
	protected FilesService filesService;

	ModelAndView modelAndView;
	PrintWriter out;
	ModelMap map;
	private VendorContactBean contactBean;

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
		System.out.println("url---"+url);
		if (url.equals("company")) {
			modelAndView = new ModelAndView("company");
		} else if (url.equals("companyList")) {
			return companyList(req, res);
		} else if (url.equals("departmentList")) {
			return departmentList(req, res);
		} else if (url.equals("addcompany")) {
			modelAndView = new ModelAndView("addcompany");
		} else if (url.equals("editcompany")) {
			return editCompany(req, res);
		} else if (url.equals("deleteCompany")) {
			return deletecompany(req, res);
		} else if (url.equals("editdepartment")) {
			return editDepartment(req, res);
		} else if (url.equals("department")) {
			modelAndView = new ModelAndView("department");
		} else if (url.equals("legalentities")) {
			modelAndView = new ModelAndView("legalentities");
		} else if (url.equals("legalEntitiesList")) {
			return legalEntitiesList(req, res);
		} else if (url.equals("editlegalentity")) {
			return editLegalEntity(req, res);
		} else if (url.equals("deleteLegalEntity")) {
			return deleteLegalEntity(req, res);
		} else if (url.equals("deleteDepartment")) {
			return deleteDepartment(req, res);
		} else if (url.equals("addlegalentity")) {
			return addlegalEntities(req, res);
		} else if (url.equals("adddepartment")) {
			return adddepartment(req, res);

		} else if (url.equals("locations")) {
			modelAndView = new ModelAndView("organization/locations");
		} else if (url.equals("locationsList")) {
			return locationsList(req, res);
		} else if (url.equals("addlocation")) {
			return addLocation(req, res);
		} else if (url.equals("editlocation")) {
			return editLocation(req, res);
		} else if (url.equals("deletelocation")) {
			return deleteLocation(req, res);
		} else if (url.equals("applications")) {
			modelAndView = new ModelAndView("organization/applications");
		} else if (url.equals("businessprocesses")) {
			modelAndView = new ModelAndView("organization/businessprocesses");
		} else if (url.equals("applicationsList")) {
			return applicationsList(req, res);
		} else if (url.equals("businessProcessesList")) {
			return businessProcessesList(req, res);
		} else if (url.equals("addapplication")) {
			return addApplication(req, res);
		} else if (url.equals("editapplication")) {
			return editApplication(req, res);
		} else if (url.equals("deleteApplication")) {
			return deleteApplication(req, res);
		} else if (url.equals("calldept")) {
			return calldept(req, res);
		}

		else if (url.equals("callbranch")) {
			return callbranch(req, res);
		}

		else if (url.equals("addbusinessprocess")) {
			return addBusinessProcess(req, res);
		} else if (url.equals("editbusinessprocess")) {
			return editBusinessProcess(req, res);
		} else if (url.equals("deleteBusinessProcess")) {
			return deleteBusinessProcess(req, res);
		} else if (url.equals("employees")) {
			modelAndView = new ModelAndView("organization/employees");
		} else if (url.equals("employeesList")) {
			return employeesList(req, res);
		} else if (url.equals("addemployee")) {
			return addEmployee(req, res);
		} else if (url.equals("editemployee")) {
			return editEmployee(req, res);
		} else if (url.equals("companyview")) {

			return companyDetails(req, res);
		} else if (url.equals("companyedit")) {

			return companyEdit(req, res);
		} else if (url.equals("viewimage")) {

			return viewimage(req, res);
		} else if (url.equals("changepassword")) {
			return viewPaasword(req, res);
		} else if (url.equals("deleteemployee")) {
			return deleteEmployee(req, res);
		} else if (url.equals("vendor")) {
			modelAndView = new ModelAndView("organization/vendor");
		} else if (url.equals("vendorlist")) {

			return vendorList(req, res);
		} else if (url.equals("addvendor")) {

			return addVendor(req, res);
		} else if (url.equals("editvendor")) {

			return editVendor(req, res);
		} else if (url.equals("deletevendor")) {
			return deleteVendor(req, res);
		} else if (url.equals("resource")) {
			return resourceFile(req, res);
		} else if (url.equals("languageKeyList")) {
			return languageKeyList(req, res);
		} else if (url.equals("editlanguagekeys")) {
			return editlanguagekeys(req, res);
		} else if (url.equals("checkusername")) {
			return checkusername(req, res);
		} else if (url.equals("checkdivisionname")) {
			return checkDivisionName(req, res);
		} else if (url.equals("checklocationname")) {
			return checkLocationName(req, res);
		} else if (url.equals("checkdepartmentname")) {
			return checkDepartmentName(req, res);
		}

		else if (url.equals("checkapplicationname")) {
			return checkApplicationName(req, res);
		} else if (url.equals("checkbusinessprocessname")) {
			return checkBusinessProcessName(req, res);
		} else if (url.equals("checkgroupname")) {
			return checkGroupName(req, res);
		}

		else if (url.equals("checkvendorname")) {
			return checkVendorName(req, res);
		} else if (url.equals("checkresponsiblehead")) {
			return checkResponsibleHead(req, res);
		} else if (url.equals("savevendorContact")) {
			return saveVendorContact(req, res);
		} else if (url.equals("deletevendorContact")) {
			return deletevendorContact(req, res);
		} else if (url.equals("deleteContactvendor")) {
			return deleteContactvendor(req, res);
		} else if (url.equals("downloadExcelForRisk")) {
			return downloadExcelForRisk(req, res);
		}

		else if (url.equals("audittrailView")) {
			modelAndView = new ModelAndView("audittrail");
		} else if (url.equals("auditTrailList")) {
			return auditTrailList(req, res);
		}

		else if (url.equals("downloadExcelForAssets")) {
			return downloadExcelForAssets(req, res);
		} else if (url.equals("checkreportingname")) {
			return checkreportingname(req, res);
		}
		else if(url.equals("checkcontrolCatname")){
			return checkcontrolCatname(req,res);
		}else if (url.equals("getemployee")) {
			return getemployee(req, res);
		}else if (url.equals("updateemployeeRecord")) {
			return updateemployeeRecord(req, res);
		}
		return modelAndView;
	}

	protected ModelAndView onSubmit(HttpServletRequest req,
			HttpServletResponse res, Object cmd, BindException errors)
			throws Exception {
		String url = UrlUtill.UrlName(req.getRequestURI());

		if (url.equals("savecompany")) {
			return savecompany(req, res);
		} else if (url.equals("savedepartment")) {
			return savedepartment(req, res);
		} else if (url.equals("savelegalentity")) {
			return savelegalentity(req, res);
		} else if (url.equals("updatedepartment")) {
			return updatedDepartment(req, res);
		} else if (url.equals("updatelegalentity")) {
			return updateLegalEntity(req, res);
		} else if (url.equals("updatecompany")) {
			return updatecompany(req, res);
		} else if (url.equals("savelocation")) {
			return saveLocation(req, res);
		} else if (url.equals("updatelocation")) {
			return updateLocation(req, res);
		} else if (url.equals("saveapplication")) {
			return saveApplication(req, res);
		} else if (url.equals("updateapplication")) {
			return updateApplication(req, res);
		} else if (url.equals("savebusinessprocess")) {
			return saveBusinessProcess(req, res);
		} else if (url.equals("updatebusinessprocess")) {
			return updateBusinessProcess(req, res);
		} else if (url.equals("saveEmployee")) {
			return saveEmployee(req, res);
		} else if (url.equals("updateEmployee")) {
			return updateEmployee(req, res);
		} else if (url.equals("updateCompanyDetail")) {
			return updateCompanyDetails(req, res);
		} else if (url.equals("savePassword")) {
			return savePassword(req, res);
		} else if (url.equals("savevendor")) {
			return saveVendor(req, res);
		} else if (url.equals("updatevendor")) {
			return updateVendor(req, res);
		} else if (url.equals("savelanguagekey")) {
			return savelanguagekey(req, res);
		} else if (url.equals("importEmployeExcel")) {
			return importEmploye(req, res);
		}

		else if (url.equals("checkoldPassword")) {
			return checkOldPassword(req, res);
		}

		else if (url.equals("importAssetsExcel")) {
			return importAssets(req, res);
		}

		return null;

	}

	public ModelAndView companyList(HttpServletRequest req,
			HttpServletResponse res) {

		try {
			out = res.getWriter();

			List<CompanyBean> getCompanyList = organizationDao.getCompanyList();
			PersonJsonObject personJsonObject = new PersonJsonObject();
			personJsonObject.setCompanyBean(getCompanyList);

			Gson gson = new GsonBuilder().setPrettyPrinting().create();
			String json2 = gson.toJson(personJsonObject);
			out.print(json2);

		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return null;
	}

	public ModelAndView editCompany(HttpServletRequest req,
			HttpServletResponse res){
		try {
			map = new ModelMap();
			String id = req.getParameter("id");
			List getList = organizationDao.getcompany(id);
			if (getList.size() > 0) {
				map.addObject("getCompany", getList);
			}

			modelAndView = new ModelAndView("editcompany", map);

		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return modelAndView;
	}

	public ModelAndView updatecompany(HttpServletRequest req,
			HttpServletResponse res) {

		try {
			String cid = req.getParameter("cid");
			String cname = req.getParameter("cname");
			String no = req.getParameter("no");
			String isactive = req.getParameter("isactive");

			int status = 0;
			if (isactive.equals("true")) {
				status = 1;
			}

			organizationDao.updatecompany(cid, cname, no, status);

		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return null;
	}

	public ModelAndView deletecompany(HttpServletRequest req,
			HttpServletResponse res) {
		try {
			String id = req.getParameter("id");
			organizationDao.deletecompany(id);
			modelAndView = new ModelAndView("company");

		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return modelAndView;
	}

	public ModelAndView departmentList(HttpServletRequest req,
			HttpServletResponse res) {

		try {
			out = res.getWriter();

			List<DepartmentBean> getDepartmnentList = organizationDao
					.getDepartmentList();
			PersonJsonObject personJsonObject = new PersonJsonObject();
			personJsonObject.setDepartmentBean(getDepartmnentList);

			//Gson gson = new GsonBuilder().setPrettyPrinting().create();
		    Gson gson = new GsonBuilder().disableHtmlEscaping().create();
			String json2 = gson.toJson(personJsonObject);
			System.out.println(json2);
			out.print(json2);

		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return null;
	}

	public ModelAndView savecompany(HttpServletRequest req,
			HttpServletResponse res) {

		try {

			InetAddress ip = InetAddress.getLocalHost();
			String userId = (String) req.getSession().getAttribute(
					"UserRecordID");

			java.util.Date dt = new java.util.Date();
			java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat(
					"yyyy-MM-dd HH:mm:ss");
			String currentTime = sdf.format(dt);

			String cname = req.getParameter("cname");
			String no = req.getParameter("no");
			String isactive = req.getParameter("isactive");
			int status = 0;
			if (isactive.equals("true")) {
				status = 1;
			}
			organizationDao.savecompany(cname, no, status);
			masterDao.userAuditTrail("assentisk_company", "1", "add",
					currentTime, Integer.parseInt(userId), ip.getHostAddress());

		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return null;
	}

	public ModelAndView savedepartment(HttpServletRequest req,
			HttpServletResponse res) {

		try {
			int status = 0;
			java.util.Date dt = new java.util.Date();
			java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat(
					"yyyy-MM-dd HH:mm:ss");
			String currentTime = sdf.format(dt);

			String companyID = req.getParameter("companyid");

			String departmentName = req.getParameter("departmentname");
			String departmentDesc = req.getParameter("departmentdesc");
			String isactive = req.getParameter("isactive");

			if (isactive.equals("true")) {
				status = 1;
			}

			organizationDao.savedepartment(0, departmentName, departmentDesc,
					currentTime, 1, currentTime, 1, status);
		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return null;
	}

	public ModelAndView editDepartment(HttpServletRequest req,
			HttpServletResponse res) {
		try {
			map = new ModelMap();
			String departmentid = req.getParameter("departmentid");
			List getCompanyList = organizationDao.getCmpList();
			map.addObject("companyList", getCompanyList);

			List getBranchList = organizationDao.getBranchList();
			map.addObject("branchList", getBranchList);

			List<DepartmentBean> getRow = organizationDao
					.getDepartmentById(Integer.parseInt(departmentid));
			if (getRow.size() > 0) {
				Map m = (Map) getRow.get(0);
				map.addObject("DepartmentID", m.get("DepartmentID"));
				map.addObject("CompanyID", m.get("CompanyID"));
				map.addObject("BranchID", m.get("BranchID"));
				map.addObject("DeptName", m.get("DeptName"));
				map.addObject("DeptDesc", m.get("DeptDesc"));
				map.addObject("IsActive", m.get("IsActive"));
			}

		} catch (Exception exception) {

		}
		return new ModelAndView("editdepartment", map);
	}

	public ModelAndView updatedDepartment(HttpServletRequest req,
			HttpServletResponse res) {

		try {
			int status = 0;
			java.util.Date dt = new java.util.Date();
			java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat(
					"yyyy-MM-dd HH:mm:ss");
			String currentTime = sdf.format(dt);

			String departmentid = req.getParameter("departmentid");
			String companyID = req.getParameter("companyid");

			String departmentName = req.getParameter("departmentname");
			String departmentDesc = req.getParameter("departmentdesc");
			String isactive = req.getParameter("isactive");

			if (isactive.equals("true")) {
				status = 1;
			}

			organizationDao.updatedDepartment(Integer.parseInt(departmentid),
					0, departmentName, departmentDesc, currentTime, 1, status);

		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return null;
	}

	public ModelAndView legalEntitiesList(HttpServletRequest req,
			HttpServletResponse res) {

		try {
			out = res.getWriter();

			List<LegalEntitiesBean> getLegalEntitiesList = organizationDao
					.getLegalEntitiesList();
			PersonJsonObject personJsonObject = new PersonJsonObject();
			personJsonObject.setLegalEntitiesBean(getLegalEntitiesList);

			Gson gson = new GsonBuilder().disableHtmlEscaping().create();
			String json2 = gson.toJson(personJsonObject);
			out.print(json2);

		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return null;
	}

	public ModelAndView savelegalentity(HttpServletRequest req,
			HttpServletResponse res) {

		try {
			int status = 0;
			java.util.Date dt = new java.util.Date();
			java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat(
					"yyyy-MM-dd HH:mm:ss");
			String currentTime = sdf.format(dt);

			String legalEntityName = req.getParameter("legalentityname");
			String legalentitydesc = req.getParameter("legalentitydesc");
			String companyID = req.getParameter("companyid");
			String departmentID = req.getParameter("departmentid");
			String branchID = req.getParameter("branchid");
			String companyPeriodID = req.getParameter("companyperiodid");
			String isactive = req.getParameter("isactive");
			String empName = req.getParameter("empName");

			InetAddress ip = InetAddress.getLocalHost();
			String userId = (String) req.getSession().getAttribute(
					"UserRecordID");

			if (isactive.equals("true")) {
				status = 1;
			}

			masterDao.userAuditTrail("assentisk_divisions", "1", "add",
					currentTime, Integer.parseInt(userId), ip.getHostAddress());

			organizationDao.saveLegalEntity(legalEntityName, legalentitydesc,
					Integer.parseInt(departmentID), Integer.parseInt(branchID),
					Integer.parseInt(companyPeriodID), currentTime, 1,
					currentTime, 1, status, organizationDao
							.getEmployeeIdByName(empName));

		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return null;
	}

	public ModelAndView editLegalEntity(HttpServletRequest req,
			HttpServletResponse res) {
		try {
			map = new ModelMap();
			List getCompanyList = organizationDao.getCmpList();
			map.addObject("companyList", getCompanyList);

			List getDepartmentList = organizationDao.getDepList();
			map.addObject("departmentList", getDepartmentList);

			List getBranchList = organizationDao.getBranchList();
			map.addObject("branchList", getBranchList);

			String legalentityid = req.getParameter("legalentityid");
			List<LegalEntitiesBean> getRow = organizationDao
					.getLegalEntityById(Integer.parseInt(legalentityid));
			if (getRow.size() > 0) {
				Map m = (Map) getRow.get(0);
				map.addObject("LegalEntityID", m.get("LegalEntityID"));
				map.addObject("LegalEntityName", m.get("LegalEntityName"));
				map.addObject("LegalEntityDescription", m
						.get("LegalEntityDescription"));
				map.addObject("DepartmentID", m.get("DepartmentID"));
				map.addObject("BranchID", m.get("BranchID"));
				map.addObject("CompanyPeriodID", m.get("CompanyPeriodID"));
				map.addObject("EmpName", m.get("EmpName"));
				map.addObject("IsActive", m.get("IsActive"));
			}

		} catch (Exception exception) {

		}
		return new ModelAndView("editlegalentity", map);
	}

	public ModelAndView updateLegalEntity(HttpServletRequest req,
			HttpServletResponse res){

		try {
			int status = 0;
			java.util.Date dt = new java.util.Date();
			java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat(
					"yyyy-MM-dd HH:mm:ss");
			String currentTime = sdf.format(dt);

			String legalEntityID = req.getParameter("legalentityid");
			String legalEntityName = req.getParameter("legalentityname");
			String legalEntityDesc = req.getParameter("legalentitydescription");
			String companyID = req.getParameter("companyid");
			String departmentID = req.getParameter("departmentid");
			String branchID = req.getParameter("branchid");
			String companyPeriodID = req.getParameter("companyperiodid");
			String isactive = req.getParameter("isactive");
			String empName = req.getParameter("empName");

			InetAddress ip = InetAddress.getLocalHost();
			String userId = (String) req.getSession().getAttribute(
					"UserRecordID");

			if (isactive.equals("true")) {
				status = 1;
			}

			masterDao.userAuditTrail("assentisk_divisions", "1", "update",
					currentTime, Integer.parseInt(userId), ip.getHostAddress());
			organizationDao.updatedLegalEntity(Integer.parseInt(legalEntityID),
					legalEntityName, legalEntityDesc, Integer
							.parseInt(departmentID),
					Integer.parseInt(branchID), Integer
							.parseInt(companyPeriodID), currentTime, 1, status,
					organizationDao.getEmployeeIdByName(empName));

		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return null;
	}

	public ModelAndView deleteLegalEntity(HttpServletRequest req,
			HttpServletResponse res) {
		try {
			InetAddress ip = InetAddress.getLocalHost();
			String userId = (String) req.getSession().getAttribute(
					"UserRecordID");

			java.util.Date dt = new java.util.Date();
			java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat(
					"yyyy-MM-dd HH:mm:ss");
			String currentTime = sdf.format(dt);

			String legalEntityID = req.getParameter("id");
			organizationDao.deleteLegalEntity(Integer.parseInt(legalEntityID));
			masterDao.userAuditTrail("assentisk_divisions", "1", "delete",
					currentTime, Integer.parseInt(userId), ip.getHostAddress());

		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return null;
	}

	public ModelAndView deleteDepartment(HttpServletRequest req,
			HttpServletResponse res) {
		try {

			InetAddress ip = InetAddress.getLocalHost();
			String userId = (String) req.getSession().getAttribute(
					"UserRecordID");

			java.util.Date dt = new java.util.Date();
			java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat(
					"yyyy-MM-dd HH:mm:ss");
			String currentTime = sdf.format(dt);

			String id = req.getParameter("id");
			organizationDao.deleteDepartment((Integer.parseInt(id)));

			masterDao.userAuditTrail("assentisk_company_department", "1",
					"delete", currentTime, Integer.parseInt(userId), ip
							.getHostAddress());

		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return null;
	}

	public ModelAndView addlegalEntities(HttpServletRequest req,
			HttpServletResponse res) {
		try {
			map = new ModelMap();
			List getCompanyList = organizationDao.getCmpList();
			map.addObject("companyList", getCompanyList);

			List getDepartmentList = organizationDao.getDepList();
			map.addObject("departmentList", getDepartmentList);

			List getBranchList = organizationDao.getBranchList();
			map.addObject("branchList", getBranchList);

			modelAndView = new ModelAndView("addlegalentity", map);

		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return modelAndView;
	}

	public ModelAndView adddepartment(HttpServletRequest req,
			HttpServletResponse res) {

		try {
			map = new ModelMap();
			List getCompanyList = organizationDao.getCmpList();
			map.addObject("companyList", getCompanyList);

			List getBranchList = organizationDao.getBranchList();
			map.addObject("branchList", getBranchList);

			modelAndView = new ModelAndView("adddepartment", map);

		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return modelAndView;
	}

	public ModelAndView locationsList(HttpServletRequest req,
			HttpServletResponse res) {

		try {
			out = res.getWriter();

			List<LocationsBean> getLegalEntitiesList = organizationDao
					.getLocationsList();
			PersonJsonObject personJsonObject = new PersonJsonObject();
			personJsonObject.setLocationsBeans(getLegalEntitiesList);

			Gson gson = new GsonBuilder().setPrettyPrinting().create();
			String json2 = gson.toJson(personJsonObject);
			out.print(json2);
		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return null;
	}

	@SuppressWarnings("unchecked")
	public ModelAndView addLocation(HttpServletRequest req,
			HttpServletResponse res) {

		try {
			map = new ModelMap();
			List<CompanyBean> companyList = organizationDao.getCompanyList();
			List<CountryBean> countryList = masterDao.getCountryList();
			map.addObject("companyList", companyList);
			map.addObject("countryList", countryList);

		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return new ModelAndView("organization/addlocation", map);
	}

	public ModelAndView saveLocation(HttpServletRequest req,
			HttpServletResponse res) {

		try {
			int status = 0;
			java.util.Date dt = new java.util.Date();
			java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat(
					"yyyy-MM-dd HH:mm:ss");
			String currentTime = sdf.format(dt);

			InetAddress ip = InetAddress.getLocalHost();
			String userId = (String) req.getSession().getAttribute(
					"UserRecordID");

			String locationname = req.getParameter("locationname");
			String companyid = req.getParameter("companyid");
			String countryid = req.getParameter("countryid");
			String stateid = req.getParameter("stateid");
			String cityid = req.getParameter("cityid");
			String street = req.getParameter("street");
			String address = req.getParameter("address");
			String contactno = req.getParameter("contactno");
			String zipcode = req.getParameter("zipcode");
			String phone1 = req.getParameter("phone1");
			String phone2 = req.getParameter("phone2");
			String email1 = req.getParameter("email1");
			String email2 = req.getParameter("email2");
			String fax1 = req.getParameter("fax1");
			String fax2 = req.getParameter("fax2");
			String url = req.getParameter("url");
			String isactive = req.getParameter("isactive");

			if (phone1.equals("undefined")) {
				phone1 = "";
			}
			if (phone2.equals("undefined")) {
				phone2 = "";
			}
			if (email2.equals("undefined")) {
				email2 = "";
			}
			if (fax1.equals("undefined")) {
				fax1 = "";
			}
			if (fax2.equals("undefined")) {
				fax2 = "";
			}
			if (url.equals("undefined")) {
				url = "";
			}
			if (url.equals("undefined")) {
				url = "";
			}
			if (zipcode.equals("undefined")) {
				zipcode = "";
			}

			if (isactive.equals("true")) {
				status = 1;
			}

			masterDao.userAuditTrail("assentisk_company_locations", "1", "add",
					currentTime, Integer.parseInt(userId), ip.getHostAddress());
			organizationDao.saveLocation(locationname, Integer
					.parseInt(countryid), Integer.parseInt(stateid), cityid,
					street, address, contactno, zipcode, phone1, phone2,
					email1, email2, fax1, fax2, url, currentTime, 1,
					currentTime, 1, status);

		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return null;
	}

	@SuppressWarnings("unchecked")
	public ModelAndView editLocation(HttpServletRequest req,
			HttpServletResponse res) {

		try {
			map = new ModelMap();
			String locationid = req.getParameter("id");
			List<LocationsBean> locationRow = organizationDao
					.getLocationById(Integer.parseInt(locationid));
			if (locationRow.size() > 0) {
				Map m = (Map) locationRow.get(0);
				map.addObject("LocationID", m.get("LocationID"));
				map.addObject("Name", m.get("Name"));
				map.addObject("Street", m.get("Street"));
				map.addObject("Address", m.get("Address"));
				map.addObject("CityID", m.get("CityID"));
				map.addObject("CountryID", m.get("CountryID"));
				map.addObject("StateID", m.get("StateID"));
				map.addObject("Contactno", m.get("Contactno"));
				map.addObject("ZipCode", m.get("ZipCode"));
				map.addObject("Phone1", m.get("Phone1"));
				map.addObject("Phone2", m.get("Phone2"));
				map.addObject("Email1", m.get("Email1"));
				map.addObject("Email2", m.get("Email2"));
				map.addObject("Fax1", m.get("Fax1"));
				map.addObject("Fax2", m.get("Fax2"));
				map.addObject("Url", m.get("Url"));
				map.addObject("IsActive", m.get("IsActive"));

				List<StateBean> stateList = organizationDao
						.getStateByCountryID(Integer.parseInt(m
								.get("CountryID").toString()));
				List<CityBean> cityList = organizationDao
						.getCityByStateCountryID(Integer.parseInt(m.get(
								"StateID").toString()), Integer.parseInt(m.get(
								"CountryID").toString()));
				map.addObject("stateList", stateList);
				map.addObject("cityList", cityList);
			}

			List<CompanyBean> companyList = organizationDao.getCompanyList();
			List<CountryBean> countryList = masterDao.getCountryList();

			map.addObject("companyList", companyList);
			map.addObject("countryList", countryList);
		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return new ModelAndView("organization/editlocation", map);
	}

	public ModelAndView updateLocation(HttpServletRequest req,
			HttpServletResponse res) {

		try {
			int status = 0;
			java.util.Date dt = new java.util.Date();
			java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat(
					"yyyy-MM-dd HH:mm:ss");
			String currentTime = sdf.format(dt);

			InetAddress ip = InetAddress.getLocalHost();
			String userId = (String) req.getSession().getAttribute(
					"UserRecordID");

			String locationid = req.getParameter("locationid");
			String locationname = req.getParameter("locationname");
			String companyid = req.getParameter("companyid");
			String countryid = req.getParameter("countryid");
			String stateid = req.getParameter("stateid");
			String cityid = req.getParameter("cityid");
			String street = req.getParameter("street");
			String address = req.getParameter("address");
			String contactno = req.getParameter("contactno");
			String zipcode = req.getParameter("zipcode");
			String phone1 = req.getParameter("phone1");
			String phone2 = req.getParameter("phone2");
			String email1 = req.getParameter("email1");
			String email2 = req.getParameter("email2");
			String fax1 = req.getParameter("fax1");
			String fax2 = req.getParameter("fax2");
			String url = req.getParameter("url");
			String isactive = req.getParameter("isactive");

			if (phone1.equals("undefined")) {
				phone1 = "";
			}
			if (phone2.equals("undefined")) {
				phone2 = "";
			}
			if (email2.equals("undefined")) {
				email2 = "";
			}
			if (fax1.equals("undefined")) {
				fax1 = "";
			}
			if (fax2.equals("undefined")) {
				fax2 = "";
			}
			if (url.equals("undefined")) {
				url = "";
			}
			if (url.equals("undefined")) {
				url = "";
			}
			if (zipcode.equals("undefined")) {
				zipcode = "";
			}

			if (isactive.equals("true")) {
				status = 1;
			}

			masterDao.userAuditTrail("assentisk_company_locations", "1",
					"update", currentTime, Integer.parseInt(userId), ip
							.getHostAddress());
			organizationDao.updateLocation(Integer.parseInt(locationid),
					locationname, Integer.parseInt(countryid), Integer
							.parseInt(stateid), cityid, street, address,
					contactno, zipcode, phone1, phone2, email1, email2, fax1,
					fax2, url, currentTime, 1, status);

		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return null;
	}

	public ModelAndView deleteLocation(HttpServletRequest req,
			HttpServletResponse res) {

		try {
			InetAddress ip = InetAddress.getLocalHost();
			String userId = (String) req.getSession().getAttribute(
					"UserRecordID");

			java.util.Date dt = new java.util.Date();
			java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat(
					"yyyy-MM-dd HH:mm:ss");
			String currentTime = sdf.format(dt);

			String locationid = req.getParameter("locationid");

			masterDao.userAuditTrail("assentisk_company_locations", "1",
					"delete", currentTime, Integer.parseInt(userId), ip
							.getHostAddress());
			organizationDao.deleteLocationById(Integer.parseInt(locationid));
		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return null;
	}

	public ModelAndView applicationsList(HttpServletRequest req,
			HttpServletResponse res) {

		try {
			out = res.getWriter();

			List<ApplicationsBean> applicationsList = organizationDao
					.getApplicationsList();
			PersonJsonObject personJsonObject = new PersonJsonObject();
			personJsonObject.setApplicationsBeans(applicationsList);

			Gson gson = new GsonBuilder().setPrettyPrinting().create();
			String json2 = gson.toJson(personJsonObject);
			out.print(json2);
		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return null;
	}

	public ModelAndView addApplication(HttpServletRequest req,
			HttpServletResponse res) {

		try {
			map = new ModelMap();
			List<LegalEntitiesBean> getDivision = organizationDao
					.getDivisionsGroupList();
			if (getDivision.size() > 0) {
				Map mp = (Map) getDivision.get(0);

				map.addObject("getDivisions", mp.get("divisions").toString());
			}
			List<LocationsBean> getLocation = organizationDao
					.getLocationsGroupList();
			if (getLocation.size() > 0) {
				Map mp = (Map) getLocation.get(0);
				map.addObject("getLocations", mp.get("locations").toString());
			}
			List<DepartmentBean> getDepartment = organizationDao
					.getDepartmentGroupList();
			if (getDepartment.size() > 0) {
				Map mp = (Map) getDepartment.get(0);
				map.addObject("getDepartments", mp.get("DeptName").toString());
			}

		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return new ModelAndView("organization/addapplication", map);
	}

	public ModelAndView callbranch(HttpServletRequest req,
			HttpServletResponse res) {
		try {
			boolean flag = false;
			String id = req.getParameter("id");
			List getBranchList = organizationDao.getSelectBranchList(id);
			if (getBranchList.size() > 0) {

				flag = true;

				map.addObject("branchList", getBranchList);
			} else {
				flag = false;
			}
			map.addObject("flag", flag);

		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return new ModelAndView("branchList", map);
	}

	public ModelAndView calldept(HttpServletRequest req, HttpServletResponse res) {
		try {
			boolean flag = false;
			String branchid = req.getParameter("branchid");
			String companyid = req.getParameter("companyid");

			List getDepartmentList = organizationDao.getSelectDeptList(
					branchid, companyid);
			if (getDepartmentList.size() > 0) {

				flag = true;

				map.addObject("departmentList", getDepartmentList);
			} else {
				flag = false;
			}
			map.addObject("flag", flag);

		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return new ModelAndView("departmentList", map);
	}

	public ModelAndView saveApplication(HttpServletRequest req,
			HttpServletResponse res) {

		try {

			int status = 0;
			java.util.Date dt = new java.util.Date();
			java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat(
					"yyyy-MM-dd HH:mm:ss");
			String currentTime = sdf.format(dt);

			String applicationname = req.getParameter("applicationname");
			String location = req.getParameter("location");
			String division = req.getParameter("division");
			String empname = req.getParameter("responsiblehead");
			String isactive = req.getParameter("isactive");
			String deptdata = req.getParameter("deptdata");
			InetAddress ip = InetAddress.getLocalHost();
			String userId = (String) req.getSession().getAttribute(
					"UserRecordID");

	
			if (isactive.equals("true")) {
				status = 1;
			}
			if (empname.equals("")) {
				empname = "0";
			} else {
				int firstBracket = empname.indexOf('(');
				String UserName = empname.substring(firstBracket + 1, empname.indexOf(')', firstBracket));
				empname=organizationDao.getUserId(UserName);
			}

			if (location.equals("")) {
				location = "0";
			}
			if (division.equals("")) {
				division = "0";
			}
			if (deptdata.equals("0")) {
				deptdata = "0";
			}
			location=location.replace("<a class=\"aclass\" href=\"javascript:void(0);\"><span class=\"remove\">X</span></a>", "");
			division=division.replace("<a class=\"aclass\" href=\"javascript:void(0);\"><span class=\"remove\">X</span></a>", "");
			deptdata=deptdata.replace("<a class=\"aclass\" href=\"javascript:void(0);\"><span class=\"remove\">X</span></a>", "");

			masterDao.userAuditTrail("assentisk_applications", "1", "add",
					currentTime, Integer.parseInt(userId), ip.getHostAddress());
			organizationDao.saveApplication(applicationname, organizationDao
					.getLocationIdByName(location), organizationDao
					.getDivisionIdByName(division), Integer.parseInt(empname), currentTime,
					currentTime, Integer.parseInt(userId), currentTime, Integer
							.parseInt(userId), status, organizationDao
							.getDepIdByName(deptdata));

		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return null;
	}

	@SuppressWarnings("unchecked")
	public ModelAndView editApplication(HttpServletRequest req,
			HttpServletResponse res) {

		try {
			map = new ModelMap();
			String applicationid = req.getParameter("id");
			List<ApplicationsBean> applicationList = organizationDao
					.getApplicationDetailById(Integer.parseInt(applicationid));
			if (applicationList.size() > 0) {
				Map m = (Map) applicationList.get(0);
				map.addObject("ApplicationID", m.get("ApplicationID"));
				map.addObject("ApplicationName", m.get("ApplicationName"));
				map.addObject("LocationID", m.get("Name"));
				map.addObject("DivisionID", m.get("LegalEntityName"));
				String responsiblehead = m.get("EmployeeID").toString();
				responsiblehead = 	organizationDao.getuserDataConcat(responsiblehead);
				
				map.addObject("EmployeeID",responsiblehead);
				map.addObject("RequestDate", m.get("RequestDate"));
				map.addObject("IsActive", m.get("IsActive"));

				String DivisionList = organizationDao.getDivisionGroupById(m
						.get("DivisionID").toString());
				map.addObject("editDivisionList", DivisionList);

				String LocationList = organizationDao.getLocationGroupById(m
						.get("LocationID").toString());
				map.addObject("editLocationList", LocationList);

				String DeptList = organizationDao.getDeptDataById(m.get(
						"DepartmentID").toString());
				map.addObject("editDeptList", DeptList);

			}

			List<LegalEntitiesBean> getDivision = organizationDao
					.getDivisionsGroupList();
			if (getDivision.size() > 0) {
				Map mp = (Map) getDivision.get(0);

				map.addObject("getDivisions", mp.get("divisions").toString());
			}
			List<LocationsBean> getLocation = organizationDao
					.getLocationsGroupList();
			if (getLocation.size() > 0) {
				Map mp = (Map) getLocation.get(0);
				map.addObject("getLocations", mp.get("locations").toString());
			}

			List<DepartmentBean> getDepartment = organizationDao
					.getDepartmentGroupList();
			if (getDepartment.size() > 0) {
				Map mp = (Map) getDepartment.get(0);
				map.addObject("getDepartments", mp.get("DeptName").toString());
			}

		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return new ModelAndView("organization/editapplication", map);
	}

	public ModelAndView updateApplication(HttpServletRequest req,
			HttpServletResponse res) {

		try {

			int status = 0;
			java.util.Date dt = new java.util.Date();
			java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat(
					"yyyy-MM-dd HH:mm:ss");
			String currentTime = sdf.format(dt);

			String applicationid = req.getParameter("applicationid");
			String applicationname = req.getParameter("applicationname");
			String location = req.getParameter("location");
			String division = req.getParameter("division");
			String empname = req.getParameter("responsiblehead");
			String deptdata = req.getParameter("deptdata");
			InetAddress ip = InetAddress.getLocalHost();
			String userId = (String) req.getSession().getAttribute(
					"UserRecordID");

			String isactive = req.getParameter("isactive");

		
			if (isactive.equals("true")) {
				status = 1;
			}
			if (empname.equals("")) {
				empname = "0";
			} else {
				int firstBracket = empname.indexOf('(');
				String UserName = empname.substring(firstBracket + 1, empname.indexOf(')', firstBracket));
				empname=organizationDao.getUserId(UserName);
			}
			if (location.equals("")) {
				location = "0";
			}
			if (division.equals("")) {
				division = "0";
			}
			if (deptdata.equals("")) {
				deptdata = "0";
			}
			masterDao.userAuditTrail("assentisk_applications", "1", "update",
					currentTime, Integer.parseInt(userId), ip.getHostAddress());
			location=location.replace("<a class=\"aclass\" href=\"javascript:void(0);\"><span class=\"remove\">X</span></a>", "");
			division=division.replace("<a class=\"aclass\" href=\"javascript:void(0);\"><span class=\"remove\">X</span></a>", "");
			deptdata=deptdata.replace("<a class=\"aclass\" href=\"javascript:void(0);\"><span class=\"remove\">X</span></a>", "");

			organizationDao.updateApplication(Integer.parseInt(applicationid),
					applicationname, organizationDao
							.getLocationIdByName(location), organizationDao
							.getDivisionIdByName(division), Integer.parseInt(empname),
					currentTime, Integer.parseInt(userId), status,
					organizationDao.getDepIdByName(deptdata));

		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return null;
	}

	public ModelAndView deleteApplication(HttpServletRequest req,
			HttpServletResponse res) {

		try {
			java.util.Date dt = new java.util.Date();
			java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat(
					"yyyy-MM-dd HH:mm:ss");
			String currentTime = sdf.format(dt);

			InetAddress ip = InetAddress.getLocalHost();
			String userId = (String) req.getSession().getAttribute(
					"UserRecordID");

			String applicationid = req.getParameter("id");

			masterDao.userAuditTrail("assentisk_applications", "1", "delete",
					currentTime, Integer.parseInt(userId), ip.getHostAddress());
			organizationDao.deleteApplicationById(Integer
					.parseInt(applicationid));
		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return null;
	}

	public ModelAndView businessProcessesList(HttpServletRequest req,
			HttpServletResponse res) {

		try {
			out = res.getWriter();

			List<BusinessProcessesBean> businessProcessList = organizationDao
					.getBusinessProcessesList();
			
			PersonJsonObject personJsonObject = new PersonJsonObject();
			personJsonObject.setBusinessProcessesBeans(businessProcessList);

			Gson gson = new GsonBuilder().setPrettyPrinting().create();
			String json2 = gson.toJson(personJsonObject);
			out.print(json2);
		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return null;
	}

	public ModelAndView addBusinessProcess(HttpServletRequest req,
			HttpServletResponse res) {

		try {
			map = new ModelMap();
			List<LocationsBean> locationList = organizationDao
					.getLocationsList();
			List<LegalEntitiesBean> divisionList = organizationDao
					.getLegalEntitiesList();
			map.addObject("locationList", locationList);
			map.addObject("divisionList", divisionList);

			List<LegalEntitiesBean> getDivision = organizationDao
					.getDivisionsGroupList();
			if (getDivision.size() > 0) {
				Map mp = (Map) getDivision.get(0);

				map.addObject("getDivisions", mp.get("divisions").toString());
			}
			List<LocationsBean> getLocation = organizationDao
					.getLocationsGroupList();
			if (getLocation.size() > 0) {
				Map mp = (Map) getLocation.get(0);
				map.addObject("getLocations", mp.get("locations").toString());
			}
			List<DepartmentBean> getDepartment = organizationDao
					.getDepartmentGroupList();
			if (getDepartment.size() > 0) {
				Map mp = (Map) getDepartment.get(0);
				map.addObject("getDepartments", mp.get("DeptName").toString());
			}

		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return new ModelAndView("organization/addbusinessprocess", map);
	}

	public ModelAndView saveBusinessProcess(HttpServletRequest req,
			HttpServletResponse res) {

		try {

			int status = 0;
			java.util.Date dt = new java.util.Date();
			java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat(
					"yyyy-MM-dd HH:mm:ss");
			String currentTime = sdf.format(dt);

			String businessprocessname = req
					.getParameter("businessprocessname");
			String location = req.getParameter("location");

			String division = req.getParameter("division");

			String empname = req.getParameter("responsiblehead");
			String isactive = req.getParameter("isactive");
			String deptdata = req.getParameter("deptdata");

			InetAddress ip = InetAddress.getLocalHost();
			String userId = (String) req.getSession().getAttribute(
					"UserRecordID");

			if(!empname.equals("")){
				int firstBracket = empname.indexOf('(');
				String UserName = empname.substring(firstBracket + 1, empname.indexOf(')', firstBracket));
				empname=organizationDao.getUserId(UserName);
				}
			else
			{
				empname="0";
			}
			
			
			if (isactive.equals("true")) {
				status = 1;
			}
			if (location.equals("")) {
				location = "0";
			}
			if (division.equals("")) {
				division = "0";
			}
			if (deptdata.equals("")) {
				deptdata = "0";
			}

			masterDao.userAuditTrail("assentisk_businessprocess", "1", "add",
					currentTime, Integer.parseInt(userId), ip.getHostAddress());
			location=location.replace("<a class=\"aclass\" href=\"javascript:void(0);\"><span class=\"remove\">X</span></a>", "");
			division=division.replace("<a class=\"aclass\" href=\"javascript:void(0);\"><span class=\"remove\">X</span></a>", "");
			deptdata=deptdata.replace("<a class=\"aclass\" href=\"javascript:void(0);\"><span class=\"remove\">X</span></a>", "");

			organizationDao.saveBusinessProcess(businessprocessname,
					organizationDao.getLocationIdByName(location),
					organizationDao.getDivisionIdByName(division),
					Integer.parseInt(empname), currentTime,
					currentTime, Integer.parseInt(userId), currentTime, Integer
							.parseInt(userId), status, organizationDao
							.getDepIdByName(deptdata));

		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return null;
	}

	@SuppressWarnings("unchecked")
	public ModelAndView editBusinessProcess(HttpServletRequest req,
			HttpServletResponse res) {

		try {
			map = new ModelMap();
			String businessprocessid = req.getParameter("id");
			List<BusinessProcessesBean> businessProcessList = organizationDao
					.getBusinessProcessDetailById(Integer
							.parseInt(businessprocessid));
			if (businessProcessList.size() > 0) {
				Map m = (Map) businessProcessList.get(0);
				map.addObject("BusinessProcessID", m.get("BusinessProcessID"));
				map.addObject("BusinessProcessName", m
						.get("BusinessProcessName"));
				map.addObject("LocationID", m.get("LocationID"));
				map.addObject("DivisionID", m.get("DivisionID"));

				String responsiblehead = m.get("EmployeeID").toString();
				responsiblehead = 	organizationDao.getuserDataConcat(responsiblehead);
				map.addObject("EmpName",responsiblehead);
				map.addObject("RequestDate", m.get("RequestDate"));
				map.addObject("IsActive", m.get("IsActive"));

				String DivisionList = organizationDao.getDivisionGroupById(m
						.get("DivisionID").toString());
				map.addObject("editDivisionList", DivisionList);

				String LocationList = organizationDao.getLocationGroupById(m
						.get("LocationID").toString());
				map.addObject("editLocationList", LocationList);

				String DeptList = organizationDao.getDeptDataById(m.get(
						"DepartmentID").toString());
				map.addObject("editDeptList", DeptList);
			}

			List<LegalEntitiesBean> getDivision = organizationDao
					.getDivisionsGroupList();
			if (getDivision.size() > 0) {
				Map mp = (Map) getDivision.get(0);

				map.addObject("getDivisions", mp.get("divisions").toString());
			}
			List<LocationsBean> getLocation = organizationDao
					.getLocationsGroupList();
			if (getLocation.size() > 0) {
				Map mp = (Map) getLocation.get(0);
				map.addObject("getLocations", mp.get("locations").toString());
			}

			List<DepartmentBean> getDepartment = organizationDao
					.getDepartmentGroupList();
			if (getDepartment.size() > 0) {
				Map mp = (Map) getDepartment.get(0);
				map.addObject("getDepartments", mp.get("DeptName").toString());
			}
			List<LocationsBean> locationList = organizationDao
					.getLocationsList();
			List<LegalEntitiesBean> divisionList = organizationDao
					.getLegalEntitiesList();

			map.addObject("locationList", locationList);
			map.addObject("divisionList", divisionList);

		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return new ModelAndView("organization/editbusinessprocess", map);
	}

	public ModelAndView updateBusinessProcess(HttpServletRequest req,
			HttpServletResponse res) {

		try {

			int status = 0;
			java.util.Date dt = new java.util.Date();
			java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat(
					"yyyy-MM-dd HH:mm:ss");
			String currentTime = sdf.format(dt);

			String businessprocessid = req.getParameter("businessprocessid");
			String businessprocessname = req.getParameter("businessprocessname");
			String location = req.getParameter("location");
			String division = req.getParameter("division");
			String empname = req.getParameter("responsiblehead");			
			String deptdata = req.getParameter("deptdata");
			InetAddress ip = InetAddress.getLocalHost();
			String userId = (String) req.getSession().getAttribute("UserRecordID");


			if (!empname.equals("")) {
				int firstBracket = empname.indexOf('(');
				 String UserName = empname.substring(firstBracket + 1,
						 empname.indexOf(')', firstBracket));
				 System.out.println(UserName);
				 empname=organizationDao.getUserId(UserName);

			}
			
			String isactive = req.getParameter("isactive");

			if (isactive.equals("true")) {
				status = 1;
			}
			if (location.equals("")) {
				location = "0";
			}
			if (division.equals("")) {
				division = "0";
			}
			if (deptdata.equals("")) {
				deptdata = "0";
			}
			masterDao.userAuditTrail("assentisk_businessprocess", "1",
					"update", currentTime, Integer.parseInt(userId), ip
							.getHostAddress());
			location=location.replace("<a class=\"aclass\" href=\"javascript:void(0);\"><span class=\"remove\">X</span></a>", "");
			division=division.replace("<a class=\"aclass\" href=\"javascript:void(0);\"><span class=\"remove\">X</span></a>", "");
			deptdata=deptdata.replace("<a class=\"aclass\" href=\"javascript:void(0);\"><span class=\"remove\">X</span></a>", "");

			organizationDao.updateBusinessProcess(Integer
					.parseInt(businessprocessid), businessprocessname,
					organizationDao.getLocationIdByName(location),
					organizationDao.getDivisionIdByName(division),
					Integer.parseInt(empname), currentTime,
					Integer.parseInt(userId), status, organizationDao
							.getDepIdByName(deptdata));

		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return null;
	}

	public ModelAndView deleteBusinessProcess(HttpServletRequest req,
			HttpServletResponse res) {

		try {
			java.util.Date dt = new java.util.Date();
			java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat(
					"yyyy-MM-dd HH:mm:ss");
			String currentTime = sdf.format(dt);

			InetAddress ip = InetAddress.getLocalHost();
			String userId = (String) req.getSession().getAttribute(
					"UserRecordID");

			String businessprocessid = req.getParameter("id");

			masterDao.userAuditTrail("assentisk_businessprocess", "1",
					"delete", currentTime, Integer.parseInt(userId), ip
							.getHostAddress());
			organizationDao.deleteBusinessProcessById(Integer
					.parseInt(businessprocessid));
		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return null;
	}

	public ModelAndView employeesList(HttpServletRequest req,
			HttpServletResponse res) {

		try {
			out = res.getWriter();
			String license = req.getParameter("license");
			List<EmployeeBean> getEmployeeList = null;
			if (license.equals("true")) {
				getEmployeeList = organizationDao.getEmployeeListByLicense();
			} else {
				getEmployeeList = organizationDao.getEmployeeList();
			}

			PersonJsonObject personJsonObject = new PersonJsonObject();
			personJsonObject.setEmpBeans(getEmployeeList);

			Gson gson = new GsonBuilder().setPrettyPrinting().create();
			String json2 = gson.toJson(personJsonObject);
			out.print(json2);

		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return null;
	}

	@SuppressWarnings("unchecked")
	public ModelAndView addEmployee(HttpServletRequest req,
			HttpServletResponse res) {

		try {
			map = new ModelMap();
			List<CountryBean> countryList = masterDao.getCountryList();
			List<EmployeeBean> employeeList = organizationDao.getEmployeeList();
			List<GroupBean> groupList = groupDao.getList();
			List<CompanyBean> companyList = organizationDao.getCompanyList();
			List<DepartmentBean> departmentList = organizationDao
					.getDepartmentList();

			map.addObject("countryList", countryList);
			map.addObject("employeeList", employeeList);
			map.addObject("groupList", groupList);
			map.addObject("companyList", companyList);
			map.addObject("departmentList", departmentList);
			List<LegalEntitiesBean> getDivision = organizationDao
					.getDivisionsGroupList();
			if (getDivision.size() > 0) {
				Map mp = (Map) getDivision.get(0);
				map.addObject("getDivisions", mp.get("divisions").toString());
			}
			List<LocationsBean> getLocation = organizationDao
					.getLocationsGroupList();
			if (getLocation.size() > 0) {
				Map mp = (Map) getLocation.get(0);
				map.addObject("getLocations", mp.get("locations").toString());
			}

			List<GroupBean> getGroups = organizationDao.getGroupDataList();
			if (getGroups.size() > 0) {
				Map mp = (Map) getGroups.get(0);
				map.addObject("getGroups", mp.get("Gname").toString());
			}
			List<DepartmentBean> getDepartment = organizationDao
					.getDepartmentGroupList();
			if (getDepartment.size() > 0) {
				Map mp = (Map) getDepartment.get(0);
				map.addObject("getDepartments", mp.get("DeptName").toString());
			}

		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return new ModelAndView("organization/addEmployees", map);
	}

	public ModelAndView saveEmployee(HttpServletRequest req,
			HttpServletResponse res) {

		try {
			int status = 0;
			java.util.Date dt = new java.util.Date();
			java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat(
					"yyyy-MM-dd HH:mm:ss");
			String currentTime = sdf.format(dt);

			InetAddress ip = InetAddress.getLocalHost();
			String userId = (String) req.getSession().getAttribute(
					"UserRecordID");

			String ename = req.getParameter("ename");
			String companyid = req.getParameter("companyid");
			String departmentid = req.getParameter("departmentid");
			String locations = req.getParameter("locations");
			String divisions = req.getParameter("divisions");
			String address = req.getParameter("address");
			String countryid = req.getParameter("countryid");
			String stateid = req.getParameter("stateid");
			String cityid = req.getParameter("cityid");
			String zip = req.getParameter("zip");
			String photo = "";
			String phone1 = req.getParameter("phone1");
			String phone2 = req.getParameter("phone2");
			String email1 = req.getParameter("email1");
			String email2 = req.getParameter("email2");
			String isactive = req.getParameter("isactive");
			String username = req.getParameter("username");
			String password = req.getParameter("password");
			String group = req.getParameter("group");
			String reporting = req.getParameter("reporting");
			if (!reporting.equals("")) {
				int firstBracket = reporting.indexOf('(');
				 String UserName = reporting.substring(firstBracket + 1,
				 reporting.indexOf(')', firstBracket));
				 reporting=organizationDao.getUserId(UserName);
//				String UserName = reporting
//						.substring(0, reporting.indexOf('('));
				reporting = organizationDao.getUserId(UserName);
			}
			if (isactive.equals("true")) {
				status = 1;
			}
			int userdata;

			String groupdata = "";

			
				organizationDao.saveUserRecord(ename, username, password,
						email1, currentTime, currentTime);

				masterDao.userAuditTrail("assentisk_userrecord", "1", "add",
						currentTime, Integer.parseInt(userId), ip
								.getHostAddress());
			

			if (username.equals("")) {
				
				reporting = "0";
				groupdata = "0";
			} else {
				group=group.replace("<a class=\"aclass\" href=\"javascript:void(0);\"><span class=\"remove\">X</span></a>", "");
				System.out.println("group---"+group);
				groupdata = organizationDao.getGroupIdByName(group);

			}
			userdata = organizationDao.getUserRecordID();
			if (countryid.equals("undefined") || countryid.equals("0")) {
				countryid = "0";
			}
			if (stateid.equals("undefined") || stateid.equals("0")) {
				stateid = "0";
			}
			departmentid=departmentid.replace("<a class=\"aclass\" href=\"javascript:void(0);\"><span class=\"remove\">X</span></a>", "");
			locations=locations.replace("<a class=\"aclass\" href=\"javascript:void(0);\"><span class=\"remove\">X</span></a>", "");
			divisions=divisions.replace("<a class=\"aclass\" href=\"javascript:void(0);\"><span class=\"remove\">X</span></a>", "");
			
			organizationDao.saveEmployee(userdata, organizationDao
					.getDepIdByName(departmentid), organizationDao
					.getLocationIdByName(locations), ename, email1, reporting,
					groupdata, currentTime, currentTime, Integer
							.parseInt(userId), currentTime, Integer
							.parseInt(userId), status, address, cityid,
					stateid, countryid, zip, photo, phone1, phone2,
					organizationDao.getDivisionIdByName(divisions), email2);
			masterDao.userAuditTrail("assentisk_employees", "1", "add",
					currentTime, Integer.parseInt(userId), ip.getHostAddress());

		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return null;
	}

	public ModelAndView companyDetails(HttpServletRequest req,
			HttpServletResponse res) {
		try {
			map = new ModelMap();

			List<CompanyBean> getRow = organizationDao.getCompanyDetails();
			List getCurrency = organizationDao.getCurrency();
			List getLicense = organizationDao.getLicense();

			String id = req.getSession().getAttribute("UserRecordID")
					.toString();
			List getAdminDetails = organizationDao.getPassword(id);

			if (getAdminDetails.size() > 0) {
				map.addObject("getAdminDetails", getAdminDetails);
			}

			if (getRow.size() > 0) {
				Map m = (Map) getRow.get(0);
				map.addObject("CompanyID", m.get("CompanyID"));
				map.addObject("CompanyName", m.get("CompanyName"));
				map.addObject("CompanyLogo", m.get("CompanyLogo"));
				String address = m.get("HeadOffice_Address").toString();
				//address = address.replaceAll("\\<.*?\\>", "");
				//address = address.replaceAll("\\&#39;", "'");
				map.addObject("HeadOffice_Address", address);
				map
						.addObject("HeadOffice_Country", m
								.get("HeadOffice_Country"));
				map.addObject("HeadOffice_City", m.get("HeadOffice_City"));
				map.addObject("HeadOffice_State", m.get("HeadOffice_State"));
				map.addObject("HeadOffice_Zip", m.get("HeadOffice_Zip"));

				map.addObject("Primary_Contact_Name", m
						.get("Primary_Contact_Name"));
				map.addObject("Primary_Contact_Number", m
						.get("Primary_Contact_Number"));
				map.addObject("PrimaryEmail", m.get("PrimaryEmail"));

				map
						.addObject("Legal_Contact_Name", m
								.get("Legal_Contact_Name"));
				map.addObject("Legal_Contact_Number", m
						.get("Legal_Contact_Number"));
				map.addObject("Legal_Contact_Email", m
						.get("Legal_Contact_Email"));

				map.addObject("Accounts_Contact_Name", m
						.get("Accounts_Contact_Name"));
				map.addObject("Accounts_Contact_Number", m
						.get("Accounts_Contact_Number"));
				map.addObject("Accounts_Contact_Email", m
						.get("Accounts_Contact_Email"));

				map.addObject("Currency", m.get("currency"));

				map.addObject("CountryName", m.get("CountryName"));
				map.addObject("StateName", m.get("StateName"));
				map.addObject("shortForm", m.get("shortForm"));

			}

			if (getCurrency.size() > 0) {
				map.addObject("currencyList", getCurrency);

			}
			if (getLicense.size() > 0) {
				int size = getLicense.size();
				int fetch = size - 1;
				map.addObject("license", getLicense);

			}

			List getPassword = organizationDao.getPassword(id);
			if (getPassword.size() > 0) {
				Map m = (Map) getPassword.get(0);

				map.addObject("EmpPassword", m.get("EmpPassword"));
			}

			modelAndView = new ModelAndView("companyView", map);

		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return modelAndView;
	}

	public ModelAndView companyEdit(HttpServletRequest req,
			HttpServletResponse res) {
		try {
			map = new ModelMap();

			List<CountryBean> countryList = masterDao.getCountryList();

			List<CompanyBean> getRow = organizationDao.getCompanyDetails();
			List getCurrency = organizationDao.getCurrency();

			if (getRow.size() > 0) {
				Map m = (Map) getRow.get(0);
				map.addObject("CompanyID", m.get("CompanyID"));
				map.addObject("CompanyName", m.get("CompanyName"));
				map.addObject("CompanyLogo", m.get("CompanyLogo"));

				map
						.addObject("HeadOffice_Address", m
								.get("HeadOffice_Address"));
				map
						.addObject("HeadOffice_Country", m
								.get("HeadOffice_Country"));
				map.addObject("HeadOffice_City", m.get("HeadOffice_City"));
				map.addObject("HeadOffice_State", m.get("HeadOffice_State"));

				List<StateBean> stateList = organizationDao
						.getStateByCountryID(Integer.parseInt(m.get(
								"HeadOffice_Country").toString()));
				List<CityBean> cityList = organizationDao
						.getCityByStateCountryID(Integer.parseInt(m.get(
								"HeadOffice_State").toString()), Integer
								.parseInt(m.get("HeadOffice_Country")
										.toString()));

				map.addObject("cityList", cityList);
				map.addObject("stateList", stateList);
				map.addObject("HeadOffice_Zip", m.get("HeadOffice_Zip"));

				map.addObject("Primary_Contact_Name", m
						.get("Primary_Contact_Name"));
				map.addObject("Primary_Contact_Number", m
						.get("Primary_Contact_Number"));
				map.addObject("PrimaryEmail", m.get("PrimaryEmail"));

				map
						.addObject("Legal_Contact_Name", m
								.get("Legal_Contact_Name"));
				map.addObject("Legal_Contact_Number", m
						.get("Legal_Contact_Number"));
				map.addObject("Legal_Contact_Email", m
						.get("Legal_Contact_Email"));

				map.addObject("Accounts_Contact_Name", m
						.get("Accounts_Contact_Name"));
				map.addObject("Accounts_Contact_Number", m
						.get("Accounts_Contact_Number"));
				map.addObject("Accounts_Contact_Email", m
						.get("Accounts_Contact_Email"));

				map.addObject("Currency", m.get("currency"));

			}
			if (getCurrency.size() > 0) {
				map.addObject("currencyList", getCurrency);
			}

			map.addObject("countryList", countryList);
			modelAndView = new ModelAndView("company", map);

		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return modelAndView;
	}

	public ModelAndView updateCompanyDetails(HttpServletRequest req,
			HttpServletResponse res) {

		try {
			InputStream inputStream = null;
			int status = 0;
			java.util.Date dt = new java.util.Date();
			java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat(
					"yyyy-MM-dd HH:mm:ss");
			String currentTime = sdf.format(dt);

			String companyID = req.getParameter("CompanyID");
			String companyname = req.getParameter("companyname");
			String headOffice = req.getParameter("headOffice");

			String country = req.getParameter("country");
			String city = req.getParameter("cityid");
			String state = req.getParameter("stateid");
			String zip = req.getParameter("zip");

			String Primary_Contact_Name = req
					.getParameter("Primary_Contact_Name");
			String Primary_Contact_Number = req
					.getParameter("Primary_Contact_Number");
			String primaryEmail = req.getParameter("primaryEmail");

			String Legal_Contact_Name = req.getParameter("Legal_Contact_Name");
			String Legal_Contact_Number = req
					.getParameter("Legal_Contact_Number");
			String Legal_Contact_Email = req
					.getParameter("Legal_Contact_Email");

			String Accounts_Contact_Name = req
					.getParameter("Accounts_Contact_Name");
			String Accounts_Contact_Number = req
					.getParameter("Accounts_Contact_Number");
			String Accounts_Contact_Email = req
					.getParameter("Accounts_Contact_Email");

			String isactive = req.getParameter("isactive");
			String currency = req.getParameter("currency");

			if (isactive != null && isactive.equals("true")) {
				status = 1;
			}

			// ====================

			// MultipartHttpServletRequest multipartRequest =
			// (MultipartHttpServletRequest) req;
			// MultipartFile multipartFile = multipartRequest.getFile("logo");
			//            
			// byte[] bytes = multipartFile.getBytes();
			//			
			// File dir = new File(getServletContext().getRealPath("/")
			// +"companylogo");
			// if (!dir.exists())
			// dir.mkdirs();
			//
			// // Create the file on server
			// File serverFile = new File("companylogo/" +
			// multipartFile.getName() + companyID + ".jpg");
			// BufferedOutputStream stream = new BufferedOutputStream(
			// new FileOutputStream(serverFile));
			// stream.write(bytes);
			// stream.close();
			//		
			// Files file = new Files();
			// file.setFile(multipartFile.getBytes());
			//		
			// if(multipartFile.getSize()>0)
			// {
			// filesService.saveCompanyLogo(serverFile,"update assentisk_company set CompanyLogo=? where CompanyID="+
			// companyID + "");
			// }

			String saveFile = "";
			String targetDir = "";
			String testid = "";
			MultipartHttpServletRequest multi = null;
			MultipartFile multipartFile = null;
			targetDir = getContextPathForDirectory(req, "companylogo");
			// System.out.println("Directory found is=" + targetDir);
			File tarDirFile = new File(targetDir);
			String fileName = null;
			if (!tarDirFile.exists()) {
				tarDirFile.mkdir();
			}
			try {
				multi = (MultipartHttpServletRequest) req;
				multipartFile = multi.getFile("logo");

				fileName = multipartFile.getOriginalFilename();

			} catch (Exception ex5) {
				ex5.printStackTrace();

			}

			File f = new File(fileName);

			// System.out.println("file path =" + f.getAbsolutePath());

			try {

				if (f != null) {
					fileName = f.getName();
					saveFile = targetDir + "/" + companyID + fileName; // saving
																		// path
																		// with
					FileOutputStream fileOut = null;
					fileOut = new FileOutputStream(saveFile);
					BufferedOutputStream bout = new BufferedOutputStream(
							fileOut);
					byte[] b = multipartFile.getBytes();
					bout.write(b);
					bout.flush();
					bout.close();

				}
				if (multipartFile.getSize() > 0) {

					organizationDao.saveCompanyLogo(companyID + fileName,
							companyID);
				}
				// regulationDao.uploadTestDoc(Integer.parseInt(testid),
				// testid+fileName);
			} catch (Exception ex) {

			}

			organizationDao.updatedCompany(Integer.parseInt(companyID),
					companyname, headOffice, country, city, state, zip,
					Primary_Contact_Name, Primary_Contact_Number, primaryEmail,
					Legal_Contact_Name, Legal_Contact_Number,
					Legal_Contact_Email, Accounts_Contact_Name,
					Accounts_Contact_Number, Accounts_Contact_Email, status,
					currentTime, currency);

		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return new ModelAndView("redirect:/companyview.org.htm");
	}

	@SuppressWarnings("unchecked")
	public ModelAndView editEmployee(HttpServletRequest req,
			HttpServletResponse res) {

		try {
			map = new ModelMap();

			String employeeID = req.getParameter("id");

			List<EmployeeBean> employeeRecord = organizationDao
					.getEmployeeRecordById(Integer.parseInt(employeeID));
			if (employeeRecord.size() > 0) {
				Map m = (Map) employeeRecord.get(0);
				map.addObject("UserRecordID", m.get("UserRecordID"));
				map.addObject("employeedataID", m.get("EmployeeID"));

				map.addObject("EmpName", m.get("EmpName"));
				map.addObject("CompanyID", m.get("CompanyID"));
				map.addObject("DepartmentID", m.get("DepartmentID"));
				map.addObject("LocationID", m.get("LocationID").toString());
				map.addObject("divisions", m.get("divisions").toString());
				map.addObject("address", m.get("address"));
				map.addObject("country", m.get("country"));
				map.addObject("state", m.get("state"));
				map.addObject("city", m.get("city"));
				map.addObject("zip", m.get("zip"));
				map.addObject("phone1", m.get("phone1"));
				map.addObject("phone2", m.get("phone2"));
				map.addObject("Email", m.get("Email"));
				map.addObject("email2", m.get("email2"));
				map.addObject("IsActive", m.get("IsActive"));
				map.addObject("EmpUsername", m.get("EmpUsername"));
				map.addObject("EmpPassword", m.get("EmpPassword"));
				map.addObject("RoleID", m.get("RoleID"));
				String reporting = "";
				if (!m.get("ReportingTo").toString().equals("0")) {
					reporting = m.get("ReportingTo").toString();
					reporting = organizationDao.getuserDataConcat(reporting);
				}
				map.addObject("ReportingTo", reporting);

				map.addObject("islicense", m.get("isLicense"));

				String DivisionList = organizationDao.getDivisionGroupById(m
						.get("divisions").toString());
				map.addObject("editDivisionList", DivisionList);

				String LocationList = organizationDao.getLocationGroupById(m
						.get("LocationID").toString());
				map.addObject("editLocationList", LocationList);

				String GroupList = organizationDao.getGroupDataById(m.get(
						"RoleID").toString());
				map.addObject("editGroupList", GroupList);

				String DeptList = organizationDao.getDeptDataById(m.get(
						"DepartmentID").toString());
				map.addObject("editDeptList", DeptList);

				if (m.get("country").toString().equals("")
						|| m.get("country").toString().equals("0")) {
					map.addObject("stateFlag", "false");
				} else {
					List<StateBean> stateList = organizationDao
							.getStateByCountryID(Integer.parseInt(m.get(
									"country").toString()));
					map.addObject("stateList", stateList);
					map.addObject("stateFlag", "true");
				}

			}
			List<CountryBean> countryList = masterDao.getCountryList();
			List<EmployeeBean> employeeList = organizationDao.getEmployeeList();
			List<GroupBean> groupList = groupDao.getList();
			List<CompanyBean> companyList = organizationDao.getCompanyList();
			List<DepartmentBean> departmentList = organizationDao
					.getDepartmentList();

			map.addObject("countryList", countryList);
			map.addObject("employeeList", employeeList);
			map.addObject("groupList", groupList);
			map.addObject("companyList", companyList);
			map.addObject("departmentList", departmentList);

			List<LegalEntitiesBean> getDivision = organizationDao
					.getDivisionsGroupList();
			if (getDivision.size() > 0) {
				Map mp = (Map) getDivision.get(0);

				map.addObject("getDivisions", mp.get("divisions").toString());
			}
			List<LocationsBean> getLocation = organizationDao
					.getLocationsGroupList();
			if (getLocation.size() > 0) {
				Map mp = (Map) getLocation.get(0);
				map.addObject("getLocations", mp.get("locations").toString());
			}

			List<GroupBean> getGroups = organizationDao.getGroupDataList();
			if (getGroups.size() > 0) {
				Map mp = (Map) getGroups.get(0);
				map.addObject("getGroups", mp.get("Gname").toString());
			}

			List<DepartmentBean> getDepartment = organizationDao
					.getDepartmentGroupList();
			if (getDepartment.size() > 0) {
				Map mp = (Map) getDepartment.get(0);
				map.addObject("getDepartments", mp.get("DeptName").toString());
			}

		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return new ModelAndView("organization/editEmployees", map);
	}

	public ModelAndView updateEmployee(HttpServletRequest req,
			HttpServletResponse res) {

		try {
			int status = 0;
			java.util.Date dt = new java.util.Date();
			java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat(
					"yyyy-MM-dd HH:mm:ss");
			String currentTime = sdf.format(dt);

			InetAddress ip = InetAddress.getLocalHost();
			String userId = (String) req.getSession().getAttribute(
					"UserRecordID");

			String employeeid = req.getParameter("employeeid");
			String userID = req.getParameter("userID");
			
			String ename = req.getParameter("ename");
			String companyid = req.getParameter("companyid");
			String departmentid = req.getParameter("departmentid");
			String locations = req.getParameter("locations");
			String divisions = req.getParameter("divisions");
			String address = req.getParameter("address");
			String countryid = req.getParameter("countryid");
			String stateid = req.getParameter("stateid");
			String cityid = req.getParameter("cityid");
			String zip = req.getParameter("zip");
			String photo = "";
			String phone1 = req.getParameter("phone1");
			String phone2 = req.getParameter("phone2");
			String email1 = req.getParameter("email1");
			String email2 = req.getParameter("email2");
			String isactive = req.getParameter("isactive");
			String username = req.getParameter("username");
			String password = req.getParameter("password");
			String group = req.getParameter("group");
			String reporting = req.getParameter("reporting");			
			String licenseuser = req.getParameter("licenseuser");
			
			System.out.println("licenseuser: " + licenseuser);
			System.out.println("reporting: " + reporting);
			if (!reporting.equals("")) {
				int firstBracket = reporting.indexOf('(');
				 String UserName = reporting.substring(firstBracket + 1,
				 reporting.indexOf(')', firstBracket));
//				String UserName = reporting.substring(0, reporting.indexOf('('));
//				System.out.println("UserName: " + UserName);
				reporting = organizationDao.getUserId(UserName);
			}
			System.out.println("reporting1: " + reporting);
			if (isactive.equals("true")) {
				status = 1;
			}
			int userIDnew;
			String groupdata = "";

			
				userIDnew = organizationDao.getUserRecordID();
				System.out.println("group>>>"+group);
				group=group.replace("<a class=\"aclass\" href=\"javascript:void(0);\"><span class=\"remove\">X</span></a>", "");
 
				groupdata = organizationDao.getGroupIdByName(group);

		
			if (countryid.equals("undefined") || countryid.equals("0")) {
				countryid = "0";
			}
			if (stateid.equals("undefined") || stateid.equals("0")) {
				stateid = "0";
			}
			divisions=divisions.replace("<a class=\"aclass\" href=\"javascript:void(0);\"><span class=\"remove\">X</span></a>", "");

			String divisionsData = organizationDao
					.getDivisionIdByName(divisions);

			System.out.println("userID: " + userID);
			organizationDao.udpateUserRecord(Integer.parseInt(userID), ename,
					username, password, email1, currentTime);
			departmentid=departmentid.replace("<a class=\"aclass\" href=\"javascript:void(0);\"><span class=\"remove\">X</span></a>", "");
			locations=locations.replace("<a class=\"aclass\" href=\"javascript:void(0);\"><span class=\"remove\">X</span></a>", "");

			
			organizationDao.updateEmployee(Integer.parseInt(employeeid),
					Integer.parseInt(userID), organizationDao
							.getDepIdByName(departmentid), organizationDao
							.getLocationIdByName(locations), ename, email1,
					reporting, groupdata, currentTime,
					Integer.parseInt(userId), status, address, cityid, stateid,
					countryid, zip, photo, phone1, phone2, divisionsData,
					email2, licenseuser);
			masterDao.userAuditTrail("assentisk_employees", "1", "update",
					currentTime, Integer.parseInt(userId), ip.getHostAddress());
			masterDao.userAuditTrail("assentisk_userrecord", "1", "update",
					currentTime, Integer.parseInt(userId), ip.getHostAddress());

		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return null;
	}

	public ModelAndView viewimage(HttpServletRequest req,
			HttpServletResponse res) {

		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		InputStream sImage;

		try {
			String id = req.getParameter("id");
			Class.forName("com.mysql.jdbc.Driver");
			conn = (Connection) DriverManager.getConnection(
					"jdbc:mysql://103.47.150.63:3306/assentisk", "javauser",
					"ot$@4737#9081");
			stmt = (PreparedStatement) conn
					.prepareStatement("select CompanyLogo from assentisk_company where CompanyID="
							+ id + "");
			rs = stmt.executeQuery();
			if (rs.next()) {
				byte[] bytearray = new byte[1048576];
				int size = 0;
				sImage = rs.getBinaryStream(1);
				res.reset();
				res.setContentType("image/jpeg");
				while ((size = sImage.read(bytearray)) != -1) {
					res.getOutputStream().write(bytearray, 0, size);
				}
			}
		}

		catch (Exception exception) {
			exception.printStackTrace();
		}

		return null;

	}

	public ModelAndView viewPaasword(HttpServletRequest req,
			HttpServletResponse res) {
		try {
			String id = req.getSession().getAttribute("UserRecordID")
					.toString();
			List getPassword = organizationDao.getPassword(id);
			if (getPassword.size() > 0) {
				Map m = (Map) getPassword.get(0);

				map.addObject("EmpPassword", m.get("EmpPassword"));
			}

			modelAndView = new ModelAndView("passwordChange", map);

		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return modelAndView;
	}

	public ModelAndView savePassword(HttpServletRequest req,
			HttpServletResponse res) {

		try {
			String id = req.getSession().getAttribute("UserRecordID")
					.toString();
			String newPassword = req.getParameter("newPassword");

			organizationDao.updatePassword(id, newPassword);

		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return null;
	}

	public ModelAndView deleteEmployee(HttpServletRequest req,
			HttpServletResponse res) {

		try {
			out = res.getWriter();
			String listOfTask="";
			java.util.Date dt = new java.util.Date();
			java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat(
					"yyyy-MM-dd HH:mm:ss");
			String currentTime = sdf.format(dt);

			InetAddress ip = InetAddress.getLocalHost();
			String userId = (String) req.getSession().getAttribute(
					"UserRecordID");

			String employeeid = req.getParameter("id");

			masterDao.userAuditTrail("assentisk_employees", "1", "delete",
					currentTime, Integer.parseInt(userId), ip.getHostAddress());
			List taskList=organizationDao.getTaskList(Integer.parseInt(employeeid));
			System.out.println("check this tasklist>>>"+taskList);
			
			if(taskList.size()> 0){
				
			 for(int i=0;i<taskList.size();i++){
				 Map task=(Map) taskList.get(i);
				 listOfTask=listOfTask+"<tr><td>Task:"+task.get("amcname")+" </td></tr>";
				 
			 }
				
			}else{
				System.out.println("else part>>>");
				organizationDao.deleteEmployee(Integer.parseInt(employeeid));	
			}
			
			out.print(listOfTask);
			System.out.println("check the listOfTask>>"+listOfTask);

		} catch (Exception exception) {
			exception.printStackTrace();
		}
		
		return null;
	}

	public ModelAndView vendorList(HttpServletRequest req,
			HttpServletResponse res) {

		try {
			out = res.getWriter();

			List<VendorBean> getVendorList = organizationDao.getVendorList();
			PersonJsonObject personJsonObject = new PersonJsonObject();
			personJsonObject.setVendorBeans(getVendorList);

			Gson gson = new GsonBuilder().disableHtmlEscaping().create();
			String json2 = gson.toJson(personJsonObject);
			out.print(json2);

		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return null;
	}

	public ModelAndView addVendor(HttpServletRequest req,
			HttpServletResponse res) {
		try {
			map = new ModelMap();
			List getCountryList = organizationDao.getCountryList();
			map.addObject("countryList", getCountryList);

			contactBean = new VendorContactBean();
			contactBean.cleanListElement();

			modelAndView = new ModelAndView("organization/addvendor", map);

		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return modelAndView;
	}

	public ModelAndView saveVendor(HttpServletRequest req,
			HttpServletResponse res) {

		try {
			int status = 0;
			java.util.Date dt = new java.util.Date();
			java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat(
					"yyyy-MM-dd HH:mm:ss");
			String currentTime = sdf.format(dt);

			InetAddress ip = InetAddress.getLocalHost();
			String userId = (String) req.getSession().getAttribute(
					"UserRecordID");

			String vendorname = req.getParameter("vendorname");
			String country = req.getParameter("country");
			String stateid = req.getParameter("stateid");
			String cityid = req.getParameter("cityid");
			String phone1 = req.getParameter("phone1");
			String phone2 = req.getParameter("phone2");
			String email1 = req.getParameter("email1");
			String email2 = req.getParameter("email2");
			String isactive = req.getParameter("isactive");
			String address = req.getParameter("address");
			address = new String((address.getBytes("8859_1")), "UTF8");

			if (isactive.equals("true")) {
				status = 1;
			}

			organizationDao.insertVendorRecord(vendorname, country, stateid,
					cityid, phone1, phone2, email1, email2, status, address);
			masterDao.userAuditTrail("assentisk_vendor", "1", "add",
					currentTime, Integer.parseInt(userId), ip.getHostAddress());

			organizationDao.saveVendorContact(contactBean);

			masterDao.userAuditTrail("assentisk_vendor_contact", "1", "update",
					currentTime, Integer.parseInt(userId), ip.getHostAddress());
		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return null;
	}

	@SuppressWarnings("unchecked")
	public ModelAndView editVendor(HttpServletRequest req,
			HttpServletResponse res) {

		try {
			map = new ModelMap();

			String vendorId = req.getParameter("id");

			List<VendorBean> vendorRecord = organizationDao
					.getVendorById(vendorId);
			if (vendorRecord.size() > 0) {
				Map m = (Map) vendorRecord.get(0);
				map.addObject("vendorId", m.get("id"));
				map.addObject("VendorName", m.get("VendorName"));
				map.addObject("country", m.get("country"));
				map.addObject("state", m.get("state").toString());
				map.addObject("city", m.get("city").toString());
				map.addObject("phone1", m.get("phone1"));
				map.addObject("phone2", m.get("phone2"));
				map.addObject("email1", m.get("email1"));
				map.addObject("email2", m.get("email2"));
				map.addObject("IsActive", m.get("IsActive"));
				map.addObject("address", m.get("address"));

				List<StateBean> stateList = organizationDao
						.getStateByCountryID(Integer.parseInt(m.get("country")
								.toString()));
				List<CityBean> cityList = organizationDao
						.getCityByStateCountryID(Integer.parseInt(m
								.get("state").toString()), Integer.parseInt(m
								.get("country").toString()));
				map.addObject("cityList", cityList);
				map.addObject("stateList", stateList);
			}
			List<CountryBean> countryList = organizationDao.getCountryList();

			List<VendorContactBean> vendorContact = organizationDao
					.getVendorContact(Integer.parseInt(vendorId));
			map.addObject("countryList", countryList);
			map.addObject("vendorContact", vendorContact);
			contactBean = new VendorContactBean();
			contactBean.cleanListElement();

		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return new ModelAndView("organization/vendorEdit", map);
	}

	public ModelAndView updateVendor(HttpServletRequest req,
			HttpServletResponse res) {

		try {
			int status = 0;
			java.util.Date dt = new java.util.Date();
			java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat(
					"yyyy-MM-dd HH:mm:ss");
			String currentTime = sdf.format(dt);

			InetAddress ip = InetAddress.getLocalHost();
			String userId = (String) req.getSession().getAttribute(
					"UserRecordID");
			String vendorid = req.getParameter("vendorid");
			String vendorname = req.getParameter("vendorname");
			String oname = req.getParameter("oname");
			String country = req.getParameter("country");
			String stateid = req.getParameter("stateid");
			String cityid = req.getParameter("cityid");
			String phone1 = req.getParameter("phone1");
			String phone2 = req.getParameter("phone2");
			String email1 = req.getParameter("email1");
			String email2 = req.getParameter("email2");
			String isactive = req.getParameter("isactive");
			String designation = req.getParameter("designation");
			String address = req.getParameter("address");
			address = new String((address.getBytes("8859_1")), "UTF8");

			if (isactive.equals("true")) {
				status = 1;
			}

			organizationDao.updateVendorRecord(vendorname, country, stateid,
					cityid, phone1, phone2, email1, email2, vendorid, status,
					address);
			masterDao.userAuditTrail("assentisk_vendor", "1", "update",
					currentTime, Integer.parseInt(userId), ip.getHostAddress());

			organizationDao.editVendorContact(contactBean, Integer
					.parseInt(vendorid));
			masterDao.userAuditTrail("assentisk_vendor_contact", "1", "update",
					currentTime, Integer.parseInt(userId), ip.getHostAddress());

		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return null;
	}

	public ModelAndView deleteVendor(HttpServletRequest req,
			HttpServletResponse res) {

		try {
			java.util.Date dt = new java.util.Date();
			java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat(
					"yyyy-MM-dd HH:mm:ss");
			String currentTime = sdf.format(dt);

			InetAddress ip = InetAddress.getLocalHost();
			String userId = (String) req.getSession().getAttribute(
					"UserRecordID");

			String vendorID = req.getParameter("id");

			masterDao.userAuditTrail("assentisk_vendor", "1", "delete",
					currentTime, Integer.parseInt(userId), ip.getHostAddress());
			organizationDao.deleteVendor(vendorID);

		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return null;
	}

	public ModelAndView laungageDetails(HttpServletRequest req,
			HttpServletResponse res) {
		try {

			ModelMap map;
			map = new ModelMap();
			/*
			 * String language = (String)
			 * req.getSession().getAttribute("language");
			 */

			List getLanguageKey = organizationDao.getLaungageKey("English");

			if (getLanguageKey.size() > 0) {

				Map mapVal;

				for (int i = 0; i < getLanguageKey.size(); i++) {

					mapVal = (Map) getLanguageKey.get(i);
					mapVal.put(mapVal.get("CFG_KEY"), mapVal.get("CFG_VALUE"));

				}

			}
		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return null;
	}

	public ModelAndView resourceFile(HttpServletRequest req,
			HttpServletResponse res) {

		try {
			res.setContentType("application/json;charset=UTF-8");
			modelAndView = new ModelAndView("resourceFile");

		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return modelAndView;
	}

	private ModelAndView languageKeyList(HttpServletRequest req,
			HttpServletResponse res) {

		try {
			res.setContentType("application/json;charset=UTF-8");
			out = res.getWriter();

			String language = (String) req.getSession().getAttribute(
					"languageVal");

			List<LanguageKeysBean> getLanguageKeyList = organizationDao
					.getLanguageKeysList(language);

			for (int i = 0; i < getLanguageKeyList.size(); i++) {

			}

			PersonJsonObject personJsonObject = new PersonJsonObject();
			personJsonObject.setLanguageKeysBean(getLanguageKeyList);

			Gson gson = new GsonBuilder().setPrettyPrinting().create();

			String json2 = gson.toJson(personJsonObject);

			out.print(json2);

		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return null;
	}

	private ModelAndView editlanguagekeys(HttpServletRequest req,
			HttpServletResponse res) {
		try {
			res.setContentType("application/json;charset=UTF-8");
			map = new ModelMap();

			String languagekey = req.getParameter("LanguageKey");
			String launguageValue = req.getParameter("LaunguageValue");
			launguageValue = new String((launguageValue.getBytes("8859_1")),
					"UTF8");

			map.addObject("languagekey", languagekey);
			map.addObject("launguageValue", launguageValue);

		} catch (Exception exception) {

		}
		return new ModelAndView("editLanguage", map);
	}

	private ModelAndView savelanguagekey(HttpServletRequest req,
			HttpServletResponse res) {
		try {

			String languagekey = req.getParameter("languagekey");
			String launguageValue = req.getParameter("launguageValue");
			launguageValue = new String((launguageValue.getBytes("8859_1")),
					"UTF8");
			String language = (String) req.getSession().getAttribute(
					"languageVal");

			organizationDao.updateLanguageKey(languagekey, launguageValue,
					language);

		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return null;
	}

	private ModelAndView checkusername(HttpServletRequest req,
			HttpServletResponse res) {

		try {
			PrintWriter out = res.getWriter();
			String username = req.getParameter("username");
			List<UserRecordBean> checkUser = organizationDao
					.checkUserName(username);
			if (checkUser.size() > 0) {
				out.write("exist");
			} else {
				out.write("notexist");
			}
		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return null;
	}

	public ModelAndView checkDivisionName(HttpServletRequest req,
			HttpServletResponse res) {

		try {
			PrintWriter out = res.getWriter();
			String divname = req.getParameter("divname");
			List<LegalEntitiesBean> checksize = organizationDao
					.checkdivisionName(divname);
			if (checksize.size() > 0) {
				out.write("exist");
			} else {
				out.write("notexist");
			}

		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return null;
	}

	public ModelAndView checkLocationName(HttpServletRequest req,
			HttpServletResponse res) {

		try {
			PrintWriter out = res.getWriter();
			String locationname = req.getParameter("locationname");
			List<LocationsBean> checksize = organizationDao
					.checkLocationName(locationname);
			if (checksize.size() > 0) {
				out.write("exist");
			} else {
				out.write("notexist");
			}

		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return null;
	}

	public ModelAndView checkDepartmentName(HttpServletRequest req,
			HttpServletResponse res) {

		try {
			PrintWriter out = res.getWriter();
			String departmentname = req.getParameter("departmentname");
			List<DepartmentBean> checksize = organizationDao
					.checkDepartmentName(departmentname);
			if (checksize.size() > 0) {
				out.write("exist");
			} else {
				out.write("notexist");
			}

		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return null;
	}

	public ModelAndView checkApplicationName(HttpServletRequest req,
			HttpServletResponse res) {

		try {
			PrintWriter out = res.getWriter();
			String applicationname = req.getParameter("applicationname");
			List<ApplicationsBean> checksize = organizationDao
					.checkApplicationName(applicationname);
			if (checksize.size() > 0) {
				out.write("exist");
			} else {
				out.write("notexist");
			}

		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return null;
	}

	public ModelAndView checkBusinessProcessName(HttpServletRequest req,
			HttpServletResponse res) {

		try {
			PrintWriter out = res.getWriter();
			String businessProc = req.getParameter("businessProc");
			List<BusinessProcessesBean> checksize = organizationDao
					.checkBusinessProcessName(businessProc);
			if (checksize.size() > 0) {
				out.write("exist");
			} else {
				out.write("notexist");
			}

		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return null;
	}
	public ModelAndView checkcontrolCatname(HttpServletRequest req,
			HttpServletResponse res) {

		try {
			PrintWriter out = res.getWriter();
			String controlname = req.getParameter("controlname");
			List<ControlCategoryBean> checksize = organizationDao.checkcontrolCatname(controlname);
			if (checksize.size() > 0) {
				out.write("exist");
			} else {
				out.write("notexist");
			}

		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return null;
	}
	public ModelAndView checkGroupName(HttpServletRequest req,
			HttpServletResponse res) {

		try {
			PrintWriter out = res.getWriter();
			String groupname = req.getParameter("groupname");
			List<GroupBean> checksize = organizationDao
					.checkGroupName(groupname);
			if (checksize.size() > 0) {
				out.write("exist");
			} else {
				out.write("notexist");
			}

		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return null;
	}

	public ModelAndView checkVendorName(HttpServletRequest req,
			HttpServletResponse res) {

		try {
			PrintWriter out = res.getWriter();
			String vendorname = req.getParameter("vendorname");
			List<VendorBean> checksize = organizationDao
					.checkVendorName(vendorname);
			if (checksize.size() > 0) {
				out.write("exist");
			} else {
				out.write("notexist");
			}

		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return null;
	}

	public ModelAndView checkResponsibleHead(HttpServletRequest req,
			HttpServletResponse res) {

		try {
			PrintWriter out = res.getWriter();
			String empName = req.getParameter("empName");
			List<EmployeeBean> checksize = organizationDao
					.checkResponsibleHead(empName);
			if (checksize.size() > 0) {
				out.write("exist");
			} else {
				out.write("notexist");
			}

		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return null;
	}

	private ModelAndView saveVendorContact(HttpServletRequest req,
			HttpServletResponse res) {

		String nameContact = req.getParameter("nameContact");

		String designationContact = req.getParameter("designationContact");

		String phoneContact = req.getParameter("phoneContact");
		String emailContact = req.getParameter("emailContact");
		String id = req.getParameter("id");
		if (designationContact.equals("")) {
			designationContact = "";
		}
		if (phoneContact.equals("")) {
			phoneContact = "";
		}
		contactBean = new VendorContactBean();
		contactBean.setId(id);
		contactBean.setname(nameContact);
		contactBean.setPhone(phoneContact);
		contactBean.setDesignation(designationContact);
		contactBean.setemail(emailContact);

		return null;
	}

	private ModelAndView deletevendorContact(HttpServletRequest req,
			HttpServletResponse res) {
		int id = Integer.parseInt(req.getParameter("vendorID"));
		try {
			organizationDao.deleteVendorContact(id);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

	private ModelAndView deleteContactvendor(HttpServletRequest req,
			HttpServletResponse res) {
		try {
			String iddata = req.getParameter("id");
			int id = Integer.parseInt(iddata);

			contactBean = new VendorContactBean();
			contactBean.removeElement(id);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	private ModelAndView importEmploye(HttpServletRequest req,
			HttpServletResponse res) throws Exception {
		System.out.println("hiiii heree.......");
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) req;
		MultipartFile multipartFile = multipartRequest.getFile("myexcel");
		String fileName = multipartFile.getOriginalFilename();
		map = new ModelMap();
		String name=req.getParameter("fileName");
		int status = 0;
		java.util.Date dt = new java.util.Date();
		java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat(
				"yyyy-MM-dd HH:mm:ss");
		String currentTime = sdf.format(dt);

		InetAddress ip = InetAddress.getLocalHost();
		String userId = (String) req.getSession().getAttribute("UserRecordID");
		
		byte[] b = multipartFile.getBytes();
		FileOutputStream fout = new FileOutputStream(new File(fileName));
		fout.write(b);
		fout.flush();
		fout.close();
		try {
			String DepartmentID="",LocationID="",EmpName = "",Email1  = "",Email2  = "", address = "";
			String city="",zip  = "", phone1 = "",locCoun="",locstate="",loccity="",locContact="",locEmail="";
			String phone2="",divisions="",email2 = "",username="",reporting="",photo="";
			int isLicense = 0;
			int isactive=1;
			int count=0;
			int notcount=0;
			FileInputStream file = new FileInputStream(new File(fileName));
			boolean flag=false;
			String []data=null;
			List<String> dataStatus=new ArrayList<String>();
			int val=0;
			//Reading .xls files
         	   
			if (fileName.toLowerCase().endsWith(".xls")){
				// Get the workbook instance for XLS file
				HSSFWorkbook workbook = new HSSFWorkbook(file);
				// Get first sheet from the workbook
				HSSFSheet sheet = workbook.getSheetAt(0);
				sheet.setColumnHidden((short) 14, false);
				// Iterate through each rows from first sheet
				Iterator<Row> rowIterator = sheet.rowIterator();
				
				if(rowIterator.hasNext())
				{
			
				while (rowIterator.hasNext()){
					short cellIndex = 0;
					HSSFRow hsrow = (HSSFRow) rowIterator.next();
					if(hsrow.getRowNum() != 0){
					if (hsrow instanceof HSSFRow) {
						try{
							EmpName=hsrow.getCell((short) 0).getStringCellValue();
							
							}catch(Exception e){
								EmpName="";
								System.out.println("Wrong Data in  Row "+hsrow.getRowNum()+": EmpName - "+e.getMessage());
								dataStatus.add("Wrong Data in  Row "+hsrow.getRowNum()+": EmpName - "+e.getMessage());
								val++;
							}
						try{
						DepartmentID = hsrow.getCell((short) 1).getStringCellValue();
						}catch(Exception e){
							DepartmentID="";
							System.out.println("Wrong Data in  Row "+hsrow.getRowNum()+":  Department - "+e.getMessage());
							dataStatus.add("Wrong Data in  Row "+hsrow.getRowNum()+": Department - "+e.getMessage());
							val++;
						}
						try{
						LocationID=hsrow.getCell((short) 2).getStringCellValue();
						}catch(Exception e){
							LocationID="";
							System.out.println("Wrong Data in  Row "+hsrow.getRowNum()+": Location -"+e.getMessage());
							dataStatus.add("Wrong Data in  Row "+hsrow.getRowNum()+": Location - "+e.getMessage());
							val++;
							
						}
						
						try{
							locCoun=hsrow.getCell((short) 3).getStringCellValue();
							}catch(Exception e){
								locCoun="";
								System.out.println("Wrong Data in  Row "+hsrow.getRowNum()+": location Country - "+e.getMessage());
								dataStatus.add("Wrong Data in  Row "+hsrow.getRowNum()+": Location Country- "+e.getMessage());
								val++;
							}
						
						try{
							locstate=hsrow.getCell((short) 4).getStringCellValue();
							}catch(Exception e){
								locstate="";
								System.out.println("Wrong Data in  Row "+hsrow.getRowNum()+": location State - "+e.getMessage());
								dataStatus.add("Wrong Data in  Row "+hsrow.getRowNum()+": Location State- "+e.getMessage());
								val++;
							}
						
						try{
							loccity=hsrow.getCell((short) 5).getStringCellValue();
							}catch(Exception e){
								loccity="";
								System.out.println("Wrong Data in  Row "+hsrow.getRowNum()+": location City -"+e.getMessage());
								dataStatus.add("Wrong Data in  Row "+hsrow.getRowNum()+": Location City- "+e.getMessage());
								val++;
							}
						try{
							locContact=hsrow.getCell((short) 6).getStringCellValue();
							}catch(Exception e){
								locContact="";
								System.out.println("Wrong Data in  Row "+hsrow.getRowNum()+": location Contact Name -"+e.getMessage());
								dataStatus.add("Wrong Data in  Row "+hsrow.getRowNum()+": Location Contact Name- "+e.getMessage());
								val++;
							}
						
						try{
							locEmail=hsrow.getCell((short) 7).getStringCellValue();
							boolean isValid = false;
							try {
								//
								// Create InternetAddress object and validated the supplied
								// address which is this case is an email address.
								InternetAddress internetAddress = new InternetAddress(locEmail);
								internetAddress.validate();
								isValid = true;
								} catch (AddressException e) {
									dataStatus.add("Wrong Data in  Row "+hsrow.getRowNum()+": Location Email- "+e.getMessage());
								}
							}catch(Exception e){
								locEmail="";
								System.out.println("Wrong Data in  Row "+hsrow.getRowNum()+": location Email -"+e.getMessage());
								dataStatus.add("Wrong Data in  Row "+hsrow.getRowNum()+": Location Email- "+e.getMessage());
								val++;
							}
					
						try{
								divisions=hsrow.getCell((short) 8).getStringCellValue();
								}catch(Exception e){
									divisions="";
									System.out.println("Wrong Data in  Row "+hsrow.getRowNum()+": Divisions - "+e.getMessage());
									dataStatus.add("Wrong Data in  Row "+hsrow.getRowNum()+": Divisions - "+e.getMessage());
									val++;
								}
						try{
						address=hsrow.getCell((short) 9).getStringCellValue();
						}catch(Exception e){
							address="";
							System.out.println("Wrong Data in  Row "+hsrow.getRowNum()+": address - "+e.getMessage());
							dataStatus.add("Wrong Data in  Row "+hsrow.getRowNum()+": address - "+e.getMessage());
							val++;
						}
						try{
						city=hsrow.getCell((short) 10).getStringCellValue();
						}catch(Exception e){
							city="";
							System.out.println("Wrong Data in  Row "+hsrow.getRowNum()+": city - "+e.getMessage());
							dataStatus.add("Wrong Data in  Row "+hsrow.getRowNum()+": city - "+e.getMessage());
							val++;
						}
					
						
						
						
						
						try{
						
						zip=String.valueOf(hsrow.getCell((short) 11).getNumericCellValue());
						zip = String.valueOf(zip).split("\\.")[0];
						
						}catch(Exception e){
							zip="";
							System.out.println("Wrong Data in  Row "+hsrow.getRowNum()+": zip - "+e.getMessage());
							dataStatus.add("Wrong Data in  Row "+hsrow.getRowNum()+": zip - "+e.getMessage());
							val++;
						}

						try{
							
					    DataFormatter formatter = new DataFormatter();
			            
						phone1=String.valueOf(hsrow.getCell((short) 12).getNumericCellValue());
				        String df2 = formatter.formatCellValue(hsrow.getCell((short) 12));
						phone1=df2;
						phone1 = String.valueOf(phone1).split("\\.")[0];
						
						}catch(Exception e){
							phone1="";
							System.out.println("Wrong Data in  Row "+hsrow.getRowNum()+": phone1 - "+e.getMessage());
							dataStatus.add("Wrong Data in  Row "+hsrow.getRowNum()+": phone1 - "+e.getMessage());
							val++;	
						}
						try{
						DataFormatter formatter = new DataFormatter();
						phone2=String.valueOf(hsrow.getCell((short) 13).getNumericCellValue());
						String df2 = formatter.formatCellValue(hsrow.getCell((short) 13));
						phone2=df2;
						System.out.println("check phone1"+phone2);
						phone2 = String.valueOf(phone2).split("\\.")[0];
						
					
						}catch(Exception e){
							phone2="";
							System.out.println("Wrong Data in  Row "+hsrow.getRowNum()+": phone2 -"+e.getMessage());
							dataStatus.add("Wrong Data in  Row "+hsrow.getRowNum()+": phone2 - "+e.getMessage());
							val++;	
						}
							try {
								boolean isValid = false;
								Email1 = hsrow.getCell((short) 14)
										.getStringCellValue();
								try {
									InternetAddress internetAddress = new InternetAddress(
											Email1);
									internetAddress.validate();
									isValid = true;
								} catch (AddressException e) {
									dataStatus.add("Wrong Data in  Row "
											+ hsrow.getRowNum() + ": Email1 - "
											+ e.getMessage());
								}
							} catch (Exception e) {
								Email1 = "";
								System.out.println("Wrong Data in  Row "
										+ hsrow.getRowNum() + ": Email1 - "
										+ e.getMessage());
								dataStatus.add("Wrong Data in  Row "
										+ hsrow.getRowNum() + ": Email1 - "
										+ e.getMessage());
								val++;
							}
						try{
							
							boolean isValid = false;
							Email2=hsrow.getCell((short) 15).getStringCellValue();
							try {
								InternetAddress internetAddress = new InternetAddress(
										Email2);
								internetAddress.validate();
								isValid = true;
							} catch (AddressException e) {
								dataStatus.add("Wrong Data in  Row "
										+ hsrow.getRowNum() + ": Email2 - "
										+ e.getMessage());
							}
							}catch(Exception e){
								Email2="";
								System.out.println("Wrong Data in  Row "+hsrow.getRowNum()+": Email2 - "+e.getMessage());
								dataStatus.add("Wrong Data in  Row "+hsrow.getRowNum()+": Email2 - "+e.getMessage());
								val++;	
							}
		
					  int userdata = 0;
							
					  String groupdata="";
							
						
						if(username.equals("")){
							userdata=0;
							reporting="0";
							groupdata="0";
						}
						
						if(!LocationID.equals("")){
							LocationID=organizationDao
							.getLocIdByName(LocationID,currentTime,Integer.parseInt(userId),locCoun,locstate,loccity,locContact,locEmail);
							if(LocationID.equals("0")){
								LocationID="";
							}
						}
						if(!DepartmentID.equals("")){
							DepartmentID=organizationDao.getDeparmentIdByName(DepartmentID,currentTime,Integer.parseInt(userId));
							if(DepartmentID.equals("0")){
								DepartmentID="";
							}
						}
						if(!divisions.equals("")){
							
							divisions=organizationDao.getDivisionByName(divisions,currentTime,Integer.parseInt(userId));
							if(divisions.equals("0")){
								divisions="";
							}
						}
					
				if(!EmpName.equals("") && !DepartmentID.equals("") && !divisions.equals("") && !LocationID.equals("")){
					String duplicate = "";
					try{
					 duplicate=	organizationDao.saveEmployeedata(0,				
								DepartmentID, LocationID, EmpName, Email1,
								reporting,groupdata, currentTime,
								currentTime,
								Integer.parseInt(userId),
								currentTime,
								Integer.parseInt(userId),
								status, address,
								city, 
								"",
								"",
								zip, photo, phone1,
								phone2,
								divisions, Email2);
								masterDao.userAuditTrail("assentisk_employees", "1", "add",
								currentTime, Integer.parseInt(userId), ip.getHostAddress());
					}catch(Exception e){
						//dataStatus.add("Error on the data : "+hsrow.getRowNum());
						
						req.setAttribute("message", "Invalid Data File");
						return new ModelAndView("organization/employees",map);
					}
								
								
								if(duplicate.equals("true")){
									notcount=notcount+1;
									dataStatus.add("Duplicate Row : "+hsrow.getRowNum());
								}
								else
								{
									count = count+1;
								}
				    }
				else
				{
					System.out.println("Error Row : "+hsrow.getRowNum()+"Not Inserted Row  : "+EmpName);
					notcount = notcount + 1;
				}
					}
					}
				
				}
			}
			else
			{
				dataStatus.add("Please import valid Data file");	
			}
				if(count>0){					
					dataStatus.add("Succesfully inserted Row : "+count);
					val++;	
				}
				if(notcount>0){
					if(notcount==1){
						dataStatus.add(notcount+" Row is not inserted");
					}else{
						dataStatus.add(notcount+" Rows are not inserted");	
					}
					
				}
				
				
			}//Reading .xlsx files
			else if (fileName.toLowerCase().endsWith(".xlsx")){
         	   
				// Get the workbook instance for XLS file
				XSSFWorkbook wBook = new XSSFWorkbook(file);
				// Get first sheet from the workbook
				XSSFSheet sheet = wBook.getSheetAt(0);
				sheet.setColumnHidden((short) 14, false);
				// Iterate through each rows from first sheet
				Iterator<Row> rowIterator = sheet.rowIterator();
				
				while(rowIterator.hasNext()){
					Row row = rowIterator.next();
					Iterator<Cell> cite = row.cellIterator();
					if(row.getRowNum() != 0){
					while(cite.hasNext()){
						Cell c = cite.next();
						if(c.getColumnIndex()==0){
							try{
								EmpName=c.toString();
								}catch(Exception e){
									EmpName="";
									dataStatus.add("Wrong Data in  Row "+rowIterator.hasNext()+": EmpName - "+e.getMessage());
								}
						}
						if(c.getColumnIndex()==1){
							try{
							DepartmentID = c.toString();
							}catch(Exception e){
							DepartmentID="";
							dataStatus.add("Wrong Data in  Row "+rowIterator.hasNext()+":  Department - "+e.getMessage());
						}
						}if(c.getColumnIndex()==2){
							try{
								LocationID=c.toString();
								}catch(Exception e){
									LocationID="";
									dataStatus.add("Wrong Data in  Row "+rowIterator.hasNext()+": Location -"+e.getMessage());
								}
						}
						if(c.getColumnIndex()==3){
							try{
								locCoun=c.toString();
								}catch(Exception e){
									locCoun="";
									dataStatus.add("Wrong Data in  Row "+rowIterator.hasNext()+": location Country - "+e.getMessage());

								}
						}
						if(c.getColumnIndex()==4){
							try{
								locstate=c.toString();
								}catch(Exception e){
									locstate="";
									dataStatus.add("Wrong Data in  Row "+rowIterator.hasNext()+": location State - "+e.getMessage());
								}
						}
						if(c.getColumnIndex()==5){
							try{
								loccity=c.toString();
								}catch(Exception e){
									loccity="";
									dataStatus.add("Wrong Data in  Row "+rowIterator.hasNext()+": location City -"+e.getMessage());

								}
						}
						if(c.getColumnIndex()==6){
							try{
								locContact=c.toString();
								}catch(Exception e){
									locContact="";
									dataStatus.add("Wrong Data in  Row "+rowIterator.hasNext()+": location Contact Name -"+e.getMessage());
								}
						}
						if(c.getColumnIndex()==7){
							try{
								locEmail=c.toString();
								boolean isValid=false;
								try {
									InternetAddress internetAddress = new InternetAddress(
											locEmail);
									internetAddress.validate();
									isValid = true;
								} catch (AddressException e) {
									dataStatus.add("Wrong Data in  Row "
											+ rowIterator.hasNext() + ": locEmail - "
											+ e.getMessage());
								}
								
								}catch(Exception e){
									locEmail="";
									dataStatus.add("Wrong Data in  Row "+rowIterator.hasNext()+": location Email -"+e.getMessage());
								}
						}
						if(c.getColumnIndex()==8){
							try{
								divisions=c.toString();
								}catch(Exception e){
									divisions="";
									dataStatus.add("Wrong Data in  Row "+rowIterator.hasNext()+": Divisions - "+e.getMessage());
								}
						}
						if(c.getColumnIndex()==9){
							try{
								address=c.toString();
								}catch(Exception e){
									address="";
									dataStatus.add("Wrong Data in  Row "+rowIterator.hasNext()+": address - "+e.getMessage());
								}
						}if(c.getColumnIndex()==10){
							try{
								city=c.toString();
								}catch(Exception e){
									city="";
									dataStatus.add("Wrong Data in  Row "+rowIterator.hasNext()+": city - "+e.getMessage());
								}
						}if(c.getColumnIndex()==11){
							try{
								zip=c.toString();
								}catch(Exception e){
									zip="";
									dataStatus.add("Wrong Data in  Row "+rowIterator.hasNext()+": zip - "+e.getMessage());
								}
						}if(c.getColumnIndex()==12){
							try{
								DataFormatter formatter = new DataFormatter();
								phone1=c.toString();
								String df2 = formatter.formatCellValue(row.getCell((short) 12));
								phone1=df2;
								}catch(Exception e){
									phone1="";
									dataStatus.add("Wrong Data in  Row "+rowIterator.hasNext()+": phone1 - "+e.getMessage());
								}
						}if(c.getColumnIndex()==13){
							try{
								DataFormatter formatter = new DataFormatter();
								phone2=c.toString();
								String df2 = formatter.formatCellValue(row.getCell((short) 12));
								phone2=df2;
								}catch(Exception e){
									phone2="";
									dataStatus.add("Wrong Data in  Row "+rowIterator.hasNext()+": phone2 -"+e.getMessage());
								}
						}
						if(c.getColumnIndex()==3){
							try{
								Email1=c.toString();
								boolean isValid=false;
								try {
									InternetAddress internetAddress = new InternetAddress(
											Email1);
									internetAddress.validate();
									isValid = true;
								} catch (AddressException e) {
									dataStatus.add("Wrong Data in  Row "
											+ rowIterator.hasNext() + ": Email1 - "
											+ e.getMessage());
								}
								}catch(Exception e){
									Email1="";
									dataStatus.add("Wrong Data in  Row "+rowIterator.hasNext()+": Email1 - "+e.getMessage());
								}
						}
						if(c.getColumnIndex()==10){
							try{
								Email2=c.toString();
								boolean isValid=false;
								try {
									InternetAddress internetAddress = new InternetAddress(
											Email2);
									internetAddress.validate();
									isValid = true;
								} catch (AddressException e) {
									dataStatus.add("Wrong Data in  Row "
											+ rowIterator.hasNext() + ": Email2 - "
											+ e.getMessage());
								}
								}catch(Exception e){
									Email2="";
									dataStatus.add("Wrong Data in  Row "+rowIterator.hasNext()+": Email2 - "+e.getMessage());
								}
						}
					
					}
					
						int userdata = 0;
						
						String groupdata="";
						
					
					if(username.equals("")){
						userdata=0;
						reporting="0";
						groupdata="0";
					}
					
					
					if(!LocationID.equals("")){
						LocationID=organizationDao
						.getLocIdByName(LocationID,currentTime,Integer.parseInt(userId),locCoun,locstate,loccity,locContact,locEmail);
						if(LocationID.equals("0")){
							LocationID="";
						}
					}
					if(!DepartmentID.equals("")){
						DepartmentID=organizationDao.getDeparmentIdByName(DepartmentID,currentTime,Integer.parseInt(userId));
						if(DepartmentID.equals("0")){
							DepartmentID="";
						}
					}
					if(!divisions.equals("")){
						
						divisions=organizationDao.getDivisionByName(divisions,currentTime,Integer.parseInt(userId));
						if(divisions.equals("0")){
							divisions="";
						}
					}
			
			if(!EmpName.equals("") && !DepartmentID.equals("") && !divisions.equals("") && !LocationID.equals("")){		
				String duplicate="";	
				try{
				 duplicate=organizationDao.saveEmployeedata(0,				
							DepartmentID, LocationID, EmpName, Email1,
							reporting,groupdata, currentTime,
							currentTime,
							Integer.parseInt(userId),
							currentTime,
							Integer.parseInt(userId),
							status, address,
							city, 
							"",
							"",
							zip, photo, phone1,
							phone2,
							divisions, Email2);
					masterDao.userAuditTrail("assentisk_employees", "1", "add",
							currentTime, Integer.parseInt(userId), ip.getHostAddress());
					
				}catch(Exception e){
					//dataStatus.add("Error on the data : "+hsrow.getRowNum());
					req.setAttribute("message", "Invalid Data File");
					
					return new ModelAndView("organization/employees",map);
				}
					
					if(duplicate.equals("true")){
						notcount=notcount+1;
						dataStatus.add("Duplicate Row : "+row.getRowNum());
					}
					else
					{
						count = count+1;
					}
			    }
			else
			{
				System.out.println("Error Row : "+row.getRowNum()+"Not Inserted Row EmpName : "+EmpName);
				notcount=notcount+1;
			}
				}
				}
				
				if(count>0){
					System.out.println("Succesfully inserted Row :"+count);
					dataStatus.add("Succesfully inserted Row : "+count);
					val++;	
				}
				if(notcount>0){
					dataStatus.add(notcount+" Rows are not inserted");
				}
				
				
				file.close();
				

				File f = new File(fileName);
				
				if (f.exists()) {
					f.delete();
				}
            }
			
			if(dataStatus.size()>0){
				map.addObject("dataStatus", dataStatus);
				map.addObject("datasize", "true");
				
			}
			else
			{
				map.addObject("datasize", "false");
			}
				file.close();
				File f = new File(fileName);
				if (f.exists()) {
					f.delete();
				}
				
		} catch (FileNotFoundException e) {
			e.printStackTrace();
			req.setAttribute("message", "Invalid data file");
		} catch (IOException e){
			e.printStackTrace();
			req.setAttribute("message", "Invalid data file");
		} catch (Exception e){
			e.printStackTrace();
			req.setAttribute("message", "Invalid data file");
		}
		return new ModelAndView("organization/employees",map);
	}








	// downloading excel for Category
	protected ModelAndView downloadExcelForRisk(HttpServletRequest req,
			HttpServletResponse res) throws Exception {

		PrintWriter out = res.getWriter();
		FilesService fs = new FilesService();
		String doc_name = "Sample Copy";
		List<DepartmentBean> getDepartmnentList = organizationDao
				.getDepartmentList();
		List<LocationsBean> getLocationList = organizationDao
				.getLocationsList();
		List<LegalEntitiesBean> divisionList = organizationDao
				.getLegalEntitiesList();

		fs.generateEmployeDemoXls(req, doc_name, getLocationList,
				getDepartmnentList, divisionList);
		try {
			String filename = "" + doc_name + ".xls";

			// set the http content type to "APPLICATION/OCTET-STREAM
			res.setContentType("APPLICATION/OCTET-STREAM");

			// initialize the http content-disposition header to
			// indicate a file attachment with the default filename
			// "myFile.txt"
			String disHeader = "Attachment;Filename=\"" + doc_name + ".xls\"";
			res.setHeader("Content-Disposition", disHeader);

			// transfer the file byte-by-byte to the response object
			File fileToDownload = new File(filename);

			FileInputStream fileInputStream = new FileInputStream(
					fileToDownload);
			int i;
			while ((i = fileInputStream.read()) != -1) {
				out.write(i);
			}
			fileInputStream.close();
			out.close();
		} catch (Exception e) // file IO errors
		{
			e.printStackTrace();
		}
		return null;
	}

	protected ModelAndView checkOldPassword(HttpServletRequest req,
			HttpServletResponse res) throws Exception {

		try {
			PrintWriter out = res.getWriter();
			String id = req.getSession().getAttribute("UserRecordID")
					.toString();
			String empPassword = req.getParameter("empPassword");
			List getRow = organizationDao.checkOldPassword(empPassword, id);
			if (getRow.size() > 0) {
				out.write("exist");
			} else {
				out.write("notexist");
			}

		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return null;
	}

	private ModelAndView auditTrailList(HttpServletRequest req,
			HttpServletResponse res) {

		try {
			out = res.getWriter();
			List<AuditTrail> getList = organizationDao.geAauditTrailList();
			PersonJsonObject personJsonObject = new PersonJsonObject();

			personJsonObject.setAuditTrail(getList);
			Gson gson = new GsonBuilder().setPrettyPrinting().create();
			String json2 = gson.toJson(personJsonObject);
			out.print(json2);

		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return null;

	}

	protected ModelAndView downloadExcelForAssets(HttpServletRequest req,
			HttpServletResponse res) throws Exception {

		PrintWriter out = res.getWriter();
		FilesService fs = new FilesService();
		String doc_name = "Sample Copy";
		List<CountryBean> getCountryList = organizationDao.getCountryData();
		List<CategoriesBean> categoryList = organizationDao.getCategoryList();
		List<BusinessProcessesBean> BusinesList = organizationDao
				.getBusinessList();
		List<ApplicationsBean> appList = organizationDao.getAppList();
		// fs.generateEmployeDemoXls(req,doc_name,getLocationList,getDepartmnentList,divisionList);
		fs.generateAssestDemoXls(req, doc_name, categoryList, getCountryList,
				appList, BusinesList);
		try {
			String filename = "" + doc_name + ".xls";

			// set the http content type to "APPLICATION/OCTET-STREAM
			res.setContentType("APPLICATION/OCTET-STREAM");

			// initialize the http content-disposition header to
			// indicate a file attachment with the default filename
			// "myFile.txt"
			String disHeader = "Attachment;Filename=\"" + doc_name + ".xls\"";
			res.setHeader("Content-Disposition", disHeader);

			// transfer the file byte-by-byte to the response object
			File fileToDownload = new File(filename);

			FileInputStream fileInputStream = new FileInputStream(
					fileToDownload);
			int i;
			while ((i = fileInputStream.read()) != -1) {
				out.write(i);
			}
			fileInputStream.close();
			out.close();
		} catch (Exception e) // file IO errors
		{
			e.printStackTrace();
		}
		return null;
	}

	private ModelAndView importAssets(HttpServletRequest req,
			HttpServletResponse res) throws Exception {
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) req;
		MultipartFile multipartFile = multipartRequest.getFile("myexcel");
		String fileName = multipartFile.getOriginalFilename();
		map = new ModelMap();
		String name = req.getParameter("fileName");
		int status = 0;
		java.util.Date dt = new java.util.Date();
		java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat(
				"yyyy-MM-dd HH:mm:ss");
		String currentTime = sdf.format(dt);

		InetAddress ip = InetAddress.getLocalHost();
		String userId = (String) req.getSession().getAttribute("UserRecordID");

		byte[] b = multipartFile.getBytes();
		FileOutputStream fout = new FileOutputStream(new File(fileName));
		fout.write(b);
		fout.flush();
		fout.close();
		try {
			String Assets = "", category = "", location = "", application = "", business = "";
			String initial = "", quantity = "", country = "", state = "", city = "", contact = "", email = "";
			List<String> dataStatus = new ArrayList<String>();
			int count = 0;
			int notcount = 0;

			FileInputStream file = new FileInputStream(new File(fileName));
			boolean flag = false;

			// Reading .xls files

			if (fileName.toLowerCase().endsWith(".xls")) {
				// Get the workbook instance for XLS file
				HSSFWorkbook workbook = new HSSFWorkbook(file);
				// Get first sheet from the workbook
				HSSFSheet sheet = workbook.getSheetAt(0);
				sheet.setColumnHidden((short) 14, false);
				// Iterate through each rows from first sheet				
				Iterator<Row> rowIterator = sheet.rowIterator();
				if(rowIterator.hasNext())
				{
			
				while (rowIterator.hasNext()) {
					short cellIndex = 0;
					HSSFRow hsrow = (HSSFRow) rowIterator.next();
					System.out.println("check this...hsrow."
							+ hsrow.getRowNum());
					if (hsrow.getRowNum() != 0) {
						if (hsrow instanceof HSSFRow) {
							try {
								Assets = hsrow.getCell((short) 0)
										.getStringCellValue();
							} catch (Exception e) {
								Assets = "";
								System.out.println("Error Row: "
										+ hsrow.getRowNum() + " "
										+ e.getMessage());

								if (e.getMessage() != null) {
									dataStatus
											.add("Wrong Data in  Row "
													+ hsrow.getRowNum()
													+ ": AssetName - "
													+ e.getMessage());
								}
							}
							try {
								category = hsrow.getCell((short) 1)
										.getStringCellValue();
							} catch (Exception e) {
								category = "";
								System.out.println("Error Row: "
										+ hsrow.getRowNum() + " "
										+ e.getMessage());
								if (e.getMessage() != null) {
									dataStatus.add("Wrong Data in  Row "
											+ hsrow.getRowNum()
											+ ": Category - " + e.getMessage());
								}
							}

							try {
								application = hsrow.getCell((short) 2)
										.getStringCellValue();
							} catch (Exception e) {
								application = "";
								System.out.println("Error Row: "
										+ hsrow.getRowNum() + " "
										+ e.getMessage());
								if (e.getMessage() != null) {
									dataStatus.add("Wrong Data in  Row "
											+ hsrow.getRowNum()
											+ ": Application - "
											+ e.getMessage());
								}
							}
							try {
								business = hsrow.getCell((short) 3)
										.getStringCellValue();
							} catch (Exception e) {
								business = "";
								System.out.println("Error Row: "
										+ hsrow.getRowNum() + " "
										+ e.getMessage());
								if (e.getMessage() != null) {
									dataStatus.add("Wrong Data in  Row "
											+ hsrow.getRowNum()
											+ ": BusinessProcess - "
											+ e.getMessage());
								}

							}
							try {
								initial = String.valueOf(hsrow.getCell(
										(short) 4).getNumericCellValue());
								initial = String.valueOf(initial).split("\\.")[0];
							} catch (Exception e) {
								initial = "";
								System.out.println("Error Row: "
										+ hsrow.getRowNum() + " "
										+ e.getMessage());
								if (e.getMessage() != null) {
									dataStatus.add("Wrong Data in  Row "
											+ hsrow.getRowNum()
											+ ": InitialValue - "
											+ e.getMessage());
								}

							}
							try {

								quantity = String.valueOf(hsrow.getCell(
										(short) 5).getNumericCellValue());
								quantity = String.valueOf(quantity)
										.split("\\.")[0];

							} catch (Exception e) {
								quantity = "";
								System.out.println("Error Row: "
										+ hsrow.getRowNum() + " "
										+ e.getMessage());
								if (e.getMessage() != null) {
									dataStatus.add("Wrong Data in  Row "
											+ hsrow.getRowNum()
											+ ": Quantity - " + e.getMessage());
								}

							}

							try {
								location = hsrow.getCell((short) 6)
										.getStringCellValue();
							} catch (Exception e) {
								location = "";
								System.out.println("Error Row: "
										+ hsrow.getRowNum() + " "
										+ e.getMessage());
								if (e.getMessage() != null) {
									dataStatus.add("Wrong Data in  Row "
											+ hsrow.getRowNum()
											+ ": Location - " + e.getMessage());
								}

							}
							try {
								country = hsrow.getCell((short) 7)
										.getStringCellValue();
							} catch (Exception e) {
								country = "";
								System.out.println("Error Row: "
										+ hsrow.getRowNum() + " "
										+ e.getMessage());
								if (e.getMessage() != null) {
									dataStatus.add("Wrong Data in  Row "
											+ hsrow.getRowNum()
											+ ": Location Country - "
											+ e.getMessage());
								}

							}
							try {
								state = hsrow.getCell((short) 8)
										.getStringCellValue();
							} catch (Exception e) {
								state = "";
								System.out.println("Error Row: "
										+ hsrow.getRowNum() + " "
										+ e.getMessage());
								if (e.getMessage() != null) {
									dataStatus.add("Wrong Data in  Row "
											+ hsrow.getRowNum()
											+ ": Location State - "
											+ e.getMessage());
								}

							}
							try {
								city = hsrow.getCell((short) 9)
										.getStringCellValue();
							} catch (Exception e) {
								city = "";
								System.out.println("Error Row: "
										+ hsrow.getRowNum() + " "
										+ e.getMessage());
								if (e.getMessage() != null) {
									dataStatus.add("Wrong Data in  Row "
											+ hsrow.getRowNum()
											+ ": Location City - "
											+ e.getMessage());
								}

							}
							try {
								contact = hsrow.getCell((short) 10)
										.getStringCellValue();
							} catch (Exception e) {
								contact = "";
								System.out.println("Error Row: "
										+ hsrow.getRowNum() + " "
										+ e.getMessage());
								if (e.getMessage() != null) {
									dataStatus.add("Wrong Data in  Row "
											+ hsrow.getRowNum()
											+ ": Location Contact Name - "
											+ e.getMessage());
								}

							}
							try {
								email = hsrow.getCell((short) 11)
										.getStringCellValue();
								boolean isValid = false;
								try {
									//
									// Create InternetAddress object and
									// validated the supplied
									// address which is this case is an email
									// address.
									InternetAddress internetAddress = new InternetAddress(
											email);
									internetAddress.validate();
									isValid = true;
								} catch (AddressException e) {

									dataStatus.add("Wrong Data in  Row "
											+ hsrow.getRowNum()
											+ ": Location Email- "
											+ e.getMessage());
								}
							} catch (Exception e) {
								email = "";
								System.out.println("Error Row: "
										+ hsrow.getRowNum() + " "
										+ e.getMessage());
								if (e.getMessage() != null) {
									dataStatus.add("Wrong Data in  Row "
											+ hsrow.getRowNum()
											+ ": Location Email - "
											+ e.getMessage());
								}

							}

							if (!location.equals("")) {

								location = organizationDao.getLocIdByName(
										location, currentTime, Integer
												.parseInt(userId), country,
										state, city, contact, email);
							} else {
								location = "0";
							}

							if (!application.equals("")) {
								application = organizationDao.getAppByName(
										application, currentTime, Integer
												.parseInt(userId));
							} else {
								application = "0";
							}

							if (!business.equals("")) {
								business = organizationDao.getBusinessByName(
										business, currentTime, Integer
												.parseInt(userId));
							} else {
								business = "0";
							}
							if (!category.equals("")) {
								category = organizationDao.getCategoryByName(
										category, currentTime, Integer
												.parseInt(userId));
							} else {
								category = "";
							}
							if (!category.equals("") && !Assets.equals("")) {
								String duplicate = organizationDao
										.saveAssetData(Assets, category,
												location, application,
												business, "", currentTime,
												Integer.parseInt(userId),
												currentTime, Integer
														.parseInt(userId), "",
												"", initial, quantity);
								masterDao.userAuditTrail("assentisk_assets",
										"1", "Insert", currentTime, Integer
												.parseInt(userId), ip
												.getHostAddress());
								if (duplicate.equals("true")) {
									notcount = notcount + 1;
									dataStatus.add("Duplicate Row : "
											+ hsrow.getRowNum());
								} else {
									count = count + 1;

								}
							} else {
								System.out.println("Error Row : "
										+ hsrow.getRowNum()
										+ "Not Inserted Row Asset Name : "
										+ Assets);
								notcount = notcount + 1;
							}

						}
					}

				}
			}
			else
			{				
				dataStatus.add("Please import valid Data file");
			}
				if (count > 0) {					
					dataStatus.add("Succesfully inserted Row : " + count);

				}
				if (notcount > 0) {
					if(notcount==1)
					{
						dataStatus.add(notcount + " Row is not inserted");
					}
					else
					{
						dataStatus.add(notcount + " Rows are not inserted");	
					}
					
				}

			}// Reading .xlsx files
			else if (fileName.toLowerCase().endsWith(".xlsx")) {

				// Get the workbook instance for XLS file
				XSSFWorkbook wBook = new XSSFWorkbook(file);
				// Get first sheet from the workbook
				XSSFSheet sheet = wBook.getSheetAt(0);
				sheet.setColumnHidden((short) 14, false);
				// Iterate through each rows from first sheet
				Iterator<Row> rowIterator = sheet.rowIterator();

				while (rowIterator.hasNext()) {
					Row row = rowIterator.next();
					Iterator<Cell> cite = row.cellIterator();
					if (row.getRowNum() != 0) {
						while (cite.hasNext()) {
							Cell c = cite.next();
							if (c.getColumnIndex() == 0) {
								try {
									Assets = c.toString();
								} catch (Exception e) {
									Assets = "";
									System.out.println("Error Row: "
											+ row.getRowNum() + " "
											+ e.getMessage());
									if (e.getMessage() != null) {
										dataStatus.add("Wrong Data in  Row "
												+ row.getRowNum()
												+ ": AssetName - "
												+ e.getMessage());
									}

								}
							}
							if (c.getColumnIndex() == 1) {
								try {
									category = c.toString();
								} catch (Exception e) {
									category = "";
									System.out.println("Error Row: "
											+ row.getRowNum() + " "
											+ e.getMessage());
									if (e.getMessage() != null) {
										dataStatus.add("Wrong Data in  Row "
												+ row.getRowNum()
												+ ": Category - "
												+ e.getMessage());
									}
								}
							}
							if (c.getColumnIndex() == 2) {
								try {
									application = c.toString();
								} catch (Exception e) {
									application = "";
									System.out.println("Error Row: "
											+ row.getRowNum() + " "
											+ e.getMessage());
									if (e.getMessage() != null) {
										dataStatus.add("Wrong Data in  Row "
												+ row.getRowNum()
												+ ": Application - "
												+ e.getMessage());
									}

								}
							}
							if (c.getColumnIndex() == 3) {
								try {
									business = c.toString();
								} catch (Exception e) {
									business = "";
									System.out.println("Error Row: "
											+ row.getRowNum() + " "
											+ e.getMessage());
									if (e.getMessage() != null) {
										dataStatus.add("Wrong Data in  Row "
												+ row.getRowNum()
												+ ": BusinessProcess - "
												+ e.getMessage());
									}

								}
							}
							if (c.getColumnIndex() == 4) {
								try {
									initial = c.toString();
								} catch (Exception e) {
									initial = "";
									System.out.println("Error Row: "
											+ row.getRowNum() + " "
											+ e.getMessage());
									if (e.getMessage() != null) {
										dataStatus.add("Wrong Data in  Row "
												+ row.getRowNum()
												+ ": InitialValue - "
												+ e.getMessage());
									}

								}
							}
							if (c.getColumnIndex() == 5) {
								try {
									quantity = c.toString();
								} catch (Exception e) {
									quantity = "";
									System.out.println("Error Row: "
											+ row.getRowNum() + " "
											+ e.getMessage());
									if (e.getMessage() != null) {
										dataStatus.add("Wrong Data in  Row "
												+ row.getRowNum()
												+ ": Quantity - "
												+ e.getMessage());
									}

								}
							}
							if (c.getColumnIndex() == 6) {
								try {
									location = c.toString();
								} catch (Exception e) {
									location = "";
									System.out.println("Error Row: "
											+ row.getRowNum() + " "
											+ e.getMessage());
									if (e.getMessage() != null) {
										dataStatus.add("Wrong Data in  Row "
												+ row.getRowNum()
												+ ": Location - "
												+ e.getMessage());
									}

								}
							}
							if (c.getColumnIndex() == 7) {
								try {
									country = c.toString();
								} catch (Exception e) {
									country = "";
									System.out.println("Error Row: "
											+ row.getRowNum() + " "
											+ e.getMessage());
									if (e.getMessage() != null) {
										dataStatus.add("Wrong Data in  Row "
												+ row.getRowNum()
												+ ": Location Country - "
												+ e.getMessage());
									}

								}
							}
							if (c.getColumnIndex() == 8) {
								try {
									state = c.toString();
								} catch (Exception e) {
									state = "";
									System.out.println("Error Row: "
											+ row.getRowNum() + " "
											+ e.getMessage());
									if (e.getMessage() != null) {
										dataStatus.add("Wrong Data in  Row "
												+ row.getRowNum()
												+ ": Location State - "
												+ e.getMessage());
									}

								}
							}
							if (c.getColumnIndex() == 9) {
								try {
									city = c.toString();
								} catch (Exception e) {
									city = "";
									System.out.println("Error Row: "
											+ row.getRowNum() + " "
											+ e.getMessage());
									if (e.getMessage() != null) {
										dataStatus.add("Wrong Data in  Row "
												+ row.getRowNum()
												+ ": Location City - "
												+ e.getMessage());
									}

								}
							}
							if (c.getColumnIndex() == 10) {
								try {
									contact = c.toString();
								} catch (Exception e) {
									contact = "";
									System.out.println("Error Row: "
											+ row.getRowNum() + " "
											+ e.getMessage());
									if (e.getMessage() != null) {
										dataStatus.add("Wrong Data in  Row "
												+ row.getRowNum()
												+ ": Location Contact Name - "
												+ e.getMessage());
									}

								}
							}
							if (c.getColumnIndex() == 11) {
								try {
									email = c.toString();
									boolean isValid = false;
									try {
										//
										// Create InternetAddress object and
										// validated the supplied
										// address which is this case is an
										// email address.
										InternetAddress internetAddress = new InternetAddress(
												email);
										internetAddress.validate();
										isValid = true;
									} catch (AddressException e) {
										if (e.getMessage() != null) {
											dataStatus
													.add("Wrong Data in  Row "
															+ row.getRowNum()
															+ ": Location Email- "
															+ e.getMessage());
										}
									}
								} catch (Exception e) {
									email = "";
									System.out.println("Error Row: "
											+ row.getRowNum() + " "
											+ e.getMessage());
									if (e.getMessage() != null) {
										dataStatus.add("Wrong Data in  Row "
												+ row.getRowNum()
												+ ": Location Email- "
												+ e.getMessage());
									}

								}
							}
						}

						if (!location.equals("")) {
							location = organizationDao.getLocIdByName(location,
									currentTime, Integer.parseInt(userId),
									country, state, city, contact, email);
						} else {
							location = "0";
						}

						if (!application.equals("")) {
							application = organizationDao.getAppByName(
									application, currentTime, Integer
											.parseInt(userId));
						} else {
							application = "0";
						}

						if (!business.equals("")) {
							business = organizationDao.getBusinessByName(
									business, currentTime, Integer
											.parseInt(userId));
						} else {
							business = "0";
						}
						if (!category.equals("")) {
							category = organizationDao.getCategoryByName(
									category, currentTime, Integer
											.parseInt(userId));
						} else {
							category = "";
						}
						if (!category.equals("") && !Assets.equals("")) {
							String duplicate = organizationDao.saveAssetData(
									Assets, category, location, application,
									business, "", currentTime, Integer
											.parseInt(userId), currentTime,
									Integer.parseInt(userId), "", "", initial,
									quantity);
							masterDao.userAuditTrail("assentisk_assets", "1",
									"Insert", currentTime, Integer
											.parseInt(userId), ip
											.getHostAddress());
							if (duplicate.equals("true")) {
								notcount = notcount + 1;
								dataStatus.add("Duplicate Row : "
										+ row.getRowNum());
							} else {
								count = count + 1;

							}
						} else {
							System.out
									.println("Error Row : " + row.getRowNum()
											+ "Not Inserted Row Asset Name : "
											+ Assets);

						}
					}
				}

				if (count > 0) {
					System.out.println("Succesfully inserted Row :" + count);
					dataStatus.add("Succesfully inserted Row : " + count);

				}
				if (notcount > 0) {
					if(notcount==1)
					{
						dataStatus.add(notcount + " Row is not inserted");
					}
					else
					{
						dataStatus.add(notcount + " Rows are not inserted");	
					}
				}

				file.close();

				File f = new File(fileName);

				if (f.exists()) {
					f.delete();
				}
			}

			if (dataStatus.size() > 0) {
				map.addObject("dataStatus", dataStatus);
				map.addObject("datasize", "true");

			} else {
				map.addObject("datasize", "false");
			}
			file.close();
			File f = new File(fileName);
			if (f.exists()) {
				f.delete();
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
			req.setAttribute("message", "Invalid data file");
		} catch (IOException e) {
			e.printStackTrace();
			req.setAttribute("message", "Invalid data file");
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("message", "Invalid data file");
		}
		return new ModelAndView("assests/assets", map);
	}

	public String getContextPathForDirectory(HttpServletRequest request,
			String dirName) {
		HttpSession session = request.getSession(true);
		ServletContext context = session.getServletContext();
		String curDir = context.getRealPath(request.getContextPath());
		curDir = curDir.replaceAll("\\\\", "/");
		String targetDir = curDir.substring(0, curDir.lastIndexOf("/")) + "/"
				+ dirName;
		return targetDir;
	}

	public ModelAndView checkreportingname(HttpServletRequest req,
			HttpServletResponse res) {
		try {
			PrintWriter out = res.getWriter();
			String reporting = req.getParameter("reporting");
			int firstBracket = reporting.indexOf('(');
			String UserName="0";
			System.out.println("firstBracket---"+firstBracket);
			if(firstBracket>0){
			  UserName = reporting.substring(firstBracket + 1,
			 reporting.indexOf(')', firstBracket));
			} 			 
//			reporting += "(" + reporting + ")";
//			int firstBracket = reporting.indexOf('(');
//			String UserName = reporting.substring(firstBracket + 1, reporting
//					.indexOf(')', firstBracket));
			List<EmployeeBean> getRow = organizationDao.checkResponsibleHead(UserName);
			if (getRow.size() > 0) {
				System.out.println("inside if");
				out.write("exist");
			} else {
				System.out.println("else");
				out.write("notexist");
			}

		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return null;
	}
	
	private ModelAndView getemployee(HttpServletRequest req,
			HttpServletResponse res) {
		try {
			out = res.getWriter();
			String rowId = req.getParameter("rowId");
			System.out.println("hi check this>empid>>"+rowId);
			List getEmpList = organizationDao.getEmpList(rowId);
			String data="<select id='listOfEmp'>";
			
			if(getEmpList.size()>0){
				for(int i=0;i<getEmpList.size();i++){
					Map m=(Map) getEmpList.get(i);
					data=data+" <option value='"+m.get("EmployeeID")+"'>"+m.get("EmpName")+"</option>";
				}
			}
			data=data+"</select>";
		out.print(data);
			
		} catch (Exception exception){
			exception.printStackTrace();
		}
		return null;
	}
	
	private ModelAndView updateemployeeRecord(HttpServletRequest req,
			HttpServletResponse res) {
		try{
			String empid = req.getParameter("empid");
			String rowId = req.getParameter("rowId");
			
			organizationDao.updateTaskRecord(Integer.parseInt(empid),Integer.parseInt(rowId));
			
			organizationDao.deleteEmployee(Integer.parseInt(rowId));
			
		}
		catch(Exception e){
			e.printStackTrace();
		}
		
		return null;
	}
	
}
