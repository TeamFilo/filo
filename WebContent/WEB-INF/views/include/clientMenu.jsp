<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="clientMenuWrap">
	<ul class="menu">
        <li><a href="/filo/mem/index.fl">홈</a></li>
        <li><a href="/filo/my/myPage.fl">내정보</a></li>
        <li><a href="/filo/travel/makingList.fl">여행떠나기</a></li>
        <li><a href="/filo/shared/sharedList.fl">여행공유</a></li>
        <li><a href="/filo/land/landmark.fl">랜드마크</a></li>
        <li><a href="/filo/mem/manual.fl">랭크/포지션 안내</a></li>
        <li><a href="/filo/msg/message.fl">쪽지함</a></li>
        <c:if test="${sessionScope.memId == 'admin'}">
        	<li><a href="/filo/admin/member.fl">관리자 페이지</a></li>
        </c:if>	
    </ul>
</div>

