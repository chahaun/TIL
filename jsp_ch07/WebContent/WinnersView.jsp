<%@page contentType= "text/html; charset=euc-kr" %>
<HTML>
        <HEAD><TITLE>�ͽ������� ��� ������ ����</TITLE></HEAD>
        <BODY>
        	<H3>����� ���</H3>
        	1�� ${WINNERS[0]}<BR>
        	1�� ${WINNERS[1]}<BR>
        	1�� ${WINNERS[2]}<BR>
        	
        	<H3>�̴޿� ���� �����ȸ� ����</H3>
        	1�� ${FRUITS[0]}<BR>
        	2�� ${FRUITS[1]}<BR>
        	3�� ${FRUITS[2]}<BR>
        	
        	<H3>�ּҷ�</H3>
        	${param.NAME}�� �ּҴ�? ${ADDRESS[param.NAME]}
        	
        	<H3>��ǰ����</H3>
        	��ǰ��:${PRODUCT.name} <BR>
        	����:${PRODUCT.price}�� <BR>
</HTML>