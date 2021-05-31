<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/include/header_filo.jsp" />

	<jsp:include page="/WEB-INF/views/include/top_pf.jsp" />
	<!-- //top_pf end -->
	
		<div class="wrapAll client">
			<h1>로그인</h1>
			<form action="/filo/loginPro.fl" method="get">
			<input type="text" name="id" placeholder="아이디" />
			<input type="password" name="pw" placeholder="비밀번호" />
			<input type="submit" value="로그인" />
			</form>
		</div>
		<!-- //wrapAll end -->
		
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
<!-- //footer end -->