<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���ø����� �λ��ϱ�</title>
</head>
<body>
	<jsp:plugin type="applet" codebase="." code="GreetingApplet.class" width="500" height="200">
		<jsp:params>
			<jsp:param name="GREETING" value="��ü�� ���� �����Ͻÿɴϱ�." />
			<jsp:param value="�ü�ü" name="FONT" />
		</jsp:params>
	</jsp:plugin>
</body>
</html>