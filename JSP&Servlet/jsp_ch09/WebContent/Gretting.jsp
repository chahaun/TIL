<%@ page language="java" contentType="text/html; charset=EUC-KR" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�λ��ϱ�</title>
</head>
<body>
	<c:choose>
		<c:when test="${param.NUM ==0 }">
			ó���˰ڽ��ϴ�. <br>
		</c:when>
		<c:when test="${param.NUM ==1 }">
			�ݰ����ϴ�. <br>
		</c:when>
		<c:otherwise>
			�ȳ��ϼ���. <br>
		</c:otherwise>
	</c:choose>
</body>
</html>