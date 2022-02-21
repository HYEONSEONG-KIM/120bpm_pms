package kr.or.ddit.demand.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DeleteDemandController {
	@RequestMapping("/demand/demandDelete")
	public String demandDelete() {
		return "";
	}
}
