<%@page contentType="text/html; charset=euc-kr"%>
<!DOCTYPE html>
<html>
<head>
<META http-equiv= "Content-Type" content= "text/html;charset=euc-kr">
<title>아이러브펫</title>
</head>
<body>
	아이디:${param.ID}<BR>
	선택한 동물:${paramValues.ANIMAL[0]}
			${paramValues.ANIMAL[1]}
			${paramValues.ANIMAL[2]}
</body>
</html>