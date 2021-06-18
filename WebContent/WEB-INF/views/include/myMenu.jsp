<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<div id="myMenu">
            <ul class="menu">
                <li><a class="active" href="/filo/my/myPage.fl">마이홈</a></li>
                <li><a href="/filo/my/myHistory.fl">여행이력</a></li>
                <li><a href="/filo/cmt/comment.fl" >코멘트 관리</a></li>
                <li><a href="/filo/my/myLand.fl">나의 랜드마크</a></li>
                <li><a href="/filo/mem/myModi.fl" >내정보 관리</a></li>
            </ul>
        </div>
        <script>
	        var nowUrl = window.location.pathname;
	    	console.log(nowUrl)
            if(nowUrl == "/filo/my/myPage.fl"){
                $('#myMenu').children('.menu').children('li').eq(0).addClass('active');
            }else if(nowUrl == "/filo/my/myHistory.fl"){
                $('#myMenu').children('.menu').children('li').eq(1).addClass('active');
            }else if(nowUrl == "/filo/my/myHistoryCont.fl"){
                $('#myMenu').children('.menu').children('li').eq(1).addClass('active');
            }else if(nowUrl == "/filo/cmt/comment.fl"){
                $('#myMenu').children('.menu').children('li').eq(2).addClass('active');
            }else if(nowUrl == "/filo/my/myLand.fl"){
                $('#myMenu').children('.menu').children('li').eq(3).addClass('active');
            }else if(nowUrl == "/filo/mem/myModi.fl"){
                $('#myMenu').children('.menu').children('li').eq(4).addClass('active');
            }
        </script>