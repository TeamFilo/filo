<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="divView" style="position:absolute; display:none; background-color:#ffffff; border:solid 2px #d0d0d0; width:150px; height:50px; padding: 5px 15px 0;"></div>

<div id="top_pf">
	<div id="ham">
		<span class="bar1"></span>
		<span class="bar2"></span>
		<span class="bar3"></span>
	</div>
	<jsp:include page="/WEB-INF/views/include/totalMenu.jsp" />
	<div id="mCover"></div>
	<a href="/filo/index.fl"><p id="logo"></p></a>	
	<div id="sign">
		<c:if test="${sessionScope.memId == null}">
			<a href="/filo/member/join.fl"><p class="btnSign">회원가입</p></a>
			<a href="/filo/member/login.fl"><p class="btnSign">로그인</p></a>
		</c:if>
		<c:if test="${sessionScope.memId != null}">
			<p class="txtSign">환영합니다! 
			<c:if test="${sessionScope.memIcon == null}"><img src="/filo/resources/images/pf/user.png" width="30"></c:if>
			<c:if test="${sessionScope.memIcon != null}"><img src="<c:url value="/resources/images/pf/${sessionScope.memIcon}.png"/>" width="30" /></c:if>
			<strong style="color:${sessionScope.memColor}";>${sessionScope.memId}</strong>님</p>
			<a href="/filo/member/logout.fl"><p class="btnSign">로그아웃</p></a>
		</c:if>
	</div>
</div>
	<script>
	var didScroll;
	var lastScrollTop = 0;
	var delta = 5;
	var navbarHeight = $('#top').outerHeight();
	
	$(window).scroll(function(event){
		didScroll = true;
	});
	
	setInterval(function() {
		if (didScroll) {
			hasScrolled();
			didScroll = false;
		}
	}, 250);
	
	function hasScrolled() {
		var st = $(this).scrollTop();
		if(Math.abs(lastScrollTop - st) <= delta)
			return;
		if(st > lastScrollTop && st > navbarHeight){
			$('#top').removeClass('nav-down').addClass('nav-up');
		}else {
			if(st + $(window).height() < $(document).height()) {
				$('#top').removeClass('nav-up').addClass('nav-down');
			}
		}
		
		lastScrollTop = st;
	}
	
	
	//탑메뉴 햄버거 버튼 눌렀을 때 효과
	let clicks = 0;	
	$('#ham').click(function(){
		if(clicks === 0){
			$(this).addClass("active");
		    $('#logo').fadeOut();
		    $('#sign').fadeOut();
		    $('#mCover').fadeIn();
		    $('#totalMenuWrap').fadeIn();
		    $('#totalMenuWrap > .menu > li').eq(1).animate({left:"0",opacity:"1"}, 750);
		    $('#totalMenuWrap > .menu > li').eq(2).delay(200).animate({left:"0",opacity:"1"}, 750);
		    $('#totalMenuWrap > .menu > li').eq(3).delay(400).animate({left:"0",opacity:"1"}, 750);
		    $('#totalMenuWrap > .menu > li').eq(4).delay(600).animate({left:"0",opacity:"1"}, 750);		    
		    return clicks = 1;
		}else{
			$(this).removeClass("active");
		    $('#logo').fadeIn();
		    $('#sign').fadeIn();
		    $('#mCover').fadeOut();
		    $('#totalMenuWrap').fadeOut();
		    $('#totalMenuWrap > .menu > li').eq(1).animate({left:"50px",opacity:"0"}, 10);
		    $('#totalMenuWrap > .menu > li').eq(2).animate({left:"50px",opacity:"0"}, 10);
		    $('#totalMenuWrap > .menu > li').eq(3).animate({left:"50px",opacity:"0"}, 10);
		    $('#totalMenuWrap > .menu > li').eq(4).animate({left:"50px",opacity:"0"}, 10);
		    return clicks = 0;
		}
	});
	
	/* var nowUrl = window.location.pathname;
	if(nowUrl == "/filo/index.fl"){
		$('#clientMenuWrap').children('.menu').children('li').eq(0).addClass('on');
	}else if(nowUrl == "/filo/game/home.fl"){
		$('#clientMenuWrap').children('.menu').children('li').eq(1).addClass('on');
	}else if(nowUrl == "/filo/game/1to50.fl"){
		$('#clientMenuWrap').children('.menu').children('li').eq(1).addClass('on');	
	}else if(nowUrl == "/filo/game/card.fl"){
		$('#clientMenuWrap').children('.menu').children('li').eq(1).addClass('on');
	}else if(nowUrl == "/filo/game/lottery.fl"){
		$('#clientMenuWrap').children('.menu').children('li').eq(1).addClass('on');	
	}else if(nowUrl == "/filo/game/numUpDown.fl"){
		$('#clientMenuWrap').children('.menu').children('li').eq(1).addClass('on');	
	}else if(nowUrl == "/filo/game/purchase.fl"){
		$('#clientMenuWrap').children('.menu').children('li').eq(1).addClass('on');
	}else if(nowUrl == "/filo/game/randomPick.fl"){ 	
		$('#clientMenuWrap').children('.menu').children('li').eq(1).addClass('on');		
	}else if(nowUrl == "/filo/game/rockPS.fl"){
		$('#clientMenuWrap').children('.menu').children('li').eq(1).addClass('on');
	}else if(nowUrl == "/filo/project/tmEx.fl"){
		$('#clientMenuWrap').children('.menu').children('li').eq(2).addClass('on');
	}else if(nowUrl == "/filo/profile/team.fl"){
		$('#clientMenuWrap').children('.menu').children('li').eq(3).addClass('on');
	}else if(nowUrl == "/filo/profile/lsm.fl"){
		$('#clientMenuWrap').children('.menu').children('li').eq(3).addClass('on');
	}else if(nowUrl == "/filo/profile/jbr.fl"){
		$('#clientMenuWrap').children('.menu').children('li').eq(3).addClass('on');
	}else if(nowUrl == "/filo/profile/lsh.fl"){
		$('#clientMenuWrap').children('.menu').children('li').eq(3).addClass('on');
	}else if(nowUrl == "/filo/profile/hys.fl"){
		$('#clientMenuWrap').children('.menu').children('li').eq(3).addClass('on');
	}else if(nowUrl == "/filo/mem/index.fl"){
		$('#clientMenuWrap').children('.menu').children('li').eq(4).addClass('on');
	} */
	</script>