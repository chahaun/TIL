<%@ page language="java" contentType="text/html; charset=EUC-KR" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url var="next" value="Divide.jsp" >
	<c:param name="NUM1" value="100"/>
	<c:param name="NUM2" value="25"/>
</c:url>
<c:redirect url = "${next }" />