package kr.or.ddit.calendar.controller;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


import kr.or.ddit.calendar.service.CalendarService;
import net.minidev.json.JSONArray;

@Controller
public class ProjectCalendarController {
 
	@Inject
	CalendarService service;
	
	@RequestMapping("/project/{pCode}/calendar")
	public String projectCalendar(
			@PathVariable int pCode
			) {
		return "calendar/calendar"; 
	}
	
	
	@RequestMapping(value="/project/{pCode}/calendar", method=RequestMethod.POST, produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody 
	public JSONArray projectCalendarAjax(
			@PathVariable int pCode
			) { 
		JSONArray arr = service.retrievePrjctWorkList(pCode);
		return arr; 
	}
}
