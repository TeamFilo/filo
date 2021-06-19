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
		            
                    <div class="inputOuter inputOuter2">
                    	<p class="tit">입력한 정보에 해당하는 아이디입니다.</p>
                        <p><strong class="txtContact">${comId}</strong></p></br></br></br>
                    </div>
                    
                    <div class="inputOuter btn">                        
						<button onclick="location.href='findPw.fl?past=${past}'">비밀번호 재설정</button>
                    </div>
                    <div class="inputOuter btn">
						<button onclick="location.href='/filo/member/login.fl?past=${past}'">로그인</button>
                    </div>
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

	<%-- <c:if test="${mem != null}">
	<div class="travelPWrap">
		<div class="travelWrap">
			<div class="travelHead">
				<h1>TravelMaker</h1>
			</div>
			<div class="tArticle">
				<h2 class="titMain">입력한 정보에 해당하는 아이디입니다.</h2>
				<p class="descMain">
					개인정보 보호를 위해 정보 일부를 *로 표시하였습니다.
				<br/>
					트레블메이커에 로그인 할 수 있는 아이디가 표시됩니다.
				</p>
				<div class="wrapFind">
					<div class="boxFind">
						<p><strong class="txtContact">${comId}</strong></p></br></br></br>
						<a href="findPw.fl" class="linkComm">비밀번호 재설정</a>
					</div>	
				</div>
					<button onclick="window.location='/filo/mem/loginForm.fl'" class="subBtn">로그인</button>
				<!--  <input type="button" value="비밀번호 수정" onclick="window.location='/travelMaker/mem/findPw.tm'"/>-->
			</div>
		</div>
	</div>			
	</c:if>
	
	<c:if test="${mem == null}">
	<script>
		alert('등록된 email이 아닙니다')
		history.go(-1)
	</script>
	</c:if> --%>
	
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
<!-- //footer end -->