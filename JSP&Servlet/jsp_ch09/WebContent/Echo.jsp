<%@ page language="java" contentType="text/html; charset=EUC-KR" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>메아리</title>
</head>
<body>
	<c:forEach var="cnt" begin="1" end="5">
		<FONT size=${cnt }>야호~</FONT> <br>
	</c:forEach>
</body>
</html>