package kr.or.ddit.notice.controller;

import javax.inject.Inject;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.accept.vo.AcceptMemberVO;
import kr.or.ddit.accept.vo.AcceptMemberVOWrapper;
import kr.or.ddit.notice.service.NoticeService;
import kr.or.ddit.notice.vo.NoticeVO;

@Controller
public class NoticeDeleteController {
	
	@Inject
	private NoticeService service;

	

	@RequestMapping(value="notice/noticeDelete",method=RequestMethod.POST)
	public String delNotice(
			@RequestParam("noticeCode") String[] noticeCode,
			
			@AuthenticationPrincipal AcceptMemberVOWrapper wrapper,
			RedirectAttributes redirectAttributes
			){		
				AcceptMemberVO authMember = wrapper.getAdaptee();
				String result = null;
		 		NoticeVO noticeInfo = new NoticeVO();
		 		noticeInfo.setMemId(authMember.getMemId());
		 		noticeInfo.setNoticeCodes(noticeCode);
		 		result  =  service.removeNotice(noticeCode, noticeInfo);
		 		
				String viewName = null;
				String message = null;
				switch (result) {
				case "OK":
					viewName = "redirect:/notice/noticeList";
					redirectAttributes.addFlashAttribute("deleteSuccess", "deleteSuccess");
					break;
				default:
					viewName = "redirect:/notice/detail/"+noticeCode;
					message = "서버 오류";
					break;
				}
				redirectAttributes.addFlashAttribute("message", message);
				return  viewName;
		
			}	
	
}
