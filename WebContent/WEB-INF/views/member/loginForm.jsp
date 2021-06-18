<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/include/header_filo.jsp" />
	
	<c:if test="${sessionScope.memId != null}">
	<script>
		alert('이미 로그인 상태입니다.')
		history.go(-1)
	</script>
	</c:if>
	
	<div class="mypageWrap">

        <div class="loginWrap">
            <a href="/"><p class="logo">filo <span>First in, last out</span></p></a>
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
                        <a href=""><span class="link">아이디 찾기</span></a>
                        <span class="divide"></span>
                        <a href=""><span class="link">비밀번호 찾기</span></a>
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
            $(this).parent('.inputOuter').css('border','1px solid #ff3f02');
        });
        $('.inputOuter > input').focusout(function(){
            $(this).parent('.inputOuter').css('border','1px solid #dadada');
        });
    </script>
</body>
</html>