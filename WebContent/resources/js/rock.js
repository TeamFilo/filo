const game = ()=>{
    let pScore = 0;
    let cScore = 0;

    //start the game
    const startGame = () =>{
        const playBtn = document.querySelector('.gameBtn');
        
        const introScreen = document.querySelector('.gameIntro');
        let gameBG = document.querySelector('.gameBG');
        let match = document.querySelector('.match');
        const hands = document.querySelectorAll('.hands img');

        hands.forEach(hand =>{
            hand.addEventListener('animationend', function(){
                this.style.animation='';
            });
        })
        
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
							gameBG.classList.add('fadeOut');
							match.classList.add('fadeIn');
							lg_reload();
						}else{
							alert("포인트가 부족합니다!");
						}
					}
				});
        });
        
    };
  //end the game
    const endGame = () =>{
    	let match = document.querySelector('.match');
    	let end = document.querySelector('.gameOut');
    	let gameBG = document.querySelector('.gameBG');
    	end.classList.remove('fadeOut');
    	end.classList.add('fadeIn');
    	match.classList.remove('fadeIn');
    	match.classList.add('fadeOut');
    	gameBG.classList.remove('fadeOut');
    	gameBG.classList.add('fadeIn');
    }

    //play Match
    const playMatch = () =>{
        const options = document.querySelectorAll('.options button');
        const playerHand = document.querySelector('.playerHand');
        const computerHand = document.querySelector('.computerHand');

        //computer options
        const computerOptions = ['rock','rock','paper','scissors','scissors','scissors'];
        options.forEach(option=>{
            option.addEventListener("click",function(){
                //computer choice
                const computerNumber = Math.floor(Math.random() * 6);
                const computerChoice = computerOptions[computerNumber];
                console.log(computerChoice);

                setTimeout(()=>{
                    //compareHands 소환
                    compareHands(this.textContent, computerChoice);
                    //update Images
                    playerHand.src=`/filo/resources/images/pf/${this.textContent}.png`;
                    computerHand.src=`/filo/resources/images/pf/${computerChoice}.png`;
                },900);

                //Animation
                playerHand.style.animation="shakePlayer 1s ease";
                computerHand.style.animation="shakeComputer 1s ease";
            });
        });
    };
    
    const updateScore = () => {
        const playerScore = document.querySelector('.playerScore p');
        const computerScore = document.querySelector('.computerScore p');
        playerScore.textContent = pScore;
        computerScore.textContent = cScore;
        //캐릭터 움직이기
        const updateChar = (pScore,cScore) => {
            //player Char
            if(pScore>=7){
                pScore=7;
            }else if(pScore==null&&pScore==''){
                pScore=0;
            }
            let pNow = document.querySelector(`.c${pScore} .playerChar`);
            let pRest = document.querySelector('.pNow');
            let pBRest = document.querySelector('.pColor');
            let pBlock = document.querySelector(`.b${pScore}`);
            pRest.classList.remove('pNow');
            pNow.classList.add('pNow');
            pBRest.classList.remove('pColor');
            pBlock.classList.add('pColor');
            
            //Computer Char
            if(cScore>=7){
                cScore=7;
            }else if(cScore==null&&cScore==''){
                cScore=0;
            }
            let cNow = document.querySelector(`.c${cScore} .computerChar`);
            let cRest = document.querySelector('.cNow');
            let cBlock = document.querySelector(`.b${cScore}`);
            let cBRest = document.querySelector('.cColor');
            cRest.classList.remove('cNow');
            cNow.classList.add('cNow');
            cBRest.classList.remove('cColor');
            cBlock.classList.add('cColor');
            if(pScore===cScore){
                let nColor = document.querySelector(`.b${cScore}`);
                nColor.classList.add('nColor');
            }
            
        }
        updateChar(pScore,cScore);
        //게임 종료 될 때 
        if(pScore>=7||cScore>=7){
            console.log('end');
            endGame();
	    	//ajax
	    	$(document).ready(function(event){
				var data = {"pScoreResult":pScore,"cScoreResult":cScore};
				console.log(data);
				$.ajax({
					type:"post",
					url: "/filo/game/insertRockResult.fl",
					dataType: "json",
					contentType: "application/json",
					data: JSON.stringify(data),
					success : function(result){
						var check = JSON.parse(result);
						console.log(check);
						lg_reload();
					}
				});
	    	});
        }
  
    }

    const compareHands = (playerChoice, computerChoice) => {
        const winner = document.querySelector('.winner');
        //Checking for a tie
        if(playerChoice === computerChoice){
            winner.textContent = 'Tie';
            return;
        }
        //Checking for a Rock
        if(playerChoice === 'rock'){
            if(computerChoice ==='scissors'){
                winner.textContent = 'Player wins'
                pScore++;
                updateScore();
                return;
            }else{
                winner.textContent = 'Computer wins'
                cScore++;
                cScore++;
                cScore++;
                updateScore();
                return;
            }
        }
        updateScore
        //checking for a paper
        if(playerChoice === 'paper'){
            if(computerChoice ==='scissors'){
                winner.textContent = 'Computer wins'
                cScore++;
                cScore++;
                updateScore();
                return;
            }else{
                winner.textContent = 'Player wins'
                pScore++;
                pScore++;
                pScore++;
                updateScore();
                return;
            }
        }
        
        //checking for a paper
        if(playerChoice === 'scissors'){
            if(computerChoice ==='rock'){
                winner.textContent = 'Computer wins'
                cScore++;
                updateScore();
                return;
            }else{
                winner.textContent = 'Player wins'
                pScore++;
                pScore++;
                updateScore();
                return;
            }
        }
    }

    //함수 호출
    startGame();
    playMatch();
};

//게임 시작
game();