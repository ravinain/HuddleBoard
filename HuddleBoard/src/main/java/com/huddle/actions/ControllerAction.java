package com.huddle.actions;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.huddle.dbo.DMLActionImpl;
import com.huddle.dbo.Defects;
import com.huddle.dbo.Huddle;
import com.huddle.dbo.OtherInfo;
import com.huddle.dbo.Projects;
import com.huddle.dbo.Queries;
import com.huddle.dbo.RDs;
import com.huddle.dbo.Tickets;
import com.huddle.util.DateUtils;
import com.huddle.util.StringUtils;

public class ControllerAction {
	
	static Logger logger = Logger.getLogger(DMLActionImpl.class.getName());
	
	public void getData(HttpServletRequest request, HttpServletResponse response) {
		DMLActionImpl dmlObj = new DMLActionImpl();
		Map<String,Object> inputData = new HashMap<String, Object>();
		
		inputData.put("tableName", Projects.class.getName());
		dmlObj.getData(inputData);
		if (StringUtils.avoidNull(inputData.get("message")).equals("success")) {
			request.setAttribute("pmtMessage", "success");
			request.setAttribute("pmtData", inputData.get("data"));
		} else {
			request.setAttribute("pmtMessage", "fail");
		}
		
		inputData.put("tableName", RDs.class.getName());
		dmlObj.getData(inputData);
		if (StringUtils.avoidNull(inputData.get("message")).equals("success")) {
			request.setAttribute("rdMessage", "success");
			request.setAttribute("rdData", inputData.get("data"));
		} else {
			request.setAttribute("rdMessage", "fail");
		}
		
		inputData.put("tableName", Defects.class.getName());
		dmlObj.getData(inputData);
		if (StringUtils.avoidNull(inputData.get("message")).equals("success")) {
			request.setAttribute("defectMessage", "success");
			request.setAttribute("defectData", inputData.get("data"));
		} else {
			request.setAttribute("defectMessage", "fail");
		}
		
		inputData.put("tableName", Tickets.class.getName());
		dmlObj.getData(inputData);
		if (StringUtils.avoidNull(inputData.get("message")).equals("success")) {
			request.setAttribute("ticketMessage", "success");
			request.setAttribute("ticketData", inputData.get("data"));
		} else {
			request.setAttribute("ticketMessage", "fail");
		}
		
		inputData.put("tableName", Queries.class.getName());
		dmlObj.getData(inputData);
		if (StringUtils.avoidNull(inputData.get("message")).equals("success")) {
			request.setAttribute("queryMessage", "success");
			request.setAttribute("queryData", inputData.get("data"));
		} else {
			request.setAttribute("queryMessage", "fail");
		}
		
		inputData.put("tableName", OtherInfo.class.getName());
		dmlObj.getData(inputData);
		if (StringUtils.avoidNull(inputData.get("message")).equals("success")) {
			request.setAttribute("otherInfoMessage", "success");
			request.setAttribute("otherInfoData", inputData.get("data"));
		} else {
			request.setAttribute("otherInfoMessage", "fail");
		}
		
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("jsp/huddle.jsp");
		try {
			requestDispatcher.forward(request, response);
		} catch (Exception e) {
			request.setAttribute("message", "error");
			logger.error(e.getMessage());
		} 
	}
	
	public void processRequest(HttpServletRequest request, HttpServletResponse response){
		DMLActionImpl dmlObj = new DMLActionImpl();
		String type = StringUtils.avoidNull(request.getParameter("type"));
		String flag = StringUtils.avoidNull(request.getParameter("flag"));
		Huddle dataObj = null;
		switch (type) {
		case "PROJECTS":
			dataObj = createProjectObject(request);
			break;
		case "RDS" :
			dataObj = createRDsObject(request);
			break;
		case "TICKETS" :
			dataObj = createTicketsObject(request);
			break;
		case "DEFECTS" :
			dataObj = createDefectsObject(request);
			break;
		case "QUERIES" :
			dataObj = createQueriesObject(request);
			break;
		case "OTHERINFO" :
			dataObj = createOtherInfoObject(request);
			break;
		default:
			break;
		}
		
		Map<String, Object> inputData = new HashMap<String, Object>();
		inputData.put("beanName", dataObj);
		
		inputData.put("filterKey",request.getAttribute("filterKey"));
		inputData.put("filterValue",request.getAttribute("filterValue"));
	
		switch (flag) {
		case "ADD":
			request.setAttribute("result", dmlObj.insertData(inputData));
			break;
		case "UPDATE":
			request.setAttribute("result", dmlObj.updateData(inputData));
			break;
		case "DELETE":
			request.setAttribute("result", dmlObj.deleteData(inputData));
			break;
		case "GET":
			request.setAttribute("result", dmlObj.getData(inputData));
			break;
		}
	}
	
	public Projects createProjectObject(HttpServletRequest request) {
		Projects proj = new Projects();
		proj.setProjectId(Long.parseLong(request.getParameter("ID")));
		proj.setProjectApp(request.getParameter("Application"));
		proj.setProjectAssignedTo(request.getParameter("AssignedTo"));
		proj.setProjectEst(Double.parseDouble(request.getParameter("Estimates")));
		proj.setProjectPercentage(Double.parseDouble(request.getParameter("Percentage")));
		proj.setProjectRelDt(DateUtils.getDateFormatMMDDYYYY(request.getParameter("ReleaseDate")));
		proj.setProjectStatus(request.getParameter("Status"));
		proj.setProjectTitle(request.getParameter("Title"));
		proj.setProjectUsedHrs(Double.parseDouble(request.getParameter("UsedHours")));
		
		String []filterKey = {"PROJECT_ID"};
		String []filterValue = {request.getParameter("ID")};
		request.setAttribute("filterKey", filterKey);
		request.setAttribute("filterValue", filterValue);
		
		return proj;
	}
	
	public RDs createRDsObject(HttpServletRequest request) {
		RDs rd = new RDs();
		rd.setRdId(Long.parseLong(request.getParameter("ID")));
		rd.setRdTitle(request.getParameter("Title"));
		rd.setRdApp(request.getParameter("Application"));
		rd.setRdSchDt(new Date());
		rd.setRdActDt(new Date());
		rd.setRdStatus(request.getParameter("Status"));
		rd.setRdAssignedTo(request.getParameter("AssignedTo"));
		rd.setRdEst(Double.parseDouble(request.getParameter("Estimates")));
		rd.setRdAct(Double.parseDouble(request.getParameter("UsedHours")));
		
		String []filterKey = {"RD_ID"};
		String []filterValue = {request.getParameter("ID")};
		request.setAttribute("filterKey", filterKey);
		request.setAttribute("filterValue", filterValue);
		
		return rd;
	}
	
	public Defects createDefectsObject(HttpServletRequest request) {
		Defects defect = new Defects();
		defect.setDefectId(Long.parseLong(request.getParameter("ID")));
		defect.setDefectApp(request.getParameter("Application"));
		defect.setDefectAssignedTo(request.getParameter("AssignedTo"));
		defect.setDefectCommitted(request.getParameter("Committed"));
		defect.setDefectEfforts(Double.parseDouble(request.getParameter("Efforts")));
		defect.setDefectFixedCancldDt(new Date());
		defect.setDefectRca(request.getParameter("RCA"));
		defect.setDefectRelDt(new Date());
		defect.setDefectSev(request.getParameter("Severity"));
		defect.setDefectSlaDt(new Date());
		defect.setDefectStatus(request.getParameter("Status"));
		
		String []filterKey = {"Defect_ID"};
		String []filterValue = {request.getParameter("ID")};
		request.setAttribute("filterKey", filterKey);
		request.setAttribute("filterValue", filterValue);
		
		return defect;
	}
	
	public Tickets createTicketsObject(HttpServletRequest request) {
		Tickets ticket = new Tickets();
		ticket.setTicketId(Long.parseLong(request.getParameter("ID")));
		ticket.setTicketApp(request.getParameter("Application"));
		ticket.setTicketAssignedTo(request.getParameter("AssignedTo"));
		ticket.setTicketClosedDt(new Date());
		ticket.setTicketEfforts(Double.parseDouble(request.getParameter("Efforts")));
		ticket.setTicketPriority(request.getParameter("Priority"));
		ticket.setTicketRCA(request.getParameter("RCA"));
		ticket.setTicketSLADt(new Date());
		ticket.setTicketStatus(request.getParameter("Status"));
		
		String []filterKey = {"TICKET_ID"};
		String []filterValue = {request.getParameter("ID")};
		request.setAttribute("filterKey", filterKey);
		request.setAttribute("filterValue", filterValue);
		
		return ticket;
	}
	
	public Queries createQueriesObject(HttpServletRequest request) {
		Queries queries = new Queries();
		//queries.setQueryID(Long.parseLong(request.getParameter("ID")));
		queries.setQueryApp(request.getParameter("Application"));
		queries.setQueryAssignedTo(request.getParameter("AssignedTo"));
		queries.setQueryEfforts(Double.parseDouble(request.getParameter("Efforts")));
		queries.setQueryEndDate(new Date());
		queries.setQueryID(1l);
		queries.setQueryPercentage(Double.parseDouble(request.getParameter("Percentage")));
		queries.setQueryStatus(request.getParameter("Status"));
		queries.setQueryTitle(request.getParameter("Title"));
		
		String []filterKey = {"QUERY_ID"};
		String []filterValue = {request.getParameter("ID")};
		request.setAttribute("filterKey", filterKey);
		request.setAttribute("filterValue", filterValue);
		
		return queries;
	}
	
	public OtherInfo createOtherInfoObject(HttpServletRequest request) {
		OtherInfo otherInfo = new OtherInfo();
		otherInfo.setOtherApp(request.getParameter("Application"));
		otherInfo.setOtherCategory(request.getParameter("Category"));
		otherInfo.setOtherID(1l);
		otherInfo.setOtherInfo(request.getParameter("Description"));
		
		String []filterKey = {"OTHER_ID"};
		String []filterValue = {request.getParameter("ID")};
		request.setAttribute("filterKey", filterKey);
		request.setAttribute("filterValue", filterValue);
		
		return otherInfo;
	}

	public void forwardRequest(HttpServletRequest request, HttpServletResponse response) {
		RequestDispatcher rd = request.getRequestDispatcher("jsp/graph.jsp");
		try {
			rd.forward(request, response);
		} catch (ServletException e) {
			logger.equals(e.getMessage());
		} catch (IOException e) {
			logger.equals(e.getMessage());
		}
	}
}
