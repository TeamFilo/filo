<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/include/header_game.jsp" />

	<script type="text/javascript" src="<c:url value="/resources/js/wScratchPad.js" />"></script>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width" />
	<link rel="icon" type="image/vnd.microsoft.icon"  href="./demo/img/favicon.ico" />
	<style>
		#demo1 {
		  width: 550px;
		  height: 365px;
		  display: block;
		  margin: 0 auto;
		  
		}
		#demo1 canvas{
		  border-radius:7px;
		  
		}
		#demo1 img{
		  border-radius:7px;
		}
		.beforeScratch img {display:block; margin: 0 auto;}
		.afterScratch img {display:block; margin: 0 auto;}
	</style>

 
<body class="noscrb">

		<div class="wrapAll game">	
		
		<jsp:include page="/WEB-INF/views/include/top_game.jsp" />
    	<jsp:include page="/WEB-INF/views/include/left_game.jsp" />
		
			<c:if test="${sessionScope.memId==null}">
				<script>
					alert("로그인 후에 이용해주세요");
					location.href="/filo/member/login.fl?past=gm";
				</script>
			</c:if>
			
			<div class="right_game index_game">
				
				<div class="gameBtnWrap lottery">
					<button class="gameBtn" onclick="lottStartBtn();">START</button>
					<button class="gameBtn" id="oneMore">다시하기</button>
				</div>
				<!-- //gameBtnWrap end -->
			
				<!-- view -->
				<div class="gameWrap">
					<div class="countWrap">
						<p id="before"> ${10-lotteryCnt}/10</p>
						<p id="after">${9-lotteryCnt}/10</p>
					</div>
					<div class="gameIntro lottery">
		                <p class="tit">복권 긁기!</p>
		                <p class="sub">
		                	복권을 긁어 POINT를 획들하세요.<br/>
		                	*하루에 10번의 기회가 주어집니다!*
		                </p>
		            </div>
					<div class="beforeScratch">
					 	<img src="/filo/resources/images/pf/lotteryNone.png" id="lotteryNone" ondragstart="return false"/><br/> 
					</div>
					<div id="demo1" class="scratchpad"></div>
				</div>	 
				
		 		<!-- script -->
				<script>
					$('#before').show();
					$('#after').hide();
				
					$('#oneMore').hide();
					$('.scratchpad').hide();
					
					function lottStartBtn(){
						var cntPossible = false;
						var pointPossible = false;
						
						//회원 포인트와 복권 구매 횟수 체크
						$.ajax({
							type:"post",
							url: "/filo/game/dailyCntCheck.fl",
							dataType: "json",
							contentType: "application/json",
							data: JSON.stringify(0),
							success : function(result){
								var count = Number(result);
								if(count>=10){
									cntPossible = false;
								}else{
									cntPossible = true;
								}
							}
						});		
						
						//내 포인트 확인
						var data = {"gameCate":0};
						$.ajax({
							type:"post",
							url: "/filo/game/lottPointCh.fl",
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
								
							//	alert('pointPossible = ' + pointPossible + ', cntPossible = ' + cntPossible);
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
									$('.beforeScratch').hide();  // 가짜이미지 숨김
									$('.scratchpad').show();  //찐스크래치나타남
									$('.gameBtn').hide();//시작버튼 숨김
									
									$('#before').hide();
									$('#after').hide();
									
									//스타트 버튼 누르면 포인트 깎인다
									var data = {"gameCate":0};
									$.ajax({
										type:"post",
										url: "/filo/game/pointCheck.fl",
										dataType: "json",
										contentType: "application/json",
										data: JSON.stringify(data),
										success : function(result){
											lg_reload();
										}
									}); //스타트 버튼 누르면 내 포인트 깎이는 에이작스 닫힘
								} //이프문 닫힘
							} //success닫힘
						}); //내포인트 확인 에이작스 닫힘 
					} //lottStartBtn
					
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
						fg: '#8542ff',
						scratchMove: function (e, percent) {
							console.log(percent);
							var msg = "";
							var point = 0;
							if (percent > 35) {
								this.clear();
								if(ranNum==1){
									msg = "오우 이런... 꽝이네요! 한판 더?";
									point = 0;
								}else if(ranNum==2){
									msg = "티끌 모아 티끌!! 5point를 얻었어요!";
									point = 5;
								}else if(ranNum==3 || ranNum==4){
									msg = "와우 ! 10point 획득!";
									point = 10;
								}else if(ranNum==5){
									msg = "50point 획득! 운이 좋은데요?";
									point = 50;
								}else if(ranNum==6){
									msg = "100point 획득! 대박...";
									point = 100;
								}
								
								//ajax
								$.ajax({
									url: "/filo/game/lotteryAjax.fl",
									cache: false,
									type: "POST",
									dataType: "json",
									contentType: "application/json",
									data: JSON.stringify(point),
								});
								
								alert(msg);
								lg_reload();
								//$('.afterScratch').html("<img src='/filo/resources/images/pf/lotteryNone.png' id='lotteryNone' ondragstart='return false'/><br/>");
								
								$('.scratchpad').wScratchPad('reset'); 
								$('.scratchpad').hide(); //패드 숨겼음 
								$('.beforeScratch').show(); //가짜이미지 다시나타남
								
								$('#before').hide();
								$('#after').show();

								$('#oneMore').show(); //다시하기버튼 
							}
						}
					});  //스크래치패드 끝
				
					$('#demo1').wScratchPad('cursor', 'url("/filo/resources/images/pf/coin.png") 5 5, default');
					$('#demo1').wScratchPad('size', 30);

					
					$(document).on('click', '#oneMore', function(){
						location.href="/filo/game/lottery.fl?oneMore=1";
					});
				</script>
				
				
				<c:if test="${param.oneMore == 1}">
					<script> 
						lottStartBtn();
					</script>
				</c:if>
			

				<!--  -->
			
			
				<!--  -->
				
				
			</div>
			<!-- right_game End -->
		</div>
		<!-- //wrapAll game end -->
		
</body>
</html>
