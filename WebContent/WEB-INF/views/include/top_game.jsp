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
	//탑메뉴 햄버거 버튼 눌렀을 때 효과
	let clicks = 0;	
	$('#ham').click(function(){
		if(clicks === 0){
			$(this).addClass("active");
		    $('#logo').fadeIn();
		    $('#sign').fadeIn();
		    $('#mCover').fadeIn();
		    $('#totalMenuWrap').fadeIn();
		    $('#totalMenuWrap > .menu > li').eq(1).animate({left:"0",opacity:"1"}, 750);
		    $('#totalMenuWrap > .menu > li').eq(2).delay(200).animate({left:"0",opacity:"1"}, 750);
		    $('#totalMenuWrap > .menu > li').eq(3).delay(400).animate({left:"0",opacity:"1"}, 750);
		    $('#totalMenuWrap > .menu > li').eq(4).delay(600).animate({left:"0",opacity:"1"}, 750);		    
		    return clicks = 1;
		}else{
			$(this).removeClass("active");
		    $('#logo').fadeOut();
		    $('#sign').fadeOut();
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
    }); */
	</script>