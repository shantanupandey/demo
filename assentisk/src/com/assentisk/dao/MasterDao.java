package com.assentisk.dao;

import java.util.List;

import com.assentisk.bean.CityBean;
import com.assentisk.bean.CountryBean;
import com.assentisk.bean.MasterBean;
import com.assentisk.bean.StateBean;
import com.assentisk.bean.VendorCategoryBean;

public interface MasterDao {

	public List<MasterBean> getList();
	
	public void savestate(String statename, Integer countryid, Integer isactive);
	
	public void saveCountry(String countryname, Integer isactive);
	
	public void saveCity(String cityname,Integer stateid, Integer countryid, Integer isactive);
	
	public void updatestate(Integer stateid, String statename, Integer countryid, Integer isactive);
	
	public void updateCountry(Integer countryid, String countryname, Integer isactive);
	
	public void updateCity(Integer cityid, String cityname,Integer stateid, Integer countryid, Integer isactive);
	
	@SuppressWarnings("unchecked")
	public List getCountryList();
	
	public List<StateBean> getStateList();
		
	public List<StateBean> getStateById(Integer stateid);
	
	public List<CountryBean> getCountryById(Integer countryid);
	
	public List<CityBean> getCityById(Integer cityid);
	
	public List<CityBean> getCityList();
	
	public void deleteCountry(Integer countryID);
	
	public void deleteState(Integer stateID);
	
	public void deleteCity(Integer cityID);

	public void userAuditTrail(String tableName, String rowID, String action, String changeDate, Integer changeBy, String ipAddress);

	public List<VendorCategoryBean> getVendorCatList();
	
	public void saveVendorCat(String vendorname, Integer isactive);
	
	public List<VendorCategoryBean> getVendorCatById(String vendorCatId);
	
	public void updateVendorCat(String vendorID,String vendorname, Integer isactive);
	
	public void deleteVendorCategory(String vendorCatId);
	
	public List<CountryBean> checkCountryName(String countryname);
	
	public List<StateBean> checkStateName(String statename, Integer countryID);
	
	public List<VendorCategoryBean> checkVendorCategoryName(String vendorCategoryName);

	public List<CountryBean> checkRiskLibrary(String fileName);
	
}
