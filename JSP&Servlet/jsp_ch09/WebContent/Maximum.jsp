<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>최대값 구하기</title>
</head>
<body>
	최대값:
	<c:if test="${param.NUM1 - param.NUM2 >= 0}">
		${param.NUM1 }
	</c:if>
	<c:if test="${param.NUM1 - param.NUM2 < 0}">
		${param.NUM2 }
	</c:if>
</body>
</html>