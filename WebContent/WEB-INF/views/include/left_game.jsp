<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div id="left_game">
    <div class="swiper-container" id="left_game_swiper">
    
        <div class="swiper-wrapper">

        	<!--로그인 했을 때 gameBio -->
           	<c:if test="${sessionScope.memId!=null}">
	            <div class="swiper-slide gameBio txtWrap">
		           		<div class="bioWrap">
		                    <c:if test="${userInfo.idIcon==null}">
		                   	 	<img src="/filo/resources/images/pf/user.png">
		                	</c:if>
		                	<c:if test="${userInfo.idIcon!=null}">
		                    	<img src="/filo/resources/images/pf/${userInfo.idIcon}.png">
		                	</c:if>
		                    <div class="nameWrap">
		                        <p class="tit"><strong style="color:${sessionScope.memColor}";>${userInfo.id}</strong></p>
		                        <p class="txt">${userInfo.nickname}</p>
		                    </div>
		                </div>
		                <!--bioWrap End-->
		                
		                <div class="proBar">
		                	<!-- 퍼센트 수치가 낮을수록 프로그레스바를 많이 채워야 하므로(반비례) -->
		                	<c:set var="myper" value="${100-gamePercent}"/>
		                    <progress max="100" value="${myper}"></progress>
		                    <p class="txt">TOP RATE</p>
		                    <p class="txt percen">${gamePercent}%</p>
		                </div>
		                <!--proBar End-->
		                
		                <div class="pIconWrap">
		                	<p class="txt">TOTAL POINT</p>
		                    <p class="sub">${wal.point}P</p>
		                    <img src="/filo/resources/images/pf/pIco.png" />
		                </div>
		                
		                 <a href="/filo/game/shop/purchase.fl"><div class="graBtn sub">Purchase Item</div></a>
	            </div>
	            <!--gameBio End-->
            </c:if>

            
            <!--비로그인 게임 바이오 -->
            <c:if test="${sessionScope.memId==null}">
	            <div class="swiper-slide gameBio txtWrap">
	           		<div class="bioWrap">
	                    <div class="nameWrapB">
	                        <p class="tit">Play game <br/> After sign in</p>
	                    </div>
	                </div>
	                <a href="/filo/login.fl"><div class="graBtn btn1 sub">Sign In</div></a>
	                <a href="/filo/join.fl"><div class="graBtn btn2 sub">Sign Up</div></a>
	            </div>
	            <!--gameBio End-->
	        </c:if>
            
            <c:if test="${sessionScope.memId!=null}">
	            <div class="swiper-slide morePoint txtWrap">
	                <p class="tit">Get More Point</p>
	                <ul class="gameCount">
	                    <li>
	                        <img src="/filo/resources/images/pf/poker-cards.png">
	                        <div class="subWrap">
	                            <p class="sub">Card</p>
	                        </div>    
	                        <a href="/filo/game/card.fl"><div class="goBtn"><img src="/filo/resources/images/tm/arrowR.png"></div></a>
	                    </li>
	                    <li>
	                        <img src="/filo/resources/images/pf/rps.png">
	                        <div class="subWrap">
	                            <p class="sub">Rock P.S</p>
	                        </div>    
	                        <a href="/filo/game/rockPS.fl"><div class="goBtn"><img src="/filo/resources/images/tm/arrowR.png"></div></a>
	                    </li>
	                    <li>
	                        <img src="/filo/resources/images/pf/upDown.png">
	                        <div class="subWrap">
	                            <p class="sub">Up & Down</p>
	                        </div>    
	                        <a href="/filo/game/updown.fl"><div class="goBtn"><img src="/filo/resources/images/tm/arrowR.png"></div></a>
	                    </li>
	                </ul>
	            </div>
            </c:if>
            <!--morePoint End-->
            
            <div class="swiper-slide rankWrap">
                <p class="tit">Player Ranking</p>
                <ul class="player">
                	<c:forEach var="r" items="${top3}">
	                    <li>
	                    	<c:if test="${r.value.idIcon==null}">
	                     	   <img src="/filo/resources/images/pf/user.png">
	                    	</c:if>
	                    	<c:if test="${r.value.idIcon!=null}">
	                     	   <img src="/filo/resources/images/pf/${r.value.idIcon}.png">
	                    	</c:if>
	                        <div class="box">
	                            <p class="user">${r.value.id}</p>
	                            <p class="name">${r.value.nickname}</p> 
	                        </div>
	                        <p class="rank">${r.key}</p>
	                    </li>
                	</c:forEach>

                    <!-- 내꺼 랭킹 -->
                    <c:if test="${sessionScope.memId!=null}">
                    <li class="myRank">
                        <c:if test="${userInfo.idIcon==null}">
                      	  <img src="/filo/resources/images/pf/user.png">
                    	</c:if>
                    	<c:if test="${userInfo.idIcon!=null}">
                     	   <img src="/filo/resources/images/pf/${sessionScope.memIcon}.png">
                    	</c:if>
                        <div class="box">
                            <p class="user">${userInfo.id}</p>
                            <p class="name">${userInfo.nickname}</p> 
                        </div>        
                        <p class="rank">${myRank}</p>
                    </li>
                    </c:if>
                </ul>
                <!--player End-->
            </div>
            <!--rankWrap End-->
            <c:if test="${!empty todayRecords}">
	            <div class="swiper-slide todayRec txtWrap">
	                <p class="tit">Recent Records</p>
	                <ul class="someWrap">
	                    <li><p class="txt">Game</p></li>
	                    <li><p class="txt">Point</p></li>
	                    <li><p class="txt">Date</p></li>
	                </ul>
	                <ul class="totalRecord">
	                	<c:forEach var="list" items="${todayRecords}">
	                    <li>
	                        <ul class="recordWrap">
	                   			<c:if test="${list.score<=0}">
	                            <li><p class="sub">${list.name}</p></li>
	                            <li><p class="sub">${list.score}</p></li>
	                            <li><p class="sub"><fmt:formatDate value="${list.reg}" type="time" pattern="HH:mm"/></p></li>
	                   			</c:if>
	                   			<c:if test="${list.score>0}">
	                            <li><p class="sub onWin">${list.name}</p></li>
	                            <li><p class="sub onWin">+${list.score}</p></li>
	                            <li><p class="sub onWin"><fmt:formatDate value="${list.reg}" type="time" pattern="HH:mm"/></p></li>
	                   			</c:if>
	                        </ul>    
	                    </li>
						</c:forEach>
	                </ul>
	            </div>
            </c:if>
            <!--todayRec End-->
        </div>
    </div>
    <!-- swiperContainer End -->
</div>
<!-- //left_game end -->
 <script>
    var swiper = new Swiper('#left_game_swiper', {
        direction: 'vertical',
        mousewheel: true,
        slidesPerView: 1.65,
        spaceBetween: 30,
	});
   </script>