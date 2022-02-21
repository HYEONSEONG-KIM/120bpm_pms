package kr.or.ddit.projectSetting.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.accept.vo.ProjectMemVO;
import kr.or.ddit.projectSetting.dao.ProjectUpdateDAO;
import kr.or.ddit.projectSetting.service.ProjectUpdateService;

@Controller
@RequestMapping("project/{prtId}")
public class ProjectMemDetailContoller {

	@Inject
	private ProjectUpdateDAO dao;
	
	@Inject
	private ProjectUpdateService service;

	@RequestMapping(value = "modify/memDetail/{memId}")
	public String prtMemDetail(
				@PathVariable String memId,
				@PathVariable int prtId,
				Model model
			) {
		ProjectMemVO prtVO = new ProjectMemVO();
		prtVO.setMemId(memId);
		prtVO.setPrjctNo(prtId);
		
		ProjectMemVO memDetail = dao.prtMemDetail(prtVO);
		
		List<Integer> boardCnt = service.prtMemBoardCnt(prtVO);
		
		int workAvg = service.workAvgPrgs(prtVO);
		
		model.addAttribute("memDetail", memDetail);
		model.addAttribute("boardCnt", boardCnt);
		model.addAttribute("workAvg", workAvg);
		
		return "find/prtMemDetail";
	}
}
