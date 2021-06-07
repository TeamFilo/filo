<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="divView" style="position:absolute; display:none; background-color:#ffffff; border:solid 2px #d0d0d0; width:150px; height:50px; padding: 5px 15px 0;"></div>

<div id="top">
	<div id="ham">
		<span class="bar1"></span>
		<span class="bar2"></span>
		<span class="bar3"></span>
	</div>
	<jsp:include page="/WEB-INF/views/include/clientMenu.jsp" />
	<div id="mCover"></div>
	<a href="/filo/index.fl"><p id="logo"></p></a>	
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
	    $('#clientMenuWrap').fadeToggle();
	    $('#mCover').fadeToggle();
	});
	var nowUrl = window.location.pathname;
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
	}
	
	
	
	
</script>