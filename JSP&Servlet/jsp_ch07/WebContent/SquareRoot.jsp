<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@taglib prefix="m" uri="http://localhost/jsp_ch07/math-functions.tld" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>주어진 범위의 합 구하기</title>
</head>
<body>
	${param.NUM1}부터 ${param.NUM2}까지의 합은?<BR>
	답 : ${m:total(param.NUM1, param.NUM2)}
</body>
</html>