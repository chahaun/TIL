<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean class = "mall.PersonalInfo" id="pinfo" scope="request"/>
<jsp:setProperty property="name" name="pinfo" value="±èÇö¼ö"/>
<jsp:setProperty property="gender" name="pinfo" value="³²"/>
<jsp:setProperty property="age" name="pinfo" value="23"/>
<jsp:forward page="CustomerInfoViewer.jsp" />