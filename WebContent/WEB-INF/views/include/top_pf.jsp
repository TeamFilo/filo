<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="divView" style="position:absolute; display:none; background-color:#ffffff; border:solid 2px #d0d0d0; width:150px; height:50px; padding: 5px 15px 0;"></div>

<div id="top">
	<div id="ham">
		<span class="bar1"></span>
		<span class="bar2"></span>
		<span class="bar3"></span>
	</div>
	<jsp:include page="/WEB-INF/views/include/clientMenu_pf.jsp" />
	<div id="mCover"></div>
	<a href="/filo/index.fl"><p id="logo"></p></a>
	<div id="sign">
		<c:if test="${sessionScope.memId == null}">
			<a href="/filo/join.fl"><p class="btnSign">회원가입</p></a>
			<a href="/filo/login.fl"><p class="btnSign">로그인</p></a>
		</c:if>
		<c:if test="${sessionScope.memId != null}">
			<p class="txtSign">환영합니다! <img src="<c:url value="/resources/images/pf/${sessionScope.memIcon}.png"/>" width="30" /><strong style="color:${sessionScope.memColor}";>${sessionScope.memId}</strong>님</p>
			<a href="/filo/logout.fl"><p class="btnSign">로그아웃</p></a>
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
	
	$("#ham").click(function(){
	    $(this).toggleClass("active");
	    $('#logo').fadeToggle();
	    $('#sign').fadeToggle();
	    $('#clientMenuWrap_pf').fadeToggle();
	    $('#mCover').fadeToggle();
	});
	var nowUrl = window.location.pathname;
	if(nowUrl == "/filo/index.fl"){
		$('#clientMenuWrap_pf').children('.menu').children('li').eq(0).addClass('on');
	}else if(nowUrl == "/filo/game/home.fl"){
		$('#clientMenuWrap_pf').children('.menu').children('li').eq(1).addClass('on');
	}else if(nowUrl == "/filo/game/1to50.fl"){
		$('#clientMenuWrap_pf').children('.menu').children('li').eq(1).addClass('on');	
	}else if(nowUrl == "/filo/game/card.fl"){
		$('#clientMenuWrap_pf').children('.menu').children('li').eq(1).addClass('on');
	}else if(nowUrl == "/filo/game/lottery.fl"){
		$('#clientMenuWrap_pf').children('.menu').children('li').eq(1).addClass('on');	
	}else if(nowUrl == "/filo/game/numUpDown.fl"){
		$('#clientMenuWrap_pf').children('.menu').children('li').eq(1).addClass('on');	
	}else if(nowUrl == "/filo/game/purchase.fl"){
		$('#clientMenuWrap_pf').children('.menu').children('li').eq(1).addClass('on');
	}else if(nowUrl == "/filo/game/randomPick.fl"){ 	
		$('#clientMenuWrap_pf').children('.menu').children('li').eq(1).addClass('on');		
	}else if(nowUrl == "/filo/game/rockPS.fl"){
		$('#clientMenuWrap_pf').children('.menu').children('li').eq(1).addClass('on');
	}else if(nowUrl == "/filo/project/tmEx.fl"){
		$('#clientMenuWrap_pf').children('.menu').children('li').eq(2).addClass('on');
	}else if(nowUrl == "/filo/profile/team.fl"){
		$('#clientMenuWrap_pf').children('.menu').children('li').eq(3).addClass('on');
	}else if(nowUrl == "/filo/profile/lsm.fl"){
		$('#clientMenuWrap_pf').children('.menu').children('li').eq(3).addClass('on');
	}else if(nowUrl == "/filo/profile/jbr.fl"){
		$('#clientMenuWrap_pf').children('.menu').children('li').eq(3).addClass('on');
	}else if(nowUrl == "/filo/profile/lsh.fl"){
		$('#clientMenuWrap_pf').children('.menu').children('li').eq(3).addClass('on');
	}else if(nowUrl == "/filo/profile/hys.fl"){
		$('#clientMenuWrap_pf').children('.menu').children('li').eq(3).addClass('on');
	}else if(nowUrl == "/filo/mem/index.fl"){
		$('#clientMenuWrap_pf').children('.menu').children('li').eq(4).addClass('on');
	}
	
	
	
	
</script>