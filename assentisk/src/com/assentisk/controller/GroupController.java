package com.assentisk.controller;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Enumeration;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.ModelMap;
import org.springframework.validation.BindException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;

import com.assentisk.bean.GroupBean;
import com.assentisk.dao.GroupDao;

import com.assentisk.util.UrlUtill;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import java.net.InetAddress;

public class GroupController extends SimpleFormController {

	protected GroupDao groupDao;
	ModelAndView modelAndView;
	PrintWriter out;
	ModelMap map;

	public GroupDao getGroupDao() {
		return groupDao;
	}

	public void setGroupDao(GroupDao groupDao) {
		this.groupDao = groupDao;
	}

	protected ModelAndView showForm(HttpServletRequest req,
			HttpServletResponse res, BindException ex) throws Exception {

		String url = UrlUtill.UrlName(req.getRequestURI());
		if (url.equals("group")) {
			modelAndView = new ModelAndView("group");
		} else if (url.equals("groupList")) {
			return groupList(req, res);
		} else if (url.equals("addgroup")) {
			modelAndView = new ModelAndView("addgroup");
		} else if (url.equals("editgroup")) {
			return editgroup(req, res);
		} else if (url.equals("deleteGroup")) {
			return deletegroup(req, res);
		} else if (url.equals("permission")) {
			return getpermission(req, res);
		} else if (url.equals("pasteGroup")) {
			return pastegroup(req, res);
		}

		return modelAndView;
	}

	@SuppressWarnings("unchecked")
	private ModelAndView pastegroup(HttpServletRequest req,
			HttpServletResponse res) {
		try {
			map = new ModelMap();
			String id = req.getParameter("id");
			Map getGroupList = groupDao.copygroup(id);
			String msg = groupDao.pastegroup(getGroupList, id);
			if (msg.equals("Group Name already copied.")) {
				map.addObject("error", msg);
				out.write("fail");
				return null;
			} else {
				map.addObject("getGroupList", getGroupList);
				out.write("success");
			}

			
			modelAndView = new ModelAndView("group", map);
		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return null;
	}

	protected ModelAndView onSubmit(HttpServletRequest req,
			HttpServletResponse res, Object cmd, BindException errors)
			throws Exception {
		String url = UrlUtill.UrlName(req.getRequestURI());
		if (url.equals("savegroup")) {
			return savegroup(req, res);
		} else if (url.equals("updategroup")) {
			return updategroup(req, res);
		} else if (url.equals("updatepermission")) {
			return updatepermission(req, res);
		}

		return null;

	}

	public ModelAndView groupList(HttpServletRequest req,
			HttpServletResponse res) {

		try {
			out = res.getWriter();

			List<GroupBean> getGroupList = groupDao.getList();
			PersonJsonObject personJsonObject = new PersonJsonObject();
			personJsonObject.setGroupBean(getGroupList);

			Gson gson = new GsonBuilder().setPrettyPrinting().create();
			String json2 = gson.toJson(personJsonObject);
			out.print(json2);

		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return null;
	}

	public ModelAndView savegroup(HttpServletRequest req,
			HttpServletResponse res) {

		try {
			InetAddress ip = InetAddress.getLocalHost();
			String userId = (String) req.getSession().getAttribute(
					"UserRecordID");

			java.util.Date dt = new java.util.Date();
			java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat(
					"yyyy-MM-dd HH:mm:ss");
			String currentTime = sdf.format(dt);

			String groupname = req.getParameter("groupname");
			String groupper = req.getParameter("desc");
			String isactive = req.getParameter("isactive");

			int status = 0;
			if (isactive.equals("true")) {
				status = 1;
			}

			groupDao.userAuditTrail("assentisk_group", "1", "1", currentTime,
					Integer.parseInt(userId), ip.getHostAddress());
			groupDao.savegroup(groupname, groupper, status);

		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return null;
	}

	public ModelAndView updategroup(HttpServletRequest req,
			HttpServletResponse res) {

		try {
			InetAddress ip = InetAddress.getLocalHost();
			String userId = (String) req.getSession().getAttribute(
					"UserRecordID");

			java.util.Date dt = new java.util.Date();
			java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat(
					"yyyy-MM-dd HH:mm:ss");
			String currentTime = sdf.format(dt);

			String gid = req.getParameter("gid");
			String groupname = req.getParameter("groupname");
			String groupdesc = req.getParameter("desc");
			String isactive = req.getParameter("isactive");

			int status = 0;
			if (isactive.equals("true")) {
				status = 1;
			}

			groupDao.userAuditTrail("assentisk_group", "1", "1", currentTime,
					Integer.parseInt(userId), ip.getHostAddress());
			groupDao.updategroup(gid, groupname, groupdesc, status);

		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return null;
	}

	public ModelAndView editgroup(HttpServletRequest req,
			HttpServletResponse res) {
		try {
			map = new ModelMap();
			String id = req.getParameter("id");
			List getGroupList = groupDao.getgroup(id);
			if (getGroupList.size() > 0) {
				map.addObject("getGroupList", getGroupList);
			}

			modelAndView = new ModelAndView("editgroup", map);

		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return modelAndView;
	}

	public ModelAndView deletegroup(HttpServletRequest req,
			HttpServletResponse res) {
		try {

			java.util.Date dt = new java.util.Date();
			java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat(
					"yyyy-MM-dd HH:mm:ss");
			String currentTime = sdf.format(dt);

			InetAddress ip = InetAddress.getLocalHost();
			String userId = (String) req.getSession().getAttribute(
					"UserRecordID");

			String id = req.getParameter("id");

			groupDao.userAuditTrail("assentisk_group", "1", "1", currentTime,
					Integer.parseInt(userId), ip.getHostAddress());
			groupDao.deletegroupPermission(id);
			groupDao.deletegroup(id);

		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return null;
	}

	public ModelAndView getpermission(HttpServletRequest req,
			HttpServletResponse res) {
		try {
			String language = (String) req.getSession().getAttribute("languageVal");
			map = new ModelMap();
			String id = req.getParameter("id");
			map.addObject("groupid", id);
			List getList = null;
			if(language.equals("English"))
			{
				getList = groupDao.getpermission(id);
			}
			else
			{
				getList = groupDao.getpermissioninspanish(id);
			}
			
			if (getList.size() > 0) {
				map.addObject("getPermission", getList);
			}

			modelAndView = new ModelAndView("permission", map);

		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return modelAndView;
	}

	public ModelAndView updatepermission(HttpServletRequest req,
			HttpServletResponse res) {

		try {
			InetAddress ip = InetAddress.getLocalHost();
			String userId = (String) req.getSession().getAttribute(
					"UserRecordID");

			Date now = new Date();
			SimpleDateFormat format = new SimpleDateFormat(
					"yyyy-MM-dd HH:mm:ss");
			String currentDate = format.format(now);
			String columnName = "";

			String id = req.getParameter("groupid");
			Enumeration en = req.getParameterNames();
			String query = "delete from assentisk_grouppermission where groupId='"
					+ id + "' ";
			groupDao.fireQuery(query);

			while (en.hasMoreElements()) {
				System.out.println("getvalue");
				Object objOri = en.nextElement();
				String param = (String) objOri;
				String value = req.getParameter(param);
				String[] viewbymodule = param.split("_");

				if (viewbymodule[0].equals("view")) {
					columnName = "view_mod";
				} else if (viewbymodule[0].equals("add")) {
					columnName = "add_mod";
				} else if (viewbymodule[0].equals("edit")) {
					columnName = "edit_mod";
				} else if (viewbymodule[0].equals("delete")) {
					columnName = "delete_mod";
				} else if (viewbymodule[0].equals("per")) {
					columnName = "per_mod";
				}
				else if (viewbymodule[0].equals("sch")) {
						columnName = "sch_mod";
					}
			   else if (viewbymodule[0].equals("copy")) {
						columnName = "copy_mod";
					}

				if (viewbymodule[0].equals("view")
						|| viewbymodule[0].equals("add")
						|| viewbymodule[0].equals("edit")
						|| viewbymodule[0].equals("delete")
						|| viewbymodule[0].equals("per") || viewbymodule[0].equals("sch") ||viewbymodule[0].equals("copy")) {

					query = "select *from assentisk_grouppermission where groupId='"
							+ id + "' and moduleId='" + viewbymodule[1] + "'";
					List getGroupPer = groupDao.getGroupPermissionList(query);
					if (getGroupPer.size() > 0) {
						query = "update assentisk_grouppermission set `"
								+ columnName + "`= '1',ModifiedDate='"
								+ currentDate
								+ "',ModifiedBy='1' where groupId='" + id
								+ "' and moduleId='" + viewbymodule[1] + "'";
					} else {
						query = "insert into assentisk_grouppermission(groupId, moduleId,`"
								+ columnName
								+ "`,CreatedDate,CreatedBy,ModifiedDate,ModifiedBy) values('"
								+ id
								+ "','"
								+ viewbymodule[1]
								+ "','1','"
								+ currentDate
								+ "','1','"
								+ currentDate
								+ "','1')";
					}
					groupDao.fireQuery(query);
				}
			}

			groupDao.userAuditTrail("assentisk_grouppermission", "1", "1",
					currentDate, Integer.parseInt(userId), ip.getHostAddress());

		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return new ModelAndView("group");
	}

}
