package kr.or.ddit.demand.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RetrieveDemandController {

	@RequestMapping("/demand/demandList")
	public String demandList() {
		return "demand/demandList";
	}
			
	@RequestMapping("/demand/demandDetail")
	public String demandDetail() {
		return "demand/demandDetail";
	}
	
	
}
