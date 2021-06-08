<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/include/header_filo.jsp" />

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
								location.href="/filo/shop/purchaseColor.fl";
							}
						}
					});
				}
			</script>
			
			<h1>색깔구매</h1>
			<h4>색깔을 골라주세요</h4>
			<div class="picker" id="picker1"></div>
			<form action="/filo/game/shop/purchaseColorPro.fl" onsubmit="return check()" method="post">
				<input type="hidden" name="color" id="color"/>
				<input type="submit" value="구매하기" />
			</form>
			<script>
				var nowColor = '${nowColor}';
				$("#picker1").colorPick({
					'initialColor' : nowColor,
					'palette': ["#1abc9c", "#16a085", "#2ecc71", "#27ae60", "#3498db", "#2980b9", "#9b59b6", "#8e44ad", "#34495e", "#2c3e50", "#f1c40f", "#f39c12", "#e67e22", "#d35400", "#e74c3c", "#c0392b", "#ecf0f1"],
					'onColorSelected': function() {
						console.log("The user has selected the color: " + this.color)
						this.element.css({'backgroundColor': this.color, 'color': this.color});
						$('#color').val(this.color);
					}
				});
			</script>
		</div>
		<!-- //wrapAll end -->
		
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
<!-- //footer end -->