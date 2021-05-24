
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/include/header_pf.jsp" />
   
	<jsp:include page="/WEB-INF/views/include/top_pf.jsp" />
	<script type="text/javascript" src="<c:url value="/resources/js/lotteryScratch.js" />"></script>
	<!-- //top_pf end -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">

		<div class="wrapAll client">
			<c:if test="${sessionScope.memId==null}">
				<script>
					alert("로그인 후에 이용해주세요");
					location.href="/filo/login.fl";
				</script>
			</c:if>
	 
			<script>
			
			 
				window.addEventListener('load', function () {
					
					
					var lotteryScratchGo1 = new lotteryScratch(
						document.querySelector('#lotteryScratch1'), 492, 259, 20,
						'/filo/resources/images/pf/img_cont02.jpg'
					);
					var lotteryScratchGo2 = new lotteryScratch(
						document.querySelector('#lotteryScratch2'), 492, 259, 25,
						'/filo/resources/images/pf/img_cont02.jpg'
					);
					lotteryScratchGo1.LotteryScratchInit();
					lotteryScratchGo2.LotteryScratchInit();
					
					var ranImg = "<c:out value='${ranImg}'/>";
					console.log(ranImg);
					
					lotteryScratchGo1.LotteryScratchCallback(function () {
						document.querySelector('#lotteryScratch1').style.backgroundImage = "url('/filo/resources/images/pf/"+ranImg+"')";
					}).LotteryScratch();
					
					
					document.querySelector('#lotteryScratch2').onclick = function () {
						lotteryScratchGo2.LotteryScratchReadyAlert('lotteryScratch2 start or reset 버튼을 클릭한 뒤 진행해주세요!');
					}
					document.querySelector('#resetButton').onclick = function () {
						lotteryScratchGo2
						.LotteryScratchClear()
						.LotteryScratchCallback(function () {
						document.querySelector('#lotteryScratch2').style.backgroundImage = "url('/filo/resources/images/pf/20190719_114105.png')";
						}).LotteryScratch();
					}
				});	//addlistener end
				
				
				
				
			</script>
			
			<h1>스크래치</h1>
			
			<span>lotteryScratch1</span>
			<div id="lotteryScratch1"></div>
			<br><br><br>
			
			<span>lotteryScratch2</span>
			<div id="lotteryScratch2"></div>
			<button id="resetButton">lotteryScratch2 start or reset</button>
			
		</div>
		<!-- //wrapAll end -->
		
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
<!-- //footer end -->