<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원 정보</title>
</head>
<body>
	<jsp:useBean class = "mall.PersonalInfo" id="pinfo" scope="request"/>
	이름 : <jsp:getProperty property="name" name="pinfo"/> <br>
	성별 : <jsp:getProperty property="gender" name="pinfo"/> <br>
	나이 : <jsp:getProperty property="age" name="pinfo"/> <br>
</body>
</html>