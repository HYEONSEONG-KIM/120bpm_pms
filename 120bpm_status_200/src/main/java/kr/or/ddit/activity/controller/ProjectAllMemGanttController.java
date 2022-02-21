package kr.or.ddit.activity.controller;

import java.text.ParseException;
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
import kr.or.ddit.activity.service.GanttService;
import kr.or.ddit.activity.vo.CmmnCodeDetailVO;
import kr.or.ddit.main.service.MainService;
import kr.or.ddit.main.vo.MyPrjctMemVO;
import kr.or.ddit.mypage.vo.MyWorkVO;
import net.minidev.json.JSONArray;
  
@Controller
public class ProjectAllMemGanttController {
//	일감 리스트 불러오기
//  카테고리,상태,우선순위별,담당자별 셀렉트 검색
//  기간별 검색
	
	
	
	@Inject
	GanttService ganttService;
	
	@Inject
	MainService mainService;
	
	@RequestMapping(value="/project/{pCode}/activity/gantt")
	public String projectAllMemGantt(
			@PathVariable int pCode,
			@AuthenticationPrincipal AcceptMemberVOWrapper wrapper,
			Model model
			) {
		AcceptMemberVO authMember = wrapper.getAdaptee();
		List<MyWorkVO> ctgryList = mainService.retrieveMyWorkCtgrys(pCode);
		List<CmmnCodeDetailVO> sttsList = ganttService.retrieveWorkStatus();
		List<CmmnCodeDetailVO> priortList = ganttService.retrieveWorkPriort();
		MyPrjctMemVO mem = new MyPrjctMemVO();
		mem.setMemId(authMember.getMemId());
		mem.setPrjctNo(pCode); 
		List<MyPrjctMemVO> prjctMemList = ganttService.retrievePrjctMems(mem);
		model.addAttribute("ctgryList", ctgryList);
		model.addAttribute("sttsList", sttsList); 
		model.addAttribute("priortList", priortList);  
		model.addAttribute("prjctMemList", prjctMemList);   
		return "activity/gantt";
	}
	
	@RequestMapping(value="/project/{pCode}/activity/gantt", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public JSONArray projectAllMemGanttAjax( 
			@PathVariable int pCode,
			@AuthenticationPrincipal AcceptMemberVOWrapper wrapper,
			@ModelAttribute("detailSearch") MyWorkVO detailSearch
			) throws ParseException { 
		AcceptMemberVO authMember = wrapper.getAdaptee();
		MyWorkVO wo = new MyWorkVO();
		wo.setMemId(authMember.getMemId());
		wo.setPrjctNo(pCode); 
		wo.setDetailSearch(detailSearch); 
		System.out.println(detailSearch); 
		JSONArray ganttArr = ganttService.retrievePrjctWorkInfoList(wo);
		
		return ganttArr;
	}

	
	
}
