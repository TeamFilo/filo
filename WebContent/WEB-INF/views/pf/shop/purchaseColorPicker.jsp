<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<jsp:include page="/WEB-INF/views/include/header_filo.jsp" />
   
	<jsp:include page="/WEB-INF/views/include/top_pf.jsp" />
	<!-- //top end -->
	
	<div class="wrapAll client">
		
		<div class="picker" id="picker1"></div>
		
		<form action="/filo/shop/purchaseColorPro.fl" method="post">
			<input type="hidden" name="color" id="color"/>
			<input type="submit" value="구매하기" />
		</form>
		<script>
			$("#picker1").colorPick({
				'initialColor' : '#8e44ad',
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