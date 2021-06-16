<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/include/header_filo.jsp" />
   
	<jsp:include page="/WEB-INF/views/include/top_game.jsp" />
	<!-- //top_pf end -->
	
		<div class="wrapAll client">

			<table>
				
				<c:forEach var="num" items="${numArray}" varStatus="status" >
					<c:if test="${status.count != 3}">
					크크크크
					 </c:if>
				<tr>
					<td>${num}</td>
				</tr>
				</c:forEach>
				
			</table>

		</div>
		<!-- //wrapAll end -->
		
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
<!-- //footer end -->