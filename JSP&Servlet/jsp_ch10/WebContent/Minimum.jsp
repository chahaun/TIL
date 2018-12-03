<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@taglib prefix= "tool" uri="/WEB-INF/tlds/tools.tld" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>최소값 구하기</title>
</head>
<body>
	<tool:newMin var="MIN" num1="${param.NUM1 }" num2="${param.NUM2 }"/>
	최소값 : ${MIN }
</body>
</html>