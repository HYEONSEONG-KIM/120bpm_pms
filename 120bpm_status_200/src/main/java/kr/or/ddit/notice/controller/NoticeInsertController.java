package kr.or.ddit.notice.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.enumtype.ServiceResult;
import kr.or.ddit.notice.service.NoticeService;
import kr.or.ddit.notice.vo.NoticeVO;
import kr.or.ddit.validate.groups.InsertGroup;

@Controller
@RequestMapping("/notice/create")
public class NoticeInsertController {

	@Inject
	private NoticeService service;
	
	@GetMapping
	public String insertNotice(
		@ModelAttribute("notice") NoticeVO notice,
		Model model
		) {
	model.addAttribute("notice", notice);
	return  "notice/noticeForm";
	}

	
	@ModelAttribute("command")
	public String addCommand() {
		return "INSERT";
	}
	
	@PostMapping
	@ResponseBody
	public String noticeInsert(
			@Validated (InsertGroup.class) NoticeVO noticeInfo ,
			BindingResult errors
			){
		String viewName = null;
		if (!errors.hasErrors()) {
			ServiceResult result = service.createNotice(noticeInfo);
			switch (result) {
			case OK:
				viewName = "OK";
				break;
			default:
				viewName = "FAIL";
				break;
			}
		} else {
			viewName = "notice/noticeForm";
		}		
		return viewName;
		
		
		
	}
	 
	
}
	
