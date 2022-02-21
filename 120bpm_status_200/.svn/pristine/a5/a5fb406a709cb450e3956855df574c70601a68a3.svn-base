package kr.or.ddit.main.controller;

import java.util.Map;

import javax.inject.Inject;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.accept.vo.AcceptMemberVO;
import kr.or.ddit.accept.vo.AcceptMemberVOWrapper;
import kr.or.ddit.main.service.UserService;
import kr.or.ddit.main.vo.MyPrjctMemVO;

@Controller
public class UserController {

	@Inject
	UserService service;
	
	@RequestMapping("/project/{pCode}/user/{userId}")
	public String userDetail(
			@PathVariable String userId,
			@PathVariable int pCode,
			@AuthenticationPrincipal AcceptMemberVOWrapper wrapper,
			Model model
			) {
		AcceptMemberVO authMember = wrapper.getAdaptee();
		MyPrjctMemVO mem = new MyPrjctMemVO();
		mem.setMemId(authMember.getMemId());
		mem.setMngrAt(authMember.getMngrAt()); 
		mem.setPrjctNo(pCode);
		mem.setUserId(userId);
		Map<String, Object> infoMap = service.retrieveMemInfo(mem); 
		model.addAttribute("infoMap", infoMap);
		return "user/userDetail";
	}
}
