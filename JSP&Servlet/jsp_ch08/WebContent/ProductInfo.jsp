<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean class="mall.ProductInfo" id="pinfo" scope="request" />
코드: <jsp:getProperty property="code" name="pinfo"/>
제품명: <jsp:getProperty property="name" name="pinfo"/>
가격: <jsp:getProperty property="price" name="pinfo"/>