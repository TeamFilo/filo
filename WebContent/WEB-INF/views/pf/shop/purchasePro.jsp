<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/include/header.jsp" />
   
	<jsp:include page="/WEB-INF/views/include/top.jsp" />
	<!-- //top end -->
	
	<div class="wrapAll">
		<script>
		var res = '<c:out value="${resCh}"/>';

			if(res==0){
				alert("구매완료!");
				document.location.href="/filo/game/shop/purchase.fl";
			}else if(res==1){
				alert("이미 사용중인 아이템입니다.");
				document.location.href="/filo/game/shop/purchase.fl";
			}
		</script>
		
		<!--  
		<script>
			var curr_url = document.URL;
			var new_curr_url = new URL(curr_url);
			
			//url 내 from이라는 파라미터의 값을 param에 넣어줌
			var param = new_curr_url.searchParams.get("from"); 
	
			if(param == "purchaseColor"){ 
				alert('아이디 컬러 구매가 완료되었습니다.');
				document.location.href="/filo/shop/purchase.fl";
			}else if(param == "purchaseSkin"){
				alert('스킨 구매가 완료되었습니다.');
				document.location.href="/filo/shop/purchase.fl";
			}
		</script>
		-->
	</div>
	<!-- //wrapAll end -->
	
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
<!-- //footer end -->