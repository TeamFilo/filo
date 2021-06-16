<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="divView" style="position:absolute; display:none; background-color:#ffffff; border:solid 2px #d0d0d0; width:150px; height:50px; padding: 5px 15px 0;"></div>

<div id="top">
	<div id="ham">
		<span class="bar1"></span>
		<span class="bar2"></span>
		<span class="bar3"></span>
	</div>
	<jsp:include page="/WEB-INF/views/include/totalMenu.jsp" />
	<div id="mCover"></div>
	<a href="/filo/mem/index.fl"><p id="logo"></p></a>
	<div id="sign">
		<c:if test="${sessionScope.memId == null}">
			<a href="/filo/mem/signupForm.fl"><p class="btnSign">회원가입</p></a>
			<a href="/filo/mem/loginForm.fl"><p class="btnSign">로그인</p></a>
		</c:if>
		<c:if test="${sessionScope.memId != null}">
			<p class="txtSign">환영합니다! 
			<c:if test="${sessionScope.memIcon == null}"><img src="/filo/resources/images/pf/user.png" width="30"></c:if>
			<c:if test="${sessionScope.memIcon != null}"><img src="<c:url value="/resources/images/pf/${sessionScope.memIcon}.png"/>" width="30" /></c:if>
			<strong style="color:${sessionScope.memColor}";>${sessionScope.memId}</strong>님</p>
			<a href="/filo/mem/logout.fl"><p class="btnSign">로그아웃</p></a>
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
	    $('#totalMenuWrap').fadeToggle();
	    $('#mCover').fadeToggle();
	});
	var nowUrl = window.location.pathname;
	if(nowUrl == "/filo/mem/index.fl"){
		$('#clientMenuWrap').children('.menu').children('li').eq(0).addClass('on');
	}else if(nowUrl == "/filo/my/myPage.fl"){
		$('#clientMenuWrap').children('.menu').children('li').eq(1).addClass('on');
	}else if(nowUrl == "/filo/travel/makingWrite.fl"){
		$('#clientMenuWrap').children('.menu').children('li').eq(1).addClass('on');	
	}else if(nowUrl == "/filo/cmt/comment.fl"){
		$('#clientMenuWrap').children('.menu').children('li').eq(1).addClass('on');
	}else if(nowUrl == "/filo/qr/myQnaReportList.fl"){
		$('#clientMenuWrap').children('.menu').children('li').eq(1).addClass('on');	
	}else if(nowUrl == "/filo/land/landWrite.fl"){
		$('#clientMenuWrap').children('.menu').children('li').eq(1).addClass('on');	
	}else if(nowUrl == "/filo/travel/makingWrite.fl"){
		$('#clientMenuWrap').children('.menu').children('li').eq(2).addClass('on');
	}else if(nowUrl == "/filo/travel/makingList.fl"){ 	
		$('#clientMenuWrap').children('.menu').children('li').eq(2).addClass('on');		
	}else if(nowUrl == "/filo/travel/sharedList.fl"){
		$('#clientMenuWrap').children('.menu').children('li').eq(3).addClass('on');
	}else if(nowUrl == "/filo/land/landmark.fl"){
		$('#clientMenuWrap').children('.menu').children('li').eq(4).addClass('on');
	}
</script>