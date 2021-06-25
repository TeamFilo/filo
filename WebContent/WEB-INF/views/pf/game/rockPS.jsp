<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/include/header_game.jsp" />
   
<body class="noscrb">
		<div class="wrapAll game">
		<script>
			function rp(){
				window.location.reload();
			}
		</script>
		
        	<jsp:include page="/WEB-INF/views/include/top_game.jsp" />
       		<jsp:include page="/WEB-INF/views/include/left_game.jsp" />
       		
			<c:if test="${sessionScope.memId==null}">
				<script>
					alert("로그인 후에 이용해주세요");
					location.href="/filo/member/login.fl?past=gm";
				</script>
			</c:if>
			
       		<div class="right_game index_game">
				<div class="gameBG"></div>
       			 <div class="gameIntro rock">
			            <p class="tit">가위바위보 계단 올라가기!</p>
			            <p class="sub">컴퓨터에게 가위바위보를 이겨 계단을 먼저 올라가면 승리!
			            <br/>*바위로 승리 시 1칸, 가위 2칸, 보 3칸 진행*</p>
		        </div>
		        <!--intro End-->
		        <div class="end fadeOut">
			        	<h2>Game End </h2>
			        	<div class="gameBtnWrap rockRe">
			        		<button onclick="rp();" class="gameBtn">다시 하기</button>   	
			        		<button class="gameBtn">메인으로</button>   	
			        	</div>
		        </div>
		        
       			<div class="gameBtnWrap rock">
					<button class="gameBtn">START</button>
				</div>
				<!-- //gameBtnWrap end -->
       		
				<div class="gameWrap">
			    	<form class="sscore">
				        <div class="score">
				            <div class="playerScore">
				                <h2>${userInfo.nickname}</h2>
				                <p id="pScoreResult">0</p>
				            </div>
				            <div class="computerScore">
				                <h2>Computer</h2>
				                <p id="cScoreResult">0</p>
				            </div>
				        </div>
			        </form>
			        <!--score End-->
			       
			        <div class="match fadeOut">
			            <h2 class="winner">안내면 진다 가위 바위 보!!!</h2>
			            <div class="hands">
			                <img class="playerHand" src="/filo/resources/images/pf/rock.png"/>
			                <img class="computerHand" src="/filo/resources/images/pf/rock.png"/>
			            </div>
			            <div class="options">
			                <button class="sicssors">scissors</button>
			                <button class="rock">rock</button>
			                <button class="paper">paper</button>
			            </div>
			        </div>
			        
			        <!--match End-->
			        <div class="stair">
			            <div class="step">
			                <div class="char c0">
			                    <img class="playerChar pNow" src="/filo/resources/images/pf/playerChar.png"/>
			                    <img class="computerChar cNow" src="/filo/resources/images/pf/comChar.png"/>
			                </div>
			                <div class="block b0 pColor cColor"></div>
			            </div>
			
			            <div class="step">
			                <div class="char c1">
			                    <img class="playerChar" src="/filo/resources/images/pf/playerChar.png"/>
			                    <img class="computerChar" src="/filo/resources/images/pf/comChar.png"/>
			                </div>
			                <div class="block b1"></div>
			            </div>
			
			            <div class="step">
			                <div class="char c2">
			                    <img class="playerChar" src="/filo/resources/images/pf/playerChar.png"/>
			                    <img class="computerChar" src="/filo/resources/images/pf/comChar.png"/>
			                </div>
			                <div class="block b2"></div>
			            </div>
			
			            <div class="step">
			                <div class="char c3">
			                    <img class="playerChar" src="/filo/resources/images/pf/playerChar.png"/>
			                    <img class="computerChar" src="/filo/resources/images/pf/comChar.png"/>
			                </div>
			                <div class="block b3"></div>
			            </div>
			            <div class="step">
			                <div class="char c4">
			                    <img class="playerChar" src="/filo/resources/images/pf/playerChar.png"/>
			                    <img class="computerChar" src="/filo/resources/images/pf/comChar.png"/>
			                </div>
			                <div class="block b4"></div>
			            </div>
			            <div class="step">
			                <div class="char c5">
			                    <img class="playerChar" src="/filo/resources/images/pf/playerChar.png"/>
			                    <img class="computerChar" src="/filo/resources/images/pf/comChar.png"/>
			                </div>
			                <div class="block b5"></div>
			            </div>
			            <div class="step">
			                <div class="char c6">
			                    <img class="playerChar" src="/filo/resources/images/pf/playerChar.png"/>
			                    <img class="computerChar" src="/filo/resources/images/pf/comChar.png"/>
			                </div>
			                <div class="block b6"></div>
			            </div>
			            <div class="step">
			                <div class="char c7">
			                    <img class="playerChar" src="/filo/resources/images/pf/playerChar.png"/>
			                    <img class="computerChar" src="/filo/resources/images/pf/comChar.png"/>
			                </div>
			                <div class="block b7"></div>
			            </div>
			        </div>
			    </div>
			    <!--gameWrap End-->
				
			</div>
			<!-- //rightgame end -->
		</div>	
		<!-- //wrapAll game end -->
		
	<script type="text/javascript" src="<c:url value="/resources/js/rock.js" />"></script>
	
</body>
</html>
