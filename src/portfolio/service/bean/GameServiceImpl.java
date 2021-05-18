package portfolio.service.bean;


import java.util.HashMap;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import java.util.ArrayList;
import java.util.List;


import org.springframework.stereotype.Service;

import portfolio.model.dao.GameDAO;
import portfolio.model.dto.GameInfoDTO;
import portfolio.model.dto.GameRecordDTO;
import portfolio.model.dto.WalletDTO;

@Service
public class GameServiceImpl implements GameService {
  
	@Autowired
	private GameDAO gameDAO = null;
	
	//카운트 리셋
	@Override
	public void resetCnt() {
		gameDAO.resetCnt();
	}
	
	//회원가입 시 지갑 테이블에 레코드 insert
	@Override
	public void addWallet(String id) {
		gameDAO.addWallet(id);
	}
	
	//회원 wallet 리턴
	@Override
	public WalletDTO getWallet(String id) {
		WalletDTO wallet = gameDAO.getWallet(id);
		return wallet;
	}
	
	//회원 gameRecord 리턴
	@Override
	public List<GameRecordDTO> getGameRecord(String id) {
		List<GameRecordDTO> records = gameDAO.getGameRecord(id);
		return records;
	}
	
	//게임 정보 리턴
	@Override
	public GameInfoDTO getGameInfo(int gameCate) {
		GameInfoDTO info = gameDAO.getGameInfo(gameCate);
		return info;		
	}
	
	//게임 시 포인트 차감
	
	//게임 승패에 따른 포인트 획득
	
	
	//Rock 승리 구분
	@Override
	public int rockResult(int pScore, int cScore) {
		//스코어 비교해서 승리/패배 구분
		int result=0;
		if(pScore > cScore) {
			result = 1;
		}else {
			result=0;
		}
		return result;
	}
	//Rock 결과 insert
	@Override
	public void insertRock(String user, int gameResult, int gameCate) {
		//게임 결과 insert
		Map rockMap = new HashMap();
		rockMap.put("user", user);
		rockMap.put("gameResult", gameResult);
		rockMap.put("gameCate", gameCate);
		gameDAO.insertRock(rockMap);
	}

	
	//jbr
	@Override
	public String randomNum() {
		/*List list = new ArrayList();
		for(int i = 0; i < 10; i++) {
			int ran = (int)(Math.random()*10 +1);
			list.add(ran);
		}
			System.out.println("랜덤" + list);
		*/
		
		int ran = (int)(Math.random()*10+1);
		String coupon;
		if(1 <= ran && ran <= 4) {
			coupon = "꽝!";
		}else if(5 <= ran && ran <= 7) {
			coupon = "50포인트";
		}else if(8 <= ran && ran <= 9) {
			coupon = "100포인트";
		}else {
			coupon = "wow! 1000포인트";
		}
		
		return coupon;
	}
	
	public int[] oneToFifty() {
		int[] numArray = new int[10];
		for(int i = 0; i < 10; i++) {
			numArray[i] = (int)(Math.random()*10+1);
			
			for(int j = 0;  j < i; j++) {
				if(numArray[i] == numArray[j]) {
					i--;
					break;
				}
			}
		}
		for(int i=0; i<numArray.length; i++) {
			System.out.println("출력!" + numArray[i] );
		}
		
		return numArray;
	}
	
	@Override
	public void insertUpdown(String user, int gameResult) {
		Map map = new HashMap();
		map.put("user", user);
		map.put("result", gameResult);
		gameDAO.insertUpdown(map);
	}
	
	
	
}
