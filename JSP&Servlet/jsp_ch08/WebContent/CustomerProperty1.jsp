<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ������</title>
</head>
<body>
	<jsp:useBean class = "mall.PersonalInfo" id="pinfo"/>
<!-- 
	<jsp:setProperty property="name" name="pinfo" param="NAME"/>
	<jsp:setProperty property="gender" name="pinfo" param="GENDER"/>
	<jsp:setProperty property="age" name="pinfo" param="AGE"/>
-->
	<jsp:setProperty property="*" name="pinfo"/>
	�̸� : <jsp:getProperty property="name" name="pinfo"/> <br>
	���� : <jsp:getProperty property="gender" name="pinfo"/> <br>
	���� : <jsp:getProperty property="age" name="pinfo"/> <br>
</body>
</html>