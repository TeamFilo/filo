<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/include/header_filo.jsp" />
   
	<jsp:include page="/WEB-INF/views/include/top_pf.jsp" />
	<script type="text/javascript" src="<c:url value="/resources/js/wScratchPad.js" />"></script>
	<!-- //top_pf end -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width" />
	<link rel="icon" type="image/vnd.microsoft.icon"  href="./demo/img/favicon.ico" />
	<!--  -->
	
		<div class="wrapAll client">
			<c:if test="${sessionScope.memId==null}">
				<script>
					alert("로그인 후에 이용해주세요");
					location.href="/filo/member/login.fl";
				</script>
			</c:if>
			<!--
			<div id="demo1" class="scratchpad"></div>
			-->
			<div id="demo2" class="scratchpad"></div>
			<div class="afterScratch"></div>
			<!--
			<div id="demo3" class="scratchpad"></div>
			<br/>
			<input type="button" value="Reset" onclick="$('.scratchpad').wScratchPad('reset');"/>
			<input type="button" value="Clear" onclick="$('.scratchpad').wScratchPad('clear');"/>
			<input type="button" value="Enable" onclick="$('.scratchpad').wScratchPad('enable', true);"/>
			<input type="button" value="Disable" onclick="$('.scratchpad').wScratchPad('enable', false);"/>
			-->
			
			<style>
				#demo1, #demo2, #demo3 {
				  width: 25%;
				  height: 100px;
				  border: solid 1px;
				  display: inline-block;
				}
			</style>
			<!--
			<script type="text/javascript" src="/resources/js/wScratchPad.js"></script>
			-->
			<script>
				/* Test 1
				$('#demo1').wScratchPad({
				  scratchMove: function (e, percent) {
				    console.log(percent);
				  }
				});
				*/
				// Test 2
				$('#demo2').wScratchPad({
					bg: '/filo/resources/images/pf/slide1.jpg',
					fg: '#ff0000',
					scratchMove: function (e, percent) {
						console.log(percent);
						if (percent > 60) {
							this.clear();
							alert("짜잔");
							$('.scratchpad').wScratchPad('reset');
							$('.scratchpad').hide();
							$('.afterScratch').html("<h1>다시하기</h1>");
						}
					}
				});
				$('#demo2').wScratchPad('cursor', 'url("/filo/resources/images/pf/coin.png") 5 5, default');
				
				/* Test 3
				$('#demo3').wScratchPad({
					cursor: 'url("../cursors/mario.png") 5 5, default',
					scratchMove: function (e, percent) {
						console.log(percent);
					}
				});
				$('#demo3').wScratchPad('bg', 'filo/resources/images/pf/winner.png');
				$('#demo3').wScratchPad('fg', 'filo/resources/images/pf/scratch-to-win.png');
				$('#demo3').wScratchPad('size', 10);
				*/
			</script>
			
		</div>
		<!-- //wrapAll end -->
		
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
<!-- //footer end -->