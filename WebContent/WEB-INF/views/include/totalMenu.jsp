<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="totalMenuWrap">
    <ul class="menu">
        <li>
            <p class="tit_big">filo<span>First in, last out.</span></p>
            <p class="tit_small">Developers who pursue freedom and style.<br/>Contact us anytime!<span>copyright ⓒ </span></p>
        </li>
        <li>
            <p class="sub"># We are FILO.<span></span></p>
            <p class="tit"><span class="en">Portfolio</span><span class="ko">포트폴리오</span></p>
            <p class="tit_depth">MAIN</p>
            <ul class="depth">
                <li><a href="/filo/index.fl#1stPage"></a><i class="fi fi-rs-home"></i>포트폴리오 홈<i class="go fi-rs-caret-right"></i></li>
                <li><a href="/filo/index.fl#2ndPage"></a><i class="fi fi-rs-comment"></i>포트폴리오 소개<i class="go fi-rs-caret-right"></i></li>
                <li><a href="/filo/index.fl#2ndPage/1"></a><i class="fi fi-rs-playing-cards"></i>게임 소개<i class="go fi-rs-caret-right"></i></li>
                <li><a href="/filo/index.fl#2ndPage/2"></a><i class="fi fi-rs-backpack"></i>트래블메이커 소개<i class="go fi-rs-caret-right"></i></li>
            </ul>
            <p class="tit_depth">PROFILE<span></span></p>
            <ul class="depth">
                <li><a href="/filo/profile/main.fl"></a><i class="fi fi-rs-home"></i>프로필 홈<i class="go fi-rs-caret-right"></i></li>
                <li><a href="/filo/profile/team.fl"></a><i class="fi fi-rs-users"></i>팀 프로필<i class="go fi-rs-caret-right"></i></li>
                <li><a href="/filo/profile/lsm.fl"></a><i class="fi fi-rs-user"></i>이승민 프로필<i class="go fi-rs-caret-right"></i></li>
                <li><a href="/filo/profile/jbr.fl"></a><i class="fi fi-rs-user"></i>정보름 프로필<i class="go fi-rs-caret-right"></i></li>
                <li><a href="/filo/profile/lsh.fl"></a><i class="fi fi-rs-user"></i>이승헌 프로필<i class="go fi-rs-caret-right"></i></li>
                <li><a href="/filo/profile/hys.fl"></a><i class="fi fi-rs-user"></i>허윤서 프로필<i class="go fi-rs-caret-right"></i></li>                    
            </ul>
        </li>
        <li>
            <p class="sub"># Get point<span></span></p>
            <p class="tit"><span class="en">Game</span><span class="ko">게임</span></p>
            <p class="tit_depth">GAME</p>
            <ul class="depth">
                <li><a href="/filo/game/main.fl"></a><i class="fi fi-rs-home"></i>게임 홈<i class="go fi-rs-caret-right"></i></li>
                <li><a href="/filo/game/rockPS.fl"></a><i class="fi fi-rs-resources"></i>가위바위보<i class="go fi-rs-caret-right"></i></li>
                <li><a href="/filo/game/winwheel.fl"></a><i class="fi fi-rs-life-ring"></i>데일리 룰렛<i class="go fi-rs-caret-right"></i></li>
                <li><a href="/filo/game/lottery.fl"></a><i class="fi fi-rs-money"></i>복권<i class="go fi-rs-caret-right"></i></li>
                <li><a href="/filo/game/updown.fl"></a><i class="fi fi-rs-thumbs-up"></i>업다운<i class="go fi-rs-caret-right"></i></li>
                <li><a href="/filo/game/card.fl"></a><i class="fi fi-rs-playing-cards"></i>카드뒤집기<i class="go fi-rs-caret-right"></i></li>
            </ul>
            <p class="tit_depth">SHOP</p>
            <ul class="depth">
                <li><a href="/filo/game/shop/purchase.fl"></a><i class="fi fi-rs-shopping-cart"></i>아이템 구매<i class="go fi-rs-caret-right"></i></li>
            </ul>
            <p class="tit_depth">GUIDE</p>
            <ul class="depth">
                <li><a href=""></a><i class="fi fi-rs-info"></i>게임 가이드<i class="go fi-rs-caret-right"></i></li>
            </ul>
        </li>
        <li>
            <p class="sub"># Let's go togeter!<span></span></p>
            <p class="tit"><span class="en">TravelMaker</span><span class="ko">트래블메이커</span></p>
            <p class="tit_depth">TRAVEL MAKER</p>
            <ul class="depth">
                <li><a href="/filo/mem/index.fl"></a><i class="fi fi-rs-home"></i>트래블메이커 홈<i class="go fi-rs-caret-right"></i></li>               
            </ul>
        </li>
        <li>
            <p class="sub">VVIP<span></span></p>
            <p class="tit"><span class="en">Memeber</span><span class="ko">회원전용</span></p>
            <p class="tit_depth">MY PAGE</p>
            <ul class="depth">
                <li><a href=""></a><i class="fi fi-rs-home"></i>마이페이지 홈<i class="go fi-rs-caret-right"></i></li>
            </ul>
        </li>
    </ul>
</div>
<script>
    $('#totalMenuWrap > ul > li').hover(function(){
        $(this).children('.sub').toggleClass('on');
        $(this).children('.tit').toggleClass('on');
    });

    $('#totalMenuWrap > ul > li > .depth').hover(function(){
        $(this).prev('.tit_depth').toggleClass('on');
    });
    
    $('#totalMenuWrap > ul > li > .depth > li').click(function(){
    	$('#ham').toggleClass("active");
	    $('#logo').fadeToggle();
	    $('#sign').fadeToggle();
	    $('#totalMenuWrap').fadeToggle();
	    $('#mCover').fadeToggle();
    });
</script>