<%@page contentType= "text/html; charset=euc-kr" %>
<%@page import="java.util.*" %>
<%@page import="mall.ProductInfo" %>
<%
	String winners[] = new String[3];
	ArrayList<String> items = new ArrayList<String>();
	HashMap<String, String> map = new HashMap<String, String>();
	ProductInfo product = new ProductInfo();
	
	winners[0] = "이수현";
	winners[1] = "이수현2";
	winners[2] = "이수현3";
	
	items.add("딸기");
	items.add("딸기우유");
	items.add("딸기쨈");
	
	map.put("Edgar", "보스턴");
	map.put("Thomas", "오하이오");
	map.put("John", "워싱턴");
	
	product.setName("딸기케이크 3호");
	product.setPrice(20000);
	request.setAttribute("PRODUCT", product);
	
	request.setAttribute("WINNERS", winners);
	request.setAttribute("FRUITS", items);
	request.setAttribute("ADDRESS", map);
	
	RequestDispatcher dispatcher = request.getRequestDispatcher("WinnersView.jsp");
	dispatcher.forward(request, response);
%>