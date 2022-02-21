package kr.or.ddit.notice.controller;

import javax.inject.Inject;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.accept.vo.AcceptMemberVO;
import kr.or.ddit.accept.vo.AcceptMemberVOWrapper;
import kr.or.ddit.enumtype.ServiceResult;
import kr.or.ddit.notice.service.NoticeService;
import kr.or.ddit.notice.vo.NoticeVO;
import kr.or.ddit.validate.groups.UpdateGroup;

@Controller
@RequestMapping(value="/notice/update/{noticeCode}")
public class NoticeUpdateController {
	@Inject
	private NoticeService service;
	
	@ModelAttribute("command")
	public String addCommand() {
		return "UPDATE";
	}
	
	private void addAttribute(Model model) {
		model.addAttribute("command", "UPDATE");
	}
	
	@GetMapping
	public String updateForm(
			@PathVariable int noticeCode,
			Model model
	) {
		addAttribute(model);
		NoticeVO notice = service.retriveNotice(noticeCode);
		model.addAttribute("notice", notice);
		return "notice/noticeUpdate";
	}

	@ModelAttribute("notice")
	public NoticeVO notice() {
		return new NoticeVO();
	}
 
	@PostMapping
	@ResponseBody
	public String noticeUpdate(@Validated(UpdateGroup.class) 
			@ModelAttribute("notice") NoticeVO noticeInfo,
			Errors errors, @AuthenticationPrincipal AcceptMemberVOWrapper acceptWraper,
			Model model) {
		
		addAttribute(model);
		AcceptMemberVO authMember = acceptWraper.getAdaptee();
		String viewName = null;
		if (!errors.hasErrors()) {
			noticeInfo.setMemId(authMember.getMemId());
			ServiceResult result = service.updateNotice(noticeInfo);
			switch (result) {
			case OK:
				viewName = "OK";
				break;
			default:
				viewName = "notice/noticeUpdate";
				break;
			}
		} else {
			viewName = "FAIL";
		}
		return viewName;
	}
		
	
}

