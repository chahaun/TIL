<%@ page language="java" contentType="text/html; charset=EUC-KR" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>��������</title>
</head>
<body>
	ù��° ��:<fmt:formatNumber value="1234500" groupingUsed="true"/><br>
	�ι�° ��:<fmt:formatNumber value="3.14158" pattern="#.##"/><br>
	����° ��:<fmt:formatNumber value="10.5" pattern="#.00"/><br>
	�ݾ�: <fmt:formatNumber value="1000000" type="currency" currencySymbol="��"/><br>
	�ۼ�Ʈ: <fmt:formatNumber value="0.09" type="percent" />		
</body>
</html>