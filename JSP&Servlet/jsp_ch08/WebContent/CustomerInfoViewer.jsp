<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ�� ����</title>
</head>
<body>
	<jsp:useBean class = "mall.PersonalInfo" id="pinfo" scope="request"/>
	�̸� : <jsp:getProperty property="name" name="pinfo"/> <br>
	���� : <jsp:getProperty property="gender" name="pinfo"/> <br>
	���� : <jsp:getProperty property="age" name="pinfo"/> <br>
</body>
</html>