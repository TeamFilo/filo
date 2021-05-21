package portfolio.controller.bean;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
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
	
	
	//색깔 구매
	@RequestMapping("purchaseColor.fl") 
	public String purchaseColor() {
		
		return "/pf/shop/purchaseColor";
	}
	
	//아이콘 구매
	@RequestMapping("purchaseIcon.fl") 
	public String purchaseIcon() {
		
		return "/pf/shop/purchaseIcon";
	}
	
	//스킨 구매
	@RequestMapping("purchaseSkin.fl") 
	public String purchaseSkin() {
		
		return "/pf/shop/purchaseSkin";
	}
	
	//색깔변경pro
	@RequestMapping("purchaseColorPro.fl")
	public String purchasePro(String color) {
		memService.removeSession("memColor");
		RequestContextHolder.getRequestAttributes().setAttribute("memColor", color, RequestAttributes.SCOPE_SESSION);
	
		String memColor = "memColor";
		memService.purchaseUpdate(memColor, color);
		
		// 구매시 포인트 차감
		String id = (String)RequestContextHolder.getRequestAttributes().getAttribute("memId", RequestAttributes.SCOPE_SESSION);
		gameService.updatePoint(id, -5);
		
		return "/pf/shop/purchaseColorPro";
	}
	
	//아이콘변경pro
	@RequestMapping("purchaseIconPro.fl")
	public String purchaseIconPro(String icon) {
		memService.removeSession("memIcon");
		RequestContextHolder.getRequestAttributes().setAttribute("memIcon", icon, RequestAttributes.SCOPE_SESSION);
		
		String memIcon = "memIcon";
		memService.purchaseUpdate(memIcon, icon);
		
		// 구매시 포인트 차감
		String id = (String)RequestContextHolder.getRequestAttributes().getAttribute("memId", RequestAttributes.SCOPE_SESSION);
		gameService.updatePoint(id, -5);
		
		return "/pf/shop/purchaseIconPro";
	}
	
	//스킨변경pro
	@RequestMapping("purchaseSkinPro.fl")
	public String purchaseSkinPro(String skin) {
		memService.removeSession("memSkin");
		RequestContextHolder.getRequestAttributes().setAttribute("memSkin", skin, RequestAttributes.SCOPE_SESSION);
		
		
		String memSkin = "memSkin";
		memService.purchaseUpdate(memSkin, skin);
		
		// 구매시 포인트 차감
		String id = (String)RequestContextHolder.getRequestAttributes().getAttribute("memId", RequestAttributes.SCOPE_SESSION);
		gameService.updatePoint(id, -5);
		
		
		return "/pf/shop/purchaseSkinPro";
	}
	
}
