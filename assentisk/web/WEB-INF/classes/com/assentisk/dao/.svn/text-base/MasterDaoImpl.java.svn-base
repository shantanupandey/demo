package com.assentisk.dao;

import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;

import com.assentisk.bean.CityBean;
import com.assentisk.bean.CountryBean;
import com.assentisk.bean.MasterBean;
import com.assentisk.bean.StateBean;
import com.assentisk.bean.VendorCategoryBean;
import com.assentisk.util.DBUtill;

public class MasterDaoImpl implements MasterDao{

	DBUtill dbUtil = new DBUtill();
	
	JdbcTemplate jdbcTemplate = new JdbcTemplate();

	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	@SuppressWarnings("unchecked")
	public List<MasterBean> getList() {		
		List<MasterBean> list = jdbcTemplate.queryForList("select *from assentisk_country order by CountryID");
		return list;
	}

	public void savestate(String statename, Integer countryid, Integer isactive) {
		
		String query = "insert into assentisk_state(StateName, CountryID, IsActive) values('"+statename+"','"+countryid+"','"+isactive+"')";
		jdbcTemplate.execute(query);		
		
	}

	@SuppressWarnings("unchecked")
	public List getCountryList() {
		List list = jdbcTemplate.queryForList("select *from assentisk_country order by CountryName");
		return list;
	}

	@SuppressWarnings("unchecked")
	public List<StateBean> getStateList() {
		List<StateBean> list = jdbcTemplate.queryForList("select ass.StateID,ass.StateName,ass.CountryID,ac.CountryName,ass.IsActive from assentisk_state ass join assentisk_country ac on ac.CountryID = ass.CountryID order by ass.StateID");
		return list;
	}

	@SuppressWarnings("unchecked")
	public List<StateBean> getStateById(Integer stateid) {
		List<StateBean> list = jdbcTemplate.queryForList("select *from assentisk_state where StateID = '"+stateid+"'");
		return list;
	}

	public void updatestate(Integer stateid, String statename, Integer countryid,
			Integer isactive) {
		
		String query = "update assentisk_state set StateName = '"+statename+"' , CountryID = '"+countryid+"', IsActive = '"+isactive+"' where StateID = '"+stateid+"' ";
		jdbcTemplate.execute(query);		
		
		
	}

	public void saveCountry(String countryname, Integer isactive) {			
		String query = "insert into assentisk_country(CountryName ,IsActive) values('"+countryname+"','"+isactive+"')";
		jdbcTemplate.execute(query);
		
	}

	public void updateCountry(Integer countryid, String countryname,
			Integer isactive) {
		String query = "update assentisk_country set CountryName = '"+countryname+"', IsActive = '"+isactive+"' where CountryID = '"+countryid+"' ";
		jdbcTemplate.execute(query);	
		
	}

	@SuppressWarnings("unchecked")
	public List<CountryBean> getCountryById(Integer countryid) {		
		List<CountryBean> list = jdbcTemplate.queryForList("select *from assentisk_country where CountryID = '"+countryid+"'");
		return list;
	}

	@SuppressWarnings("unchecked")
	public List<CityBean> getCityList() {		
		List<CityBean> list = jdbcTemplate.queryForList("select ac.CityID, ac.CityName, ac.StateID, ac.CountryID, ac.IsActive,acn.CountryName,ass.StateName from assentisk_city ac join assentisk_country acn on ac.CountryID = acn.CountryID join assentisk_state ass on ass.StateID = ac.StateID order by ac.CityID");
		return list;
	}

	public void saveCity(String cityname, Integer stateid, Integer countryid,
			Integer isactive) {
		String query = "insert into assentisk_city(CityName, StateID,CountryID, IsActive) values('"+cityname+"','"+stateid+"','"+countryid+"','"+isactive+"')";
		jdbcTemplate.execute(query);
		
	}

	@SuppressWarnings("unchecked")
	public List<CityBean> getCityById(Integer cityid) {
		List<CityBean> list = jdbcTemplate.queryForList("select *from assentisk_city where CityID = '"+cityid+"'");
		return list;
	}

	public void updateCity(Integer cityid, String cityname, Integer stateid, Integer countryid,
			Integer isactive) {
		
		String query = "update assentisk_city set CityName = '"+cityname+"', StateID = '"+stateid+"',CountryID='"+countryid+"',IsActive='"+isactive+"' where CityID = '"+cityid+"' ";
		jdbcTemplate.execute(query);
	}

public void deleteCity(Integer cityID) {
		
		String query = "delete from assentisk_city where CityID = '"+cityID+"'";
		jdbcTemplate.execute(query);
	}

	public void deleteCountry(Integer countryID) {
		
		
		String query = "delete from assentisk_country where CountryID = '"+countryID+"'";
		System.out.println(query);
		jdbcTemplate.execute(query);
		
	}

	public void deleteState(Integer stateID) {
		
		String query = "delete from assentisk_state where StateID = '"+stateID+"'";
		jdbcTemplate.execute(query);
		
	}

	@SuppressWarnings("unchecked")
	public List<StateBean> getStateByCountryID(Integer countryid) {
		
		String query = "select *from assentisk_state where CountryID = '"+countryid+"'";
		List<StateBean> stateList = jdbcTemplate.queryForList(query);
		return stateList;
	}

	public void userAuditTrail(String tableName, String rowID, String action,
			String changeDate, Integer changeBy, String ipAddress) {
	
		String query = "insert into assentisk_audittrail (TableName, RowID, Action, ChangedDate, ChangedBy, IPAddress) values ('"+tableName+"','"+rowID+"','"+action+"','"+changeDate+"','"+changeBy+"','"+ipAddress+"')";
		jdbcTemplate.execute(query);
		
	}
	
	@SuppressWarnings("unchecked")
	public List<VendorCategoryBean> getVendorCatList() {
		List<VendorCategoryBean> list = jdbcTemplate.queryForList("select *from assentisk_vendorcat order by id");
		return list;
	}
	
	public void saveVendorCat(String vendorname, Integer isactive){
		String query = "insert into assentisk_vendorcat(VendorCatName ,IsActive) values('"+vendorname+"','"+isactive+"')";
		jdbcTemplate.execute(query);
	}
	
	@SuppressWarnings("unchecked")
	public List<VendorCategoryBean> getVendorCatById(String vendorCatId){
		List<VendorCategoryBean> list = jdbcTemplate.queryForList("select *from assentisk_vendorcat where id = '"+vendorCatId+"'");
		return list;
	}
	
	public void updateVendorCat(String vendorcatID,String vendorname, Integer isactive){
		String query = "update assentisk_vendorcat set VendorCatName='"+vendorname+"' ,IsActive='"+isactive+"' where id ='"+vendorcatID+"'";
		jdbcTemplate.execute(query);
	}

	public void deleteVendorCategory(String vendorCatId) {
	
		String query = "delete from assentisk_vendorcat where id = '"+vendorCatId+"'";
		jdbcTemplate.execute(query);
	}

	@SuppressWarnings("unchecked")
	public List<CountryBean> checkCountryName(String countryname) {
		
		String query = "select *from assentisk_country where CountryName='"+countryname+"'";
		List<CountryBean> getRow = jdbcTemplate.queryForList(query);
		return getRow;
		
	}

	@SuppressWarnings("unchecked")
	public List<StateBean> checkStateName(String statename, Integer countryID) {
		
		String query = "select StateName from assentisk_state where StateName = '"+statename+"' and CountryID = '"+countryID+"'";
		List<StateBean> getRow = jdbcTemplate.queryForList(query);
		return getRow;
	}

	@SuppressWarnings("unchecked")
	public List<VendorCategoryBean> checkVendorCategoryName(
			String vendorCategoryName) {
		
		String query = "select VendorCatName from assentisk_vendorcat where VendorCatName='"+vendorCategoryName+"'";
		List<VendorCategoryBean> getRow = jdbcTemplate.queryForList(query);
		return getRow;
	}

	 public List<CountryBean> checkRiskLibrary(String fileName) {
		  List list = jdbcTemplate.queryForList("select * from riskdcoument where Doc_name='"+fileName+"'");
		  return list;
		 }
		
	
}
