package portfolio.controller.bean;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/project/")
public class MyprojectController {
	
	@RequestMapping("tmEx.fl")
	public String home() {
		return "/pf/myproject/tmEx";
	}
	
}
