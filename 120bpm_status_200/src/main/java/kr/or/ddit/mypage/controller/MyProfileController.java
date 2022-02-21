package kr.or.ddit.mypage.controller;

import java.util.List;

import javax.inject.Inject;
import javax.xml.ws.WebServiceContext;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.accept.vo.AcceptMemberVO;
import kr.or.ddit.accept.vo.AcceptMemberVOWrapper;
import kr.or.ddit.enumtype.ServiceResult;
import kr.or.ddit.mypage.service.MyAccountService;
import kr.or.ddit.mypage.vo.MemSetVO;
import kr.or.ddit.mypage.vo.MyMemVO;

@Controller
public class MyProfileController { 
	
	@Inject
	private MyAccountService service;
	
	@Inject
	private WebApplicationContext context;
	 
	//마이페이지 프로필 설정 페이지
	@RequestMapping(value="/mypage/profileSetting")
	public String settingProfile(
			@AuthenticationPrincipal AcceptMemberVOWrapper wrapper,
			Model model
			) {
		AcceptMemberVO authMember = wrapper.getAdaptee();
		List<MemSetVO> memSetList = service.retrieveMyProfileSet(authMember.getMemId());
		model.addAttribute("mem", authMember);   
		model.addAttribute("memSetList", memSetList);   
		model.addAttribute("menu", "profileSetting");  
		return "mypage/profile";  
	}
	 
	//마이페이지 프로필 설정 변경
	@RequestMapping(value="/mypage/profileSetting", method=RequestMethod.POST)
	public String ModifyProfile(
			@ModelAttribute MyMemVO mem,
			@AuthenticationPrincipal AcceptMemberVOWrapper wrapper,
			Model model,
			RedirectAttributes redirectAttributes
			) { 
		AcceptMemberVO authMember = wrapper.getAdaptee();
		mem.setMemId(authMember.getMemId()); 
		String viewName = "redirect:/mypage/profileSetting"; 
		String message = null;    
		ServiceResult result = service.modifyMyProfileSet(mem);
		
		String path = context.getServletContext().getRealPath("/");
		
		switch(result) {   
		case OK:
			if(mem.getProfileImg()!=null && !mem.getProfileImg().isEmpty()) {
				authMember.setProflImgNm(mem.getProflImgNm());  
			}
			message = "SUCCESS"; 
			break;   
		default:     
			message = "FAIL"; 
			break;
		}   
	
		if(message!=null)   
			redirectAttributes.addAttribute("profileUpdateMessage", message);
		
		return viewName;
	}
}
