<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/include/header_filo.jsp" />

		<div class="wrapAll client">
			
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
				
		</div>
		<!-- //wrapAll end -->
		
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
<!-- //footer end -->