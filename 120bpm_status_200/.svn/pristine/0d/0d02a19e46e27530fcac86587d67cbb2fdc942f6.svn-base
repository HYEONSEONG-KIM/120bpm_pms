package kr.or.ddit.project.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.member.vo.PagingVO;
import kr.or.ddit.member.vo.SearchVO;
import kr.or.ddit.project.service.ProjectService;
import kr.or.ddit.project.vo.ProjectVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class ProjectRetrieveController {

	@Inject
	private ProjectService service;
	
	@RequestMapping("admin/entireProjectList")
	public String entireList(
		 @RequestParam(value="page",required=false, defaultValue="1") int currentPage,
		 @ModelAttribute("simpleSearch") SearchVO simpleSearch, // 검색기능을 추가하려고 넣었어
			Model model
			){
		PagingVO<ProjectVO> projectPagingInfo = new PagingVO<>(5, 4);
		projectPagingInfo.setCurrentPage(currentPage);
		projectPagingInfo.setSimpleSearch(simpleSearch);
		int totalRecord = service.retrieveTotalCount(projectPagingInfo);
		projectPagingInfo.setTotalRecord(totalRecord);
		List<ProjectVO> projectList = service.retrieveProjectList(projectPagingInfo);
		projectPagingInfo.setDataList(projectList);
		model.addAttribute("projectPagingInfo", projectPagingInfo);
		return "project/entireProjectList";
	}
}
