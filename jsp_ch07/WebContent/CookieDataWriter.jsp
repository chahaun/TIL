<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	Cookie cookie = new Cookie("NAME", "John");
	response.addCookie(cookie);
%>;
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>데이터 저장</title>
</head>
<body>
	쿠키 값이 설정되었습니다.
</body>
</html>