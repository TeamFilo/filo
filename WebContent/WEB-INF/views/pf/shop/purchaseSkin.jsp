<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/include/header_pf.jsp" />

	<jsp:include page="/WEB-INF/views/include/top_pf.jsp" />
	<!-- //top_pf end -->
	
		<div class="wrapAll client">
			<h1>스킨구매</h1>
			<form action="/filo/shop/purchaseSkinPro.fl" method="post">
				<h4>스킨색상을 골라주세요</h4>
				<input type="color" name="skin" />
				<input type="submit" value="구매하기" />
			</form>
		</div>
		<!-- //wrapAll end -->
		
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
<!-- //footer end -->