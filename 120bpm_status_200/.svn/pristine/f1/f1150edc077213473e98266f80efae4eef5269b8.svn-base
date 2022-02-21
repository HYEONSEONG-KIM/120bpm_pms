package kr.or.ddit.main.controller;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.accept.vo.AcceptMemberVO;
import kr.or.ddit.accept.vo.AcceptMemberVOWrapper;
import kr.or.ddit.main.service.MyProjectsService;
import kr.or.ddit.makeProject.service.MakeProjectService;
import kr.or.ddit.makeProject.vo.MakeProjectPagingVO;
import kr.or.ddit.makeProject.vo.MakeProjectSearchVO;
import kr.or.ddit.makeProject.vo.MakeProjectVO;

@Controller
public class MyProjectsController {
	
	@Inject
	private MyProjectsService service;
	
	@RequestMapping("/main/projects")
	public String myProjects(
			Model model
			) {
		model.addAttribute("menu", "projects");
		return "main/projects";
	} 
	
	@RequestMapping(value="/main/projects", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public MakeProjectPagingVO<MakeProjectVO> projectList(
			String checkDate,
			@AuthenticationPrincipal AcceptMemberVOWrapper wrapper,
			@RequestParam(value = "page", required = false, defaultValue = "1") int currentPage,
			@ModelAttribute("simpleSearch") MakeProjectSearchVO simpleSearch
			){
		AcceptMemberVO authMember = wrapper.getAdaptee();
		MakeProjectPagingVO<MakeProjectVO> paging = new MakeProjectPagingVO<>(5, 5);
		paging.setMemId(authMember.getMemId());  
		paging.setCheckDate(checkDate); 
		paging.setCurrentPage(currentPage);
		paging.setSimpleSearch(simpleSearch);
		service.retrieveProjectList(paging);
		
		return paging;
	}
}
