<%@page contentType= "text/html; charset=euc-kr" %>
<HTML>
        <HEAD><TITLE>�ͽ������� ��� ������ ����</TITLE></HEAD>
        <BODY>
        		�ȳ��ϼ���. ${empty param.ID ? "guest":param.ID}��<BR>
        		
                X = ${param.NUM1}, Y = ${param.NUM2} <BR><BR>
                X + Y = ${param.NUM1 + param.NUM2} <BR>
                X - Y = ${param.NUM1 - param.NUM2} <BR>
                X * Y = ${param.NUM1 * param.NUM2} <BR>
                X / Y = ${param.NUM1 / param.NUM2} <BR>
                X % Y = ${param.NUM1 % param.NUM2} <BR><BR>
                X�� �� Ů�ϱ�? ${param.NUM1 - param.NUM2 > 0} <BR>
                Y�� �� Ů�ϱ�? ${param.NUM1 - param.NUM2 < 0} <BR><BR>
                X�� Y�� ��� ����Դϱ�? ${(param.NUM1 > 0) && (param.NUM2 > 0)} <BR><BR>
                X�� Y�� �����ϱ�? ${param.NUM1 == param.NUM2? "��" : "�ƴϿ�"} <BR><BR>
                
                ${param.NUM1}�� ${param.NUM2}�� ���� ����? ${param.NUM1 div param.NUM2} <BR>
				��������? ${param.NUM1 mod param.NUM2} <BR><BR>
				�� �� ����Դϱ�? ${(param.NUM1 gt 0) and (param.NUM2 gt 0)} <BR>
				�� �� �����Դϱ�? ${(param.NUM1 lt 0) and (param.NUM2 lt 0)} <BR>
				
				�Է� ���ڿ� : ${param.STR1}, ${param.STR2} <BR><BR>
				�� ���ڿ��� �����ϱ�? ${param.STR1 == param.STR2} <BR>
				��� ���ڿ��� �����Դϱ�? ${param.STR1 lt param.STR2 ? param.STR1 : param.STR2}
        </BODY>
</HTML>