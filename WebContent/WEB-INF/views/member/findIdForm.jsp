<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/include/header_filo.jsp" />
	
	<c:if test="${sessionScope.memId != null}">
	<script>
		alert('이미 로그인 상태입니다.')
		history.go(-1)
	</script>
	</c:if>
	
	<c:choose>
		<c:when test="${past == 'gm'}">
			<div class="mypageWrap gm">
		</c:when>
		<c:when test="${past == 'tm'}">
			<div class="mypageWrap tm">
		</c:when>
		<c:otherwise>
			<div class="mypageWrap">
		</c:otherwise>
	</c:choose>

        <div class="loginWrap">
        	<c:choose>
				<c:when test="${past == 'gm'}">
					<a href="/filo/game/main.fl"><p class="logo gm">FILO GAMES</p></a>
				</c:when>
				<c:when test="${past == 'tm'}">
					<a href="/filo/mem/index.fl"><p class="logo tm">TRAVEL MAKER</p></a>
				</c:when>
				<c:otherwise>
					<a href="/filo/index.fl"><p class="logo">filo<span>First in, last out</span></p></a>
				</c:otherwise>
			</c:choose>        	
            <div class="inputField">
                <form action="/filo/member/findIdPro.fl?past=${past}" method="post">                
		            
                    <div class="inputOuter inputOuter2">
                    	<p class="tit">사용자 계정에 등록된 이메일을 입력해주세요.</p>
                        <input type="text" name="email" placeholder="email 입력"/>
	                    <p class="existError idError"></p>
	                    <p class="existError idError1"></p>
                    </div>
                    
                    <div class="inputOuter btn">
                        <button type="submit">아이디 찾기</button>
                    </div>
                    
           		 </form>
          	</div>
          </div>
          <!-- //loginWrap end -->
    </div>
    <!-- //mypageWrap end -->
    
    <script>
    $('.inputOuter > input').focusin(function(){
        $(this).addClass('on');
    });
    $('.inputOuter > input').focusout(function(){
        $(this).removeClass('on');
    });
    </script>
		
	<!-- <div class="travelPWrap">
		<div class="travelWrap">
			<div class="travelHead">
				<h1>TravelMaker</h1>
			</div>
			<div class="tArticle">
				<h2 class="titMain">이메일로 계정을 찾습니다.</h2>
				<p class="descMain">트래블 메이커에서 사용한 이메일을 입력해주세요.</p>
				<div class="formArea">
					<form action="/filo/member/findIdPro.fl" method="post">
						<div class="itemTf">
							<strong class="tf_required">이메일</strong>
							<input type="text" name="email" placeholder="등록된 email"/>
						</div>
						<button type="submit" class="subBtn">아이디 찾기</button>
					</form>
				</div>	
			</div>
		</div>
	</div> -->
	<!-- //wrapAll end -->
	
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
<!-- //footer end -->