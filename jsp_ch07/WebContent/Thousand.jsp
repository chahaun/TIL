<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%
	int sum = 0;
	for (int cnt=1; cnt<=1000; cnt++) sum += cnt;
	pageContext.setAttribute("RESULT", new Integer(sum));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>1부터 1000까지 합</title>
</head>
<body>
	1부터 1000까지 더한 결과는? ${pageScope.RESULT}
</body>
</html>