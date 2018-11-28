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
	<util:max var="MAX" num1="77" num2="11" />
	최대값: ${MAX}
</body>
</html>