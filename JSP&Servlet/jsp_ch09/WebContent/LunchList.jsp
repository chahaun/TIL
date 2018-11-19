<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String arr[] = {"불고기 백반", "오므라이스", "콩국수"};
	request.setAttribute("MENU", arr);
%>
<jsp:forward page = "LunchMenuView.jsp" />