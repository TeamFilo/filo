package portfolio.service.bean;

import java.util.List;

import portfolio.model.dto.GameInfoDTO;
import portfolio.model.dto.GameRecordDTO;
import portfolio.model.dto.WalletDTO;

public interface GameService {
	
	//카운트 리셋
	public void resetCnt();
	
	//회원가입 시 지갑 테이블에 레코드 insert
	public void addWallet(String id);
	//회원 wallet 리턴
	public WalletDTO getWallet(String id);
	//회원 gameRecord 리턴
	public List<GameRecordDTO> getGameRecord(String id);
	//게임 정보 리턴
	public GameInfoDTO getGameInfo(int gameCate);
	/*
	//게임 시 포인트 차감
	public void takePoint(String id, int gameCate);
	//게임 승패에 따른 포인트 획득
	public void getPoint(String id, int gameCate);
	*/
	
	//rock 승패여부
	public int rockResult(int pScore, int cScore);
	//rock 결과 insert
	public void insertRock(String user,int gameResult,int gameCate);
	

	public String randomNum();
	public int[] oneToFifty();

	//updown 결과 insert
	public void insertUpdown(String user, int gameResult);
	

}
