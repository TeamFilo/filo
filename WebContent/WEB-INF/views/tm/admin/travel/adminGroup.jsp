<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/include/header.jsp" />
   
	<jsp:include page="/WEB-INF/views/include/adminMenu.jsp" />
	<!-- //adminMenu end -->
	
	<c:if test="${sessionScope.memId != 'admin'}">
      <script>
         alert("관리자만 사용가능한 페이지 입니다.");
         history.go(-1);
      </script>
   </c:if>
	
	
	<div class="wrapAll admin">
		
		<h1>그룹관리</h1>
		<c:if test="${sel == null && search == null}">
			${groupAllCnt}건
		</c:if>
		<%-- <div class="searchBar">
			<form action="/filo/admin/adminGroup.fl">
				<select name="sel">
					<option value="" selected disabled hidden>선택하세요</option>
					<option value="id" >개설자</option>
					<option value="subject">여행명</option>
					<option value="loc">지역</option>
				</select>
				<input type="text" name="search" />
				<input type="submit" value="검색" />
			</form>
			<c:if test="${sel != null && search != null }">
				<button onclick="window.location='/filo/admin/adminGroup.fl'">전체목록</button>
			</c:if>
		</div> --%>
		<!-- //searchBar end -->
		
		
		<ul class="adminGroup">
			<c:if test="${sel == null && search == null }">
			<c:forEach var="groupAllList" items="${groupAllList}" varStatus="status">
			<li>
				<button onclick="window.location='/filo/admin/adminGroupDel.fl?gNo=${groupAllList.gNo}'">그룹삭제</button>
				<a href="/filo/travel/makingCont.fl?gNo=${groupAllList.gNo}&id=${memId}">
				<p>No.${status.count}</p>
				<p>그룹번호 : ${groupAllList.gNo}</p>
				<p>개설자ID : ${groupAllList.id}</p>
				<p>그룹이름 : ${groupAllList.subject}</p>
				<p>
					<c:if test="${groupAllList.status==0}">여행상태 : 모집중</c:if>
					<c:if test="${groupAllList.status==1}">여행상태 : 모집완료</c:if>
					<c:if test="${groupAllList.status==2}">여행상태 : 여행시작</c:if>
					<c:if test="${groupAllList.status==3}">여행상태 : 여행종료</c:if>
					<c:if test="${groupAllList.status==4}">여행상태 : 최종완료</c:if>
					<c:if test="${groupAllList.status==5}">여행상태 : 모집취소</c:if>
				</p>
				</a>
			</li>
			</c:forEach>
			</c:if>
			<c:if test="${sel != null && search != null}">
			검색결과 ${searchGroupCtn}건
			<c:forEach var="searchGroupList" items="${searchGroupList}" varStatus="status">
			<li>
				<a href="/filo/travel/makingCont.fl?gNo=${searchGroupList.gNo}">
				<p>No.${status.count}</p>
				<p>그룹번호 : ${searchGroupList.gNo}</p>
				<p>개설자ID : ${searchGroupList.id}</p>
				<p>그룹이름 : ${searchGroupList.subject}</p>
				<p>여행상태 : ${searchGroupList.status}</p>
				</a>
			</li>
			</c:forEach>
			</c:if>
		</ul>
		<!-- //adminGroup end -->		
		
	</div>
	<!-- //wrapAll end -->
   
</body>
</html>