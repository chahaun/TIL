<%@ page language="java" contentType="text/html; charset=EUC-KR" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>������ �ձ�</title>
</head>
<body>
	������ ������ġ�� ���� �������?<br><br>
	<c:set var="guests" value="�䳢^^�ź���~~�罿"/>
	<c:forTokens var="animal" items="${guests}" delims="^~">
		${animal }<br>
	</c:forTokens>
</body>
</html>