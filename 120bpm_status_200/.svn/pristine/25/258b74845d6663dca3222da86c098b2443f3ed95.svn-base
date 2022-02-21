package kr.or.ddit.free.controller;

import javax.inject.Inject;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.accept.vo.AcceptMemberVO;
import kr.or.ddit.accept.vo.AcceptMemberVOWrapper;
import kr.or.ddit.enumtype.ServiceResult;
import kr.or.ddit.free.service.FreeBoardService;
import kr.or.ddit.free.vo.FreeBoardVO;

@Controller
public class DeleteFreeController {
	@Inject
	private FreeBoardService service;

	

	@RequestMapping(value="/project/{pCode}/freeboard/remove/{boNo}",method=RequestMethod.POST)
	public String delFreeBoard(
			@PathVariable(name="pCode")String pCode,
			@RequestParam("boNo") Integer boNo,
			
			@AuthenticationPrincipal AcceptMemberVOWrapper wrapper,
			RedirectAttributes redirectAttributes
			){		
				AcceptMemberVO authMember = wrapper.getAdaptee();
				ServiceResult result = null;
		 		FreeBoardVO freeBoardInfo = new FreeBoardVO();
		 		freeBoardInfo.setMemId(authMember.getMemId());
		 		freeBoardInfo.setBoNo(boNo);
		 		result  =  service.removeBoard(boNo, freeBoardInfo);
		 		
				String viewName = null;
				String message = null;
				switch (result) {
				case OK:
					viewName = "redirect:/project/{pCode}/freeboard/list";
					redirectAttributes.addFlashAttribute("deleteSuccess", "deleteSuccess");
					break;
				default:
					viewName = "redirect:/project/{pCode}/freeboard/detail/{boNo}";
					message = "서버 오류";
					break;
				}
				redirectAttributes.addFlashAttribute("message", message);
				return  viewName;
		
			}	
	
}