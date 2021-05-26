package portfolio.controller.bean;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;

import portfolio.service.bean.GameService;
import travelMaker.service.bean.MemberService;

@Controller
@RequestMapping("/shop/")
public class ShopController {
	
	@Autowired
	private MemberService memService = null;
	@Autowired
	private GameService gameService = null;
	
	//아이템샵 홈
	@RequestMapping("purchase.fl")
	public String purchase() {
		return "/pf/shop/purchase";
	}
	
	//색깔 구매
	@RequestMapping("purchaseColor.fl") 
	public String purchaseColor(Model model) {
		String id = (String)RequestContextHolder.getRequestAttributes().getAttribute("memId", RequestAttributes.SCOPE_SESSION);
		String nowColor = memService.getMember(id).getIdColor();
		model.addAttribute("nowColor",nowColor);
		return "/pf/shop/purchaseColor";
	}
	
	//아이콘 구매
	@RequestMapping("purchaseIcon.fl") 
	public String purchaseIcon() {
		
		return "/pf/shop/purchaseIcon";
	}
	
	//스킨 구매
	@RequestMapping("purchaseSkin.fl") 
	public String purchaseSkin(Model model) {
		String id = (String)RequestContextHolder.getRequestAttributes().getAttribute("memId", RequestAttributes.SCOPE_SESSION);
		String nowColor = memService.getMember(id).getIdSkin();
		model.addAttribute("nowColor",nowColor);
		return "/pf/shop/purchaseSkin";
	}
	
	//색깔변경pro
	@RequestMapping("purchaseColorPro.fl")
	public String purchasePro(String color) {
		memService.removeSession("memColor");
		System.out.println("선택한 색상" + color);
		RequestContextHolder.getRequestAttributes().setAttribute("memColor", color, RequestAttributes.SCOPE_SESSION);
	
		String memColor = "memColor";
		memService.purchaseUpdate(memColor, color);
		
		// 구매시 포인트 차감
		String id = (String)RequestContextHolder.getRequestAttributes().getAttribute("memId", RequestAttributes.SCOPE_SESSION);
		int userPoint = gameService.getWallet(id).getPoint();
		
		// 구매 포인트
		int purPoint= -20;
		
		// 보유포인트와 비교를 위한 절대값 변환 
		int pp = Math.abs(purPoint);
		
		// 보유 포인트가 구매포인트보다 클경우에만 업데이트 
		if(userPoint >= pp) {
			gameService.updatePoint(id, purPoint);
		}
		
		return "/pf/shop/purchaseColorPro";
	}
	
	//아이콘변경pro
	@RequestMapping("purchaseIconPro.fl")
	public String purchaseIconPro(String icon) {
		memService.removeSession("memIcon");
		RequestContextHolder.getRequestAttributes().setAttribute("memIcon", icon, RequestAttributes.SCOPE_SESSION);
		
		//구입한 아이콘 반영
		String memIcon = "memIcon";
		memService.purchaseUpdate(memIcon, icon);
		
		// 구매시 포인트 차감
		String id = (String)RequestContextHolder.getRequestAttributes().getAttribute("memId", RequestAttributes.SCOPE_SESSION);
		int userPoint = gameService.getWallet(id).getPoint();
		
		// 구매 포인트
		int purPoint= -20;
		
		// 보유포인트와 비교를 위한 절대값 변환 
		int pp = Math.abs(purPoint);
		
		// 보유 포인트가 구매포인트보다 클경우에만 업데이트 
		if(userPoint >= pp) {
			gameService.updatePoint(id, purPoint);
		}
		
		return "/pf/shop/purchaseIconPro";
	}
	
	//스킨변경pro
	@RequestMapping("purchaseSkinPro.fl")
	public String purchaseSkinPro(String skin) {
		memService.removeSession("memSkin");
		RequestContextHolder.getRequestAttributes().setAttribute("memSkin", skin, RequestAttributes.SCOPE_SESSION);
		
		//tmuser에 스킨 업데이트
		String memSkin = "memSkin";
		memService.purchaseUpdate(memSkin, skin);
		
		// 포인트 차감
		String id = (String)RequestContextHolder.getRequestAttributes().getAttribute("memId", RequestAttributes.SCOPE_SESSION);
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
			System.out.println("업데이트전");
			gameService.updatePoint(id, purPoint);
			System.out.println("업데이트후");
		}
	
		
		return "/pf/shop/purchaseSkinPro";
	}
	
	
	// 샵에서 아이템 구입시 포인트 확인하기위한 ajax
	@ResponseBody
	@RequestMapping("shopPointCh.fl")
	public Map shopPointCh(@RequestBody Map<String,Integer> map) {
		String user = (String)RequestContextHolder.getRequestAttributes().getAttribute("memId", RequestAttributes.SCOPE_SESSION);
		int needPoint = map.get("purchaseShop");
		int userPoint = gameService.getWallet(user).getPoint();
		
		/*
		if(userPoint>=needPoint) {
			System.out.println("구매 ㄱㄱ");
		}
		*/
		map.put("needPoint",needPoint);
		map.put("userPoint",userPoint);
		
		return map;
	}
	
	
	@RequestMapping("colorTest.fl")
	public String colorTest() {
		return "/pf/shop/purchaseColorPicker";
	}
	
}
