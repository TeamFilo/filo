<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/include/header_pf.jsp" />
   
	<jsp:include page="/WEB-INF/views/include/top_pf.jsp" />
	<!-- //top_pf end -->
	
		<div class="wrapAll client">
		
			<script>
			$(function(){
					$('#coupon').hide();
					  $('button').click(function(){
				   // $('#3').hide();
				    $('#coupon').show();
				  });
				});
			</script>
			
			<button>딱</button>
			<button>하</button>
			<button>나</button>
			<button>만</button>
			<button>골</button><br/><br/>
			<button>라</button>
			<button>보</button>
			<button>세</button>
			<button>요</button>
			<button>!!</button>
			
			<div id="coupon">
				▼▼▼▼▼▼▼▼▼ <br/>
				${result}
			</div>
		
		</div>
		<!-- //wrapAll end -->
		
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
<!-- //footer end -->