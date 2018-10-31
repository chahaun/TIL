<%@page contentType= "text/html; charset=euc-kr" %>
<HTML>
        <HEAD><TITLE>익스프레션 언어 연산자 연습</TITLE></HEAD>
        <BODY>
        	<H3>우승자 명단</H3>
        	1등 ${WINNERS[0]}<BR>
        	1등 ${WINNERS[1]}<BR>
        	1등 ${WINNERS[2]}<BR>
        	
        	<H3>이달에 가장 많이팔린 과일</H3>
        	1등 ${FRUITS[0]}<BR>
        	2등 ${FRUITS[1]}<BR>
        	3등 ${FRUITS[2]}<BR>
        	
        	<H3>주소록</H3>
        	${param.NAME}의 주소는? ${ADDRESS[param.NAME]}
        	
        	<H3>상품정보</H3>
        	상품명:${PRODUCT.name} <BR>
        	가격:${PRODUCT.price}원 <BR>
</HTML>