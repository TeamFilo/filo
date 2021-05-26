<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
	<script>
		alert("구매완료!");
		document.location.href="/filo/shop/purchase.fl";
	</script>

<body>
	스킨구매프로 : ${memSkin}  // ${memId}
</body>
</html>