package portfolio.service.bean;

import java.util.List;

import portfolio.model.dto.GameInfoDTO;
import portfolio.model.dto.GrGiJoinDTO;
import portfolio.model.dto.WalletDTO;

public interface GameService {
	
	//카운트 리셋
	public void resetCnt();
	
	//회원가입 시 지갑 테이블에 레코드 insert
	public void addWallet(String id);
	//회원 wallet 리턴
	public WalletDTO getWallet(String id);
	//회원의 모든 gameRecord 리턴
	public List<GrGiJoinDTO> getGameRecord(String id);
	//게임 정보 리턴
	public GameInfoDTO getGameInfo(int gameCate);
	
	//포인트 업데이트 (게임 시작 및 아이템 구매 등)
	public void updatePoint(String id, int needPoint);
	//gameRecord테이블에 insert + wallet테이블에 포인트 추가
	public void insRecordPoint(String id, int gameCate, int score);
	
	//rock 승패여부
	public int rockResult(int pScore, int cScore);

	public String randomNum();
	
	//데일리 룰렛 횟수 올리기
	public void updateWheelCnt(String user);
	//복권 구매 횟수 올리기
	public void updateLotteryCnt(String user);
	//오늘 한 게임 정보 리턴
	public List<GrGiJoinDTO> todayRecords(String user);
	//오늘 첫 게임인지 판단
	public int didPlayToday(String user, int gameCate);
	//상위 퍼센트 정보 리턴
	public double gamePercent(String user);
	//랭킹 세 명 정보
	public List topThree();
	//내 등수
	public int myRank(String user);
	
}
