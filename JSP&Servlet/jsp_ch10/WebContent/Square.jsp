<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="util" tagdir="/WEB-INF/tags" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>제곱표</title>
</head>
<body>
	<h3>1부터 5까지 제곱표</h3>
	<util:compute var="num" start="1" end="5">
		${num}의 제곱근은? ${num*num}<br>
	</util:compute>
</body>
</html>