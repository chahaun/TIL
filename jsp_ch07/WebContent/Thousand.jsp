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
<title>1���� 1000���� ��</title>
</head>
<body>
	1���� 1000���� ���� �����? ${pageScope.RESULT}
</body>
</html>