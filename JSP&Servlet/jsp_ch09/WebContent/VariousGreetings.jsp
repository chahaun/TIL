<%@ page language="java" contentType="text/html; charset=EUC-KR" %>
<%@page import="java.util.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix= "fn" uri= "http://java.sun.com/jsp/jstl/functions" %>
<c:set var="greeting" value="How Are You?"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�������� �λ縻</title>
</head>
<body>
	������ ���ڿ�: ${greeting }<br>
	��� �빮�ڷ�: ${fn:toUpperCase(greeting) }<br>
	��� �ҹ��ڷ�: ${fn:toLowerCase(greeting) }<br>
	Are�� ��ġ��? ${fn:indexOf(greeting, "Are") }<br>
	Are�� Were�� �ٲٸ�? ${fn:replace(greeting, "Are", "Were") }<br>
	���ڿ��� ���̴�? ${fn:length(greeting) }<br>
</body>
</html>