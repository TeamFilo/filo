<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/include/header_filo.jsp" />

	<jsp:include page="/WEB-INF/views/include/top_pf.jsp" />
	<!-- //top_pf end -->
	
		<div class="wrapAll client">      
			
			<div class="portfolioMode indexMode">
				
				<h1>포트폴리오 모드</h1>
				<button class="modeBtn">모드변경</button>
				
			</div>
			<!-- //portfolioMode end -->
			
			<div class="gameMode indexMode">
				
				<h1>게임 모드</h1>
				<button class="modeBtn">모드변경</button>
				
			</div>
			<!-- //gameMode end -->
			
			<script>
				$('.modeBtn').click(function(){
					$('.indexMode').fadeToggle(200);
					$('#top').toggleClass('black');
				});
			</script>
			
		</div>
		<!-- //wrapAll end -->

<jsp:include page="/WEB-INF/views/include/footer.jsp" />
<!-- //footer end -->