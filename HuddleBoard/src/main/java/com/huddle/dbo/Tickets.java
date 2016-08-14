package com.huddle.dbo;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="TICKETS")
public class Tickets implements Serializable, Huddle{

	@Id
	@Column(name="TICKET_ID")
	private long ticketId;
	
	@Column(name="TICKET_PRIORITY")
	private String ticketPriority;
	
	@Column(name="TICKET_APP")
	private String ticketApp;
	
	@Column(name="TICKET_STATUS")
	private String ticketStatus;
	
	@Column(name="TICKET_ASSIGNED_TO")
	private String ticketAssignedTo;
	
	@Column(name="TICKET_SLA_DT")
	private Date ticketSLADt;
	
	@Column(name="TICKET_CLOSED_DT")
	private Date ticketClosedDt;
	
	@Column(name="TICKET_RCA")
	private String ticketRCA;
	
	@Column(name="TICKET_EFFORTS")
	private Double ticketEfforts;

	public long getTicketId() {
		return ticketId;
	}

	public void setTicketId(long ticketId) {
		this.ticketId = ticketId;
	}

	public String getTicketPriority() {
		return ticketPriority;
	}

	public void setTicketPriority(String ticketPriority) {
		this.ticketPriority = ticketPriority;
	}

	public String getTicketStatus() {
		return ticketStatus;
	}

	public void setTicketStatus(String ticketStatus) {
		this.ticketStatus = ticketStatus;
	}

	public String getTicketAssignedTo() {
		return ticketAssignedTo;
	}

	public void setTicketAssignedTo(String ticketAssignedTo) {
		this.ticketAssignedTo = ticketAssignedTo;
	}

	public Date getTicketSLADt() {
		return ticketSLADt;
	}

	public void setTicketSLADt(Date ticketSLADt) {
		this.ticketSLADt = ticketSLADt;
	}

	public Date getTicketClosedDt() {
		return ticketClosedDt;
	}

	public void setTicketClosedDt(Date ticketClosedDt) {
		this.ticketClosedDt = ticketClosedDt;
	}

	public String getTicketRCA() {
		return ticketRCA;
	}

	public void setTicketRCA(String ticketRCA) {
		this.ticketRCA = ticketRCA;
	}

	public Double getTicketEfforts() {
		return ticketEfforts;
	}

	public void setTicketEfforts(Double ticketEfforts) {
		this.ticketEfforts = ticketEfforts;
	}

	public String getTicketApp() {
		return ticketApp;
	}

	public void setTicketApp(String ticketApp) {
		this.ticketApp = ticketApp;
	}

}
