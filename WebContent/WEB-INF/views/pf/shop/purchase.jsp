<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/include/header_game.jsp" />
	
<body class="noscrb">
    <div class="wrapAll game">

        <jsp:include page="/WEB-INF/views/include/top_game.jsp" />
        
        <jsp:include page="/WEB-INF/views/include/left_game.jsp" />

        <div class="right_game shop_game">
            
            <ul class="tab_menu">
                <li class="on">ID color</li>
                <li>Icon</li>
                <li>Skin</li>
            </ul>

            <ul class="tab_cont">
                <li>
                    ID color
                </li>
                <li>
                    <div class="item_id">
                        <img src="/filo/resources/images/pf/bread.png" alt="">
                        <div class="box">
                            <p class="name">아이콘 이름1</p>
                            <p class="price">1000 point</p>
                        </div>
                        <div class="btn_purchase">buy</div>
                    </div>
                    <div class="item_id">
                        <img src="/filo/resources/images/pf/bread.png" alt="">
                        <div class="box">
                            <p class="name">아이콘 이름1</p>
                            <p class="price">1000 point</p>
                        </div>
                        <div class="btn_purchase">buy</div>
                    </div>
                </li>
                <li>
                    Skin
                </li>
            </ul>

        </div>
        <!-- //shop_game -->
        <script>
            $('.tab_menu > li').eq(0).click(function(){
                $(this).siblings().removeClass('on');
                $(this).addClass('on');
                $('.tab_cont > li').hide();
                $('.tab_cont > li').eq(0).fadeIn();
            });
            $('.tab_menu > li').eq(1).click(function(){
                $(this).siblings().removeClass('on');
                $(this).addClass('on');
                $('.tab_cont > li').hide();
                $('.tab_cont > li').eq(1).fadeIn();
            });
            $('.tab_menu > li').eq(2).click(function(){
                $(this).siblings().removeClass('on');
                $(this).addClass('on');
                $('.tab_cont > li').hide();
                $('.tab_cont > li').eq(2).fadeIn();
            });
        </script>

    </div>
    <!-- //wrapAll end -->
    <script>
    var swiper = new Swiper('#left_game_swiper', {
        direction: 'vertical',
        mousewheel: true,
        slidesPerView: 1.65,
        spaceBetween: 30,
	});
    </script>
</body>
</html>