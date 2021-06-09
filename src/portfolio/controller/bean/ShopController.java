package portfolio.controller.bean;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;

import portfolio.model.dto.GrGiJoinDTO;
import portfolio.model.dto.IconDTO;
import portfolio.service.bean.GameService;
import portfolio.service.bean.ShopService;
import travelMaker.model.dto.TmUserDTO;
import travelMaker.service.bean.MemberService;

@Controller
@RequestMapping("/game/shop/")
public class ShopController {
	
	@Autowired
	private MemberService memService = null;
	@Autowired
	private GameService gameService = null;
	@Autowired
	private ShopService shopService = null;
	

	//아이템샵 홈
	@RequestMapping("purchase.fl")
	public String purchase(Model model) {
		
		List<IconDTO> getIcon = shopService.getIcon();
		model.addAttribute("getIcon", getIcon);
		String user = (String)RequestContextHolder.getRequestAttributes().getAttribute("memId", RequestAttributes.SCOPE_SESSION);
		
		if(user!=null) {
			String nowIdColor = memService.getMember(user).getIdColor();
			String nowSkin = memService.getMember(user).getIdSkin();
			model.addAttribute("nowIdColor",nowIdColor);
			model.addAttribute("nowSkin",nowSkin);
			
		//	left_game 부분
			model.addAttribute("userInfo",memService.getMember(user));  //tmUserDTO로가져옴
			model.addAttribute("wal",gameService.getWallet(user)); 
			//오늘 한 게임
			List<GrGiJoinDTO> todayRecords = gameService.todayRecords(user); //조인시킴
			if(!todayRecords.isEmpty()) {
				model.addAttribute("todayRecords",todayRecords);
			}
			
			//오늘 룰렛, 복권 횟수
			model.addAttribute("lotteryCnt", gameService.getWallet(user).getLotteryCnt());
			model.addAttribute("rouletteCnt", gameService.getWallet(user).getRouletteCnt());
			
			int playCnt = gameService.haveEverPlayed(user);
			if(playCnt>0) {
				//내 등수
				model.addAttribute("myRank", gameService.myRank(user));
				//퍼센트
				double gamePercent = gameService.gamePercent(user);	
				model.addAttribute("gamePercent", gamePercent);
			}
		}
		
		//랭킹 탑3 정보
		Map<Integer,TmUserDTO> top3 = gameService.topThree();
		model.addAttribute("top3",top3);
	//	left_game 부분 끝
		
		return "/pf/shop/purchase";
	}
	
	/*
	//색깔 구매
	@RequestMapping("purchaseColor.fl") 
	public String purchaseColor(Model model) {
		String id = (String)RequestContextHolder.getRequestAttributes().getAttribute("memId", RequestAttributes.SCOPE_SESSION);
		
		if(id!=null) {
			String nowColor = memService.getMember(id).getIdColor();
			model.addAttribute("nowColor",nowColor);
		}
		
		return "/pf/shop/purchaseColor";
	}
	
	//아이콘 구매
	@RequestMapping("purchaseIcon.fl") 
	public String purchaseIcon(Model model) {
		List<IconDTO> getIcon = shopService.getIcon();
		
		for(int i=0; i<getIcon.size(); i++) {
			System.out.println("이름목록"+getIcon.get(i).getName());
		}
		
		model.addAttribute("getIcon", getIcon);
		return "/pf/shop/purchaseIcon";
	}
	
	//스킨 구매
	@RequestMapping("purchaseSkin.fl") 
	public String purchaseSkin(Model model) {
		String id = (String)RequestContextHolder.getRequestAttributes().getAttribute("memId", RequestAttributes.SCOPE_SESSION);
		
		if(id!=null) {
			String nowColor = memService.getMember(id).getIdSkin();
			model.addAttribute("nowColor",nowColor);
		}
		
		return "/pf/shop/purchaseSkin";
	}
	
	 색깔변경pro
	@RequestMapping("purchaseColorPro.fl")
	public String purchaseColorPro(String color) {
		String id = (String)RequestContextHolder.getRequestAttributes().getAttribute("memId", RequestAttributes.SCOPE_SESSION);

		// 보유 포인트
		int userPoint = gameService.getWallet(id).getPoint();
		
		// 구매 포인트
		int purPoint= -20;
		
		// 보유포인트와 비교를 위한 절대값 변환 
		int pp = Math.abs(purPoint);
		
		// 보유 포인트가 구매포인트보다 클경우에만 업데이트 
		if(userPoint >= pp) {
			//기존 memColor삭제
			memService.removeSession("memColor");
			
			//새로운 color 세션에 저장
			RequestContextHolder.getRequestAttributes().setAttribute("memColor", color, RequestAttributes.SCOPE_SESSION);
			
			// tmuser에 컬러 업데이트
			String memColor = "memColor";
			memService.purchaseUpdate(memColor, color);
			
			// 포인트 차감
			gameService.updatePoint(id, purPoint);
		}
		
		return "/pf/shop/purchaseColorPro";
	}
	
	/*아이콘변경pro
	@RequestMapping("purchaseIconPro.fl")
	public String purchaseIconPro(String icon, Model model) {
		
		String id = (String)RequestContextHolder.getRequestAttributes().getAttribute("memId", RequestAttributes.SCOPE_SESSION);
		
		// 보유포인트 확인
		int userPoint = gameService.getWallet(id).getPoint();
		
		int purPoint = 0;
		List<IconDTO> getIcon = shopService.getIcon();
		for(int i=0; i<getIcon.size(); i++) {
			if(getIcon.get(i).getName().equals(icon)) {
				System.out.println("글자" + getIcon.get(i).getName()+"포인트"+ getIcon.get(i).getNeedPoint());
				purPoint = getIcon.get(i).getNeedPoint();
			}
		}
		
		// 보유포인트와 비교를 위한 절대값 변환 
		int pp = Math.abs(purPoint);
		
		// 보유 포인트가 구매포인트보다 클경우에만 업데이트 
		if(userPoint >= pp) {
			//기존 memIcon삭제
			memService.removeSession("memIcon");
			//세션에 저장
			RequestContextHolder.getRequestAttributes().setAttribute("memIcon", icon, RequestAttributes.SCOPE_SESSION);
			
			// tmuser에 아이콘 업데이트
			String memIcon = "memIcon";
			memService.purchaseUpdate(memIcon, icon);
			
			// 포인트 차감
			gameService.updatePoint(id, purPoint);
		}
		
		model.addAttribute("icon", icon);
		
		return "/pf/shop/purchaseIconPro";
	}
	
	
	//스킨변경pro
	@RequestMapping("purchaseSkinPro.fl")
	public String purchaseSkinPro(String skin) {
		String id = (String)RequestContextHolder.getRequestAttributes().getAttribute("memId", RequestAttributes.SCOPE_SESSION);
		
		// 사용자 정보 포인트 가져옴
		int userPoint = gameService.getWallet(id).getPoint();
		
		// 구매 포인트
		int purPoint= -20;
		System.out.println("purPoint" + purPoint);
		
		// 보유포인트와 비교를 위한 절대값 변환 
		int pp = Math.abs(purPoint);
		System.out.println("pp" + pp);
		System.out.println("유저포인트" + userPoint);
		
		// 보유 포인트가 구매포인트보다 클경우에만 업데이트 
		if(userPoint >= pp) {
			//기존 memSkin삭제
			memService.removeSession("memSkin");
			RequestContextHolder.getRequestAttributes().setAttribute("memSkin", skin, RequestAttributes.SCOPE_SESSION);
			
			// tmuser에 스킨 업데이트
			String memSkin = "memSkin";
			memService.purchaseUpdate(memSkin, skin);
			
			// 포인트 차감
			gameService.updatePoint(id, purPoint);
		}
	
		return "/pf/shop/purchaseSkinPro";
	}
	*/
	
	// 샵에서 아이템 구입시 포인트 확인하기위한 ajax
	@ResponseBody
	@RequestMapping("shopPointCh.fl")
	public Map shopPointCh(@RequestBody Map<String, Integer> map) {
		String user = (String)RequestContextHolder.getRequestAttributes().getAttribute("memId", RequestAttributes.SCOPE_SESSION);
		
		int needPoint =  map.get("purchaseShop");
		
		//String item = (String)map.get("usingItem");
		//String result = (String)map.get("usingResult");
		
		System.out.println("니드포인트"+needPoint);
		map.put("needPoint",needPoint);
		
		if(user!=null) {
			int userPoint = gameService.getWallet(user).getPoint();
			
			//사용중인 아이템인지 확인
			//int res = shopService.usingItemCh(user, item, result);
			
			map.put("userPoint",userPoint);
			map.put("loginCheck",1);
			//map.put("usingCh",res);
			
		}else {
			map.put("userPoint",-100);
			map.put("loginCheck",0);
		}
		
		return map;
	}
	
	/*
	@ResponseBody
	@RequestMapping("usingItemCh.fl")
	public int usingItemCh(@RequestBody Map<String, String> map) {
		System.out.println("유징아이템체크오냐");
		String user = (String)RequestContextHolder.getRequestAttributes().getAttribute("memId", RequestAttributes.SCOPE_SESSION);
		String item = map.get("usingItem");
		String result = map.get("usingResult");
		
		int res = shopService.usingItemCh(user, item, result);
		System.out.println("유징아템컨트롤res값" + res);
		
		return res;
	}
	*/
	
	@RequestMapping("colorTest.fl")
	public String colorTest() {
		return "/pf/shop/purchaseColorPicker";
	}
	
	//아이템샵 구매Pro
	@RequestMapping("purchasePro.fl")
	public String purchase(String item, String result, int price,Model model) {
		String id = (String)RequestContextHolder.getRequestAttributes().getAttribute("memId", RequestAttributes.SCOPE_SESSION);
		
		// 보유포인트 확인
		int userPoint = gameService.getWallet(id).getPoint();
	//	System.out.println("보유포인트확인" + userPoint);
	//	System.out.println("item:"+item+"/result:"+result+"/price:"+price);
		
		//사용중인 아이템인지 확인 
		int res = shopService.usingItemCh(id, item, result);
		
	//	System.out.println("콘트롤res"+res);
		// 보유 포인트가 구매포인트보다 클경우에만 업데이트 
		if(userPoint >= price) {
			if(res == 0) {
				if(item.equals("icon")) {
				//	System.out.println("아이콘일경우");
					//기존 memIcon삭제
					memService.removeSession("memIcon");
					//세션에 저장
					RequestContextHolder.getRequestAttributes().setAttribute("memIcon", result, RequestAttributes.SCOPE_SESSION);
					// tmuser에 아이콘 업데이트
					String memIcon = "memIcon";
					memService.purchaseUpdate(memIcon, result);
					// 포인트 차감
					gameService.updatePoint(id, -price); 
					
				}else if(item.equals("idColor")) {
					
				//	System.out.println("아이디컬러일경우");
					//기존 memColor삭제
					memService.removeSession("memColor");
					//새로운 color 세션에 저장
					RequestContextHolder.getRequestAttributes().setAttribute("memColor", result, RequestAttributes.SCOPE_SESSION);
					// tmuser에 컬러 업데이트
					String memColor = "memColor";
					memService.purchaseUpdate(memColor, result);
					// 포인트 차감
					gameService.updatePoint(id, -price);
					
				}else if(item.equals("skin")) {
				//	System.out.println("스킨일 경우");
					//기존 memSkin삭제
					memService.removeSession("memSkin");
					RequestContextHolder.getRequestAttributes().setAttribute("memSkin", result, RequestAttributes.SCOPE_SESSION);
					// tmuser에 스킨 업데이트
					String memSkin = "memSkin";
					memService.purchaseUpdate(memSkin, result);
					// 포인트 차감
					gameService.updatePoint(id, -price);
				}
			}//res==0  선택한 아이템을 안가지고있을때
		}else {
			System.out.println("포인트 모자라서 안탔음");
		}
		
		//model.addAttribute("icon", icon);
		model.addAttribute("resCh",res);
		
		return "/pf/shop/purchasePro";
	}
	
	
	/*
	@RequestMapping("test.fl")
	public String test(Model model) {
		
		List<IconDTO> getIcon = shopService.getIcon();
		model.addAttribute("getIcon", getIcon);
		String user = (String)RequestContextHolder.getRequestAttributes().getAttribute("memId", RequestAttributes.SCOPE_SESSION);
		
		if(user!=null) {
			String nowIdColor = memService.getMember(user).getIdColor();
			String nowSkin = memService.getMember(user).getIdSkin();
			model.addAttribute("nowIdColor",nowIdColor);
			model.addAttribute("nowSkin",nowSkin);
			
		//	left_game 부분
			model.addAttribute("userInfo",memService.getMember(user));  //tmUserDTO로가져옴
			model.addAttribute("wal",gameService.getWallet(user)); 
			//오늘 한 게임
			List<GrGiJoinDTO> todayRecords = gameService.todayRecords(user); //조인시킴
			if(!todayRecords.isEmpty()) {
				model.addAttribute("todayRecords",todayRecords);
			}
			
			//오늘 룰렛, 복권 횟수
			model.addAttribute("lotteryCnt", gameService.getWallet(user).getLotteryCnt());
			model.addAttribute("rouletteCnt", gameService.getWallet(user).getRouletteCnt());
			
			int playCnt = gameService.haveEverPlayed(user);
			if(playCnt>0) {
				//내 등수
				model.addAttribute("myRank", gameService.myRank(user));
				//퍼센트
				double gamePercent = gameService.gamePercent(user);	
				model.addAttribute("gamePercent", gamePercent);
			}
		}
		
		//랭킹 탑3 정보
		Map<Integer,TmUserDTO> top3 = gameService.topThree();
		model.addAttribute("top3",top3);
	//	left_game 부분 끝
		
		
		return "/pf/shop/test";
	}
	
	@RequestMapping("testPro.fl")
	public String testPro() {
		
		
		return "/pf/shop/testPro";
	}
	*/

}
