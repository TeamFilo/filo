package portfolio.service.bean;


import java.util.HashMap;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.List;


import org.springframework.stereotype.Service;

import portfolio.model.dao.GameDAO;
import portfolio.model.dto.GameInfoDTO;
import portfolio.model.dto.GameRecordDTO;
import portfolio.model.dto.GrGiJoinDTO;
import portfolio.model.dto.WalletDTO;
import travelMaker.model.dao.TmUserDAO;
import travelMaker.model.dto.TmUserDTO;

@Service
public class GameServiceImpl implements GameService {
  
	@Autowired
	private GameDAO gameDAO = null;
	
	@Autowired
	private TmUserDAO tmUserDAO = null;
	
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
	
	//회원의 모든 gameRecord 리턴
	@Override
	public List<GrGiJoinDTO> getGameRecord(String id) {
		List<GrGiJoinDTO> records = gameDAO.getGameRecord(id);
		return records;
	}
	
	//게임 정보 리턴
	@Override
	public GameInfoDTO getGameInfo(int gameCate) {
		GameInfoDTO info = gameDAO.getGameInfo(gameCate);
		return info;		
	}
	
	//포인트 업데이트 (게임 시작 및 아이템 구매 등)
	@Override
	public void updatePoint(String id, int needPoint) {
		Map map = new HashMap();
		map.put("id",id);
		//소모할 포인트(needPoint)를 point라는 key 값으로 보낸다
		map.put("point",needPoint);
		gameDAO.updatePoint(map);
	}
	
	//gameRecord테이블에 insert + wallet테이블에 포인트 추가
	@Override
	public void insRecordPoint(String id, int gameCate, int score) {
		Map map = new HashMap();
		map.put("id",id);
		map.put("gameCate",gameCate);
		//얻은 점수(score)를 point라는 key 값으로 보낸다
		map.put("point",score);
		gameDAO.insertRecord(map);
		gameDAO.updatePoint(map);
	}

	
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
	
	//데일리 룰렛 횟수 올리기
	@Override
	public void updateWheelCnt(String user) {
		gameDAO.updateWheelCnt(user);
	}
	
	//복권 구매 횟수 올리기
	@Override
	public void updateLotteryCnt(String user) {
		gameDAO.updateLotteryCnt(user);
	}
	
	//오늘 한 게임 정보 리턴
	@Override
	public List<GrGiJoinDTO> todayRecords(String user) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		String today = sdf.format(Calendar.getInstance().getTime());
		List<GrGiJoinDTO> records = getGameRecord(user);
		List<GrGiJoinDTO> todayR = new ArrayList<GrGiJoinDTO>();
		List<GrGiJoinDTO> todayRecords = new ArrayList<GrGiJoinDTO>();

		for(int i=0; i<records.size(); i++) {
			//GameRecordDTO rec = records.get(i);
			String gameReg = sdf.format(new Date(records.get(i).getReg().getTime()));
			if(gameReg.equals(today)) { //&& rec.getGameCate()!=0 && rec.getGameCate()!=4;
				todayR.add(records.get(i));
			}
		}
		if(todayR.size()>5) {
			for(int i=0; i<5; i++) {
				todayRecords.add(todayR.get(i));
			}
		}else {
			for(int i=0; i<todayR.size(); i++) {
				todayRecords.add(todayR.get(i));
			}
		}
		
		return todayRecords;
	}
	
	//오늘 첫 게임인지 판단
	@Override
	public int didPlayToday(String user, int gameCate) {
		List<GrGiJoinDTO> list = todayRecords(user);
		List<GrGiJoinDTO> thisList = new ArrayList<GrGiJoinDTO>();
		for(int i=0; i<list.size(); i++) {
			if(gameCate == list.get(i).getGameCate()) {
				thisList.add(list.get(i));
			}
		}
		return thisList.size();
	}
	
	
	//오늘 한 게임중  게임카테1,2,3 중 오늘 안한 게임 카테만 담겨있음
	@Override
	public List playToday(String user) {
		List<GrGiJoinDTO> playList = todayRecords(user); //오늘 한 게임 
		
		for(int i =0; i<playList.size(); i++) {
		System.out.println("오늘한게임"+ ((GrGiJoinDTO)playList.get(i)).getGameCate());
		}
		
		List<Integer> gameNum = new ArrayList<Integer>(Arrays.asList(1,2,3));  //Get More Point에 보여주는 전체 게임카테를 배열에 담음
		
		// playList에 담겨있는 오늘 한 게임카테를 gameNum배열에서 삭제시킴 
		for(int i = 0; i < playList.size(); i++) {
			if(playList.get(i).getGameCate() == 1) {
				gameNum.remove((Integer)1);
			}else if(playList.get(i).getGameCate() == 2) {
				gameNum.remove((Integer)2);
			}else if(playList.get(i).getGameCate() == 3) {
				gameNum.remove((Integer)3);
			}
		}
		
		for(int i=0; i<gameNum.size(); i++) {
			System.out.println("게임넘목록"+gameNum.get(i));
		}
		return gameNum;
	}
	
	
	
	
	//상위 퍼센트 정보 리턴
	@Override
	public double gamePercent(String user) {
		Map map =gameDAO.gamePercent(user);
		double myRank = (double)map.get("myRank");
		double allCnt = (double)map.get("allCnt");
		double gamePercent = myRank/allCnt*100;
		
		return gamePercent;
	}
	
	//랭킹 세 명 정보
	@Override
	public Map<Integer,TmUserDTO> topThree() {
		List<Map> list = gameDAO.topRankers();
	/*
		list에는 {ID=yoonseo, ALL_RANK=1}과 같은 식으로 랭킹 정보가 map 타입으로 들어가 있음
		이를 Map<등수,회원정보DTO>으로 재조합해서 보내줌
	*/
		Map<Integer,TmUserDTO> topPlayers = new HashMap<Integer,TmUserDTO>();
		int index = 0;
		if(list.size()>3) {
			index = 3;
		}else if(list.size()<=3) {
			index = list.size();
		}
		for(int i=0; i<index; i++) {
			int rank = Integer.parseInt(String.valueOf(list.get(i).get("ALL_RANK")));
			String id = (String)list.get(i).get("ID");
			topPlayers.put(rank, tmUserDAO.getMember(id));
		}
		return topPlayers;
	}
	
	//내 등수
	@Override
	public int myRank(String user) {
		Map map = gameDAO.gamePercent(user);
		double r = (double)map.get("myRank");
		int rank = (int)r;
		return rank;
	}
	
	//게임 해봤는지 여부
	@Override
	public int haveEverPlayed(String user) {
		int check = gameDAO.haveEverPlayed(user);
		return check;
	}
	
	
}
