<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="util" tagdir="/WEB-INF/tags" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>����ǥ</title>
</head>
<body>
	<h3>1���� 5���� ����ǥ</h3>
	<util:compute var="num" start="1" end="5">
		${num}�� ��������? ${num*num}<br>
	</util:compute>
</body>
</html>