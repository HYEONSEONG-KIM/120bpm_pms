package kr.or.ddit.accept.controller;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.enumtype.ServiceResult;

@Controller
@RequestMapping("/accept")
public class FindMemberController {

	@RequestMapping(value = "findId/{name}/{mail}", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ServiceResult findId(
			@PathVariable("name") String name,
			@PathVariable("mail") String mail
			) {
		ServiceResult result = null;
		
		return result;
	}
	
	@RequestMapping(value = "findPass/{id}/{mail}", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ServiceResult findPass(
			@PathVariable("id") String id,
			@PathVariable("mail") String mail
			) {	
		ServiceResult result = null;
		
		return result;
	}
}
