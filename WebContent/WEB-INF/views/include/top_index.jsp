<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="ham">
	<span class="bar1"></span>
	<span class="bar2"></span>
	<span class="bar3"></span>
</div>
<jsp:include page="/WEB-INF/views/include/clientMenu.jsp" />
<div id="mCover"></div>
<a href="/filo/mem/index.fl"><p id="logo">Travel Maker</p></a>
<div id="sign">
	<c:if test="${sessionScope.memId == null}">
		<a href="/filo/mem/signupForm.fl">회원가입</a>
		<a href="/filo/mem/loginForm.fl">로그인</a>
	</c:if>
	<c:if test="${sessionScope.memId != null}">
		<a href="/filo/mem/logout.fl">로그아웃</a>
	</c:if>
</div>
<script>	
	$("#ham").click(function(){
	    $(this).toggleClass("active");
	    $('#logo').fadeToggle();
	    $('#sign').fadeToggle();
	    $('.searchBar').fadeToggle();
	    $('#clientMenuWrap').fadeToggle();
	    $('#mCover').fadeToggle();
	});
	var nowUrl = window.location.pathname;
	if(nowUrl == "/filo/mem/index.fl"){
		$('#clientMenuWrap').children('.menu').children('li').eq(0).addClass('on');
	}else if(nowUrl == "/filo/my/myPage.fl" || "/filo/cmt/comment.fl" || "/filo/qr/myQnaReportList.fl"){
		$('#clientMenuWrap').children('.menu').children('li').eq(1).addClass('on');
	}else if(nowUrl == "/filo/travel/makingList.fl" || "/filo/travel/makingWrite.fl" ){ 	
		$('#clientMenuWrap').children('.menu').children('li').eq(2).addClass('on');
	}else if(nowUrl == "/filo/travel/sharedList.fl"){
		$('#clientMenuWrap').children('.menu').children('li').eq(3).addClass('on');
	}else if(nowUrl == "/filo/land/landmark.fl" || "/filo/land/landWrite.fl"){
		$('#clientMenuWrap').children('.menu').children('li').eq(4).addClass('on');
	}else if(nowUrl == "/filo/travel/makingWrite.fl"){
		$('#clientMenuWrap').children('.menu').children('li').eq(2).addClass('on');
	}	
</script>