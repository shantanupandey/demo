package com.assentisk.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;

import com.assentisk.bean.GroupBean;
import com.assentisk.util.DBUtill;

public class GroupDaoImpl implements GroupDao {

	DBUtill dbUtil = new DBUtill();

	JdbcTemplate jdbcTemplate = new JdbcTemplate();

	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	@SuppressWarnings("unchecked")
	public List<GroupBean> getList() {
		List<GroupBean> list = jdbcTemplate
				.queryForList("select Gname,Description,GroupID ,IF(LENGTH(Description)>50,'true','false')  as Descriptionlen,LEFT(Description, 100) as Description1  from assentisk_group  order by GroupID");
		return list;
	}

	public void savegroup(String groupname, String Description, Integer isactive) {

		String query = "insert into assentisk_group(Gname, Description, IsActive) values('"
				+ groupname + "','" + Description + "','" + isactive + "')";
		jdbcTemplate.execute(query);

	}

	public void updategroup(String gid, String groupname, String Description,
			Integer isactive) {

		String query = "update assentisk_group set Gname='" + groupname
				+ "',Description='" + Description + "',IsActive='" + isactive
				+ "' where GroupID='" + gid + "'";

		jdbcTemplate.execute(query);

	}

	@SuppressWarnings("unchecked")
	public List getgroup(String id) {
		List list = jdbcTemplate
				.queryForList("select * from assentisk_group where GroupID='"
						+ id + "'");
		return list;
	}

	public void deletegroup(String gid) {

		String query = "delete from assentisk_group where GroupID='" + gid
				+ "'";
		jdbcTemplate.execute(query);

	}

	@SuppressWarnings("unchecked")
	public List getpermission(String id) {
		List list = jdbcTemplate.queryForList("select m.id ,m.modules_name,m.is_milestone,ifnull(concat(m.view_mod, ''),0) 'view_mod', ifnull(concat(m.add_mod, ''),0) 'add_mod'," +
				"ifnull(concat(m.edit_mod, ''),0) 'edit_mod', ifnull(concat(m.delete_mod, ''),0) 'delete_mod'," +
				" ifnull(concat(m.per_mod, ''),0) 'per_mod',ifnull(concat(m.sch_mod, ''),0) 'sch_mod'," +
				"ifnull(concat(m.copy_mod, ''),0) 'copy_mod', ifnull(concat(gp.view_mod, ''),0) 'gp_view_mod'," +
				"ifnull(concat(gp.add_mod, ''),0) 'gp_add_mod', ifnull(concat(gp.edit_mod, ''),0) 'gp_edit_mod',ifnull(concat(gp.delete_mod, ''),0) 'gp_delete_mod'," +
				"ifnull(concat(gp.per_mod, ''),0) 'gp_per_mod',ifnull(concat(gp.sch_mod, ''),0) 'gp_sch_mod'," +
				"ifnull(concat(gp.copy_mod, ''),0) 'gp_copy_mod'from assentisk_modules as m  LEFT JOIN assentisk_grouppermission as gp ON m.id=gp.moduleId and gp.groupId='"+id+"' order by m.id");
		return list;
	}

	@SuppressWarnings("unchecked")
	public List getpermissioninspanish(String id) {
		List list = jdbcTemplate
				.queryForList("select m.id ,m.modules_name,m.is_milestone,ifnull(concat(m.view_mod, ''),0) 'view_mod' ,"
						+ " ifnull(concat(m.add_mod, ''),0) 'add_mod',ifnull(concat(m.edit_mod, ''),0) 'edit_mod',"
						+ " ifnull(concat(m.delete_mod, ''),0) 'delete_mod', ifnull(concat(m.per_mod, ''),0) 'per_mod',"
						+ " ifnull(concat(gp.view_mod, ''),0) 'gp_view_mod',ifnull(concat(gp.add_mod, ''),0) 'gp_add_mod',"
						+ " ifnull(concat(gp.edit_mod, ''),0) 'gp_edit_mod',ifnull(concat(gp.delete_mod, ''),0) 'gp_delete_mod',ifnull(concat(gp.per_mod, ''),0) 'gp_per_mod'"
						+ " from assentisk_modules_spanish as m  LEFT JOIN assentisk_grouppermission as gp "
						+ " ON m.id=gp.moduleId and gp.groupId='"
						+ id
						+ "' order by m.id");
		return list;
	}
	
	public List getGroupPermissionList(String query) {
		List list = jdbcTemplate.queryForList(query.toString());
		return list;
	}

	public void fireQuery(String query) {

		jdbcTemplate.execute(query);
	}

	public void userAuditTrail(String tableName, String rowID, String action,
			String changeDate, Integer changeBy, String ipAddress) {

		String query = "insert into assentisk_audittrail (TableName, RowID, Action, ChangedDate, ChangedBy, IPAddress) values ('"
				+ tableName
				+ "','"
				+ rowID
				+ "','"
				+ action
				+ "','"
				+ changeDate + "','" + changeBy + "','" + ipAddress + "')";
		jdbcTemplate.execute(query);

	}

	public void deletegroupPermission(String id) {
		String query = "delete from assentisk_grouppermission where groupId='"
				+ id + "'";
		jdbcTemplate.execute(query);

	}

	public Map copygroup(String id) {
		Map map = jdbcTemplate
				.queryForMap("select * from assentisk_group where GroupID='"
						+ id + "'");

		return map;

	}

	public String pastegroup(Map getGroupList, String id) {
		int isActive;
		int count = 0;
		Map Grpname = null;
		Map Grpname1 = null;
		if (getGroupList.get("IsActive").equals("true")) {
			isActive = 1;
		} else {
			isActive = 0;
		}
		try {

			count = jdbcTemplate
					.queryForInt("Select count(Gname) from assentisk_group where Gname='"
							+ getGroupList.get("Gname") + "_copy'");

			if (count > 0) {
				return "Group Name already copied.";
			}
			if (getGroupList.get("Gname").toString().substring(
					getGroupList.get("Gname").toString().length() - 4,
					getGroupList.get("Gname").toString().length()).equals(
					"copy")) {
				return "Group Name already copied.";
			}
		} catch (Exception e) {

		}
		String query = "insert into assentisk_group(Gname, Description, IsActive) values('"
				+ getGroupList.get("Gname")
				+ "_copy','"
				+ getGroupList.get("Description")
				+ "_copy','"
				+ isActive
				+ "')";
		jdbcTemplate.execute(query);

		List permissionmap = jdbcTemplate
				.queryForList("select * from assentisk_grouppermission where groupId='"
						+ id + "'");

		int groupId = jdbcTemplate
				.queryForInt("Select max(GroupID) from assentisk_group");
		for (int i = 0; i < permissionmap.size(); i++) {
			Map pmap = (Map) permissionmap.get(i);

			String permissionquery = "insert into assentisk_grouppermission( groupId, moduleId, view_mod, add_mod, edit_mod, delete_mod, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy, per_mod) values('"
					+ groupId
					+ "','"
					+ pmap.get("moduleId")
					+ "','"
					+ pmap.get("view_mod")
					+ "','"
					+ pmap.get("add_mod")
					+ "','"
					+ pmap.get("edit_mod")
					+ "','"
					+ pmap.get("delete_mod")
					+ "','"
					+ pmap.get("CreatedDate")
					+ "','"
					+ pmap.get("CreatedBy")
					+ "','"
					+ pmap.get("ModifiedDate")
					+ "','"
					+ pmap.get("ModifiedBy")
					+ "','" + pmap.get("per_mod") + "')";
			jdbcTemplate.execute(permissionquery);
		}

		return "success";
	}

}
