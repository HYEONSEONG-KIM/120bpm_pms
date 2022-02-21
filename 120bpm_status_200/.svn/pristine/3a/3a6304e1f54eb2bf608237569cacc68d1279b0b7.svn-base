package kr.or.ddit.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MemberJoinController {
	
	//step1. 회원가입 인증 페이지
	@RequestMapping("/member/joinStep1")
	public String joinForm(HttpSession session) {
		//session 정보초기화
    	session.removeAttribute("joinCode");
    	session.removeAttribute("isAuthJoin");
		return "/member/enterJoin";
	}
    
	
	//step2. 약관 페이지
	@RequestMapping("/member/joinStep2")
	public String yakgwan(HttpSession session) {
		Boolean isAuthJoin = (Boolean) session.getAttribute("isAuthJoin");
		if(isAuthJoin == null || !isAuthJoin.booleanValue()) {
			return "redirect:/member/joinStep1";
		}		
		return "/member/yakgwan";		
	}
	
    // 회원가입 인증 확인
    @RequestMapping(value = "/member/checkAuth", method = RequestMethod.POST, produces = "application/json")
    @ResponseBody
    public String checkAuth(HttpSession session, @RequestParam String joinCode, Model model) {
    	String result = "fail";
    	String sessionJoinCode = (String) session.getAttribute("joinCode");
    	if(joinCode.equals(sessionJoinCode)) {
    		result = "success";
    		session.setAttribute("isAuthJoin", true);
    	}return result;
    }
    
    
}
	

