<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<!-- 카카오 로그인 --> 
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script> 
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>


<script>
	Kakao.init("0e101eea812ddf458b96e9ee9fdb7c15");
	Kakao.isInitialized();
	console.log("Kakao.isInitialized();", Kakao.isInitialized());
	
	//로그인
	function kakaoLogin() { 
		Kakao.Auth.login({
			//가져와서 쓸 정보들
			scope:'profile, account_email, gender',
			//authObj에 성공시 받아온 오브젝트데이터 담겨있음 
			success: function(authObj){
				console.log(authObj);
				//받아올 데이터 부르는 api
				
				Kakao.API.request({
					url:'/v2/user/me',
					success: res => {
						const kakao_account = res.kakao_account;
						//console.log("카카오고유아이디",id);
						console.log("카카오어카운트",kakao_account);
						console.log("프로필",res.kakao_account.profile.nickname);
						console.log("이메일",res.kakao_account.email);
						console.log("성별",res.kakao_account.gender);
						console.log("아이디",res.id);
						//===================
						
						var data = {
							"id":res.id,
							"gender":res.kakao_account.gender,
							"nickname":res.kakao_account.profile.nickname,
							"email":res.kakao_account.email
						};
						console.log("찍",data);
			          		
						$.ajax({
							type:"post",
							url: "/filo/mem/kakaoTestPro.fl",
							dataType: "json",
							contentType: "application/json",
							data: JSON.stringify(data),
							success : function(){
							
							console.log("에이젝스댕겨옴");
						
							}
						});
						//===================
					}
				})
			}
		});
	}
	
	//연결끊기(탈퇴)   (서비스탈퇴는 구현해야함)
	function kakaoUnLink(){
		console.log("탈퇴");
		Kakao.API.request({
		  url: '/v1/user/unlink',
		  success: function(response) {
		    console.log(response);
		    alert("탈퇴완료!"); 
		  },
		  fail: function(error) {
		    console.log(error);
		  },
		});
	}

	//로그아웃
	function kakaoLogout(){
		if (!Kakao.Auth.getAccessToken()) {
			  console.log('Not logged in.');
			  return;
		}
		//로그인 시 발급받은 토큰을 만료시키는 함수(서비스로그아웃은 직접구현해야함)
		Kakao.Auth.logout(function() {
		console.log(Kakao.Auth.getAccessToken());
		});
	}
</script>

<body>
	<h2>카카오 로그인 테스트ㅋ</h2>
	<!-- 버튼 누르면 카카오로그인() 자바스크립트가 실행됨 -->
	<a href="javascript:kakaoLogin();">
		<img src="//mud-kage.kakao.com/14/dn/btqbjxsO6vP/KPiGpdnsubSq3a0PHEGUK1/o.jpg" width="300"/>
	</a>
	
	<!-- 로그아웃버튼누름 -->
 	<a href="javascript:kakaoLogout();">로그아웃</a>
 	<a href="javascript:kakaoUnLink();">탈퇴하기</a>
 	
 	멤아이디: ${memId}
 	멤아이콘: ${memIcon}
 	멤컬러  : ${memColor}
 	
 	<h4>${res.kakao_account.gender}</h4>
</body>
</html>