package kr.or.ddit.welcome;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {

	//웰컴페이지
	@RequestMapping("/")
	public String boardList(
			) {
		return "/index";
	}
	
	//로그인페이지
	@RequestMapping("/login/loginCheck")
	public String loginForm() {
		return "login/loginForm";
	}  
	
	//회원가입 페이지
	@RequestMapping("/join/enterJoin")
	public String joinForm() {
		return "/member/joinStep1";
	}
}
