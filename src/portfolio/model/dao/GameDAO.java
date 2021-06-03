package portfolio.model.dao;

import java.util.List;
import java.util.Map;
import portfolio.model.dto.GameInfoDTO;
import portfolio.model.dto.GameRecordDTO;
import portfolio.model.dto.GrGiJoinDTO;
import portfolio.model.dto.WalletDTO;

public interface GameDAO {
	
	//복권,룰렛 카운트 리셋
	public void resetCnt();

	//회원가입 시 지갑 테이블에 레코드 insert
	public void addWallet(String id);

	//회원 wallet 리턴
	public WalletDTO getWallet(String id);
	//회원의 모든 gameRecord 리턴
	public List<GrGiJoinDTO> getGameRecord(String id);
	//게임 정보 리턴
	public GameInfoDTO getGameInfo(int gameCate);
	
	//게임 레코드 insert
	public void insertRecord(Map map);
	//지갑에 포인트 업데이트
	public void updatePoint(Map map);
	//데일리 룰렛 횟수 올리기
	public void updateWheelCnt(String user);
	//복권 구매 횟수 올리기
	public void updateLotteryCnt(String user);
	
	//상위 퍼센트 정보 구하기
	public Map<Double, Double> gamePercent(String user);
	
}
