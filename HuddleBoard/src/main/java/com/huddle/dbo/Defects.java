package com.huddle.dbo;
import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="Defects")
public class Defects implements Serializable, Huddle{

	@Id
	@Column(name="Defect_ID", nullable=false)
	private long defectId;
	
	@Column(name="DEFECT_APP")
	private String defectApp;
	
	@Column(name="Defect_Sev")
	private String defectSev;
	
	@Column(name="Defect_Status")
	private String defectStatus;
	
	@Column(name="Defect_Assigned_To")
	private String defectAssignedTo;
	
	@Column(name="Defect_Efforts")
	private Double defectEfforts;
	
	@Column(name="Defect_Committed")
	private String defectCommitted;
	
	@Column(name="Defect_SLA_DT")
	private Date defectSlaDt;
	
	@Column(name="Defect_Rel_Dt")
	private Date defectRelDt;
	
	@Column(name="Defect_Fixed_Cancld_Dt")
	private Date defectFixedCancldDt;
	
	@Column(name="Defect_RCA")
	private String defectRca;

	public long getDefectId() {
		return defectId;
	}

	public void setDefectId(long defectId) {
		this.defectId = defectId;
	}

	public String getDefectSev() {
		return defectSev;
	}

	public void setDefectSev(String defectSev) {
		this.defectSev = defectSev;
	}

	public String getDefectStatus() {
		return defectStatus;
	}

	public void setDefectStatus(String defectStatus) {
		this.defectStatus = defectStatus;
	}

	public String getDefectAssignedTo() {
		return defectAssignedTo;
	}

	public void setDefectAssignedTo(String defectAssignedTo) {
		this.defectAssignedTo = defectAssignedTo;
	}

	public Double getDefectEfforts() {
		return defectEfforts;
	}

	public void setDefectEfforts(Double defectEfforts) {
		this.defectEfforts = defectEfforts;
	}

	public String getDefectCommitted() {
		return defectCommitted;
	}

	public void setDefectCommitted(String defectCommitted) {
		this.defectCommitted = defectCommitted;
	}

	public Date getDefectSlaDt() {
		return defectSlaDt;
	}

	public void setDefectSlaDt(Date defectSlaDt) {
		this.defectSlaDt = defectSlaDt;
	}

	public Date getDefectRelDt() {
		return defectRelDt;
	}

	public void setDefectRelDt(Date defectRelDt) {
		this.defectRelDt = defectRelDt;
	}

	public Date getDefectFixedCancldDt() {
		return defectFixedCancldDt;
	}

	public void setDefectFixedCancldDt(Date defectFixedCancldDt) {
		this.defectFixedCancldDt = defectFixedCancldDt;
	}

	public String getDefectRca() {
		return defectRca;
	}

	public void setDefectRca(String defectRca) {
		this.defectRca = defectRca;
	}

	public String getDefectApp() {
		return defectApp;
	}

	public void setDefectApp(String defectApp) {
		this.defectApp = defectApp;
	}
	
	
}
