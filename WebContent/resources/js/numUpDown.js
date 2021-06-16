const game = ()=>{


    //start the game
    const startGame = () =>{
        const playBtn = document.querySelector('.intro button');
        const introScreen = document.querySelector('.intro');
        let match = document.querySelector('.match');

       /* hands.forEach(hand =>{
            hand.addEventListener('animationend', function(){
                this.style.animation='';
            });
        })
        */

        playBtn.addEventListener('click', () => {
				var data = {"gameCate":2};
				$.ajax({
					type:"post",
					url: "/filo/game/pointCheck.fl",
					dataType: "json",
					contentType: "application/json",
					data: JSON.stringify(data),
					success : function(result){
						var np = result.needPoint;
						var up = result.userPoint;
						if(up>=np){
							introScreen.classList.add('fadeOut');
							match.classList.add('fadeIn');
						}else{
							alert("포인트가 부족합니다!");
						}
					}
				});
        });
        
    };
  //end the game
    /*
    const endGame = () =>{
    	let match = document.querySelector('.match');
    	let end = document.querySelector('.end');
    	end.classList.remove('fadeOut');
    	end.classList.add('fadeIn');
    	match.classList.remove('fadeIn');
    	match.classList.add('fadeOut');
    }
    */

   

    //함수 호출
    startGame();
  //  playMatch();
};

//게임 시작
game();