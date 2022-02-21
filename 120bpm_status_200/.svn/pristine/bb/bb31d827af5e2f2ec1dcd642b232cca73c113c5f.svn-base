package kr.or.ddit.mypage.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.accept.vo.AcceptMemberVO;
import kr.or.ddit.accept.vo.AcceptMemberVOWrapper;
import kr.or.ddit.enumtype.ServiceResult;
import kr.or.ddit.mypage.service.MyAccountService;
import kr.or.ddit.mypage.service.MypageService;
import kr.or.ddit.mypage.vo.MemSetVO;
import kr.or.ddit.mypage.vo.MyMemVO;
import kr.or.ddit.pushMsg.vo.PushMsgVO;
import kr.or.ddit.pushMsg.vo.PushPagingVO;

@Controller
public class SettingMyNoticeController {

	@Inject
	private MyAccountService service;
	
	@Inject
	private MypageService myPageService;
	
	//마이페이지 메일&푸시알림 설정 메뉴 이동
	@RequestMapping("/mypage/notification")
	public String myNotice(
			@AuthenticationPrincipal AcceptMemberVOWrapper wrapper,
			Model model 
			) {
		AcceptMemberVO authMember = wrapper.getAdaptee();
		List<MemSetVO> memSetList = service.retrieveMyPushSet(authMember.getMemId());
		model.addAttribute("mem", authMember);   
		model.addAttribute("menu", "notification");   
		model.addAttribute("memSetList", memSetList);   
		return "mypage/notification"; 
	} 
	
	@RequestMapping(value = "/mypage/notification/pushList",produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public PushPagingVO<PushMsgVO> pushList(
				@RequestParam(value = "page", required = false, defaultValue = "1") int currentPage,
				@AuthenticationPrincipal AcceptMemberVOWrapper wrapper
			){
		AcceptMemberVO auth = wrapper.getAdaptee();
		PushPagingVO<PushMsgVO> paging = new PushPagingVO<>(5, 3);
		paging.setMemId(auth.getMemId());
		paging.setCurrentPage(currentPage);
		myPageService.myPushList(paging);
		
		return paging;
	}
	
	@RequestMapping(value = "/mypage/notification/allDelPush",produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ServiceResult allDeletePush(@AuthenticationPrincipal AcceptMemberVOWrapper wrapper) {
		AcceptMemberVO auth = wrapper.getAdaptee();
		return myPageService.allRemovePush(auth.getMemId());
	}
	
	@RequestMapping(value = "/mypage/notification/oneDelPush/{pushCode}",produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ServiceResult oneDeletePush(
			@PathVariable int pushCode) {
		return myPageService.oneRemovePush(pushCode);
	}
	
	//메일&푸시알림 설정 변경
	@RequestMapping(value="/mypage/notification", method=RequestMethod.POST)
	public String UpdateMyNotice( 
			@ModelAttribute MyMemVO mem,
			@AuthenticationPrincipal AcceptMemberVOWrapper wrapper,
			RedirectAttributes redirectAttributes
		) {
		AcceptMemberVO authMember = wrapper.getAdaptee();
		mem.setMemId(authMember.getMemId()); 
		String viewName = "redirect:/mypage/notification"; 
		String message = null;    
		ServiceResult result = service.modifyMyPushSet(mem); 
		switch(result) {    
		case OK:
			message = "SUCCESS"; 
			break;   
		default:     
			message = "FAIL"; 
			break; 
		}   
	
		if(message!=null)   
			redirectAttributes.addAttribute("pushUpdateMessage", message);
		
		return viewName; 
	}
	
}
