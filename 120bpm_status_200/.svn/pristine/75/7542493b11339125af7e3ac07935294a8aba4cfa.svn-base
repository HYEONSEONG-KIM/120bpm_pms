package kr.or.ddit.projectReport.controller;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.accept.vo.AcceptMemberVO;
import kr.or.ddit.accept.vo.AcceptMemberVOWrapper;
import kr.or.ddit.accept.vo.ProjectMemVO;
import kr.or.ddit.activity.service.GanttService;
import kr.or.ddit.activity.service.GraphService;
import kr.or.ddit.activity.vo.CmmnCodeDetailVO;
import kr.or.ddit.main.service.MainService;
import kr.or.ddit.main.vo.MyIssueVO;
import kr.or.ddit.main.vo.MyPrjctMemVO;
import kr.or.ddit.makeProject.dao.MakeProjectDAO;
import kr.or.ddit.makeProject.service.MakeProjectService;
import kr.or.ddit.makeProject.vo.MakeProjectVO;
import kr.or.ddit.mypage.vo.MyWorkVO;
import kr.or.ddit.projectReport.service.ProjectReportService;
import kr.or.ddit.projectReport.vo.WorkPriorityVO;
import kr.or.ddit.projectSetting.vo.WorkCategoryVO;
import net.minidev.json.JSONArray;

@Controller
@RequestMapping("projectRep")
public class ProjectReportController {

	@Inject
	private MakeProjectService makePrtService;
	
	@Inject
	private MakeProjectDAO dao;
	
	@Inject
	private ProjectReportService service;
	
	@Inject
	private GraphService grathService;
	
	@Inject
	private GanttService ganttService;
	
	@Inject
	private MainService mainService;
	
	@RequestMapping(value = "info/{prtId}")
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
		List<Integer> menuCnt = makePrtService.projectMenuCnt(prtId);
		
		MakeProjectVO prt= dao.selectProject(prtId);
		
		List<ProjectMemVO> prtMem = dao.endPrtMemList(prtId);
		
		
		model.addAttribute("prt", prt);
		model.addAttribute("prtMemList", prtMem);
		model.addAttribute("menu", menuCode);
		model.addAttribute("menuCnt", menuCnt);
		
		
		return "find/projectReport_Info";
	}
	
	
	@RequestMapping("work/{prtId}")
	public String projectWork(
				@PathVariable int prtId,
				Model model
			) {
		
		MyWorkVO work = grathService.retrieveWorkPrgsCounts(prtId); 
		model.addAttribute("work", work); 
		MyIssueVO issue = grathService.retrieveIssueCount(prtId);
		model.addAttribute("issue", issue); 
		
		List<WorkCategoryVO> categoryList = service.prtCategoryReport(prtId);
		
		model.addAttribute("CategoryList", categoryList);
		
		return "find/projectReport_work";
	}
	
	
	
	
	@RequestMapping(value="gantt/{pCode}")
	public String projectAllMemGantt(
			@PathVariable int pCode,
			@AuthenticationPrincipal AcceptMemberVOWrapper wrapper,
			Model model
			) {
//		AcceptMemberVO authMember = wrapper.getAdaptee();
		List<MyWorkVO> ctgryList = mainService.retrieveMyWorkCtgrys(pCode);
		List<CmmnCodeDetailVO> sttsList = ganttService.retrieveWorkStatus();
		List<CmmnCodeDetailVO> priortList = ganttService.retrieveWorkPriort();
//		MyPrjctMemVO mem = new MyPrjctMemVO();
//		mem.setMemId(authMember.getMemId());
//		mem.setPrjctNo(pCode); 
//		List<MyPrjctMemVO> prjctMemList = ganttService.retrievePrjctMems(mem);
		model.addAttribute("ctgryList", ctgryList);
		model.addAttribute("sttsList", sttsList); 
		model.addAttribute("priortList", priortList);  
//		model.addAttribute("prjctMemList", prjctMemList);   
		return "find/projectReport_gantt";
	}
	
	@RequestMapping(value="gantt/find/{pCode}", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public JSONArray projectAllMemGanttAjax( 
			@PathVariable int pCode,
			@AuthenticationPrincipal AcceptMemberVOWrapper wrapper,
			@ModelAttribute("detailSearch") MyWorkVO detailSearch
			) throws ParseException { 
//		AcceptMemberVO authMember = wrapper.getAdaptee();
		MyWorkVO wo = new MyWorkVO();
//		wo.setMemId(authMember.getMemId());
		wo.setPrjctNo(pCode); 
		wo.setDetailSearch(detailSearch); 
		System.out.println(detailSearch); 
		JSONArray ganttArr = ganttService.retrievePrjctWorkInfoList(wo);
		
		return ganttArr;
	}
}















