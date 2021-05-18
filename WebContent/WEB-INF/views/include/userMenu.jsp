<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="myMenu">
<ul class="menu">
	<li><a href="/filo/mem/userHistory.fl?userId=<c:out value="${param.userId}"/>">여행이력</a></li>
	<li><a href="/filo/mem/userComment.fl?userId=<c:out value="${param.userId}"/>">코멘트</a></li>
	<li><a href="/filo/mem/userLand.fl?userId=<c:out value="${param.userId}"/>">작성한 랜드마크</a></li>
</ul>
</div>
<script>
	if(nowUrl == "/filo/mem/userHistory.fl"){
		$('#myMenu').children('.menu').children('li').eq(0).addClass('active');
	}else if(nowUrl == "/filo/mem/userHistoryCont.fl"){
		$('#myMenu').children('.menu').children('li').eq(0).addClass('active');
	}else if(nowUrl == "/filo/mem/userComment.fl"){
		$('#myMenu').children('.menu').children('li').eq(1).addClass('active');
	}else if(nowUrl == "/filo/mem/userLand.fl"){
		$('#myMenu').children('.menu').children('li').eq(2).addClass('active');
	}
</script>
