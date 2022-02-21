package kr.or.ddit.accept.controller;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.accept.vo.AcceptMemberVO;
import kr.or.ddit.accept.vo.AcceptMemberVOWrapper;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class LoginSuccess {

	@RequestMapping("/test")
	public String loginSuccess(
//			@AuthenticationPrincipal AcceptMemberVOWrapper wrapper
			) {
		/*AcceptMemberVO memVO = wrapper.getAdaptee();
		log.info("memVO : {}", memVO);*/
		
		return "test";
	}
}
