<%@page contentType= "text/html; charset=euc-kr" %>
<%@page import="java.util.*" %>
<%@page import="mall.ProductInfo" %>
<%
	String winners[] = new String[3];
	ArrayList<String> items = new ArrayList<String>();
	HashMap<String, String> map = new HashMap<String, String>();
	ProductInfo product = new ProductInfo();
	
	winners[0] = "�̼���";
	winners[1] = "�̼���2";
	winners[2] = "�̼���3";
	
	items.add("����");
	items.add("�������");
	items.add("����´");
	
	map.put("Edgar", "������");
	map.put("Thomas", "�����̿�");
	map.put("John", "������");
	
	product.setName("��������ũ 3ȣ");
	product.setPrice(20000);
	request.setAttribute("PRODUCT", product);
	
	request.setAttribute("WINNERS", winners);
	request.setAttribute("FRUITS", items);
	request.setAttribute("ADDRESS", map);
	
	RequestDispatcher dispatcher = request.getRequestDispatcher("WinnersView.jsp");
	dispatcher.forward(request, response);
%>