<%@page contentType= "text/html; charset=euc-kr" %>
<HTML>
        <HEAD><TITLE>익스프레션 언어 연산자 연습</TITLE></HEAD>
        <BODY>
        		안녕하세요. ${empty param.ID ? "guest":param.ID}님<BR>
        		
                X = ${param.NUM1}, Y = ${param.NUM2} <BR><BR>
                X + Y = ${param.NUM1 + param.NUM2} <BR>
                X - Y = ${param.NUM1 - param.NUM2} <BR>
                X * Y = ${param.NUM1 * param.NUM2} <BR>
                X / Y = ${param.NUM1 / param.NUM2} <BR>
                X % Y = ${param.NUM1 % param.NUM2} <BR><BR>
                X가 더 큽니까? ${param.NUM1 - param.NUM2 > 0} <BR>
                Y가 더 큽니까? ${param.NUM1 - param.NUM2 < 0} <BR><BR>
                X와 Y가 모두 양수입니까? ${(param.NUM1 > 0) && (param.NUM2 > 0)} <BR><BR>
                X와 Y가 같습니까? ${param.NUM1 == param.NUM2? "예" : "아니오"} <BR><BR>
                
                ${param.NUM1}을 ${param.NUM2}로 나눈 몫은? ${param.NUM1 div param.NUM2} <BR>
				나머지는? ${param.NUM1 mod param.NUM2} <BR><BR>
				둘 다 양수입니까? ${(param.NUM1 gt 0) and (param.NUM2 gt 0)} <BR>
				둘 다 음수입니까? ${(param.NUM1 lt 0) and (param.NUM2 lt 0)} <BR>
				
				입력 문자열 : ${param.STR1}, ${param.STR2} <BR><BR>
				두 문자열이 같습니까? ${param.STR1 == param.STR2} <BR>
				어느 문자열이 먼저입니까? ${param.STR1 lt param.STR2 ? param.STR1 : param.STR2}
        </BODY>
</HTML>