<%@ page language="java" contentType="text/html; charset=UTF-8" %>
	<div id="top" class="top_game">
	    <a href="/filo/game/main.fl"><img src="/filo/resources/images/pf/logo_top.png" alt="" class="logo"></a>
	    <ul class="sc_menu">
	        <li><a href="/filo/game/main.fl">Home</a></li>
	        <li><a href="/filo/game/shop/purchase.fl">Shop</a></li>
	        <li><a href="#">Guide</a></li>
	    </ul>
	    <div id="ham">
	        <span class="bar1"></span>
	        <span class="bar2"></span>
	        <span class="bar3"></span>
	    </div>
	    <jsp:include page="/WEB-INF/views/include/totalMenu.jsp" />
	    <div id="mCover"></div>
	</div>
	<!-- //top_game -->
	<script>
	$("#ham").click(function(){
	    $(this).toggleClass("active");
	    $('#logo').fadeToggle();
	    $('#sign').fadeToggle();
	    $('#totalMenuWrap').fadeToggle();
	    $('#mCover').fadeToggle();
	});
	
	//menu_right_on
	var nowUrl = window.location.pathname;
	if(nowUrl == "/filo/game/main.fl" || "/filo/game/shop/main.fl"){
		$('#clientMenuWrap').children('.menu').children('li').eq(1).addClass('on');
	}
	//menu_top_on
	if(nowUrl == "/gameTest1.html"){
		$('.sc_menu').children('li').eq(0).addClass('on');
	}else if(nowUrl == "/gameTest_shop.html"){
		$('.sc_menu').children('li').eq(1).addClass('on');
	}	
	
	$(document).ready(function(){
        $('.right_game').css('opacity','1');
    });
	</script>