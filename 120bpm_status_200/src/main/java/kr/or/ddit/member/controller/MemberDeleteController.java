package kr.or.ddit.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MemberDeleteController {
	@RequestMapping(value="/member/memberDelete.do", method=RequestMethod.POST)
	public String memberDelete() {
		return "member/entireMemberList";
	}

}
