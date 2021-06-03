<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/include/header_filo.jsp" />

	<div class="wrapAll game">
        <div id="top_game">
        </div>
        <!-- //top_game -->

        <div id="left_game">
            <div class="swiper-container" id="left_game_swiper">
                <div class="swiper-wrapper">
                
                    <div class="swiper-slide gameBio txtWrap">
                        <div class="bioWrap">
                            <img src="/filo/resources/images/pf/pf2-1.jpg">
                            <div class="nameWrap">
                                <p class="tit">vino_costa</p>
                                <p class="txt">cameliner</p>
                            </div>
                        </div>
                        <!--bioWrap End-->
                        <div class="proBar">
                            <progress max="100" value="70"></progress>
                            <p class="txt">TOP RATE</p>
                            <p class="txt percen">72.1%</p>
                            <!--<progress max="${nextVal.rkNeed}" value="${memInfo.travelCnt}"></progress> -->
                        </div>
                        <!--proBar End-->
                        <div class="pIconWrap">
                            <p class="sub">1,203</p>
                            <img src="/filo/resources/images/pf/pIco.png" />
                        </div>
                        <div class="graBtn sub">Purchase Item</div>
                    </div>
                    <!--gameBio End-->
                    
                    <div class="swiper-slide rankWrap txtWrap">
                        <p class="tit">Player Ranking</p>
                        <ul class="player">
                            <li>
                                <img src="/filo/resources/images/pf/pf1.jpg">
                                <div class="playPoint">
                                    <p class="sub">vino_costa</p>
                                    <p class="txt">pride chicken</p> 
                                </div>        
                                <p class="tit">1</p>
                            </li>

                            <li>
                                <img src="/filo/resources/images/pf/pf3.jpg">
                                <div class="playPoint">
                                    <p class="sub">vino_costa</p>
                                    <p class="txt">pride chicken</p> 
                                </div>        
                                <p class="tit">2</p>
                            </li>

                            <li>
                                <img src="/filo/resources/images/pf/pf2-2.jpg">
                                <div class="playPoint">
                                    <p class="sub">vino_costa</p>
                                    <p class="txt">pride chicken</p> 
                                </div>        
                                <p class="tit">3</p>
                            </li>

                            <li>
                                <img src="/filo/resources/images/pf/pf2-1.jpg">
                                <div class="playPoint">
                                    <p class="sub">vino_costa</p>
                                    <p class="txt">pride chicken</p> 
                                </div>        
                                <p class="tit">13</p>
                            </li>

                            <div class="rCover"></div>
                        </ul>
                        <!--player End-->
                    </div>
                    <!--rankWrap End-->
                    <div class="swiper-slide todayRec txtWrap">
                        <p class="tit">Recent Records</p>
                        <ul class="someWrap">
                            <li><p class="txt">Game</p></li>
                            <li><p class="txt">Point</p></li>
                            <li><p class="txt">Date</p></li>
                        </ul>
                        <ul class="totalRecord">
                            <li>
                                <ul class="recordWrap">
                                    <li><p class="sub">RockPS</p></li>
                                    <li><p class="sub">+ 20</p></li>
                                    <li><p class="sub">PM 12:00</p></li>
                                </ul>    
                            </li>
                            <li>
                                <ul class="recordWrap">
                                    <li><p class="sub">RockPS</p></li>
                                    <li><p class="sub">+ 20</p></li>
                                    <li><p class="sub">PM 12:00</p></li>
                                </ul>    
                            </li>
                            <li>
                                <ul class="recordWrap">
                                    <li><p class="sub onWin">RockPS</p></li>
                                    <li><p class="sub onWin">+ 20</p></li>
                                    <li><p class="sub onWin">PM 12:00</p></li>
                                </ul>    
                            </li>
                            <li>
                                <ul class="recordWrap">
                                    <li><p class="sub onWin">RockPS</p></li>
                                    <li><p class="sub onWin">+ 20</p></li>
                                    <li><p class="sub onWin">PM 12:00</p></li>
                                </ul>    
                            </li>
                            <li>
                                <ul class="recordWrap">
                                    <li><p class="sub">RockPS</p></li>
                                    <li><p class="sub">+ 20</p></li>
                                    <li><p class="sub">PM 12:00</p></li>
                                </ul>    
                            </li>
                            <li>
                                <ul class="recordWrap">
                                    <li><p class="sub onWin">RockPS</p></li>
                                    <li><p class="sub onWin">+ 20</p></li>
                                    <li><p class="sub onWin">PM 12:00</p></li>
                                </ul>    
                            </li>
                            <li>
                                <ul class="recordWrap">
                                    <li><p class="sub onWin">RockPS</p></li>
                                    <li><p class="sub onWin">+ 20</p></li>
                                    <li><p class="sub onWin">PM 12:00</p></li>
                                </ul>    
                            </li>
                            <li>
                                <ul class="recordWrap">
                                    <li><p class="sub onWin">RockPS</p></li>
                                    <li><p class="sub onWin">+ 20</p></li>
                                    <li><p class="sub onWin">PM 12:00</p></li>
                                </ul>    
                            </li>
                        </ul>
                    </div>
                    <!--todayRec End-->
                    
                    <div class="swiper-slide morePoint txtWrap">
                        <p class="tit">Get More Point</p>
                        <ul class="gameCount">
                            <li>
                                <img src="/filo/resources/images/pf/roulette.png">
                                <div class="subWrap">
                                    <p class="sub">Roulette</p>
                                </div>    
                                <div class="goBtn"></div>
                            </li>
                            <li>
                                <img src="/filo/resources/images/pf/roulette.png">
                                <div class="subWrap">
                                    <p class="sub">Roulette</p>
                                </div>    
                                <div class="goBtn"></div>
                            </li>
                            <li>
                                <img src="/filo/resources/images/pf/roulette.png">
                                <div class="subWrap">
                                    <p class="sub">Roulette</p>
                                </div>    
                                <div class="goBtn"></div>
                            </li>
                        </ul>
                    </div>
                    <!--morePoint End-->
                </div>
            </div>
            <!-- swiperContainer End -->
        </div>
        <!-- //left_game end -->
        
        <div class="index_game">
            <div class="inner1">
                123
            </div>

            <div class="inner2">
                <div class="swiper-container" id="right_game_swiper">
                    <div class="swiper-wrapper">
                        <div class="swiper-slide">asdfasdfsad</div>
                        <div class="swiper-slide">asf6d58g4sd564f</div>
                        <div class="swiper-slide">Slide 3</div>
                        <div class="swiper-slide">Slide 4</div>
                        <div class="swiper-slide">Slide 5</div>
                        <div class="swiper-slide">Slide 6</div>
                        <div class="swiper-slide">Slide 7</div>
                        <div class="swiper-slide">Slide 8</div>
                        <div class="swiper-slide">Slide 9</div>
                        <div class="swiper-slide">Slide 10</div>
                    </div>
                </div>
            </div>
        </div>
        <!-- //index_game end -->

    </div>

    <!-- Initialize Swiper -->
    <script>
        var swiper = new Swiper('#left_game_swiper', {
        direction: 'vertical',
        mousewheel: true,
        slidesPerView: 1.85,
        spaceBetween: 30,
        });

        var swiper = new Swiper('#right_game_swiper', {
        mousewheel: true,
        slidesPerView: 2.5,
        spaceBetween: 30,
        });
    </script>
</body>
</html>