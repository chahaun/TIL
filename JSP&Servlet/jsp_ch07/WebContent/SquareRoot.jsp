<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@taglib prefix="m" uri="http://localhost/jsp_ch07/math-functions.tld" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�־��� ������ �� ���ϱ�</title>
</head>
<body>
	${param.NUM1}���� ${param.NUM2}������ ����?<BR>
	�� : ${m:total(param.NUM1, param.NUM2)}
</body>
</html>