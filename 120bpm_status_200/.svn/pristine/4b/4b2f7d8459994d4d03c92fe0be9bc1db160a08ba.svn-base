package kr.or.ddit.makeProject.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.accept.vo.AcceptMemSearchVO;
import kr.or.ddit.accept.vo.ProjectMemVO;
import kr.or.ddit.listener.customevent.PushMsgCustomEvent;
import kr.or.ddit.makeProject.dao.MakeProjectDAO;
import kr.or.ddit.makeProject.service.MakeProjectService;
import kr.or.ddit.makeProject.vo.MakeProjectPagingVO;
import kr.or.ddit.makeProject.vo.MakeProjectSearchVO;
import kr.or.ddit.makeProject.vo.MakeProjectVO;

@Controller
@RequestMapping("admin/project")
public class RetrieveProjectController {

	@Inject
	private MakeProjectService service;
	
	@Inject
	private MakeProjectDAO dao;

	@RequestMapping("list")
	public String listForm(
			Model model
			) {
		model.addAttribute("menu", "projectManage");
		return "adminProject/projectList";
	}
	
	@RequestMapping(value = "list", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public MakeProjectPagingVO<MakeProjectVO> proejctList(
				String checkDate,
				@RequestParam(value = "page", required = false, defaultValue = "1") int currentPage,
				@ModelAttribute("simpleSearch") MakeProjectSearchVO simpleSearch
			){
		MakeProjectPagingVO<MakeProjectVO> paging = new MakeProjectPagingVO<>(8, 5);
		paging.setCheckDate(checkDate);
		paging.setCurrentPage(currentPage);
		paging.setSimpleSearch(simpleSearch);
		service.retrieveProjectList(paging);
		
		return paging;
	}
	
	@RequestMapping(value = "/detail/{prtId}")
	public String projectDetail(
				@PathVariable int prtId,
				Model model
			) {
		List<String> menuCode = new ArrayList<String>();
		menuCode.add("'일감'");
		menuCode.add("'뉴스'");
		menuCode.add("'자유게시판'");
		menuCode.add("'위키'");
		menuCode.add("'이슈'");
		List<Integer> menuCnt = service.projectMenuCnt(prtId);
		
		MakeProjectVO prt= dao.selectProject(prtId);
		List<ProjectMemVO> prtMem = dao.selectPrtMem(prtId);
		List<MakeProjectVO> childPrtList = service.childProjectList(prtId);
		
		
		model.addAttribute("prt", prt);
		model.addAttribute("prtMemList", prtMem);
		model.addAttribute("menu", menuCode);
		model.addAttribute("menuCnt", menuCnt);
		model.addAttribute("childList", childPrtList);
		
		
		return "find/projectView";
	}
}
