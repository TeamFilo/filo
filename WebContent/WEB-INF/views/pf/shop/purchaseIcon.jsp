<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/include/header_pf.jsp" />

	<jsp:include page="/WEB-INF/views/include/top_pf.jsp" />
	<!-- //top_pf end -->
	
		<div class="wrapAll client">
			<script>
				function check(){
						
						// 보유 포인트 확인 ajax
						var data = {"purchaseShop":20};
		          		
						$.ajax({
							type:"post",
							url: "/filo/shop/shopPointCh.fl",
							dataType: "json",
							contentType: "application/json",
							data: JSON.stringify(data),
							success : function(result){
								var np = result.needPoint;
								var up = result.userPoint;
								if(up>=np){
									introScreen.classList.add('fadeOut');
									match.classList.add('fadeIn');
								}else{
									alert("포인트가 부족합니다!");
									location.href="/filo/shop/purchaseIcon.fl";
								}
							}
						});
				}
			</script>
			
			<h1>아이콘구매</h1>
			<form action="/filo/shop/purchaseIconPro.fl" onsubmit="return check()" method="get">
				<input type="text" name="icon" />
				<input type="submit" value="구매하기" />
			</form>
		</div>
		<!-- //wrapAll end -->
		
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
<!-- //footer end -->