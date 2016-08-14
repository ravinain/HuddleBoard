package com.huddle.dbo;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="Projects")
public class Projects implements Serializable, Huddle {

	@Id
	@Column(name="PROJECT_ID", nullable=false)
	private long projectId;
	
	@Column(name="PROJECT_TITLE")
	private String projectTitle;
	
	@Column(name="PROJECT_APP")
	private String projectApp;
	
	@Column(name="PROJECT_STATUS")
	private String projectStatus;
	
	@Column(name="PROJECT_ASSIGNED_TO")
	private String projectAssignedTo;
	
	@Column(name="PROJECT_PERCENTAGE")
	private Double projectPercentage;
	
	@Column(name="PROJECT_EST")
	private Double projectEst;
	
	@Column(name="PROJECT_USED_HRS")
	private Double projectUsedHrs;
	
	@Column(name="PROJECT_REL_DT")
	private Date projectRelDt;

	public long getProjectId() {
		return projectId;
	}

	public void setProjectId(long projectId) {
		this.projectId = projectId;
	}

	public String getProjectTitle() {
		return projectTitle;
	}

	public void setProjectTitle(String projectTitle) {
		this.projectTitle = projectTitle;
	}

	public String getProjectStatus() {
		return projectStatus;
	}

	public void setProjectStatus(String projectStatus) {
		this.projectStatus = projectStatus;
	}

	public String getProjectAssignedTo() {
		return projectAssignedTo;
	}

	public void setProjectAssignedTo(String projectAssignedTo) {
		this.projectAssignedTo = projectAssignedTo;
	}

	public Double getProjectPercentage() {
		return projectPercentage;
	}

	public void setProjectPercentage(Double projectPercentage) {
		this.projectPercentage = projectPercentage;
	}

	public Double getProjectEst() {
		return projectEst;
	}

	public void setProjectEst(Double projectEst) {
		this.projectEst = projectEst;
	}

	public Double getProjectUsedHrs() {
		return projectUsedHrs;
	}

	public void setProjectUsedHrs(Double projectUsedHrs) {
		this.projectUsedHrs = projectUsedHrs;
	}

	public Date getProjectRelDt() {
		return projectRelDt;
	}

	public void setProjectRelDt(Date projectRelDt) {
		this.projectRelDt = projectRelDt;
	}

	public String getProjectApp() {
		return projectApp;
	}

	public void setProjectApp(String projectApp) {
		this.projectApp = projectApp;
	}
	
}
