<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.Date" %>
<%@ page isELIgnored ="false" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Work Load Graphs</title>
	<% String currentTime = new Date().toString(); %>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/stylesheet/theme1.css?t=<%=currentTime %>"  />
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.9.1.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-ui.js"></script>
	<script src="${pageContext.request.contextPath}/js/Chart.js"></script>
	<script src="${pageContext.request.contextPath}/js/huddleGraph.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/common.js?t=<%=currentTime %>"></script>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<img src="${pageContext.request.contextPath}/images/bg7.png" class="bgImage" />
	<div class="theme1">
		<div class="imageProfileDiv">
			<img src="${pageContext.request.contextPath}/images/default_profile.jpg" />
			<br />
			<div class="chartPersonName">ABC XYZ</div>
		</div>
		<canvas id="canvas" height="250" width="500"></canvas>
	</div>
</body>
</html>