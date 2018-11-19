<%@ page language="java" contentType="text/html; charset=EUC-KR" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>숫자포맷</title>
</head>
<body>
	첫번째 수:<fmt:formatNumber value="1234500" groupingUsed="true"/><br>
	두번째 수:<fmt:formatNumber value="3.14158" pattern="#.##"/><br>
	세번째 수:<fmt:formatNumber value="10.5" pattern="#.00"/><br>
	금액: <fmt:formatNumber value="1000000" type="currency" currencySymbol="￦"/><br>
	퍼센트: <fmt:formatNumber value="0.09" type="percent" />		
</body>
</html>