package kr.or.ddit.accept.controller;

import java.util.List;
import java.util.Set;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import kr.or.ddit.accept.dao.AcceptDao;
import kr.or.ddit.accept.service.AcceptMemberService;
import kr.or.ddit.accept.vo.AcceptMemPagingVO;
import kr.or.ddit.accept.vo.AcceptMemSearchVO;
import kr.or.ddit.accept.vo.AcceptMemberVO;
import kr.or.ddit.makeProject.vo.MakeProjectVO;

@Controller
@RequestMapping("/admin/mem")
public class AcceptMemberRetirieveController {

	@Inject
	private AcceptMemberService service;
	
	@Inject
	private AcceptDao dao;
	
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String listForm(
				Model model
			) {
		model.addAttribute("menu", "memList");
		return "accept/AcceptUserList";
	}
	
	
	@RequestMapping(value = "list", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public AcceptMemPagingVO<AcceptMemberVO> memberList(
				@RequestParam(value = "page", required = false, defaultValue = "1") int currentPage,
				@ModelAttribute("simpleSearch") AcceptMemSearchVO simpleSearch
			){
		
		AcceptMemPagingVO<AcceptMemberVO> paging = new AcceptMemPagingVO<>(10, 3);
		paging.setCurrentPage(currentPage);
		paging.setSimpleSearch(simpleSearch);
		
		service.retrieveMemList(paging);
		
		return paging;
	}
	
	@RequestMapping(value = "detail/{memId}")
	public String memberDetail(
				@PathVariable String memId,
				Model model
			) {
		AcceptMemberVO memVO = service.retrieveMember(memId);
		List<MakeProjectVO> memProject = service.memProjectInfo(memId);
		
		model.addAttribute("memVO", memVO);
		model.addAttribute("projectList", memProject);
		
		return "find/AcceptMemView"; 
		
	}
	
	@RequestMapping(value = "detail/prtForm/{memId}")
	public String projectFormMemDetail(
				@PathVariable String memId,
				Model model
			) {
		AcceptMemberVO memVO = service.retrieveMember(memId);
//		List<MakeProjectVO> memProject = service.memProjectInfo(memId);
		List<MakeProjectVO> memProject = dao.memPrtList(memId);
		
		model.addAttribute("memVO", memVO);
		model.addAttribute("projectList", memProject);
		
		return "find/FormMemDetail";
	}
	
	@RequestMapping(value = "notaccept")
	public String notAceeptList(
				Model model
			) {
		model.addAttribute("menu", "notAccept");
		return "accept/acceptUser";
	}
	
	@RequestMapping(value = "notaccept", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public AcceptMemPagingVO<AcceptMemberVO> notAcceptList(
				@RequestParam(value = "page", required = false, defaultValue = "1") int currentPage,
				@ModelAttribute("simpleSearch") AcceptMemSearchVO simpleSearch
			){
		AcceptMemPagingVO<AcceptMemberVO> paging = new AcceptMemPagingVO<>(10, 3);
		paging.setCurrentPage(currentPage);
		paging.setSimpleSearch(simpleSearch);
		
		service.retrieveNotAcceptList(paging);
		
		return paging;
	}
	
	
	
	
}
