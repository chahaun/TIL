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
<title>������ ����</title>
</head>
<body>
	��Ű ���� �����Ǿ����ϴ�.
</body>
</html>