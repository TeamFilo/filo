<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/include/header_pf.jsp" />
   
	<jsp:include page="/WEB-INF/views/include/top_pf.jsp" />
	<!-- //top_pf end -->
	
		<div class="wrapAll client">
			<h1>로그인</h1>
			<c:if test="${result != 1}">
				<script>
					alert("아이디 혹은 비밀번호 정보가 일치하지 않습니다!")
					history.go(-1)
				</script>
			</c:if>
			<c:if test="${result == 1}">
				<script>
				document.location.href="/filo/index.fl";
				</script>	
			</c:if>
		</div>
		<!-- //wrapAll end -->
		
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
<!-- //footer end -->