package com.huddle.dbo;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;



@Entity
@Table(name="RDS")
public class RDs implements Serializable, Huddle{
	
	@Id
	@Column(name="RD_ID", nullable=false)
	private long rdId;
	
	@Column(name="RD_TITLE")
	private String rdTitle;
	
	@Column(name="RD_APP")
	private String rdApp;
	
	@Column(name="RD_SCH_DT")
	private Date rdSchDt;
	
	@Column(name="RD_ACT_DT")
	private Date rdActDt;
	
	@Column(name="RD_STATUS")
	private String rdStatus;
	
	@Column(name="RD_ASSIGNED_TO")
	private String rdAssignedTo;
	
	@Column(name="RD_EST")
	private Double rdEst;
	
	@Column(name="RD_ACT")
	private Double rdAct;

	public long getRdId() {
		return rdId;
	}

	public void setRdId(long rdId) {
		this.rdId = rdId;
	}

	public String getRdTitle() {
		return rdTitle;
	}

	public void setRdTitle(String rdTitle) {
		this.rdTitle = rdTitle;
	}

	public Date getRdSchDt() {
		return rdSchDt;
	}

	public void setRdSchDt(Date rdSchDt) {
		this.rdSchDt = rdSchDt;
	}

	public Date getRdActDt() {
		return rdActDt;
	}

	public void setRdActDt(Date rdActDt) {
		this.rdActDt = rdActDt;
	}

	public String getRdStatus() {
		return rdStatus;
	}

	public void setRdStatus(String rdStatus) {
		this.rdStatus = rdStatus;
	}

	public String getRdAssignedTo() {
		return rdAssignedTo;
	}

	public void setRdAssignedTo(String rdAssignedTo) {
		this.rdAssignedTo = rdAssignedTo;
	}

	public Double getRdEst() {
		return rdEst;
	}

	public void setRdEst(Double rdEst) {
		this.rdEst = rdEst;
	}

	public Double getRdAct() {
		return rdAct;
	}

	public void setRdAct(Double rdAct) {
		this.rdAct = rdAct;
	}

	public String getRdApp() {
		return rdApp;
	}

	public void setRdApp(String rdApp) {
		this.rdApp = rdApp;
	}

}
