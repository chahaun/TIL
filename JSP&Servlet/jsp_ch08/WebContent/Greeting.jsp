<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>애플릿으로 인사하기</title>
</head>
<body>
	<jsp:plugin type="applet" codebase="." code="GreetingApplet.class" width="500" height="200">
		<jsp:params>
			<jsp:param name="GREETING" value="기체후 일향 만강하시옵니까." />
			<jsp:param value="궁서체" name="FONT" />
		</jsp:params>
	</jsp:plugin>
</body>
</html>