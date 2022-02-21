package kr.or.ddit.template.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TmplatRetrieveController {

	@RequestMapping(value="/project/1234/templateList")
	public String templateListView() {
		return "template/templateList";
	}
	@RequestMapping(value="/project/1234/a001/templateDetail")
	public String templateDetailView() {
		return "template/templateDetail";
	}
}
