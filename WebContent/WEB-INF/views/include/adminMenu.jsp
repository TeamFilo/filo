<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<div id="adminMenuWrap">
	<a href="/filo/admin/member.fl"><p class="logo">Travel Maker</p></a>
	<ul class="menu">
        <li><a href="/filo/admin/member.fl">회원관리</a></li>
        <li><a href="/filo/admin/adminGroup.fl">그룹관리</a></li>
     <!--  <li><a href="/filo/admin/qna.fl">문의관리</a></li> -->
    <!-- <li><a href="/filo/admin/report.fl">신고관리</a></li> -->   
    <!-- <li><a href="/filo/admin/reason.fl">신고사유/문의유형</a></li> -->  
        <li><a href="/filo/admin/rkPos.fl">랭크</a></li>
        <li><a href="/filo/admin/posList.fl">포지션</a></li>
        <li><a href="/filo/mem/index.fl">메인 홈</a></li>        
    </ul>
</div>
<script>
	var nowUrl = window.location.pathname;
	console.log(nowUrl)
	if(nowUrl == "/filo/admin/member.fl"){
		$('#adminMenuWrap').children('.menu').children('li').eq(0).addClass('on');
	}else if(nowUrl == "/filo/admin/memberModiForm.fl"){
		$('#adminMenuWrap').children('.menu').children('li').eq(0).addClass('on');
	}else if(nowUrl == "/filo/admin/adminGroup.fl"){
		$('#adminMenuWrap').children('.menu').children('li').eq(1).addClass('on');
	}else if(nowUrl == "/filo/admin/rkPos.fl"){
		$('#adminMenuWrap').children('.menu').children('li').eq(2).addClass('on');
	}else if(nowUrl == "/filo/admin/modifyFormRk.fl"){
		$('#adminMenuWrap').children('.menu').children('li').eq(2).addClass('on');
	}else if(nowUrl == "/filo/admin/posList.fl"){
		$('#adminMenuWrap').children('.menu').children('li').eq(3).addClass('on');
	}else if(nowUrl == "/filo/admin/modifyFormPos.fl"){
		$('#adminMenuWrap').children('.menu').children('li').eq(3).addClass('on');
	}
	
</script>





	
	<%-- 
	else if(nowUrl == "/filo/admin/report.fl"){
		$('#adminMenuWrap').children('.menu').children('li').eq(3).addClass('on');
	}else if(nowUrl == "/filo/admin/reason.fl"){
		$('#adminMenuWrap').children('.menu').children('li').eq(4).addClass('on');
	}else if(nowUrl == "/filo/admin/reasonInsert.fl"){
		$('#adminMenuWrap').children('.menu').children('li').eq(4).addClass('on');
	}
	--%>