package com.assentisk.bean;

import java.util.Date;

import com.mysql.jdbc.jdbc2.optional.MysqlDataSource;

@SuppressWarnings("all")
public class RiskBean {

	protected String Doc_name;
	protected String Control_ID;
	protected String Risk;
	protected String Control_Objective;
	protected String Control_Description;
	protected String Test_Steps;
	public String getDoc_name() {
		return Doc_name;
	}
	public void setDoc_name(String docName) {
		Doc_name = docName;
	}
	public String getControl_ID() {
		return Control_ID;
	}
	public void setControl_ID(String controlID) {
		Control_ID = controlID;
	}
	public String getRisk() {
		return Risk;
	}
	public void setRisk(String risk) {
		Risk = risk;
	}
	public String getControl_Objective() {
		return Control_Objective;
	}
	public void setControl_Objective(String controlObjective) {
		Control_Objective = controlObjective;
	}
	public String getControl_Description() {
		return Control_Description;
	}
	public void setControl_Description(String controlDescription) {
		Control_Description = controlDescription;
	}
	public String getTest_Steps() {
		return Test_Steps;
	}
	public void setTest_Steps(String testSteps) {
		Test_Steps = testSteps;
	}
	
	
	
	
	
	
}
