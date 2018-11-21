<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="util" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>최대값 구하기</title>
</head>
<body>
	<h3>최대값 구하기</h3>
	<util:max num1="${param.NUM1 }" num2="${param.NUM2 }" />
	최대값: ${maximum}
</body>
</html>