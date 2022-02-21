package kr.or.ddit.member.controller;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.member.service.MemberService;

@Controller
public class IdCheckController{

	@Inject
	private MemberService serviceMember;
	
	@RequestMapping(value="/member/idCheck", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public boolean idCheck(@RequestParam("memId") String memId) {

		boolean duplCheck = serviceMember.IdCheck(memId);
		
		return duplCheck;
	}
}
