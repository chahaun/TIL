<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="util" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�ִ밪 ���ϱ�</title>
</head>
<body>
	<h3>�ִ밪 ���ϱ�</h3>
	<util:max num1="${param.NUM1 }" num2="${param.NUM2 }" />
	�ִ밪: ${maximum}
</body>
</html>