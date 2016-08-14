<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>
<%@ page isELIgnored ="false" %>
<%@ page import="java.util.Date" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Huddle Board</title>
	<% String currentTime = new Date().toString(); %>
	<link rel="shortcut icon" href="${pageContext.request.contextPath}/images/favicon.ico" type="image/x-icon">
	<link rel="icon" href="${pageContext.request.contextPath}/images/favicon.ico" type="image/x-icon">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/stylesheet/theme1.css?t=<%=currentTime %>"  />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/stylesheet/jquery-ui.css?t=<%=currentTime %>"  />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/stylesheet/jquery.jscrollpane.css?t=<%=currentTime %>" media="all" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/stylesheet/validationEngine.jquery.css?t=<%=currentTime %>" media="all" />

	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.9.1.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-ui.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.jscrollpane.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.validationEngine-en.js?t=<%=currentTime %>"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.validationEngine.js?t=<%=currentTime %>"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/huddle.js?t=<%=currentTime %>"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/common.js?t=<%=currentTime %>"></script>

	<script>
		$(window).scroll(function(e) {
		    var windowScroll = $(window).scrollTop();
		    $('.bgImage').css('margin-top', windowScroll);
		});
		$(document).ready(function(){
			var settings = {
					showArrows: true,
					autoReinitialise: true,
					mouseWheelSpeed : 120,
					horizontalGutter: 10,
					arrowScrollOnHover: true

				};
				var pane = $('.scroll-pane')
				pane.jScrollPane(settings);
				
				$("form").validationEngine('attach', {
					promptPosition:"bottomLeft",
					relative: true,
					overflownDIV:"#divOverflown"
				});
		});
	</script>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<jsp:include page="theme.jsp"></jsp:include>
	<img src="${pageContext.request.contextPath}/images/bg7.png" class="bgImage" />
	<div class="theme1" id="themeDiv">
		<table class="headerTable">
			<colgroup>
				<col width="20%">
				<col width="60%">
				<col width="20%">
			</colgroup>
			<tr>
				<td class="heading" colspan="3">
					<img src="${pageContext.request.contextPath}/images/hb3.jpg" class="hb" />
				</td>
			<tr>
			<tr>
				<td class="teamMember">
					<table>
						<tr>
							<td>Ravi Kumar</td>
						</tr>
						<tr>
							<td>Asmita Deshmane</td>
						</tr>
						<tr>
							<td>Yuti Nangliya</td>
						</tr>
					</table>
				</td>
				<td class="app">
					MST
				</td>
				<td class="dt">
					02-JUL-14<br />
					Wednesday
				</td>
			</tr>
		</table>
		<div class="mainDiv scroll-pane">
		<table class="mainTable">
			<colgroup>
				<col width="20%">
				<col width="60%">
				<col width="20%">
			</colgroup>
			<tr>
				<td colspan="3" class="subHeading">
				<img src="${pageContext.request.contextPath}/images/collapse.png" align="left" id="pmtExpColl" class="expColl" onclick="expandCollapse(this, 'pmtTableId')"/>
					PMTs
				</td>
			</tr>
			<tr id="pmtTableTRId">
				<td colspan="3" class="pmtCell" id="pmtTableId">
					<table class="pmtTable">
						<tr>
							<th>ID</th>
							<th>Title</th>
							<th>Application</th>
							<th>Status</th>
							<th>Assigned To</th>
							<th>%age</th>
							<th>Estimates</th>
							<th>Used Hours</th>
							<th>Release Date</th>
							<th>Action</th>
						</tr>
						
						<c:if test="${pmtMessage == 'success' }">
							<c:choose>
								<c:when test="${fn:length(pmtData) gt 0 }">
									<c:forEach items="${pmtData}" var="pmtVar" varStatus="counter">
										<tr>
											<td> <c:out value="${pmtVar.projectId}"></c:out></td>
											<td> <c:out value="${pmtVar.projectTitle}"></c:out></td>
											<td> <c:out value="${pmtVar.projectApp}"></c:out></td>
											<td> <c:out value="${pmtVar.projectStatus}"></c:out></td>
											<td> <c:out value="${pmtVar.projectAssignedTo}"></c:out></td>
											<td> <c:out value="${pmtVar.projectPercentage}"></c:out></td>
											<td> <c:out value="${pmtVar.projectEst}"></c:out></td>
											<td> <c:out value="${pmtVar.projectUsedHrs}"></c:out></td>
											<td> <fmt:formatDate value="${pmtVar.projectRelDt}" type="DATE" dateStyle="LONG"/> </td>
											<td class="actionCell">
												<img src="${pageContext.request.contextPath}/images/edit.png" onclick="updData('pmtData','pmtForm${counter.count}')" />
												<img src="${pageContext.request.contextPath}/images/delete.png" onclick="deleteData(this.parentNode.parentNode, 'pmtForm${counter.count}')" />
												
												<form name="pmtForm${counter.count}">
													<input type="hidden" value="${pmtVar.projectId}" name="ID" />
													<input type="hidden" value="${pmtVar.projectTitle}" name="Title" />
													<input type="hidden" value="${pmtVar.projectApp}" name="Application" />
													<input type="hidden" value="${pmtVar.projectStatus}" name="Status" />
													<input type="hidden" value="${pmtVar.projectAssignedTo}" name="AssignedTo" />
													<input type="hidden" value="${pmtVar.projectPercentage}" name="Percentage" />
													<input type="hidden" value="${pmtVar.projectEst}" name="Estimates" />
													<input type="hidden" value="${pmtVar.projectUsedHrs}" name="UsedHours" />
													<input type="hidden" value="<fmt:formatDate value='${pmtVar.projectRelDt}' type='DATE' dateStyle='SHORT'/>" name="ReleaseDate" />
													<input type="hidden" value="" name="flag" />
													<input type="hidden" value="PROJECTS" name="type" />
												</form>
											</td>
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										<td>No PMTs exist!</td>
									</tr>
								</c:otherwise>
							</c:choose>
						</c:if>
						
						<tr class="newBtn">
							<td colspan="10">
								<img src="${pageContext.request.contextPath}/images/new.png" align="right" onclick="javascript:addNew('pmtData');"/>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr><td colspan="3">&nbsp;</td></tr>
			<tr>
				<td colspan="3" class="subHeading">
					<img src="${pageContext.request.contextPath}/images/collapse.png" align="left" id="pmtExpColl" class="expColl" onclick="expandCollapse(this, 'rdsTableId')"/>
					RDs
				</td>
			</tr>
			
			<tr>
				<td colspan="3" class="rdsCell" id="rdsTableId">
					<table class="rdsTable">
						<tr>
							<th>ID</th>
							<th>Title</th>
							<th>Application</th>
							<th>Status</th>
							<th>Scheduled Date</th>
							<th>Actual Date</th>
							<th>Estimates</th>
							<th>Used Hours</th>
							<th>Assigned To</th>
							<th>Action</th>
						</tr>
						<c:if test="${rdMessage == 'success' }">
							<c:choose>
								<c:when test="${fn:length(rdData) gt 0 }">
									<c:forEach items="${rdData}" var="rdVar" varStatus="counter">
										<tr>
											<td> <c:out value="${rdVar.rdId}"></c:out> </td>
											<td> <c:out value="${rdVar.rdTitle}"></c:out> </td>
											<td> <c:out value="${rdVar.rdApp}"></c:out> </td>
											<td> <c:out value="${rdVar.rdStatus}"></c:out></td>
											<td> <fmt:formatDate value="${rdVar.rdSchDt}" type="DATE" dateStyle="LONG"/> </td>
											<td> <fmt:formatDate value="${rdVar.rdActDt}" type="DATE" dateStyle="LONG"/> </td>
											<td> <c:out value="${rdVar.rdEst}"></c:out> </td>
											<td> <c:out value="${rdVar.rdAct}"></c:out> </td>
											<td> <c:out value="${rdVar.rdAssignedTo}"></c:out> </td>
											<td class="actionCell">
												<img src="${pageContext.request.contextPath}/images/edit.png" onclick="updData('rdsData','rdsForm${counter.count}')" />
												<img src="${pageContext.request.contextPath}/images/delete.png" onclick="deleteData(this.parentNode.parentNode, 'rdsForm${counter.count}')" />
												
												<form name="rdsForm${counter.count}">
													<input type="hidden" value="${rdVar.rdId}" name="ID" />
													<input type="hidden" value="${rdVar.rdTitle}" name="Title" />
													<input type="hidden" value="${rdVar.rdApp}" name="Application" />
													<input type="hidden" value="${rdVar.rdStatus}" name="Status" />
													<input type="hidden" value="${rdVar.rdSchDt}" name="ScheduledDate" />
													<input type="hidden" value="${rdVar.rdActDt}" name="ActualDate" />
													<input type="hidden" value="${rdVar.rdEst}" name="Estimates" />
													<input type="hidden" value="${rdVar.rdAct}" name="UsedHours" />
													<input type="hidden" value="${rdVar.rdAssignedTo}" name="AssignedTo" />
													<input type="hidden" value="" name="flag" />
													<input type="hidden" value="RDS" name="type" />
												</form>
											</td>
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										<td>No RDs exist!</td>
									</tr>
								</c:otherwise>
							</c:choose>
						</c:if>
						<tr class="newBtn">
							<td colspan="10">
								<img src="${pageContext.request.contextPath}/images/new.png" align="right" onclick="addNew('rdsData');" class="newAdd"/>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			
			<tr><td>&nbsp;</td></tr>
			
			<tr>
				<td colspan="3" class="subHeading">
					<img src="${pageContext.request.contextPath}/images/collapse.png" align="left" id="pmtExpColl" class="expColl" onclick="expandCollapse(this, 'defectsTableId')"/>
					Defects
				</td>
			</tr>
			
			<tr>
				<td colspan="3" class="defectsCell" id="defectsTableId">
					<table class="defectsTable">
						<tr>
							<th>ID</th>
							<th>Application</th>
							<th>Severity</th>
							<th>Status</th>
							<th>Assigned To</th>
							<th>Efforts</th>
							<th>Committed</th>
							<th>SLA Date</th>
							<th>Release Date</th>
							<th>Fixed/Cancelled Date</th>
							<th>RCA</th>
							<th>Action</th>
						</tr>
						<c:if test="${defectMessage == 'success' }">
							<c:choose>
								<c:when test="${fn:length(defectData) gt 0 }">
									<c:forEach items="${defectData}" var="defectVar" varStatus="counter">
										<tr>
											<td> <c:out value="${defectVar.defectId}"></c:out> </td>
											<td> <c:out value="${defectVar.defectApp}"></c:out> </td>
											<td> <c:out value="${defectVar.defectSev}"></c:out> </td>
											<td> <c:out value="${defectVar.defectStatus}"></c:out></td>
											<td> <c:out value="${defectVar.defectAssignedTo}"></c:out></td>
											<td> <c:out value="${defectVar.defectEfforts}"></c:out></td>
											<td> <c:out value="${defectVar.defectCommitted}"></c:out></td>
											<td> <fmt:formatDate value="${defectVar.defectSlaDt}" type="DATE" dateStyle="LONG"/> </td>
											<td> <fmt:formatDate value="${defectVar.defectRelDt}" type="DATE" dateStyle="LONG"/> </td>
											<td> <fmt:formatDate value="${defectVar.defectFixedCancldDt}" type="DATE" dateStyle="LONG"/> </td>
											<td> <c:out value="${defectVar.defectRca}"></c:out> </td>
											<td class="actionCell">
												<img src="${pageContext.request.contextPath}/images/edit.png" onclick="updData('defectsData','defectsForm${counter.count}')" />
												<img src="${pageContext.request.contextPath}/images/delete.png" onclick="deleteData(this.parentNode.parentNode, 'defectsForm${counter.count}')" />
												
												<form name="defectsForm${counter.count}">
													<input type="hidden" value="${defectVar.defectId}" name="ID" />
													<input type="hidden" value="${defectVar.defectApp}" name="Application" />
													<input type="hidden" value="${defectVar.defectSev}" name="Severity" />
													<input type="hidden" value="${defectVar.defectStatus}" name="Status" />
													<input type="hidden" value="${defectVar.defectAssignedTo}" name="AssignedTo" />
													<input type="hidden" value="${defectVar.defectEfforts}" name="Efforts" />
													<input type="hidden" value="${defectVar.defectCommitted}" name="Committed" />
													<input type="hidden" value="${defectVar.defectSlaDt}" name="SLADate" />
													<input type="hidden" value="${defectVar.defectRelDt}" name="ReleaseDate" />
													<input type="hidden" value="${defectVar.defectFixedCancldDt}" name="FixCancelDate" />
													<input type="hidden" value="${defectVar.defectRca}" name="RCA" />
													<input type="hidden" value="" name="flag" />
													<input type="hidden" value="DEFECTS" name="type" />
												</form>
											</td>
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										<td>No Defects exist!</td>
									</tr>
								</c:otherwise>
							</c:choose>
						</c:if>
						<tr class="newBtn">
							<td colspan="12">
								<img src="${pageContext.request.contextPath}/images/new.png" align="right" onclick="addNew('defectsData');" class="newAdd"/>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		
		<tr><td>&nbsp;</td></tr>
			<tr>
				<td colspan="3" class="subHeading">
					<img src="${pageContext.request.contextPath}/images/collapse.png" align="left" id="pmtExpColl" class="expColl" onclick="expandCollapse(this, 'ticketsTableId')"/>
					Tickets
				</td>
			</tr>
			
			<tr>
				<td colspan="3" class="ticketsCell" id="ticketsTableId">
					<table class="ticketsTable">
						<tr>
							<th>ID</th>
							<th>Application</th>
							<th>Priority</th>
							<th>Status</th>
							<th>Assigned To</th>
							<th>SLA Date</th>
							<th>Closed Date</th>
							<th>RCA</th>
							<th>Efforts</th>
							<th>Action</th>
						</tr>
						<c:if test="${ticketMessage == 'success' }">
							<c:choose>
								<c:when test="${fn:length(ticketData) gt 0 }">
									<c:forEach items="${ticketData}" var="ticketVar" varStatus="counter">
										<tr>
											<td> <c:out value="${ticketVar.ticketId}"></c:out> </td>
											<td> <c:out value="${ticketVar.ticketApp}"></c:out> </td>
											<td> <c:out value="${ticketVar.ticketPriority}"></c:out> </td>
											<td> <c:out value="${ticketVar.ticketStatus}"></c:out></td>
											<td> <c:out value="${ticketVar.ticketAssignedTo}"></c:out></td>
											<td> <fmt:formatDate value="${ticketVar.ticketSLADt}" type="DATE" dateStyle="LONG"/> </td>
											<td> <fmt:formatDate value="${ticketVar.ticketClosedDt}" type="DATE" dateStyle="LONG"/> </td>
											<td> <c:out value="${ticketVar.ticketRCA}"></c:out> </td>
											<td> <c:out value="${ticketVar.ticketEfforts}"></c:out> </td>
											
											<td class="actionCell">
												<img src="${pageContext.request.contextPath}/images/edit.png" onclick="updData('ticketsData','ticketsForm${counter.count}')" />
												<img src="${pageContext.request.contextPath}/images/delete.png" onclick="deleteData(this.parentNode.parentNode, 'ticketsForm${counter.count}')" />
												
												<form name="ticketsForm${counter.count}">
													<input type="hidden" value="${ticketVar.ticketId}" name="ID" />
													<input type="hidden" value="${ticketVar.ticketApp}" name="Application" />
													<input type="hidden" value="${ticketVar.ticketPriority}" name="Priority" />
													<input type="hidden" value="${ticketVar.ticketStatus}" name="Status" />
													<input type="hidden" value="${ticketVar.ticketAssignedTo}" name="AssignedTo" />
													<input type="hidden" value="${ticketVar.ticketSLADt}" name="SLADate" />
													<input type="hidden" value="${ticketVar.ticketClosedDt}" name="ClosedDate" />
													<input type="hidden" value="${ticketVar.ticketRCA}" name="RCA" />
													<input type="hidden" value="${ticketVar.ticketEfforts}" name="Efforts" />
													<input type="hidden" value="" name="flag" />
													<input type="hidden" value="TICKETS" name="type" />
												</form>
											</td>
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										<td>No Tickets exist!</td>
									</tr>
								</c:otherwise>
							</c:choose>
						</c:if>
						<tr class="newBtn">
							<td colspan="10">
								<img src="${pageContext.request.contextPath}/images/new.png" align="right" onclick="addNew('ticketsData');" class="newAdd"/>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			
			<tr><td>&nbsp;</td></tr>
			
			<tr>
				<td colspan="3" class="subHeading">
					<img src="${pageContext.request.contextPath}/images/collapse.png" align="left" id="pmtExpColl" class="expColl" onclick="expandCollapse(this, 'queriesTableId')"/>
					Queries
				</td>
			</tr>
			
			<tr>
				<td colspan="3" class="queriesCell" id="queriesTableId">
					<table class="queriesTable">
						<tr>
							<th>Title</th>
							<th>Application</th>
							<th>Status</th>
							<th>Assigned To</th>
							<th>%age</th>
							<th>End Date</th>
							<th>Efforts</th>
							<th>Action</th>
						</tr>
						<c:if test="${queryMessage == 'success' }">
							<c:choose>
								<c:when test="${fn:length(queryData) gt 0 }">
									<c:forEach items="${queryData}" var="queryVar" varStatus="counter">
										<tr>
											<td> <c:out value="${queryVar.queryTitle}"></c:out> </td>
											<td> <c:out value="${queryVar.queryApp}"></c:out> </td>
											<td> <c:out value="${queryVar.queryStatus}"></c:out> </td>
											<td> <c:out value="${queryVar.queryAssignedTo}"></c:out></td>
											<td> <c:out value="${queryVar.queryPercentage}"></c:out></td>
											<td> <fmt:formatDate value="${queryVar.queryEndDate}" type="DATE" dateStyle="LONG"/> </td>
											<td> <c:out value="${queryVar.queryEfforts}"></c:out> </td>
											
											<td class="actionCell">
												<img src="${pageContext.request.contextPath}/images/edit.png" onclick="updData('queriesData','queriesForm${counter.count}')" />
												<img src="${pageContext.request.contextPath}/images/delete.png" onclick="deleteData(this.parentNode.parentNode, 'queriesForm${counter.count}')" />
												
												<form name="queriesForm${counter.count}">
													<input type="hidden" value="${queryVar.queryID}" name="ID" />
													<input type="hidden" value="${queryVar.queryTitle}" name="Title" />
													<input type="hidden" value="${queryVar.queryApp}" name="Application" />
													<input type="hidden" value="${queryVar.queryStatus}" name="Status" />
													<input type="hidden" value="${queryVar.queryAssignedTo}" name="AssignedTo" />
													<input type="hidden" value="${queryVar.queryPercentage}" name="Percentage" />
													<input type="hidden" value="${queryVar.queryEndDate}" name="EndDate" />
													<input type="hidden" value="${queryVar.queryEfforts}" name="Efforts" />
													<input type="hidden" value="" name="flag" />
													<input type="hidden" value="QUERIES" name="type" />
												</form>
											</td>
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										<td>No Queries exist!</td>
									</tr>
								</c:otherwise>
							</c:choose>
						</c:if>
						<tr class="newBtn">
							<td colspan="8">
								<img src="${pageContext.request.contextPath}/images/new.png" align="right" onclick="addNew('queriesData')" class="newAdd"/>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr><td>&nbsp;</td></tr>		
			<tr>
				<td colspan="3" class="otherInfoCell">
					<table class="otherInfoTable">
						<colgroup>
							<col width="40%">
							<col width="10%">
							<col width="40%">
							<col width="10%">
						</colgroup>
						<tr>
							<th>Achievements</th>
							<th>Action</th>
							<th>Kaizen Ideas</th>
							<th>Action</th>
						</tr>
						
						<tr>
							<td>1</td>
							<td class="actionCell">
								<img src="${pageContext.request.contextPath}/images/edit.png" onclick="updData('otherInfoData','otherInfoForm1');"/>
								<img src="${pageContext.request.contextPath}/images/delete.png" onclick="deleteData(this.parentNode.parentNode, 'otherInfoForm1')"/>
								<form name="otherInfoForm1">
									<input type="hidden" value="ACHIEVEMENTS" name="Category"/>
									<input type="hidden" value="nothing to describe!!!" name="Description"/>
									<input type="hidden" value="OTHERINFO" name="type" />
								</form>
							</td>
							<td>2</td>
							<td class="actionCell">
								<img src="${pageContext.request.contextPath}/images/edit.png" />
								<img src="${pageContext.request.contextPath}/images/delete.png" onclick="deleteData(this.parentNode.parentNode, 'otherInfoForm1')"/>
							</td>
						</tr>
						
						<tr>
							<td>1</td>
							<td class="actionCell">
								<img src="${pageContext.request.contextPath}/images/edit.png" />
								<img src="${pageContext.request.contextPath}/images/delete.png" onclick="deleteData(this.parentNode.parentNode, 'otherInfoForm1')"/>
							</td>
							<td>2</td>
							<td class="actionCell">
								<img src="${pageContext.request.contextPath}/images/edit.png" />
								<img src="${pageContext.request.contextPath}/images/delete.png" onclick="deleteData(this.parentNode.parentNode, 'otherInfoForm1')"/>
							</td>
						</tr>
						
						<tr>
							<th>Open Issues</th>
							<th>Action</th>
							<th>Leave Plan</th>
							<th>Action</th>
						</tr>
						
						<tr>
							<td>1</td>
							<td class="actionCell">
								<img src="${pageContext.request.contextPath}/images/edit.png" />
								<img src="${pageContext.request.contextPath}/images/delete.png" onclick="deleteData(this.parentNode.parentNode, 'otherInfoForm1')"/>
							</td>
							<td>2</td>
							<td class="actionCell">
								<img src="${pageContext.request.contextPath}/images/edit.png" />
								<img src="${pageContext.request.contextPath}/images/delete.png" onclick="deleteData(this.parentNode.parentNode, 'otherInfoForm1')"/>
							</td>
						</tr>
						<tr>
							<td>1</td>
							<td class="actionCell">
								<img src="${pageContext.request.contextPath}/images/edit.png" />
								<img src="${pageContext.request.contextPath}/images/delete.png" onclick="deleteData(this.parentNode.parentNode, 'otherInfoForm1')"/>
							</td>
							<td>2</td>
							<td class="actionCell">
								<img src="${pageContext.request.contextPath}/images/edit.png" />
								<img src="${pageContext.request.contextPath}/images/delete.png" onclick="deleteData(this.parentNode.parentNode, 'otherInfoForm1')"/>
							</td>
						</tr>
						<tr class="newBtn">
							<td colspan="4">
								<img src="${pageContext.request.contextPath}/images/new.png" align="right" onclick="addNew('otherInfoData')" class="newAdd"/>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		</div>
		<jsp:include page="deletePopUp.jsp"></jsp:include>
		<jsp:include page="loading.html"></jsp:include>
	</div>
	
<span style="display: none;">
	<%@ include file="pmtPopUp.jsp" %>
	<%@ include file="rdPopUp.jsp" %>
	<%@ include file="defectPopUp.jsp" %>
	<%@ include file="ticketPopUp.jsp" %>
	<%@ include file="queryPopUp.jsp" %>
	<%@ include file="otherInfoPopUp.jsp" %>
</span>
	
</body>
</html>