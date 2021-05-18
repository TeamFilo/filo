package portfolio.controller.bean;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import portfolio.service.bean.GameService;
import travelMaker.model.dto.TmUserDTO;
import travelMaker.service.bean.MemberService;

@Controller
public class MainController {
	
	@Autowired
	private MemberService memService = null;
	
	@Autowired
	private GameService gameService = null;
	
	@RequestMapping("index.fl")
	public String index() {
		return "pf/index";
	}
	
	//로그인
	@RequestMapping("login.fl")
	public String login() {
		return "pf/member/login";
	}
	
	@RequestMapping("loginPro.fl")
	public String loginPro(TmUserDTO dto, Model model, String auto) {
		//id, pw 확인
		int result = memService.idPwCheck(dto);
		//자동 로그인 시 쿠키 처리
		memService.addCookie(dto,auto);
		//뷰에 로그인 결과 넘겨주기 
		model.addAttribute("result",result);
		return "pf/member/loginPro";
		/* return "redirect:index.fl"; */
	}
	
	//로그아웃
	@RequestMapping("logout.fl")
	public String logout(TmUserDTO dto, String auto) {
		//세션 지워주기 
		memService.removeSession("memId");
		//자동 로그인 했다면 쿠키 지워 주기 
		memService.removeCookie(dto, auto);
		
		return "redirect:index.fl";
	}
	
	//회원가입
	@RequestMapping("join.fl")
	public String join() {
		return "pf/member/join";
	}
	
	@RequestMapping("joinPro.fl")
	public String joinPro(TmUserDTO dto) {
		memService.addMember(dto);
		gameService.addWallet(dto.getId());
		return "pf/member/joinPro";
	}
	
}