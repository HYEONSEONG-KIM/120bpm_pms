package kr.or.ddit.projectSetting.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.apache.commons.lang3.StringUtils;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.accept.vo.AcceptMemPagingVO;
import kr.or.ddit.accept.vo.AcceptMemberVO;
import kr.or.ddit.accept.vo.ProjectMemVO;
import kr.or.ddit.enumtype.ServiceResult;
import kr.or.ddit.makeProject.service.MakeProjectService;
import kr.or.ddit.makeProject.vo.MakeProjectVO;
import kr.or.ddit.project.vo.ProjectVO;
import kr.or.ddit.projectSetting.dao.ProjectUpdateDAO;
import kr.or.ddit.projectSetting.service.ProjectUpdateService;
import kr.or.ddit.security.vo.AuthorityVO;
import oracle.net.aso.p;

@Controller
@RequestMapping("project")
public class ProjectUpdateController {

	@Inject
	private ProjectUpdateDAO dao;
	
	@Inject
	private MakeProjectService makePrtservice;
	
	@Inject
	private ProjectUpdateService service;
	
	@Inject
	private MakeProjectService makeService;
	
	@RequestMapping(value = "{prtId}/modify")
	public String basicInfoFomr(
				@PathVariable int prtId,
				Model model
			) {

		MakeProjectVO project = dao.selectProject(prtId);
		List<ProjectVO> projectList = makePrtservice.projectList();
		
		
		model.addAttribute("prtList", projectList);		
		model.addAttribute("project", project);
		model.addAttribute("menu", "modify");
		
		return "projectSetting/projectInfoUpdate";
		
	}
	
	@RequestMapping(value = "{prtId}/modify",produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ServiceResult basicInfoUpdate(
				@PathVariable int prtId,
				@ModelAttribute("prtVO") MakeProjectVO prtVO
				
			) {
		prtVO.setPrjctNo(prtId);
		ServiceResult result = service.modifyProject(prtVO);
		
		return result;
		
	}
	
	@RequestMapping("{prtId}/modify/mem")
	public String prtMemModifyForm(
				@PathVariable int prtId,
				Model model
			) {
		List<ProjectMemVO> prtMemList = dao.projectMemList(prtId);
		List<AuthorityVO> roleList = dao.selectAllRole();
		
		List<String> memList = new ArrayList<String>();
		List<Integer> activityAvg = new ArrayList<>();
		
		service.prtMemActivityAvg(memList, activityAvg, prtId);
		
		model.addAttribute("memList", memList);
		model.addAttribute("activityAvg", activityAvg);

		AcceptMemPagingVO<AcceptMemberVO> paging = new AcceptMemPagingVO<>(16,5);
		paging.setPrtId(prtId);
		paging.setCurrentPage(1);
		makeService.memList(paging);
		
		
		model.addAttribute("prtMemList", prtMemList);
		model.addAttribute("roleList", roleList);
		model.addAttribute("paging", paging);
		
		model.addAttribute("menu", "mem");
		
		System.out.println("activityAvg : " + activityAvg);
		
		return "projectSetting/projectMemUpdate";
	}
	
	@RequestMapping(value = "{prtId}/modify/mem", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public AcceptMemPagingVO<AcceptMemberVO> memList(
			@PathVariable int prtId,
				@RequestParam(value = "page", required = false, defaultValue = "1") int currentPage,
				String detailWord
			){
		AcceptMemPagingVO<AcceptMemberVO> paging = new AcceptMemPagingVO<>(16,5);
		paging.setCurrentPage(currentPage);
		paging.setPrtId(prtId);
		if(detailWord != null && StringUtils.isNoneBlank(detailWord))
			paging.setDetailWord(detailWord);
		makeService.memList(paging);
		
		return paging;
	}
	
	@RequestMapping(value = "{prtId}/modify/addMem", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ServiceResult createPrtMem(
				@PathVariable int prtId,
				@ModelAttribute("prtMem") ProjectMemVO prtMem
			) {
		prtMem.setPrjctNo(prtId);
		ServiceResult result = service.addProjectMem(prtMem);
		
		return result;
	}
	
	@RequestMapping(value = "{prtId}/modify/delMem/{memId}", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ServiceResult deletePrtMem(
				@PathVariable int prtId,
				@PathVariable String memId
				
			) {
		ProjectMemVO prtMem = new ProjectMemVO();
		
		
		prtMem.setMemId(memId);
		prtMem.setPrjctNo(prtId);
		System.out.println("preVO : " + prtMem);
		ServiceResult result = service.removePrtMem(prtMem);
		
		return result;
	}
	
	@RequestMapping(value = "{prtId}/modify/mem/role", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ServiceResult updateMemRole(
				@PathVariable int prtId,
				@ModelAttribute("prtMem") ProjectMemVO prtMem
			) {
		System.out.println(prtMem);
		prtMem.setPrjctNo(prtId);
		ServiceResult result = service.modifyMemRole(prtMem);
		System.out.println(result);
		return result;
	}
}














