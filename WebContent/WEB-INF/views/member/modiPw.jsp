<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/include/header_filo.jsp" />	
	
	<c:if test="${result!=1}">
	<script>
		alert('아이디 혹은 email이 틀렸습니다');
		history.go(-1);
	</script>
	</c:if> 
	<c:if test="${result==1}">
	<div class="travelPWrap">
		<div class="travelWrap">
			<div class="travelHead">
				<h1>TravelMaker</h1>
			</div>
			<div class="tArticle">
				<h2 class="titMain">비밀번호를 재설정합니다.</h2>
				<p class="descMain">새로운 비밀번호를 입력해주세요</p>
				<div class="formArea">
					<form action="/filo/mem/modiPwPro.fl" name="modiPwForm" id="modiPwForm" onsubmit="return check()" method="post">
						<div class="itemTf">
							<strong class="tf_required">비밀번호</strong>
								<input type="hidden" name="id" value="${mem.id}"/>
								<input type="password" name="pw" id="pw" placeholder="비밀번호" /><br/>
							<strong class="tf_required">비밀번호 확인</strong>	
								<input type="password" name="pwch" placeholder="비밀번호 확인" /><br/>
						</div>
						<button type="submit" class="subBtn">비밀번호 재설정</button>
						<!-- <input type="button" value="뒤로가기" onclick="history.go(-1)"/> -->
					</form>
				</div>
			</div>
		</div>
	</div>
	</c:if>
	
	<script>
	/* //ajax
	$(document).ready(function(){
		$("#pw").change(function(){
			event.preventDefault();
			var data = {};
			$.each($('#modiPwForm').serializeArray(), function(index, i){
			data[i.name] = i.value;
			});
			console.log(data);
			$.ajax({
				type:"post",
				url: "/filo/mem/ajaxModiPw.fl",
				dataType: "json",
				contentType: "application/json",
				data: JSON.stringify(data),
				success : function(result){
					var check = JSON.parse(result);
					console.log(check);
					$("#pwExRes").val(check);
				}
			});
		});			
	}); */
	//유효성 검사 
	function check(){
		var inputs = document.modiPwForm;
		console.log(inputs);
		if(!inputs.pw.value){
			alert("새 비밀번호를 입력하세요");
			return false;
		}else if(!inputs.pwch.value){
			alert("비밀번호 확인란을 입력하세요");
			return false;
		}else if(inputs.pw.value !== inputs.pwch.value ){
			alert("비밀번호가 일치하지 않습니다");
			return false;
		}else if(inputs.pw.value === inputs.pwch.value ){
			alert("비밀번호 재설정 완료.");
			return true;
		}
	}
	</script>
		
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
<!-- //footer end -->








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
                <form action="/filo/mem/modiPwPro.fl" name="modiPwForm" id="modiPwForm" onsubmit="return check()" method="post">
		        	<c:if test="${past == 'tm'}">
		            <input type="hidden" name="past" value="tm"/>
		            </c:if>
		            <c:if test="${past == 'gm'}">
		            <input type="hidden" name="past" value="gm"/>
		            </c:if>
                    <div class="inputOuter">
                    	<p class="tit">비밀번호를 재설정에 필요한 정보를 입력해주세요.</p>
                        <input type="hidden" name="id" value="${mem.id}"/>
						<input type="password" name="pw" id="pw" placeholder="비밀번호" />
                    </div>
                    <div class="inputOuter">
                    	<input type="password" name="pwch" placeholder="비밀번호 확인" />
                    </div>
                    <div class="inputOuter btn">
                        <button type="submit">비밀번호 재설정</button>
                    </div>
                </form>
            </div>
        </div>
        <!-- //loginWrap end -->

        <p class="copy">Copyright 2021, Team <span>FILO.</span> all rights reserved.</p>
        
    </div>
    <!-- //mypageWrap end -->

    <script>
  	//유효성 검사 
	function check(){
		var inputs = document.modiPwForm;
		console.log(inputs);
		if(!inputs.pw.value){
			alert("새 비밀번호를 입력하세요");
			return false;
		}else if(!inputs.pwch.value){
			alert("비밀번호 확인란을 입력하세요");
			return false;
		}else if(inputs.pw.value !== inputs.pwch.value ){
			alert("비밀번호가 일치하지 않습니다");
			return false;
		}else if(inputs.pw.value === inputs.pwch.value ){
			alert("비밀번호 재설정 완료.");
			return true;
		}
	}
   	
       $('.inputOuter > input').focusin(function(){
           $(this).addClass('on');
       });
       $('.inputOuter > input').focusout(function(){
           $(this).removeClass('on');
       });
    </script>

<jsp:include page="/WEB-INF/views/include/footer.jsp" />
<!-- //footer end -->
