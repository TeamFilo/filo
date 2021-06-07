<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/include/header_game.jsp" />
	
<body class="noscrb">
    <div class="wrapAll game">

        <jsp:include page="/WEB-INF/views/include/top_game.jsp" />
        
        <jsp:include page="/WEB-INF/views/include/left_game.jsp" />
        
      <!--    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> -->
        <script>	
			function check(){
				// 보유 포인트 확인 ajax
				var data = {"purchaseShop":$('input[name=price]').val()};
				
				console.log(data);
	         		
				$.ajax({
					type:"post",
					url: "/filo/game/shop/shopPointCh.fl",
					dataType: "json",
					contentType: "application/json",
					data: JSON.stringify(data),
					success : function(result){
						console.log('값 넘어왔냐');
						var np = result.needPoint;
						var up = result.userPoint;
						if(up>=np){
							console.log('이프문타냐');
							introScreen.classList.add('fadeOut');
							match.classList.add('fadeIn');
						}else{
							alert("포인트가 부족합니다!");
							location.href="/filo/game/shop/purchase.fl";
						}
					}
				});
			}
		</script>

        <div class="right_game shop_game">
            
            <ul class="tab_menu">
                <li class="on">ID color</li>
                <li>Icon</li>
                <li>Skin</li>
            </ul>

            <ul class="tab_cont">
                <li>
                    ID color
                    <!-- ================== -->
			
					<h1>색깔구매</h1>
					<h4>색깔을 골라주세요</h4>
					<div class="picker" id="picker1"></div>
					<form action="/filo/shop/purchaseColorPro.fl" onsubmit="return check()" method="post">
						<input type="hidden" name="color" id="color"/>
						<input type="submit" value="구매하기" />
					</form>
					<script>
						var nowColor = '${nowColor}';
						$("#picker1").colorPick({
							'initialColor' : nowColor,
							'palette': ["#1abc9c", "#16a085", "#2ecc71", "#27ae60", "#3498db", "#2980b9", "#9b59b6", "#8e44ad", "#34495e", "#2c3e50", "#f1c40f", "#f39c12", "#e67e22", "#d35400", "#e74c3c", "#c0392b", "#ecf0f1"],
							'onColorSelected': function() {
								console.log("The user has selected the color: " + this.color)
								this.element.css({'backgroundColor': this.color, 'color': this.color});
								$('#color').val(this.color);
							}
						});
					</script>
                    
                    <!-- 
                    <form action="/filo/shop/purchaseColorPro.fl" onsubmit="return check()" method="post">
						<input type="hidden" name="color" id="color"/>
						<input type="submit" value="구매하기" />
					</form>
                     -->
                
                </li>
                <li>
                	<!-- 아이콘구매 -->
                	<c:forEach var="icon" items="${getIcon}">
                	<div class="item_id">
                        <img src="/filo/resources/images/pf/${icon.name}.png" alt="">
                        <div class="box">
                            <p class="name">${icon.name}</p>
                            <p class="price">${icon.needPoint} point</p>
                        </div>
                        
                    <!--<form action="/filo/game/shop/purchasePro.fl" onsubmit="return check()" method="get"> -->
                        <form action="/filo/game/shop/purchasePro.fl" onsubmit="return check()" method="post">
                        <input type="hidden" name="item" value="icon"/>
                        <input type="hidden" name="result" value="${icon.name}"/>
                        <input type="hidden" name="price" value="${icon.needPoint}"/>
                        <!-- 버튼을 어떻게해야할지 모르겠다 -->
                        <div class="btn_purchase"><input type="submit" value="buy" class="btn_purchase"/></div>
                       
                <!--    <input type="submit" class="btn_purchase">buy</button>	-->
                		</form>
                        
                    </div>
                    
                    </c:forEach>
	             
                	
                	
                	
					<!--  
                    <div class="item_id">
                        <img src="/filo/resources/images/pf/bread.png" alt="">
                        <div class="box">
                            <p class="name">아이콘 이름1</p>
                            <p class="price">1000 point</p>
                        </div>
                        <div class="btn_purchase">buy</div>
                    </div>
                   -->
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