<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean class="mall.ClothingInfo" id="pinfo" scope="request"/>
<jsp:setProperty name="pinfo" property="code" value="70002" />
<jsp:setProperty name="pinfo" property="name" value="���� Ƽ����" />
<jsp:setProperty name="pinfo" property="price" value="15000" />
<jsp:setProperty name="pinfo" property="size" value="M" />
<jsp:setProperty name="pinfo" property="color" value="������" />

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�Ƿ� ���� ����</title>
</head>
<body>
	�Ƿ� ������ ����Ǿ����ϴ�. <br>
	------------<br>
	<h3>��ǰ ���� ����</h3>
	<jsp:include page = "ProductInfo.jsp" />
</body>
</html>