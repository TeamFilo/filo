<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/include/header_game.jsp" />

	<script type="text/javascript" src="<c:url value="/resources/js/wScratchPad.js" />"></script>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width" />
	<link rel="icon" type="image/vnd.microsoft.icon"  href="./demo/img/favicon.ico" />
	<style>
		#demo1 {
		  width: 300px;
		  height: 200px;
		  border: solid 1px;
		  display: inline-block;
		}
	</style>

<body class="noscrb">

		<div class="wrapAll game">	
		
		<jsp:include page="/WEB-INF/views/include/top_game.jsp" />
    	<jsp:include page="/WEB-INF/views/include/left_game.jsp" />
		
			<c:if test="${sessionScope.memId==null}">
				<script>
					alert("로그인 후에 이용해주세요");
					location.href="/filo/member/login.fl";
				</script>
			</c:if>
			
			<div class="right_game index_game">
				<!-- view -->
				<div class="beforeScratch">
					<img src="/filo/resources/images/pf/lotteryNone.png" id="lotteryNone" ondragstart="return false"/><br/>
					<button onclick="possibleCheck();">START</button>
				</div>
				<div id="demo1" class="scratchpad"></div>
				<div class="afterScratch"></div>
	 		
		 		<!-- script -->
				<script>
					var cntPossible = false;
					var pointPossible = false;
					
					$(document).ready(function(){
						//회원 포인트와 복권 구매 횟수 체크
						$.ajax({
							type:"post",
							url: "/filo/game/dailyCntCheck.fl",
							dataType: "json",
							contentType: "application/json",
							data: JSON.stringify(0),
							success : function(result){
								var count = Number(result);
								if(count>=5){
									cntPossible = false;
								}else{
									cntPossible = true;
								}
							}
						});
						var data = {"gameCate":0};
						$.ajax({
							type:"post",
							url: "/filo/game/pointCheck.fl",
							dataType: "json",
							contentType: "application/json",
							data: JSON.stringify(data),
							success : function(result){
								var np = result.needPoint;
								var up = result.userPoint;
								if(up>=np){
									pointPossible = true;
								}else{
									pointPossible = false;
								}
							}
						});
						$("#demo1").hide();
						$("#after").hide();
						$('#dragInfo').hide();
					});
					
					function possibleCheck(){
						$('#before').hide();
						$('#dragInfo').show();
						
						if(!cntPossible && pointPossible){
							alert("일일 구매 횟수를 초과하였습니다");
						}
						if(!pointPossible && cntPossible){
							alert("포인트가 부족합니다");
						}
						if(!pointPossible && !cntPossible){
							alert("일일 구매 횟수도 초과하셨고 포인트도 없네요");
						}
						if(cntPossible && pointPossible){
							$("#demo1").show();
							$('.beforeScratch').hide();
						}
					}
					
					var ranNum = "${ranNum}";
				/*	임시로 정한 value
					ranNum 1~6
					1) 꽝
					2) 10point (1/2배)
					3) 20point (1배)
					4) 20point (1배)
					5) 100point (5배)
					6) 200point (10배)	*/
					var ranImg = "<c:out value='${ranImg}'/>";
					//wScratchPad
					$('#demo1').wScratchPad({
						bg: '/filo/resources/images/pf/'+ranImg,
						fg: '#949194',
						scratchMove: function (e, percent) {
							console.log(percent);
							var msg = "";
							var point = 0;
							if (percent > 30) {
								this.clear();
								if(ranNum==1){
									msg = "오우 이런... 꽝이네요!";
									point = 0;
								}else if(ranNum==2){
									msg = "20point를 써서 10point를 얻었어요!";
									point = 10;
								}else if(ranNum==3 || ranNum==4){
									msg = "20point 획득! 본전이네요";
									point = 20;
								}else if(ranNum==5){
									msg = "100point 획득! 운이 아주 좋은데요?";
									point = 100;
								}else if(ranNum==6){
									msg = "200point 획득! 대박...";
									point = 200;
								}
								alert(msg);
								
								//ajax
								$.ajax({
									url: "/filo/game/lotteryAjax.fl",
									cache: false,
									type: "POST",
									dataType: "json",
									contentType: "application/json",
									data: JSON.stringify(point),
								});
								
								$('.scratchpad').wScratchPad('reset');
								$('.scratchpad').hide();
								$('#after').show();
								$('#dragInfo').hide();
								$('.afterScratch').html("<img src='/filo/resources/images/pf/lotteryNone.png' id='lotteryNone' ondragstart='return false'/><br/><button id='oneMore'>한번 더 긁기</button>");
							}
						}
					});
					$('#demo1').wScratchPad('cursor', 'url("/filo/resources/images/pf/coin.png") 5 5, default');
					$('#demo1').wScratchPad('size', 30);
					
					$(document).on('click', '#oneMore', function(){
						location.href="/filo/game/lottery.fl";
					});
			            
				</script>
				
				<p id="before"> 긁기전 남은횟수: 5회중 ${5-lotteryCnt}회 남았습니다.</p>
				<p id="after">긁은 후남은횟수 : 5회중 ${4-lotteryCnt }회 남았습니다.</p>
				<p id="dragInfo">마우스로 긁어보세요!</p>
				
			
				<!--  -->
			
			
				<!--  -->
				
				
			</div>
			<!-- right_game End -->
		</div>
		<!-- //wrapAll game end -->
		
</body>
</html>
