package portfolio.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import portfolio.model.dto.GameInfoDTO;
import portfolio.model.dto.GameRecordDTO;
import portfolio.model.dto.WalletDTO;

@Repository
public class GameDAOImpl implements GameDAO  {

	@Autowired
	private SqlSessionTemplate sqlSession = null;
	
	
	//복권,룰렛 카운트 리셋
	@Override
	public void resetCnt() {
		sqlSession.update("game.resetCnt");
	}
	
	//회원가입 시 지갑 테이블에 레코드 insert
	@Override
	public void addWallet(String id) {
		sqlSession.insert("game.addWallet",id);
	}
	
	//회원 wallet 리턴
	@Override
	public WalletDTO getWallet(String id) {
		WalletDTO wallet = sqlSession.selectOne("game.userWallet",id);
		return wallet;
	}
	
	//회원 gameRecord 리턴
	@Override
	public List<GameRecordDTO> getGameRecord(String id) {
		List<GameRecordDTO> records = sqlSession.selectList("game.userAllRecord",id);
		return records;
	}
	
	//게임 정보 리턴
	@Override
	public GameInfoDTO getGameInfo(int gameCate) {
		GameInfoDTO info = sqlSession.selectOne("game.getGameInfo",gameCate);
		return info;
	}
	
	
	
	
	
	
	
	
	@Override
	public void insertRock(Map rockMap) {
		sqlSession.insert("game.insertRock",rockMap);
	}
	
	@Override
	public void insertUpdown(Map map) {
		sqlSession.insert("game.insertUpdown", map);
	}
}
