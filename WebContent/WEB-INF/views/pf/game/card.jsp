<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/include/header_game.jsp" />
   
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
			<script>
			$(document).ready(function(){
				$('#reGameBtn').hide();
				
			});
			
            // 게임 상태
            var gameState = '';
 
            // 열린 카드 src
            var openCardId = '';
            var openCardId2 = '';
 
            // 난수 생성 함수
            function generateRandom (min, max) {
                var ranNum = Math.floor(Math.random()*(max-min+1)) + min;
                    return ranNum;
            }
 
            
            var cards; // 카드 목록
            var score = 0; // 점수
            var openedCtn = 0; // 맞춘 카드 갯수
            
            // 카드 배치
            function setTable(){
                cards = [
                '1.png','1.png', 
                '2.png','2.png', 
                '3.png','3.png', 
                '4.png','4.png', 
                '5.png','5.png', 
                '6.png','6.png', 
                '7.png','7.png', 
                '8.png','8.png', 
                '9.png','9.png', 
                '10.png','10.png', 
                '11.png','11.png', 
                '12.png','12.png' 
                ];
                var cardTableCode = '<ul>';                
                for(var i=0;i<24;i++) {
                    if(i>0 && i%6 == 0){
                        cardTableCode += '</ul><ul>';
                    }
                    var idx = generateRandom(0,23-i);
                    var img = cards.splice(idx,1);
 
                    cardTableCode += '<li id="card'+i+'"><img src="/filo/resources/images/pf/'+img+'"><span>?</span></li>';
                }											
                cardTableCode += '</ul>';
                $('#cardTable').html(cardTableCode);
            }
 
            // 카드 전체 가리기
            function hiddenCards(){
                $('#cardTable ul li img').hide();
                $('#cardTable ul li span').show().css('display','block');
            }
 
            // 게임 시작
            function startGame() {
                var sec = 6;
                
                $('#info').hide(); // 안내 문구 가리기
                scoreInit(); // 점수 초기화
                setTable(); // 카드 배치
                
                //카운트 다운
                function setText(){
                    $('#countDown').text(--sec);
                }
 
                //카운트 다운
                var intervalID = setInterval(setText, 1000);
                setTimeout(function(){
                    clearInterval(intervalID);
                    $('#countDown').text('start');
                    hiddenCards();
                    gameState = '';
                }, 6000);
            }
 
 
            // 카드 선택 시
            $(document).on('click', '#cardTable ul li', function(){
                if(gameState != '') return; // 게임 카운트 다운중일 때 누른 경우 return
                if(openCardId2 != '') return; // 2개 열려있는데 또 누른 경우 return
                if($(this).hasClass('opened')) return; // 열려있는 카드를 또 누른 경우                
                $(this).addClass('opened'); // 열여있다는 것을 구분하기 위한 class 추가
 
                if(openCardId == '') {
                    $(this).find('img').show();
                    $(this).find('span').hide();
                    openCardId = this.id;
                }else {
                    if(openCardId == openCardId2) return; //같은 카드 누른 경우 return
 
                    $(this).find('img').show();
                    $(this).find('span').hide();
                    
                    var openCardSrc = $('#'+openCardId).find('img').attr('src');
                    var openCardSrc2 = $(this).find('img').attr('src');
                    openCardId2 = this.id;
                    
                    if(openCardSrc == openCardSrc2) { // 일치
                        openCardId = '';
                        openCardId2 = '';
                        scorePlus();
                        if(++openedCtn == 12){
                            //score를 wallet에 update 시키고 gameRecord 테이블에 레코드 insert 시키기
                            var data = {"gameCate":3,"score":score};
                            $.ajax({
            					type:"post",
            					url: "/filo/game/insertCardResult.fl",
            					dataType: "json",
            					contentType: "application/json",
            					data: JSON.stringify(data),
            				});
                            alert('성공!!\n'+score+'점 입니다!');
                            $('#reGameBtn').show();
                           
                            
                          
                        }
                    }else { // 불일치
                        setTimeout(back, 1000);
                        scoreMinus();
                    }
                }
            });
            
            
            $(document).on('click', '#reGameBtn', function(){
            	location.href="/filo/game/card.fl";
            });
            
            
            
 
            // 두개의 카드 다시 뒤집기
            function back() {
                $('#'+openCardId).find('img').hide();
                $('#'+openCardId).find('span').show();
                $('#'+openCardId2).find('img').hide();
                $('#'+openCardId2).find('span').show();
                $('#'+openCardId).removeClass('opened');
                $('#'+openCardId2).removeClass('opened');
                openCardId = '';
                openCardId2 = '';
            }
 
            // 점수 초기화
            function scoreInit(){
                score = 0;
                openedCtn = 0;
                $('#score').text(score);
            }
            // 점수 증가
            function scorePlus(){
                score += 10;
                $('#score').text(score);
            }
            // 점수 감소
            function scoreMinus(){
                score -= 5;
                $('#score').text(score);
            }
 
            $(document).on('click', '#gameBtn', function(){
            	$("#gameBtn").hide();
                var data = {"gameCate":3};
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
			            	if(gameState == '') {
			                    startGame();
			                    gameState = 'alreadyStart'
			                }
						}else{
							alert("포인트가 부족합니다!");
						}
					}
				});
            });        
			</script>
			<div class="right_game index_game">
				<div class="gameWrap">
			            <div>
			                <p class="tit">같은 그림 찾기!</p>
                            <button id='gameBtn'>start</button>
                            <button id='reGameBtn'>다시하기</button>
                            <p>score : <p id='score'>0</p></p>
			            </div>
			            
			            <div>
			                <div id='countDown'>
			                    ready
			                </div>
			                <div id='cardTable'>
			                </div>
			                <div id='info'>
			                    start 버튼을 눌러주세요<br>
			                </div>
			            </div>
			            
			        </div>
			        <!-- width 500px End -->
		        </div>
		        <!-- gameWrap End -->
		    </div>
		    <!-- right_game End -->
		</div>
		<!-- //wrapAll game end -->
</body>
</html>