<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/include/header_filo.jsp" />
	
	<c:if test="${sessionScope.memId != null}">
	<script>
		alert('이미 로그인 상태입니다.')
		history.go(-1)
	</script>
	</c:if>
	
	<c:if test="${past == null}">
    <div class="mypageWrap">
    </c:if>
	<c:if test="${past == 'tm'}">
    <div class="mypageWrap tm">
    </c:if>
    <c:if test="${past == 'gm'}">
    <div class="mypageWrap gm">
    </c:if>

        <div class="loginWrap">
        	<c:if test="${past == null}">
            <a href="/filo/index.fl"><p class="logo">filo<span>First in, last out</span></p></a>
            </c:if>
        	<c:if test="${past == 'tm'}">
            <a href="/filo/mem/index.fl"><p class="logo tm">TRAVEL MAKER</p></a>
            </c:if>
            <c:if test="${past == 'gm'}">
            <a href="/filo/game/main.fl"><p class="logo gm">FILO GAMES</p></a>
            </c:if>
            <div class="inputField">
                <form action="/filo/mem/loginPro.fl" method="post">
                    <div class="inputOuter">
                        <input type="text" name="id" autocomplete="off" placeholder="아이디" maxlength="41"/>
                    </div>
                    <div class="inputOuter">
                        <input type="password" name="pw" autocomplete="off" placeholder="비밀번호" maxlength="16" />                        
                    </div>
                    <div class="inputOuter btn">
                        <button type="submit">로그인</button>
                    </div>
                    <div class="inputOuter none left">
                        <label for="auto">
                            <input type="checkbox" name="auto" id="auto" value="1" />                            
                            <span class="img"></span>
                            <span class="txt">로그인 상태 유지</span>
                        </label>
                    </div>
                    <p class="line"></p>
                    <div class="inputOuter none">
                        <a href="findId.fl"><span class="link">아이디 찾기</span></a>
                        <span class="divide"></span>
                        <a href="findPw.fl"><span class="link">비밀번호 찾기</span></a>
                        <span class="divide"></span>
                        <a href=""><span class="link">회원가입</span></a>
                    </div>
                </form>
            </div>
        </div>
        <!-- //loginWrap end -->

        <p class="copy">Copyright 2021, Team <span>FILO.</span> all rights reserved.</p>
        
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

<jsp:include page="/WEB-INF/views/include/footer.jsp" />
<!-- //footer end -->