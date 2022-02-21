package kr.or.ddit.template.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TmplatInsertController {
	
	@RequestMapping(value="/project/1234/template" )
	public String templateForm() {
		return "template/templateForm";
	}
	
}
