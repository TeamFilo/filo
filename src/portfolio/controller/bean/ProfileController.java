package portfolio.controller.bean;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/profile/")
public class ProfileController {
	//팀프로필
	@RequestMapping("team.fl")
	public String home() {
		return "/pf/profile/team";
	}
	//개인 프로필 lsm
	@RequestMapping("lsm.fl")
	public String lsm() {
		return "/pf/profile/lsm";
	}
	//개인 프로필 jbr
	@RequestMapping("jbr.fl")
	public String jbr() {
		return "/pf/profile/jbr";
	}

	//개인 프로필 lsh
	@RequestMapping("lsh.fl")
	public String lsh() {
		return "/pf/profile/lsh";
	}

	//개인 프로필 hys
	@RequestMapping("hys.fl")
	public String hys() {
		return "/pf/profile/hys";
	}
	
}