package com.huddle.dbo;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="QUERIES")
public class Queries implements Serializable, Huddle{
	
	@Id 
	@GeneratedValue (strategy=GenerationType.AUTO)
	@Column(name="QUERY_ID")
	private long queryID;
	
	@Column(name="QUERY_TITLE")
	private String queryTitle;
	
	@Column(name="QUERY_APP")
	private String queryApp;
	
	@Column(name="QUERY_ASSIGNED_TO")
	private String queryAssignedTo;
	
	@Column(name="QUERY_STATUS")
	private String queryStatus;
	
	@Column(name="QUERY_PERCENTAGE")
	private Double queryPercentage;
	
	@Column(name="QUERY_END_DATE")
	private Date queryEndDate;
	
	@Column(name="QUERY_EFFORTS")
	private Double queryEfforts;

	public long getQueryID() {
		return queryID;
	}

	public void setQueryID(long queryID) {
		this.queryID = queryID;
	}

	public String getQueryTitle() {
		return queryTitle;
	}

	public void setQueryTitle(String queryTitle) {
		this.queryTitle = queryTitle;
	}

	public String getQueryAssignedTo() {
		return queryAssignedTo;
	}

	public void setQueryAssignedTo(String queryAssignedTo) {
		this.queryAssignedTo = queryAssignedTo;
	}

	public String getQueryStatus() {
		return queryStatus;
	}

	public void setQueryStatus(String queryStatus) {
		this.queryStatus = queryStatus;
	}

	public Double getQueryPercentage() {
		return queryPercentage;
	}

	public void setQueryPercentage(Double queryPercentage) {
		this.queryPercentage = queryPercentage;
	}

	public Date getQueryEndDate() {
		return queryEndDate;
	}

	public void setQueryEndDate(Date queryEndDate) {
		this.queryEndDate = queryEndDate;
	}

	public Double getQueryEfforts() {
		return queryEfforts;
	}

	public void setQueryEfforts(Double queryEfforts) {
		this.queryEfforts = queryEfforts;
	}

	public String getQueryApp() {
		return queryApp;
	}

	public void setQueryApp(String queryApp) {
		this.queryApp = queryApp;
	}
	
}
