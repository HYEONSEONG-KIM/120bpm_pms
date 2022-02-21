package kr.or.ddit.activity.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.activity.service.GraphService;
import kr.or.ddit.main.vo.MyIssueVO;
import kr.or.ddit.mypage.vo.MyWorkVO;

@Controller
public class ProjectGraphController {
	
	@Inject
	GraphService service;
	
	@RequestMapping("/project/{pCode}/activity/graph")
	public String prjctGraphPage(
			@PathVariable int pCode,
			Model model
			) {
		MyWorkVO work = service.retrieveWorkPrgsCounts(pCode); 
		model.addAttribute("work", work); 
		List<String> arrayList = service.retrieveDayInsertWork(pCode); 
		model.addAttribute("arrayList", arrayList); 
		List<String> memArrList = service.retrieveMemSttsWork(pCode);
		model.addAttribute("memArrList", memArrList);
		MyIssueVO issue = service.retrieveIssueCount(pCode);
		model.addAttribute("issue", issue); 
		List<String> issueList = service.retrieveIssueAvgCounts(pCode);
		model.addAttribute("issueList", issueList); 
		return "activity/graph";
	}
}
