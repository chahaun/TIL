<%@ page language="java" contentType="text/html; charset=EUC-KR" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String str1 = request.getParameter("NUM1");
	String str2 = request.getParameter("NUM2");
	int num1 = Integer.parseInt(str1);
	int num2 = Integer.parseInt(str2);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>������ ���α׷�</title>
</head>
<body>
	<c:catch var="e">
		<% int result = num1 / num2; %>
		�������� �����? <%=result %>
	</c:catch>
	<c:if test="${e!=null }">
		���� �޽���: ${e.message }
	</c:if>
</body>
</html>