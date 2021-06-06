package portfolio.controller.bean;

import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;

import com.fasterxml.jackson.databind.ObjectMapper;

import portfolio.model.dto.GameInfoDTO;
import portfolio.model.dto.GameRecordDTO;
import portfolio.model.dto.GrGiJoinDTO;
import portfolio.model.dto.WalletDTO;
import portfolio.service.bean.GameService;
import travelMaker.service.bean.MemberService;

@Controller
@RequestMapping("/game/")
public class GameController {
	
	@Autowired
	private GameService gameService = null;
	
	@Autowired
	private MemberService memService = null;
	
	@Scheduled(cron = "1 0 0 * * *")
	public void resetCnt() {
		System.out.println("매일 0시 0분 1초 실행 ["+new Date()+"]");
		gameService.resetCnt();
	}
	
	int answer = 0;	//updown 시 ajax와 게임페이지에서 변수를 공유하기 위해 바깥으로 뺌
	
	@RequestMapping("main.fl")
	public String gameMain(Model model) throws Exception {
		String user = (String)RequestContextHolder.getRequestAttributes().getAttribute("memId", RequestAttributes.SCOPE_SESSION);
		if(user!=null) {
			model.addAttribute("userInfo",memService.getMember(user));
			model.addAttribute("wal",gameService.getWallet(user));
			//오늘 한 게임
			List<GrGiJoinDTO> todayRecords = gameService.todayRecords(user);
			model.addAttribute("todayRecords",todayRecords);
			
			//오늘 룰렛, 복권 횟수
			model.addAttribute("lotteryCnt", gameService.getWallet(user).getLotteryCnt());
			model.addAttribute("rouletteCnt", gameService.getWallet(user).getRouletteCnt());
			
			//내 등수
			model.addAttribute("myRank", gameService.myRank(user));
			
			//랭킹 탑3 정보
			
			
			//퍼센트
			double gamePercent = gameService.gamePercent(user);	
			model.addAttribute("gamePercent" ,gamePercent);
		}
		
		return "/pf/game/main";
	}
	
	//hys up-down game page
	@RequestMapping("updown.fl")
	public String numUpDown(Model model) {
		String user = (String)RequestContextHolder.getRequestAttributes().getAttribute("memId", RequestAttributes.SCOPE_SESSION);
		answer = (int)(Math.random()*25)+1;	//0~24 +1
		if(user!=null) {
			int needPoint = gameService.getGameInfo(1).getNeedPoint();
			int userPoint = gameService.getWallet(user).getPoint();
			boolean isPossible = false;
			if(needPoint>userPoint) {
				isPossible = false;	//게임 불가능
			}else {
				isPossible = true;	//게임 가능
				gameService.updatePoint(user,-needPoint);	//포인트 차감
			}
			model.addAttribute("isPossible",isPossible);
			model.addAttribute("answer",answer);
		}
		
		return "/pf/game/numUpDown";
	}
	
	//hys up-down game ajax
	@ResponseBody
	@RequestMapping("updownGuess.fl")
	public Map numUpDownGuess(@RequestBody Map<String, Integer> map) throws Exception {
		String user = (String)RequestContextHolder.getRequestAttributes().getAttribute("memId", RequestAttributes.SCOPE_SESSION);
		
		int chance = map.get("chance");
		int input = map.get("guess");
		int start = map.get("start");
		int end = map.get("end");
		int gp = 0;
		
		//승리시 1, 패배시 0, 게임 진행 중에는 -1
		int result = -1;
		if(chance>1) {
			if(input==answer) {
				result = 1;
				System.out.println("정답! user:"+user+"/result:"+result);
			/*	오늘 첫 게임인지 테스트해서 첫 게임일 때는 점수 더 넣어주기	*/
				if(gameService.didPlayToday(user, 1)==0) {
					gp = 60;
				}else {
					gp = 50;
				}
				gameService.insRecordPoint(user,1,gp);	//이기면 50포인트
			}else if(input>answer) {
				chance-=1;
				end = input-1;
			}else if(input<answer) {
				chance-=1;
				start = input+1;
			}
		}else if(chance<=1){
			chance-=1;
			if(input==answer) {
				result = 1;
				System.out.println("정답! user:"+user+"/result:"+result);
				/*	오늘 첫 게임인지 테스트해서 첫 게임일 때는 점수 더 넣어주기	*/
				if(gameService.didPlayToday(user, 1)==0) {
					gp = 60;
				}else {
					gp = 50;
				}
				gameService.insRecordPoint(user,1,gp);	//이기면 50포인트
			}else {
				result = 0;
				System.out.println("실패! user:"+user+"/result:"+result);
				gameService.insRecordPoint(user,1,0);	//지면 0포인트
			}
		}
		map.put("input",input);
		map.put("chance",chance);
		map.put("start",start);
		map.put("end",end);
		map.put("result",result);
		return map;
	}
	
	//lsh rockPS game page
	@RequestMapping("rockPS.fl")
	public String rockPS(Model model) {
		String user = (String)RequestContextHolder.getRequestAttributes().getAttribute("memId", RequestAttributes.SCOPE_SESSION);
		if(user!=null) {
			String nick = memService.getMember(user).getNickname();
			model.addAttribute("nickname",nick);
		}
		return "/pf/game/rockPS";
	}
	
	@ResponseBody
	@RequestMapping("pointCheck.fl")
	public Map pointCheck(@RequestBody Map<String,Integer> map) {
		String user = (String)RequestContextHolder.getRequestAttributes().getAttribute("memId", RequestAttributes.SCOPE_SESSION);
		int needPoint = gameService.getGameInfo(map.get("gameCate")).getNeedPoint();
		int userPoint = gameService.getWallet(user).getPoint();
		if(userPoint>=needPoint) {
			gameService.updatePoint(user,-needPoint);	//포인트 차감
		}
		map.put("needPoint",needPoint);
		map.put("userPoint",userPoint);
		return map;
	}
	
	
	//lhs ajaxTest
	@ResponseBody
	@RequestMapping("insertRockResult.fl")
	public String insertRockResult(@RequestBody Map<Object, Object> map)throws Exception {
		String result ="";
		String user = (String)RequestContextHolder.getRequestAttributes().getAttribute("memId", RequestAttributes.SCOPE_SESSION);

		int pScore = (int)map.get("pScoreResult");
		int cScore = (int)map.get("cScoreResult");
		System.out.println(pScore);
		System.out.println(cScore);
		
		//게임 고유 번호, 아이디, 종목, 승패여부
		//1. 스코어를 넣었을 때 승패 여부 알려주기
		//승리시 1 패배시 0 
		int gameResult = gameService.rockResult(pScore,cScore);
		System.out.println("gameResult:"+gameResult);
		//2. 아이디, 승패여부, 종목 db에 넣어주기 
		if(gameResult==1) {
		/*	오늘 첫 게임인지 테스트해서 첫 게임일 때는 점수 더 넣어주기	*/
			int gp = 0;
			if(gameService.didPlayToday(user, 2)==0) {
				gp = 60;
			}else {
				gp = 50;
			}
			gameService.insRecordPoint(user,2,gp);	//이기면 50포인트
		}else if(gameResult==0) {
			gameService.insRecordPoint(user, 2, 0);
		}
		
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(result);
		return json;
	}
	
	//lsm lottery game page
	@RequestMapping("lottery.fl")
	public String lottery(Model model) {
		int ranNum = (int)(Math.random()*5+1);
		String ranImg = "lottery"+ranNum+".png";
		//System.out.println("랜덤이미지" + ranImg); 
		model.addAttribute("ranNum",ranNum);
		model.addAttribute("ranImg",ranImg);
		return "pf/game/lottery";
	}
	
	//복권 구매
	@ResponseBody
	@RequestMapping("buyLottery.fl")
	public String buyLottery() {
		
		//gameService.buyLottery();
		return "";
	}
	
	
	//jbr
	@RequestMapping("randomPick.fl")
	public String randomPick(Model model) {
		String result = gameService.randomNum();
		model.addAttribute("result", result);
		return "pf/game/randomPick";
	}
	
	//jbr
	@RequestMapping("card.fl")
	public String card() {
		return "pf/game/card";
	}

	@ResponseBody
	@RequestMapping("insertCardResult.fl")
	public void insertCardResult(@RequestBody Map<String,Integer> map) {
		String user = (String)RequestContextHolder.getRequestAttributes().getAttribute("memId", RequestAttributes.SCOPE_SESSION);
		int score = map.get("score");
		int gameCate = map.get("gameCate");
	/*	오늘 첫 게임인지 테스트해서 첫 게임일 때는 점수 더 넣어주기	*/
		if(gameService.didPlayToday(user, gameCate)==0) {
			score += 10;
		}
		gameService.insRecordPoint(user, gameCate, score);
	}
	
	//룰렛
	@RequestMapping("winwheel.fl")
	public String winwheel(Model model){
		String user = (String)RequestContextHolder.getRequestAttributes().getAttribute("memId", RequestAttributes.SCOPE_SESSION);
		model.addAttribute("user",user);
		return "pf/game/winwheel";
	}
	
	//룰렛 ajax
	@ResponseBody
	@RequestMapping("winwheelAjax.fl")
	public void winwheelAjax(@RequestBody String pointText){
		String user = (String)RequestContextHolder.getRequestAttributes().getAttribute("memId", RequestAttributes.SCOPE_SESSION);
		String point[] = pointText.split("p");
		int p = Integer.parseInt(point[0]);
	//1)wallet에 rouletteCnt +1
		gameService.updateWheelCnt(user);
	//2)gameRecord에 레코드 insert
		gameService.insRecordPoint(user, 4, p);
	}
	
	//복권 ajax
	@ResponseBody
	@RequestMapping("lotteryAjax.fl")
	public void lotteryAjax(@RequestBody String point){
		String user = (String)RequestContextHolder.getRequestAttributes().getAttribute("memId", RequestAttributes.SCOPE_SESSION);
		int p = Integer.parseInt(point);
		//1)wallet에 lotteryCnt +1
		gameService.updateLotteryCnt(user);
		//2)gameRecord에 레코드 insert
		gameService.insRecordPoint(user, 0, p);
	}
	
	
	//회원의 룰렛 복권 횟수 체크
	@ResponseBody
	@RequestMapping("dailyCntCheck.fl")
	public int dailyCntCheck(@RequestBody String gameCate) {
		String user = (String)RequestContextHolder.getRequestAttributes().getAttribute("memId", RequestAttributes.SCOPE_SESSION);
		int cate = Integer.parseInt(gameCate);
		WalletDTO wallet = gameService.getWallet(user);
		int count = -1;
		if(cate==0) {	//복권
			count = wallet.getLotteryCnt();
		}else if(cate==4) {	//룰렛
			count = wallet.getRouletteCnt();
		}
		return count;
	}
	
	//스크래치 테스트
	@RequestMapping("scratchTest.fl")
	public String scratchTest() {
		return "pf/game/scratchTest";
	}
	
}
