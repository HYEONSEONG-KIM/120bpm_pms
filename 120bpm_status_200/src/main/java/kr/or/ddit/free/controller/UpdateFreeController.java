package kr.or.ddit.free.controller;

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
import kr.or.ddit.free.service.FreeBoardService;
import kr.or.ddit.free.vo.FreeBoardVO;
import kr.or.ddit.validate.groups.UpdateGroup;

@Controller
@RequestMapping(value="/project/{pCode}/freeboard/update/{boNo}")
public class UpdateFreeController {

	@Inject
	private FreeBoardService service;
	
	@ModelAttribute("command")
	public String addCommand() {
		return "UPDATE";
	}
	
	private void addAttribute(Model model) {
		model.addAttribute("command", "UPDATE");
	}
	

	
	@GetMapping
	public String updateForm(
			@PathVariable int boNo,
			@ModelAttribute("freeBoard") FreeBoardVO freeBoardInfo,
			Model model
	) {
		addAttribute(model);
		freeBoardInfo = service.retriveBoard(boNo);
		model.addAttribute("freeBoard", freeBoardInfo);
		return "freeboard/freeUpdate";
	}

	@ModelAttribute("freeBoard")
	public FreeBoardVO Free() {
		return new FreeBoardVO();
	}
	

	@PostMapping
	@ResponseBody
	public String freeBoardUpdate(@Validated(UpdateGroup.class) 
			@ModelAttribute("freeBoard") FreeBoardVO freeBoardInfo,
			Errors errors, @AuthenticationPrincipal AcceptMemberVOWrapper acceptWraper,
			Model model) {
		
		addAttribute(model);
		AcceptMemberVO authMember = acceptWraper.getAdaptee();
		String viewName = null;
		if (!errors.hasErrors()) {
			freeBoardInfo.setMemId(authMember.getMemId());
			ServiceResult result = service.modifyBoard(freeBoardInfo);
			switch (result) {
			case OK:
				viewName = "OK";
				break;
			default:
				viewName = "freeboard/freeUpdate";
				break;
			}
		} else {
			viewName = "FAIL";
		}

		 
		return viewName;
	}
	
	

}
		
