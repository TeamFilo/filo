<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="totalMenuWrap">
    <ul class="menu">
        <li>
            <a href="/filo/index.fl"><p class="tit_big">filo<span>First in, last out.</span></p></a>
            <c:if test="${sessionScope.memId != null}">
            <p class="tit_user">환영합니다!<br/><span>"${sessionScope.memId}"</span> 님</p>
            </c:if>
            <p class="tit_small">We are passionate developers.<br/>Contact us anytime!<span>Copyright 2021, Team FILO.<br/>all rights reserved.</span></p>
        </li>
        <li>
            <p class="sub"># We are FILO.<span></span></p>
            <p class="tit"><span class="en">Portfolio</span><span class="ko">포트폴리오</span></p>            
            <ul class="depth total_depth_main">
            	<p class="tit_depth">MAIN</p>
                <li><a href="/filo/index.fl#1stPage"></a><i class="fi fi-rs-home"></i>포트폴리오 홈<i class="go fi-rs-caret-right"></i></li>
                <li><a href="/filo/index.fl#2ndPage"></a><i class="fi fi-rs-comment"></i>포트폴리오 소개<i class="go fi-rs-caret-right"></i></li>
                <li><a href="/filo/index.fl#2ndPage/1"></a><i class="fi fi-rs-playing-cards"></i>게임 소개<i class="go fi-rs-caret-right"></i></li>
                <li><a href="/filo/index.fl#2ndPage/2"></a><i class="fi fi-rs-backpack"></i>트래블메이커 소개<i class="go fi-rs-caret-right"></i></li>
            </ul>            
            <ul class="depth total_depth_profile">
            	<p class="tit_depth">PROFILE<span></span></p>
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
            <ul class="depth total_depth_game">
            	<p class="tit_depth">GAME</p>
                <li><a href="/filo/game/main.fl"></a><i class="fi fi-rs-home"></i>게임 홈<i class="go fi-rs-caret-right"></i></li>
                <li><a href="/filo/game/rockPS.fl"></a><i class="fi fi-rs-resources"></i>가위바위보<i class="go fi-rs-caret-right"></i></li>
                <li><a href="/filo/game/winwheel.fl"></a><i class="fi fi-rs-life-ring"></i>데일리 룰렛<i class="go fi-rs-caret-right"></i></li>
                <li><a href="/filo/game/lottery.fl"></a><i class="fi fi-rs-money"></i>복권<i class="go fi-rs-caret-right"></i></li>
                <li><a href="/filo/game/updown.fl"></a><i class="fi fi-rs-thumbs-up"></i>업다운<i class="go fi-rs-caret-right"></i></li>
                <li><a href="/filo/game/card.fl"></a><i class="fi fi-rs-playing-cards"></i>카드뒤집기<i class="go fi-rs-caret-right"></i></li>
            </ul>            
            <ul class="depth total_depth_shop">
            	<p class="tit_depth">SHOP</p>
                <li><a href="/filo/game/shop/purchase.fl"></a><i class="fi fi-rs-shopping-cart"></i>아이템 구매<i class="go fi-rs-caret-right"></i></li>
            </ul>
            <ul class="depth total_depth_guide">
	            <p class="tit_depth">GUIDE</p>
                <li><a href=""></a><i class="fi fi-rs-info"></i>게임 가이드<i class="go fi-rs-caret-right"></i></li>
            </ul>
        </li>
        <li>
            <p class="sub"># Let's go togeter!<span></span></p>
            <p class="tit"><span class="en">TravelMaker</span><span class="ko">트래블메이커</span></p>
            <ul class="depth total_depth_travelmaker">
	            <p class="tit_depth">TRAVEL MAKER</p>
                <li><a href="/filo/mem/index.fl"></a><i class="fi fi-rs-home"></i>트래블메이커 홈<i class="go fi-rs-caret-right"></i></li>               
            </ul>
        </li>
        <li>
            <p class="sub">VVIP<span></span></p>
            <p class="tit"><span class="en">Memeber</span><span class="ko">회원전용</span></p>
            <ul class="depth total_depth_mypage">
	            <p class="tit_depth">MY PAGE</p>
                <li><a href=""></a><i class="fi fi-rs-home"></i>마이페이지 홈<i class="go fi-rs-caret-right"></i></li>
            </ul>
        </li>
    </ul>
</div>
<script>    
    //포폴 메뉴 선택했을 때 토탈메뉴 닫기 처리
    $('#totalMenuWrap > ul > li > .depth > li').click(function(){
    	$('#ham').removeClass("active");
    	$('#logo').fadeOut();
	    $('#sign').fadeOut();
	    $('#mCover').fadeOut();
	    $('#totalMenuWrap').fadeOut();
	    $('#totalMenuWrap > .menu > li').eq(1).animate({left:"50px",opacity:"0"}, 10);
	    $('#totalMenuWrap > .menu > li').eq(2).animate({left:"50px",opacity:"0"}, 10);
	    $('#totalMenuWrap > .menu > li').eq(3).animate({left:"50px",opacity:"0"}, 10);
	    $('#totalMenuWrap > .menu > li').eq(4).animate({left:"50px",opacity:"0"}, 10);
	    return clicks = 0;	    
    });
    
    //요청 주소에 따른 메뉴 on처리
    let nowUrl = window.location.pathname;
    const menuOn = (total_depth_name) => {
    	$(total_depth_name).children('.tit_depth').addClass('on');
		$(total_depth_name).siblings('.sub','.tit').addClass('on');
    }
	if(nowUrl == "/filo/index.fl"){	//portfolio
		menuOn(".total_depth_main");
	}else if(nowUrl === "/filo/profile/main.fl"){	//profilie
		menuOn(".total_depth_profile");
		$('.total_depth_profile > li').eq(0).addClass('on');
	}else if(nowUrl === "/filo/profile/team.fl"){
		menuOn(".total_depth_profile");
		$('.total_depth_profile > li').eq(1).addClass('on');
	}else if(nowUrl === "/filo/profile/lsm.fl"){
		menuOn(".total_depth_profile");
		$('.total_depth_profile > li').eq(2).addClass('on');
	}else if(nowUrl === "/filo/profile/jbr.fl"){
		menuOn(".total_depth_profile");
		$('.total_depth_profile > li').eq(3).addClass('on');
	}else if(nowUrl === "/filo/profile/lsh.fl"){
		menuOn(".total_depth_profile");
		$('.total_depth_profile > li').eq(4).addClass('on');
	}else if(nowUrl === "/filo/profile/hys.fl"){
		menuOn(".total_depth_profile");
		$('.total_depth_profile > li').eq(5).addClass('on');
	}else if(nowUrl === "/filo/game/main.fl"){	//game
		menuOn(".total_depth_game");
		$('.total_depth_game > li').eq(0).addClass('on');
	}else if(nowUrl === "/filo/game/rockPS.fl"){
		menuOn(".total_depth_game");
		$('.total_depth_game > li').eq(1).addClass('on');
	}else if(nowUrl === "/filo/game/winwheel.fl"){
		menuOn(".total_depth_game");
		$('.total_depth_game > li').eq(2).addClass('on');
	}else if(nowUrl === "/filo/game/lottery.fl"){
		menuOn(".total_depth_game");
		$('.total_depth_game > li').eq(3).addClass('on');
	}else if(nowUrl === "/filo/game/updown.fl"){
		menuOn(".total_depth_game");
		$('.total_depth_game > li').eq(4).addClass('on');
	}else if(nowUrl === "/filo/game/card.fl"){
		menuOn(".total_depth_game");
		$('.total_depth_game > li').eq(5).addClass('on');
	}else if(nowUrl === "/filo/game/shop/purchase.fl"){	//item shop
		menuOn(".total_depth_shop");
		$('.total_depth_shop > li').eq(0).addClass('on');
	}else if(nowUrl === ""){	//game guide
		menuOn(".total_depth_guide");
		$('.total_depth_guide > li').eq(0).addClass('on');
	}else if(nowUrl === "/filo/mem/index.fl"){	//travel maker
		menuOn(".total_depth_travelmaker");
		$('.total_depth_travelmaker > li').eq(0).addClass('on');
	}
</script>