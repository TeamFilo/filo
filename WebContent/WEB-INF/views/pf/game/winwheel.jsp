<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/include/header_game.jsp" />
   
<body class="noscrb">
		<div class="wrapAll game">
			<jsp:include page="/WEB-INF/views/include/top_game.jsp" />
       		<jsp:include page="/WEB-INF/views/include/left_game.jsp" />
       		
			<c:if test="${sessionScope.memId==null}">
				<script>
					alert("로그인 후에 이용해주세요");
					location.href="/filo/member/login.fl";
				</script>
			</c:if>
			
			<div class="right_game index_game">
		        <div align="center">
		            <table cellpadding="0" cellspacing="0" border="0">
		                <tr>
		                    <td>
		                        <div class="power_controls">
		                            <br />
		                            <br />
		                            <!-- 
		                            <br />
		                            <table class="power" cellpadding="10" cellspacing="0">
		                                <tr>
		                                    <th align="center">Power</th>
		                                </tr>
		                                <tr>
		                                    <td width="78" align="center" id="pw3" onClick="powerSelected(3);">High</td>
		                                </tr>
		                                <tr>
		                                    <td align="center" id="pw2" onClick="powerSelected(2);">Med</td>
		                                </tr>
		                                <tr>
		                                    <td align="center" id="pw1" onClick="powerSelected(1);">Low</td>
		                                </tr>
		                            </table>
		                             -->
		                            <img id="spin_button" src="/filo/resources/images/pf/spin_off.png" alt="Spin" onClick="startSpin();" />
		                            <br /><br />
		                        </div>
		                    </td>
		                    <td width="438" height="582" class="the_wheel" align="center" valign="center">
		                        <canvas id="canvas" width="434" height="434">
		                            <p style="{color: white}" align="center">Sorry, your browser doesn't support canvas. Please try another.</p>
		                        </canvas>
		                    </td>
		                </tr>
		            </table>
		        </div>
		        
		        <script>
		            // Create new wheel object specifying the parameters at creation time.
		            let theWheel = new Winwheel({
		                'numSegments'  : 8,     // Specify number of segments.
		                'outerRadius'  : 212,   // Set outer radius so wheel fits inside the background.
		                'textFontSize' : 28,    // Set font size as desired.
		                'segments'     :        // Define segments including colour and text.
	            	    [
		                     {'fillStyle' : '#eae56f', 'text' : '5point'},
		                     {'fillStyle' : '#89f26e', 'text' : '10point'},
		                     {'fillStyle' : '#7de6ef', 'text' : '5point'},
		                     {'fillStyle' : '#e7706f', 'text' : '10point'},
		                     {'fillStyle' : '#eae56f', 'text' : '5point'},
		                     {'fillStyle' : '#89f26e', 'text' : '10point'},
		                     {'fillStyle' : '#7de6ef', 'text' : '100point'},
		                     {'fillStyle' : '#e7706f', 'text' : '1point'}
		                ],
		                'animation' :           // Specify the animation to use.
		                {
		                    'type'     : 'spinToStop',
		                    'duration' : 15,
		                    'spins'    : 8,
		                    'callbackFinished' : alertPrize,
		                    'callbackSound'    : playSound,   // Function to call when the tick sound is to be triggered.
		                    'soundTrigger'     : 'pin'        // Specify pins are to trigger the sound, the other option is 'segment'.
		                },
		                'pins' :
		                {
		                    'number' : 16   // Number of pins. They space evenly around the wheel.
		                }
		            });
		
		            // -----------------------------------------------------------------
		            // This function is called when the segment under the prize pointer changes
		            // we can play a small tick sound here like you would expect on real prizewheels.
		            // -----------------------------------------------------------------
		            let audio = new Audio('/filo/resources/images/pf/tick.mp3');  // Create audio object and load tick.mp3 file.
		
		            function playSound()
		            {
		                // Stop and rewind the sound if it already happens to be playing.
		                audio.pause();
		                audio.currentTime = 0;
		
		                // Play the sound.
		                audio.play();
		            }
		
		            // -------------------------------------------------------
		            // Called when the spin animation has finished by the callback feature of the wheel because I specified callback in the parameters
		            // note the indicated segment is passed in as a parmeter as 99% of the time you will want to know this to inform the user of their prize.
		            // -------------------------------------------------------
		            function alertPrize(indicatedSegment)
		            {
		                // Do basic alert of the segment text.
		                // You would probably want to do something more interesting with this information.
		                var getPoint = indicatedSegment.text;
						$.ajax({
							url: "/filo/game/winwheelAjax.fl",
							cache: false,
							type: "POST",
							dataType: "json",
							contentType: "application/json",
							data: JSON.stringify(getPoint),
						});
		                alert("축하합니다! " +getPoint+"가 적립됩니다!");
		            }
		
		            // =======================================================================================================================
		            // Code below for the power controls etc which is entirely optional. You can spin the wheel simply by
		            // calling theWheel.startAnimation();
		            // =======================================================================================================================
		            let wheelPower    = 4;
		            let wheelSpinning = false;
					/*
		             -------------------------------------------------------
		             Function to handle the onClick on the power buttons.
		             -------------------------------------------------------
		            function powerSelected(powerLevel)
		            {
		                // Ensure that power can't be changed while wheel is spinning.
		                if (wheelSpinning == false) {
		                    // Reset all to grey incase this is not the first time the user has selected the power.
		                    document.getElementById('pw1').className = "";
		                    document.getElementById('pw2').className = "";
		                    document.getElementById('pw3').className = "";
		
		                    // Now light up all cells below-and-including the one selected by changing the class.
		                    if (powerLevel >= 1) {
		                        document.getElementById('pw1').className = "pw1";
		                    }
		
		                    if (powerLevel >= 2) {
		                        document.getElementById('pw2').className = "pw2";
		                    }
		
		                    if (powerLevel >= 3) {
		                        document.getElementById('pw3').className = "pw3";
		                    }
		
		                    // Set wheelPower var used when spin button is clicked.
		                    wheelPower = powerLevel;
		
		                    // Light up the spin button by changing it's source image and adding a clickable class to it.
		                    document.getElementById('spin_button').src = "/filo/resources/images/pf/spin_on.png";
		                    document.getElementById('spin_button').className = "clickable";
		                }
		            }
		           */
		            // -------------------------------------------------------
		            // Click handler for spin button.
		            // -------------------------------------------------------
		            function startSpin(){
		            	// ****** 여기다가 ajax 써서 cnt 확인하기 ******
		            	var gameCate = 4;	//gameCate
						$.ajax({
							type:"post",
							url: "/filo/game/dailyCntCheck.fl",
							dataType: "json",
							contentType: "application/json",
							data: JSON.stringify(gameCate),
							success : function(result){
								//result가 문자로 넘어오기 때문에 문자로 비교
								if(result=='0'){	//오늘 안했으면
					                // Ensure that spinning can't be clicked again while already running.
					                if (wheelSpinning == false) {
					                    // Based on the power level selected adjust the number of spins for the wheel, the more times is has
					                    // to rotate with the duration of the animation the quicker the wheel spins.
					                    if (wheelPower == 1) {
					                        theWheel.animation.spins = 3;
					                    } else if (wheelPower == 2) {
					                        theWheel.animation.spins = 8;
					                    } else if (wheelPower == 3) {
					                        theWheel.animation.spins = 15;
					                    } else if (wheelPower == 4) {
					                        theWheel.animation.spins = 30;
					                    }
					
					                    // Disable the spin button so can't click again while wheel is spinning.
					                    document.getElementById('spin_button').src       = "/filo/resources/images/pf/spin_off.png";
					                    document.getElementById('spin_button').className = "";
					
					                    // Begin the spin animation by calling startAnimation on the wheel object.
					                    theWheel.startAnimation();
					
					                    // Set to true so that power can't be changed and spin button re-enabled during
					                    // the current animation. The user will have to reset before spinning again.
					                    wheelSpinning = true;
					                }
								}else{
									alert("이미 참여하셨습니다");
								}
							}
						});
	                    
		            }
					/*
		             -------------------------------------------------------
		             Function for reset button.
		             -------------------------------------------------------
		            function resetWheel()
		            {
		                theWheel.stopAnimation(false);  // Stop the animation, false as param so does not call callback function.
		                theWheel.rotationAngle = 0;     // Re-set the wheel angle to 0 degrees.
		                theWheel.draw();                // Call draw to render changes to the wheel.
		
		                document.getElementById('pw1').className = "";  // Remove all colours from the power level indicators.
		                document.getElementById('pw2').className = "";
		                document.getElementById('pw3').className = "";
		
		                wheelSpinning = false;          // Reset to false to power buttons and spin can be clicked again.
		            }
					*/
		        </script>
	        </div>
		</div>
		<!-- //wrapAll game end -->
	
</body>
</html>