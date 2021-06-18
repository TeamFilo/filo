<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/include/header_filo.jsp" />
	${past}
		<div class="wrapAll client">
			<c:if test="${result != 1}">
				<script>
					alert("아이디 혹은 비밀번호 정보가 일치하지 않습니다!")
					history.go(-1)
				</script>
			</c:if>
			<c:if test="${result == 1}">
				<c:if test="${past == null}">
				<script>
				document.location.href="/filo/index.fl";
				</script>	
				</c:if>
				<c:if test="${past == 'tm'}">
				<script>
				document.location.href="/filo/mem/index.fl";
				</script>	
				</c:if>
				<c:if test="${past == 'gm'}">
				<script>
				document.location.href="/filo/game/main.fl";
				</script>	
				</c:if>
			</c:if>
		</div>
		<!-- //wrapAll end -->
		
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
<!-- //footer end -->