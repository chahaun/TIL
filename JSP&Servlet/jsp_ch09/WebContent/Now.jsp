<%@ page language="java" contentType="text/html; charset=EUC-KR" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.util.*" %>
<c:set var="date" value="<%=new Date() %>"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>������ �ð�</title>
</head>
<body>
	[������ ��¥]<fmt:formatDate value="${date }"/><br>
	[������ �ð�]<fmt:formatDate value="${date }" type="time"/><br>
</body>
</html>