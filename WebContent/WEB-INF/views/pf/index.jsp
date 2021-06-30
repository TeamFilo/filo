<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/include/header_filo.jsp" />
	
	<jsp:include page="/WEB-INF/views/include/top_pf.jsp" />
	<!-- //top_pf end -->
	
	<div style="display:none;position:fixed;top:50px;left:50px;z-index:999;" id="callbacksDiv"></div>
    <!--callbacksDiv end-->    

    <!-- <div class="fullpageImgWrap">
        <img class="img img1" src="/filo/resources/images/pf/bread.png"/>
        <img class="img img2-1" src="/filo/resources/images/pf/bus.png"/>
        <img class="img img2-2" src="/filo/resources/images/pf/beer.png"/>
        <img class="img img3" src="/filo/resources/images/pf/soju.png"/>
    </div> -->
    <!--imgWrap End-->

   	<div id="fullpage">
        <div class="section active" id="section0">
        
            <div class="titWrap titWrap1 center">
			
                <p class="tit">We are FILO!</p>
                <p class="sub">
                	"First In Last Out"<br>				    				                   
                	Team FILO를 소개합니다.
                </p>
                <p class="txt">
                	남다른 열정과 뜻을 가진 개발자들 입니다.<br/>
                	나름의 결과물을 준비해봤어요.
                </p>
             </div>
             <a href="/filo/index.fl#2ndPage" class="scrolldown"><span></span><span></span><span></span></a>
        </div>
        
        <div class="section" id="section1">
        	<div class="slide_left">
           		<div class="box"></div>
           		<div class="boundary"></div>
           	</div>
           	<ul class="slide_review slide_review2-1">
           		<li></li>
           		<li></li>
           		<li></li>
           		<li></li>
           	</ul>
           	<ul class="slide_review slide_review2-2">
           		<li></li>
           		<li></li>
           		<li></li>
           		<li></li>
           	</ul>
           	<ul class="slide_review slide_review2-3">
           		<li></li>
           		<li></li>
           		<li></li>
           		<li></li>
           	</ul>
        	<div class="slide_bg"></div>
            <div class="slide pf" id="slide1">
                <div class="titWrap titWrap2-1">
                    <p class="tit">Portfolio</p>
                    <p class="sub">
						지금 보고 있는 페이지는 <br/>
			                     어떻게 만들어졌을까요?
                    </p>
                    <p class="txt">
						포트폴리오에 사용된 기술에 대한 설명입니다.<br/>
			                     아래 Detail 버튼으로 자세한 내용을 확인해보세요.
                    </p>
                    <div class="btnDef bounce-to-right btnPop btnPop2-1" id="deBtn1">Detail</div>
                 </div>
            </div>

            <div class="slide gm" id="slide2">
                <div class="titWrap titWrap2-2">
                    <p class="tit">Game</p>
                    <p class="sub">
			                       미니게임 즐기고 <br/>
			                       포인트 모아보세요.
                    </p>
                    <p class="txt">
			                       게임과 프로젝트가 서로 연동되는 시스템입니다<br/>
			                       게임을 통해 포인트를 획득하고<br/>
			                       이모티콘, 아이디 색상 등의 아이템을 구매해보세요!
                    </p>
                    <div class="btnDef bounce-to-right btnPop btnPop2 btnPop2-2" id="deBtn2">Detail</div>
                    <div class="btnDef bounce-to-right btnPop btnPop2-2" id="goBtn2"><a href="/filo/game/main.fl">Go</a></div>
                 </div>
            </div>

            <div class="slide tm" id="slide3">            	
                <div class="titWrap titWrap2-3">
                    <p class="tit">TravelMaker</p>
                    <p class="sub">
						여행 동행 매칭 서비스 <br/>
						자신만의 추억을 만들어보세요.
                    </p>
                    <p class="txt">
						여행 횟수에 따라 레벨을 올리고 포지션을 선택해보세요<br/>
						여행 테마를 정하고 필요한 포지션의 팀원들을 모아<br/>
						우리만의 특별한 여행을 떠나보세요! 
                    </p>
                    <div class="btnDef bounce-to-right btnPop btnPop2-3" id="deBtn3">Detail</div>
                    <div class="btnDef bounce-to-right btnPop btnPop2-3" id="goBtn3"><a href="/filo/mem/index.fl">Go</a></div>
                 </div>
            </div>
        </div>
        
        <div class="section" id="section2">
            <div class="titWrap titWrap3">

                <p class="tit">Profile</p>
                <p class="sub">
	                더 나은 개발자로<br/>
	                성장하고 싶습니다.
                </p>
                <p class="txt">
                	프로필 페이지입니다.<br/>
                	개개인의 특성과 연락처를<br/>
                	확인하실 수 있습니다.	                	
                </p>
              		<div class="btnDef bounce-to-right btnPop btnPop3" id="goBtn4"><a href="/filo/profile/main.fl">Go</a></div>
             </div>
             <!-- titWrap End -->
        </div>
        
        <div class="section fp-auto-height" id="section3">
			<ul class="footer">
                <li>
                   <ul class="icon">
                     <li></li>
                     <li></li>
                     <li></li>
                   </ul>
                   <div class="info">
                        <p class="sub">Info</p>
                     <p>이승민 조윤호 정보름 이승헌 허윤서</p>
                     <p>서울시 관악구 남부순환로 1820,에그엘로우14층</p>
                   </div>
                </li>
                <li class="middle">
                   <p class="sub">Service Center</p>
                   <p class="ph">1577-1577</p>
                </li>
                <li>
                   <select class="sel_portfolio">
                     <!-- <option defaultValue="Family Site">Family Site</option>
                     <option value="포폴1">GITHUB</option>
                     <option value="포폴2">Americano</option> -->
                   </select>
                </li>
                <li>
                   <p>Copyright 2021, Team FILO. all rights reserved.</p>
                </li>
             </ul>
		</div>
	</div>
	<!-- //fullpage end -->
		
    
	<div class="popWrap" id="popWrap">
        <ul class="inner" id="popWrapTop">
            <li>
                <div class="vodWrap">
                    <video src="/filo/resources/images/pf/portfolio.mp4" autoplay muted loop></video>
                    <div class="pCover"></div>
                    <div class="btnPopClose"></div>
                    <div class="txtWrap">
                        <p class="bTxt">We are FILO!</p>
                        <p class="tit">Portfolio</p>
                        <div class="btnDef bounce-to-right">Go</div>
                    </div>
                    <!--txtWrap End-->
                    <div id="scroll-down">
                        <span class="arrow-down">
                        <!-- css generated icon -->
                        </span>
                        <span id="scroll-title">
                        Scroll down
                        </span>
                    </div>
                </div>
                <!--vodWrap End-->
                <div class="contWrap">
                    <div class="indexWrap txtWrap">
                        <p class="sTit">Duration</p>
                        <p class="bTxt">2021.03.21 - 2021.04.29</p>
                        <p class="sTit">Service</p>
                        <p class="bTxt">Travel Maker는 여행 동행 매칭 서비스입니다.  여행 횟수에 따라 레벨을 올리고 포지션을 선택해 자신만의 여행을 떠나보세요! </p>
                        <p class="sTit">Contributor</p>
                        <p class="bTxt">Lee Seungmin, Jung Boram, Lee Seungheon, Heo Yoonseo </p>
                    </div>
                    <!--indexWrap End-->
                    <p class="line"></p>
                    <div class="partWrap txtWrap">
                        <p class="sTit">Front-End Dev</p>
                        <ul class="techWrap">
                            <li>
                                <p class="ssTit">Server</p>
                                <p class="bTxt">Tomcat 8.5</p>
                            </li>
                            <li>
                                <p class="ssTit">Tool</p>
                                <p class="bTxt">Visual Studio, Eclipse</p>
                            </li>
                            <li>
                                <p class="ssTit">Language </p>
                                <p class="bTxt">Html, css, Js</p>
                            </li>
                            <li>
                                <p class="ssTit">Contribution </p>
                                <p class="bTxt">Lee Seung Min(100%), Lee Seung Hun(100%)</p>
                            </li>
                        </ul>
                    </div>
                    <!--partWrap End-->
                    <p class="line"></p>
                    <div class="partWrap txtWrap">
                        <p class="sTit">Back-End Dev</p>
                        <ul class="techWrap">
                            <li>
                                <p class="ssTit">Server</p>
                                <p class="bTxt">Tomcat 8.5</p>
                            </li>
                            <li>
                                <p class="ssTit">Tool</p>
                                <p class="bTxt">Visual Studio, Eclipse</p>
                            </li>
                            <li>
                                <p class="ssTit">Language </p>
                                <p class="bTxt">Html, css, Js</p>
                            </li>
                            <li>
                                <p class="ssTit">Contribution </p>
                                <p class="bTxt">Lee Seung Min(100%), Lee Seung Hun(100%)</p>
                            </li>
                        </ul>
                    </div>
                    <!--partWrap End-->
                    <p class="line"></p>
                    <div class="devWrap txtWrap">
                        <p class="sTit">Main Point</p>
                        <ul class="pointWrap">
                            <li>
                                <p class="bTxt">Chatting</p>
                                <img src="/filo/resources/images/tm/myhomeimg.png">
                                <p class="deTit">컬러 콘텐츠의 실습 교재를 통해 NCS 컬러시스템<br /> 을 학습하고  콘텐츠의 실습 교재를 통해 NCS </p>
                            </li>
                            <li>
                                <p class="bTxt">Full Page</p>
                                <img src="/filo/resources/images/tm/tl4.jpg">
                                <p class="deTit">컬러 콘텐츠의 실습 교재를 통해 NCS 컬러시스템<br /> 을 학습하고  콘텐츠의 실습 교재를 통해 NCS </p>
                            </li>
                            <li>
                                <p class="bTxt">Set Interval</p>
                                <img src="/filo/resources/images/tm/tl2.jpg">
                                <p class="deTit">컬러 콘텐츠의 실습 교재를 통해 NCS 컬러시스템<br /> 을 학습하고  콘텐츠의 실습 교재를 통해 NCS </p>
                            </li>
                            <li>
                                <p class="bTxt">여행 떠나기</p>
                                <img src="/filo/resources/images/tm/pbg5.jpg">
                                <p class="deTit">컬러 콘텐츠의 실습 교재를 통해 NCS 컬러시스템<br /> 을 학습하고  콘텐츠의 실습 교재를 통해 NCS </p>
                            </li>
                            <li>
                                <p class="bTxt">여행 떠나기</p>
                                <img src="/filo/resources/images/tm/mout.jpg">
                                <p class="deTit">컬러 콘텐츠의 실습 교재를 통해 NCS 컬러시스템<br /> 을 학습하고  콘텐츠의 실습 교재를 통해 NCS </p>
                            </li>
                            <li>
                                <p class="bTxt">여행 떠나기</p>
                                <img src="/filo/resources/images/tm/mv1.jpg">
                                <p class="deTit">컬러 콘텐츠의 실습 교재를 통해 NCS 컬러시스템<br /> 을 학습하고  콘텐츠의 실습 교재를 통해 NCS </p>
                            </li>
                            <li>
                                <p class="bTxt">여행 떠나기</p>
                                <img src="/filo/resources/images/tm/pbg3.jpg">
                                <p class="deTit">컬러 콘텐츠의 실습 교재를 통해 NCS 컬러시스템<br /> 을 학습하고  콘텐츠의 실습 교재를 통해 NCS </p>
                            </li>
                            <li>
                                <p class="bTxt">여행 떠나기</p>
                                <img src="/filo/resources/images/tm/pbg4.jpg">
                                <p class="deTit">컬러 콘텐츠의 실습 교재를 통해 NCS 컬러시스템<br /> 을 학습하고  콘텐츠의 실습 교재를 통해 NCS </p>
                            </li>
                        </ul>
                    </div>
                    <!--devWrap End-->
                </div>
                <!--contWrap End-->
            </li>
            <li class="gm">
                <div class="vodWrap">
                    <video src="/filo/resources/images/pf/game.mp4" autoplay muted loop></video>
                    <div class="pCover"></div>
                    <div class="btnPopClose"></div>
                    <div class="txtWrap">
                        <p class="bTxt">Earn Point Playing Games</p>
                        <p class="tit">Game</p>
                        <div class="btnDef bounce-to-right">Go</div>
                    </div>
                    
                    <div id="scroll-down">
                        <span class="arrow-down">
                        <!-- css generated icon -->
                        </span>
                        <span id="scroll-title">
                        Scroll down
                        </span>
                    </div>
                      
                    <!--txtWrap End-->
                </div>
                <!--vodWrap End-->
                <div class="contWrap">
                    <div class="indexWrap txtWrap">
                        <p class="sTit">Duration</p>
                        <p class="bTxt">2021.03.21 - 2021.04.29</p>
                        <p class="sTit">Service</p>
                        <p class="bTxt">Travel Maker는 여행 동행 매칭 서비스입니다.  여행 횟수에 따라 레벨을 올리고 포지션을 선택해 자신만의 여행을 떠나보세요! </p>
                        <p class="sTit">Contributor</p>
                        <p class="bTxt">Lee Seungmin, Jung Boram, Lee Seungheon, Heo Yoonseo </p>
                    </div>
                    <!--indexWrap End-->
                    <p class="line"></p>
                    <div class="partWrap txtWrap">
                        <p class="sTit">Front-End Dev</p>
                        <ul class="techWrap">
                            <li>
                                <p class="ssTit">Server</p>
                                <p class="bTxt">Tomcat 8.5</p>
                            </li>
                            <li>
                                <p class="ssTit">Tool</p>
                                <p class="bTxt">Visual Studio, Eclipse</p>
                            </li>
                            <li>
                                <p class="ssTit">Language </p>
                                <p class="bTxt">Html, css, Js</p>
                            </li>
                            <li>
                                <p class="ssTit">Contribution </p>
                                <p class="bTxt">Lee Seung Min(100%), Lee Seung Hun(100%)</p>
                            </li>
                        </ul>
                    </div>
                    <!--partWrap End-->
                    <div class="partWrap txtWrap">
                        <p class="sTit">Back-End Dev</p>
                        <ul class="techWrap">
                            <li>
                                <p class="ssTit">Server</p>
                                <p class="bTxt">Tomcat 8.5</p>
                            </li>
                            <li>
                                <p class="ssTit">Tool</p>
                                <p class="bTxt">Visual Studio, Eclipse</p>
                            </li>
                            <li>
                                <p class="ssTit">Language </p>
                                <p class="bTxt">Html, css, Js</p>
                            </li>
                            <li>
                                <p class="ssTit">Contribution </p>
                                <p class="bTxt">Lee Seung Min(100%), Lee Seung Hun(100%)</p>
                            </li>
                        </ul>
                    </div>
                    <!--partWrap End-->
                    <p class="line"></p>
                    <div class="devWrap txtWrap">
                        <p class="sTit">Main Point</p>
                        <ul class="pointWrap">
                            <li>
                                <p class="bTxt">Chatting</p>
                                <img src="/filo/resources/images/tm/myhomeimg.png">
                                <p class="deTit">컬러 콘텐츠의 실습 교재를 통해 NCS 컬러시스템<br /> 을 학습하고  콘텐츠의 실습 교재를 통해 NCS </p>
                            </li>
                            <li>
                                <p class="bTxt">Full Page</p>
                                <img src="/filo/resources/images/tm/tl4.jpg">
                                <p class="deTit">컬러 콘텐츠의 실습 교재를 통해 NCS 컬러시스템<br /> 을 학습하고  콘텐츠의 실습 교재를 통해 NCS </p>
                            </li>
                            <li>
                                <p class="bTxt">Set Interval</p>
                                <img src="/filo/resources/images/tm/tl2.jpg">
                                <p class="deTit">컬러 콘텐츠의 실습 교재를 통해 NCS 컬러시스템<br /> 을 학습하고  콘텐츠의 실습 교재를 통해 NCS </p>
                            </li>
                            <li>
                                <p class="bTxt">여행 떠나기</p>
                                <img src="/filo/resources/images/tm/pbg5.jpg">
                                <p class="deTit">컬러 콘텐츠의 실습 교재를 통해 NCS 컬러시스템<br /> 을 학습하고  콘텐츠의 실습 교재를 통해 NCS </p>
                            </li>
                            <li>
                                <p class="bTxt">여행 떠나기</p>
                                <img src="/filo/resources/images/tm/mout.jpg">
                                <p class="deTit">컬러 콘텐츠의 실습 교재를 통해 NCS 컬러시스템<br /> 을 학습하고  콘텐츠의 실습 교재를 통해 NCS </p>
                            </li>
                            <li>
                                <p class="bTxt">여행 떠나기</p>
                                <img src="/filo/resources/images/tm/mv1.jpg">
                                <p class="deTit">컬러 콘텐츠의 실습 교재를 통해 NCS 컬러시스템<br /> 을 학습하고  콘텐츠의 실습 교재를 통해 NCS </p>
                            </li>
                            <li>
                                <p class="bTxt">여행 떠나기</p>
                                <img src="/filo/resources/images/tm/pbg3.jpg">
                                <p class="deTit">컬러 콘텐츠의 실습 교재를 통해 NCS 컬러시스템<br /> 을 학습하고  콘텐츠의 실습 교재를 통해 NCS </p>
                            </li>
                            <li>
                                <p class="bTxt">여행 떠나기</p>
                                <img src="/filo/resources/images/tm/pbg4.jpg">
                                <p class="deTit">컬러 콘텐츠의 실습 교재를 통해 NCS 컬러시스템<br /> 을 학습하고  콘텐츠의 실습 교재를 통해 NCS </p>
                            </li>
                        </ul>
                    </div>
                    <!--devWrap End-->
                </div>
                <!--contWrap End-->
            </li>
            <li class="tm">
                <div class="vodWrap">
                    <video src="/filo/resources/images/pf/travelM.mp4" autoplay muted loop></video>
                    <div class="pCover"></div>
                    <div class="btnPopClose"></div>
                    <div class="txtWrap">
                        <p class="bTxt">Make your Own Travel</p>
                        <p class="tit">Travel Maker</p>
                        <div class="btnDef bounce-to-right">Go</div>
                    </div>
                    <!--txtWrap End-->
                </div>
                <!--vodWrap End-->
                <div class="contWrap">
                    <div class="indexWrap txtWrap">
                        <p class="sTit">Duration</p>
                        <p class="bTxt">2021.03.21 - 2021.04.29</p>
                        <p class="sTit">Service</p>
                        <p class="bTxt">Travel Maker는 여행 동행 매칭 서비스입니다.  여행 횟수에 따라 레벨을 올리고 포지션을 선택해 자신만의 여행을 떠나보세요! </p>
                        <p class="sTit">Contributor</p>
                        <p class="bTxt">Lee Seungmin, Jung Boram, Lee Seungheon, Heo Yoonseo </p>
                    </div>
                    <!--indexWrap End-->
                    <p class="line"></p>
                    <div class="partWrap txtWrap">
                        <p class="sTit">Front-End Dev</p>
                        <ul class="techWrap">
                            <li>
                                <p class="ssTit">Server</p>
                                <p class="bTxt">Tomcat 8.5</p>
                            </li>
                            <li>
                                <p class="ssTit">Tool</p>
                                <p class="bTxt">Visual Studio, Eclipse</p>
                            </li>
                            <li>
                                <p class="ssTit">Language </p>
                                <p class="bTxt">Html, css, Js</p>
                            </li>
                            <li>
                                <p class="ssTit">Contribution </p>
                                <p class="bTxt">Lee Seung Min(100%), Lee Seung Hun(100%)</p>
                            </li>
                        </ul>
                    </div>
                    <!--partWrap End-->
                    <div class="partWrap txtWrap">
                        <p class="sTit">Back-End Dev</p>
                        <ul class="techWrap">
                            <li>
                                <p class="ssTit">Server</p>
                                <p class="bTxt">Tomcat 8.5</p>
                            </li>
                            <li>
                                <p class="ssTit">Tool</p>
                                <p class="bTxt">Visual Studio, Eclipse</p>
                            </li>
                            <li>
                                <p class="ssTit">Language </p>
                                <p class="bTxt">Html, css, Js</p>
                            </li>
                            <li>
                                <p class="ssTit">Contribution </p>
                                <p class="bTxt">Lee Seung Min(100%), Lee Seung Hun(100%)</p>
                            </li>
                        </ul>
                    </div>
                    <!--partWrap End-->
                    <p class="line"></p>
                    <div class="devWrap txtWrap">
                        <p class="sTit">Main Point</p>
                        <ul class="pointWrap">
                            <li>
                                <p class="bTxt">Chatting</p>
                                <img src="/filo/resources/images/tm/myhomeimg.png">
                                <p class="deTit">컬러 콘텐츠의 실습 교재를 통해 NCS 컬러시스템<br /> 을 학습하고  콘텐츠의 실습 교재를 통해 NCS </p>
                            </li>
                            <li>
                                <p class="bTxt">Full Page</p>
                                <img src="/filo/resources/images/tm/tl4.jpg">
                                <p class="deTit">컬러 콘텐츠의 실습 교재를 통해 NCS 컬러시스템<br /> 을 학습하고  콘텐츠의 실습 교재를 통해 NCS </p>
                            </li>
                            <li>
                                <p class="bTxt">Set Interval</p>
                                <img src="/filo/resources/images/tm/tl2.jpg">
                                <p class="deTit">컬러 콘텐츠의 실습 교재를 통해 NCS 컬러시스템<br /> 을 학습하고  콘텐츠의 실습 교재를 통해 NCS </p>
                            </li>
                            <li>
                                <p class="bTxt">여행 떠나기</p>
                                <img src="/filo/resources/images/tm/pbg5.jpg">
                                <p class="deTit">컬러 콘텐츠의 실습 교재를 통해 NCS 컬러시스템<br /> 을 학습하고  콘텐츠의 실습 교재를 통해 NCS </p>
                            </li>
                            <li>
                                <p class="bTxt">여행 떠나기</p>
                                <img src="/filo/resources/images/tm/mout.jpg">
                                <p class="deTit">컬러 콘텐츠의 실습 교재를 통해 NCS 컬러시스템<br /> 을 학습하고  콘텐츠의 실습 교재를 통해 NCS </p>
                            </li>
                            <li>
                                <p class="bTxt">여행 떠나기</p>
                                <img src="/filo/resources/images/tm/mv1.jpg">
                                <p class="deTit">컬러 콘텐츠의 실습 교재를 통해 NCS 컬러시스템<br /> 을 학습하고  콘텐츠의 실습 교재를 통해 NCS </p>
                            </li>
                            <li>
                                <p class="bTxt">여행 떠나기</p>
                                <img src="/filo/resources/images/tm/pbg3.jpg">
                                <p class="deTit">컬러 콘텐츠의 실습 교재를 통해 NCS 컬러시스템<br /> 을 학습하고  콘텐츠의 실습 교재를 통해 NCS </p>
                            </li>
                            <li>
                                <p class="bTxt">여행 떠나기</p>
                                <img src="/filo/resources/images/tm/pbg4.jpg">
                                <p class="deTit">컬러 콘텐츠의 실습 교재를 통해 NCS 컬러시스템<br /> 을 학습하고  콘텐츠의 실습 교재를 통해 NCS </p>
                            </li>
                        </ul>
                    </div>
                    <!--devWrap End-->
                </div>
                <!--contWrap End-->
            </li>

        </ul>
    </div>
    <!-- //popWrap end -->
	    
    <div class="btnGoTop"><img src="/filo/resources/images/pf/goTop.png"></div>
    
	<script type="text/javascript">	
	let slideNum = "2-1";
	var myFullpage = new fullpage('#fullpage', {
		anchors: ['1stPage', '2ndPage', '3rdPage','4thPage'],
		onLeave: function(origin, destination, direction){
			$('.slide_left > .box').css('background','transparent');
        	$('.slide_left > .boundary').css('border-bottom','100vh solid transparent');
			$('.slide_bg').css('background','transparent');
			$('.slide_review2-1').hide();
			$('.slide_review2-2').hide();
			$('.slide_review2-3').hide();
			$('.titWrap > .tit').hide().animate({opacity:'0', top:'-80px'});
			$('.titWrap > .sub').hide().animate({opacity:'0', left:'-80px'});
			$('.titWrap > .txt').hide().animate({opacity:'0', left:'-80px'});
			$('.slide_review').hide().animate({left:'-100%'},1000);
			$('.btnPop').hide().animate({opacity:'0'});
			$('.total_depth_main > li').removeClass('on');
			$('.scrolldown').hide();
		},
		afterLoad: function(origin, destination, direction){
			console.log();
			if(destination.index == 0){
				$('#logo').removeClass('gm').removeClass('tm').addClass('pf');
				$('#ham').removeClass('white');
	        	$('#sign').removeClass('white');
				$('.titWrap1 > .tit').show().animate({opacity:'1', top:'0'},700);
				$('.titWrap1 > .sub').delay(300).show().animate({opacity:'1', left:'0'},700);
				$('.titWrap1 > .txt').delay(600).show().animate({opacity:'1', left:'0'},700);
				$('.total_depth_main > li').eq(0).addClass('on');
				$('.scrolldown').fadeIn();
            }else if(destination.index == 1 && slideNum === "2-1"){
            	$('#logo').removeClass('gm').removeClass('tm').addClass('pf');
            	$('#ham').addClass('white');
            	$('#sign').addClass('white');
            	$('.slide_left > .box').css('background','#fff');
            	$('.slide_left > .boundary').css('border-bottom','100vh solid #fff');
            	$('.slide_bg').css('background','#ff3f02')
				$('.slide_review2-1').show().animate({left:'870px'},1000);
            	$('.titWrap2-1 > .tit').delay(200).show().animate({opacity:'1', top:'0'},700);
				$('.titWrap2-1 > .sub').delay(500).show().animate({opacity:'1', left:'0'},700);
				$('.titWrap2-1 > .txt').delay(700).show().animate({opacity:'1', left:'0'},700);
				$('.btnPop2-1').show().animate({opacity:'1'},700);
				$('.total_depth_main > li').eq(1).addClass('on');
            }else if(destination.index == 1 && slideNum === "2-2"){
            	$('#logo').removeClass('pf').removeClass('tm').addClass('gm');
            	$('#ham').addClass('white');
            	$('#sign').addClass('white');
            	$('.slide_left > .box').css('background','#fff');
            	$('.slide_left > .boundary').css('border-bottom','100vh solid #fff');
            	$('.slide_left > .box').css('background','#21252A');
            	$('.slide_left > .boundary').css('border-bottom','100vh solid #21252A');
            	$('.slide_bg').css('background','#8542ff');
				$('.slide_review2-2').show().animate({left:'870px'},1000);
            	$('.titWrap2-2 > .tit').delay(200).show().animate({opacity:'1', top:'0'},700);
				$('.titWrap2-2 > .sub').delay(500).show().animate({opacity:'1', left:'0'},700);
				$('.titWrap2-2 > .txt').delay(700).show().animate({opacity:'1', left:'0'},700);
				$('.btnPop2-2').show().animate({opacity:'1'},700);
				$('.total_depth_main > li').eq(2).addClass('on');
            }else if(destination.index == 1 && slideNum === "2-3"){
            	$('#logo').removeClass('pf').removeClass('gm').addClass('tm');
            	$('#ham').addClass('white');
            	$('#sign').addClass('white');
            	$('.slide_left > .box').css('background','#fff');
            	$('.slide_left > .boundary').css('border-bottom','100vh solid #fff');
            	$('.slide_bg').css('background','#ff0000')
				$('.slide_review2-3').show().animate({left:'870px'},1000);
            	$('.titWrap2-3 > .tit').delay(200).show().animate({opacity:'1', top:'0'},700);
				$('.titWrap2-3 > .sub').delay(500).show().animate({opacity:'1', left:'0'},700);
				$('.titWrap2-3 > .txt').delay(700).show().show().animate({opacity:'1', left:'0'},700);
				$('.btnPop2-3').show().animate({opacity:'1'},700);
				$('.total_depth_main > li').eq(3).addClass('on');
            }else if(destination.index == 2){
            	$('#logo').removeClass('gm').removeClass('tm').addClass('pf');
            	$('#ham').removeClass('white');
            	$('#sign').removeClass('white');
            	$('.titWrap3 > .tit').show().animate({opacity:'1', top:'0'},700);
				$('.titWrap3 > .sub').delay(300).show().animate({opacity:'1', left:'0'},700);
				$('.titWrap3 > .txt').delay(600).show().animate({opacity:'1', left:'0'},700);
				$('.btnPop3').show().animate({opacity:'1'},700);
            }
        },
        onSlideLeave: function(section, origin, destination, direction){        	
        	$('.titWrap > .tit').hide().animate({opacity:'0', top:'-80px'});
			$('.titWrap > .sub').hide().animate({opacity:'0', left:'-80px'});
			$('.titWrap > .txt').hide().animate({opacity:'0', left:'-80px'});
			$('.btnPop').hide().animate({opacity:'0'});
			$('.slide_review').hide().animate({left:'-100%'},1000);
			$('.total_depth_main > li').removeClass('on');
        },
        afterSlideLoad: function(section, origin, destination, direction){
        	if(destination.index == 0){
        		$('#logo').removeClass('gm').removeClass('tm').addClass('pf');
        		$('#ham').addClass('white');
        		$('#sign').addClass('white');
        		$('.slide_left > .box').css('background','#fff');
            	$('.slide_left > .boundary').css('border-bottom','100vh solid #fff');
        		$('.slide_bg').css('background','#ff3f02')
				$('.slide_review2-1').show().animate({left:'870px'},1000);
				$('.titWrap2-1 > .tit').delay(200).show().animate({opacity:'1', top:'0'},700);
				$('.titWrap2-1 > .sub').delay(500).show().animate({opacity:'1', left:'0'},700);
				$('.titWrap2-1 > .txt').delay(700).show().animate({opacity:'1', left:'0'},700);
				$('.btnPop2-1').show().animate({opacity:'1'},700);
				$('.total_depth_main > li').eq(1).addClass('on');
				slideNum = "2-1";
            }else if(destination.index == 1){
            	$('#logo').removeClass('pf').removeClass('tm').addClass('gm');
            	$('#ham').addClass('white');
            	$('#sign').addClass('white');
            	$('.slide_left > .box').css('background','#21252A');
            	$('.slide_left > .boundary').css('border-bottom','100vh solid #21252A');
            	$('.slide_bg').css('background','#8542ff')
            	$('.slide_review2-2').show().animate({left:'870px'},1000);
            	$('.titWrap2-2 > .tit').delay(200).show().animate({opacity:'1', top:'0'},700);
				$('.titWrap2-2 > .sub').delay(500).show().animate({opacity:'1', left:'0'},700);
				$('.titWrap2-2 > .txt').delay(700).show().animate({opacity:'1', left:'0'},700);				
				$('.btnPop2-2').show().animate({opacity:'1'},700);
				$('.total_depth_main > li').eq(2).addClass('on');
				slideNum = "2-2";
            }else if(destination.index == 2){
            	$('#logo').removeClass('pf').removeClass('gm').addClass('tm');
            	$('#ham').addClass('white');
            	$('#sign').addClass('white');
            	$('.slide_left > .box').css('background','#fff');
            	$('.slide_left > .boundary').css('border-bottom','100vh solid #fff');
            	$('.slide_bg').css('background','#ff0000')
				$('.slide_review2-3').show().animate({left:'870px'},1000);
            	$('.titWrap2-3 > .tit').delay(200).show().animate({opacity:'1', top:'0'},700);
				$('.titWrap2-3 > .sub').delay(500).show().animate({opacity:'1', left:'0'},700);
				$('.titWrap2-3 > .txt').delay(700).show().animate({opacity:'1', left:'0'},700);
				$('.btnPop2-3').show().animate({opacity:'1'},700);
				$('.total_depth_main > li').eq(3).addClass('on');
				slideNum = "2-3";
            }
        }
        
	});
	
	//layer pop-up
	$('#deBtn1').click(function(){
	    $('body').on('scroll mousewheel', function(event) {
	        event.preventDefault();
	        event.stopPropagation();
	        return false;
	    });
	    $('#mCover').fadeIn().css('z-index','1000');    
	    $('.popWrap').fadeIn();    
	    $('.popWrap > .inner > li').eq(0).fadeIn();
	});
	$('#deBtn2').click(function(){
	    $('body').on('scroll mousewheel', function(event) {
	        event.preventDefault();
	        event.stopPropagation();
	        return false;
	    });
	    $('#mCover').fadeIn().css('z-index','1000');    
	    $('.popWrap').fadeIn();    
	    $('.popWrap > .inner > li').eq(1).fadeIn();
	});
	$('#deBtn3').click(function(){
	    $('body').on('scroll mousewheel', function(event) {
	        event.preventDefault();
	        event.stopPropagation();
	        return false;
	    });
	    $('#mCover').fadeIn().css('z-index','1000');    
	    $('.popWrap').fadeIn();    
	    $('.popWrap > .inner > li').eq(2).fadeIn();
	});
	$('.btnPopClose').click(function(){
	    $('.popWrap').fadeOut();
	    $('.popWrap > .inner > li').fadeOut();
	    $('.btnGoTop').fadeOut();
	    $('#mCover').fadeOut().css('z-index','997');
	    $('body').off('scroll mousewheel');    
	});
	
	$(".popWrap").scroll(function(){
	    if($('.popWrap').scrollTop() > 450){
	        $(".btnGoTop").fadeIn();
	    }else{
	        $(".btnGoTop").fadeOut();
	    }
	});
	
	$( '.btnGoTop' ).click( function() {
	    console.log('a click');
	  $( '#popWrap' ).animate( { scrollTop : 0 }, 600 );
	  return false;
	});
	</script>
	</body>
</html>
	
