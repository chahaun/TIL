<%@ page language="java" contentType="text/html; charset=EUC-KR" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�����Ĵ�</title>
</head>
<body>
	<h3>������ ���� �޴��Դϴ�</h3>
	<ul>
		<c:forEach var="dish" items="${MENU }">
			<li>${dish }</li>
		</c:forEach>
	</ul>
</body>
</html>