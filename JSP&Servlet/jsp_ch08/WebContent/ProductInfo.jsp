<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean class="mall.ProductInfo" id="pinfo" scope="request" />
�ڵ�: <jsp:getProperty property="code" name="pinfo"/>
��ǰ��: <jsp:getProperty property="name" name="pinfo"/>
����: <jsp:getProperty property="price" name="pinfo"/>