package com.assentisk.dao;

import java.util.List;

import com.assentisk.bean.ApplicationsBean;
import com.assentisk.bean.BusinessProcessesBean;
import com.assentisk.bean.CityBean;
import com.assentisk.bean.CompanyBean;
import com.assentisk.bean.ControlCategoryBean;
import com.assentisk.bean.DepartmentBean;
import com.assentisk.bean.EmployeeBean;
import com.assentisk.bean.GroupBean;
import com.assentisk.bean.LanguageKeysBean;
import com.assentisk.bean.LegalEntitiesBean;
import com.assentisk.bean.LocationsBean;
import com.assentisk.bean.RiskBean;
import com.assentisk.bean.StateBean;
import com.assentisk.bean.UserRecordBean;
import com.assentisk.bean.VendorBean;
import com.assentisk.bean.VendorContactBean;
import com.assentisk.bean.employeesBean;

public interface RegulationDao {

	void addFields(String fileName, String controlID, String risk,
			String controlObjective, String controlDescription, String testSteps, int businessId, String controlCategory);

	List getFile(String fileName);

	void UpdateFields(String string, String string2, String string3,
			String string4, String string5, String string6);

	void removeFields(String fileName);

	List<RiskBean> getRiskList();

	List getFileDetail(String docName);

	List<RiskBean> getControlsList(String riskLibrary);

	List<RiskBean> getTestList(String riskLibrary);
	public List getFileDetail();
	
	public List<RiskBean>  checkControlID(String controlID);
	
	public List<RiskBean> saveControler(String docName, String controlID, String risk, String controlObjective, String controlDescription, String testSteps,String controlcategory,String businessProc);
	
	public List<RiskBean> getControlById(Integer id);
	
	public List<RiskBean> updateControler(String id, String docName, String controlID, String risk,
			String controlObjective, String controlDescription, String testSteps,String controlcategory,
			String businessProc);
	
	public void deleteControlById(Integer id); 
	
	public List<RiskBean> getControlListByDoc(String library);
	
	public void saveTest(String library, String controlID, String testStep);
	
	public void deleteTestById(Integer id);
	
	public void uploadTestDoc(Integer testid, String filename,String filetype,String type);

	List updateTest(String id);

	void updateTestbyID(String testid, String controlid, String teststep);

	List getTest(String id);

	void savecontrolCategory(String controlCategory, String buisnessProcess,
			String parent, String userId);

	List<ControlCategoryBean> getControlCategoryList();

	List<BusinessProcessesBean> getBusinessProcessesList();

	List<ControlCategoryBean> getcontrolCategoryParentList();

	List<ControlCategoryBean> getControlChildsList(String ctrlCategoryName);

	void updatecontrolCategory(String controlCategory, String buisnessProcess,
			String parent, String userId, String id);

	String getbusinesProcID(String businessProc);

	void updatecontCategory(String controlCategory, String buisnessProcess,
			String parent, String userId, String id);

	void savecontrolTreeCategory(String controlCategory,
			String buisnessProcess, String parent, String id);

	List getControlCategoryById(String parent);

	int getMaxId();

	List getTreeValue();

	void updatecontrolCategory(String renameVal, String treeNodeId);

	void saveTree(String treeValue);

	void deleteControlCategoryNode(String id);
	
	}

	

