<%@ page language="java" contentType="text/html; charset=EUC-KR" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.util.*" %>
<c:set var="date" value="<%=new Date() %>"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>현재의 시각</title>
</head>
<body>
	[오늘의 날짜]<fmt:formatDate value="${date }"/><br>
	[현재의 시각]<fmt:formatDate value="${date }" type="time"/><br>
</body>
</html>