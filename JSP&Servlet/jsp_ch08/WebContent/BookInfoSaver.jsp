<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean class="mall.BookInfo" id="pinfo" scope="request"/>
<jsp:setProperty name="pinfo" property="code" value="50001" />
<jsp:setProperty name="pinfo" property="name" value="�Ƿ���" />
<jsp:setProperty name="pinfo" property="price" value="9000" />
<jsp:setProperty name="pinfo" property="writer" value="�� �׸���" />
<jsp:setProperty name="pinfo" property="page" value="704" />

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>å���� ����</title>
</head>
<body>
	å ������ ����Ǿ����ϴ�. <br>
	------------<br>
	<h3>��ǰ ���� ����</h3>
	<jsp:include page = "ProductInfo.jsp" />
</body>
</html>