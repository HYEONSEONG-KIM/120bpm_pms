package kr.or.ddit.makeProject.controller;

import java.util.List;

import javax.inject.Inject;
import javax.validation.Valid;

import org.apache.commons.lang3.StringUtils;
import org.springframework.http.MediaType;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.accept.vo.AcceptMemPagingVO;
import kr.or.ddit.accept.vo.AcceptMemberVO;
import kr.or.ddit.accept.vo.AcceptMemberVOWrapper;
import kr.or.ddit.accept.vo.ProjectMemVO;
import kr.or.ddit.enumtype.ServiceResult;
import kr.or.ddit.makeProject.service.MakeProjectService;
import kr.or.ddit.makeProject.vo.MakeProjectVO;
import kr.or.ddit.project.vo.ProjectVO;
import kr.or.ddit.pushMsg.vo.PushMsgVO;
import kr.or.ddit.validate.groups.InsertGroup;

@Controller
@RequestMapping("admin/project")
public class MakeProdjectController {
	
	@Inject
	private MakeProjectService service;
	

	
	@RequestMapping("create")
	public String proejctForm(
				Model model
			) {
		List<ProjectVO> projectList = service.projectList();
		AcceptMemPagingVO<AcceptMemberVO> paging = new AcceptMemPagingVO<>(16,5);
		paging.setCurrentPage(1);
		service.memList(paging);
		
		model.addAttribute("prtList", projectList);
		model.addAttribute("paging", paging);
		model.addAttribute("menu", "projectManage");
		
		return "adminProject/projectForm";
	}
	
	@RequestMapping(value = "create", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public AcceptMemPagingVO<AcceptMemberVO> memList(
				@RequestParam(value = "page", required = false, defaultValue = "1") int currentPage,
				String detailWord
			){
		AcceptMemPagingVO<AcceptMemberVO> paging = new AcceptMemPagingVO<>(16,5);
		paging.setCurrentPage(currentPage);
		if(detailWord != null && StringUtils.isNoneBlank(detailWord))
			paging.setDetailWord(detailWord);
		service.memList(paging);
		
		return paging;
	}
	
	@RequestMapping(value = "create", method = RequestMethod.POST)
	public String makeProject(
				boolean upperPrtMem,
				@Validated(InsertGroup.class) @ModelAttribute("projectVO") MakeProjectVO projectVO,
				Errors errors,
				RedirectAttributes redirectAttributes
			) {
		String goPage = null;
		String message = null;
		ServiceResult result = null;
		
		if(!errors.hasErrors()) {
			result = service.createProject(projectVO, upperPrtMem);
			if(result == ServiceResult.OK) {
				goPage = "redirect:/admin/project/list";
			}else {
				goPage = "redirect:/admin/project/create";
				message = "프로젝트 생성 실패";
			}
		}else {
			message = "ERROR";
			goPage = "redirect:/admin/project/create";
		}
		redirectAttributes.addFlashAttribute("message", message);
		
		return goPage;
	}
	
}
