package com.casmax.admin.command;

public class Files {

	private Integer Id,certIssued;
	private Integer Candid;
	private String CourseId;
	private byte[] file;
	private String issueDate, expiryDate ,initial_Cert_Alert;
	private String fileName;
	private String tStatus;
	private String trainingId;
	private String type;
	private String crangeid;
	private String rangeid;
	private String rcandid;
	private String rcatrec;
	private String training_Title,description;
	
	public Integer getId() {
		return Id;
	}

	public void setId(Integer id) {
		Id = id;
	}

	public Integer getCandid() {
		return Candid;
	}

	public void setCandid(Integer candid) {
		Candid = candid;
	}

	public String getCourseId() {
		return CourseId;
	}

	public void setCourseId(String courseId) {
		CourseId = courseId;
	}

	public byte[] getFile() {
		return file;
	}

	public void setFile(byte[] file) {
		this.file = file;
	}

	public void setIssueDate(String issueDate) {
		this.issueDate = issueDate;
	}

	public String getIssueDate() {
		return this.issueDate;
	}

	public void setExpiryDate(String expiryDate) {
		this.expiryDate = expiryDate;
	}

	public String getExpirydate() {
		return this.expiryDate;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getFileName() {
		return this.fileName;
	}

	public void setTStatus(String tStatus) {
		this.tStatus = tStatus;
	}

	public String getTStatus() {
		return this.tStatus;
	}

	public String getTrainingId() {
		return this.trainingId;
	}

	public void setTrainingId(String trainingId) {
		this.trainingId = trainingId;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getType() {
		return this.type;
	}

	public String getCrangeid() {
		return crangeid;
	}

	public void setCrangeid(String crangeid) {
		this.crangeid = crangeid;
	}

	public String getRangeid() {
		return rangeid;
	}

	public void setRangeid(String rangeid) {
		this.rangeid = rangeid;
	}

	public String getRcandid() {
		return rcandid;
	}

	public void setRcandid(String rcandid) {
		this.rcandid = rcandid;
	}

	public String getRcatrec() {
		return rcatrec;
	}

	public void setRcatrec(String rcatrec) {
		this.rcatrec = rcatrec;
	}

	public String getExpiryDate() {
		return expiryDate;
	}
	
	public void setTraining_Title(String training_Title)
	{
		this.training_Title=training_Title;
	}
	public String getTraining_Title()
	{
		return this.training_Title;
	}
	public void setDescription(String description)
	{
		this.description=description;
	}
	public String getDescription()
	{
		return this.description;
	}
	public void setCertIssued(Integer certIssued)
	{
		this.certIssued = certIssued;
	}
	public Integer getCertIssued()
	{
		return this.certIssued;
	}
	public void setInitial_Cert_Alert(String initial_Cert_Alert)
	{
		this.initial_Cert_Alert =initial_Cert_Alert;
	}
	public String getInitial_Cert_Alert()
	{
		return this.initial_Cert_Alert;
	}
}
