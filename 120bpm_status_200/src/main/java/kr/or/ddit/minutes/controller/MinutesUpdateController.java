package kr.or.ddit.minutes.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MinutesUpdateController {

	@RequestMapping(value="/project/1234/1234/minutesForm")
	public String MenuUpdateForm() {
		return "minutes/minutesForm";
	}
	
}
