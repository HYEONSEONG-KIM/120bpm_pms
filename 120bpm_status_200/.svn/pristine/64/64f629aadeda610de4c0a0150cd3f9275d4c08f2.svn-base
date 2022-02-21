package kr.or.ddit.main.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

import javax.inject.Inject;

import org.apache.commons.lang3.StringUtils;
import org.springframework.http.MediaType;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import kr.or.ddit.accept.vo.AcceptMemberVO;
import kr.or.ddit.accept.vo.AcceptMemberVOWrapper;
import kr.or.ddit.chatting.dao.ChattingDAO;
import kr.or.ddit.main.dao.MainDAO;
import kr.or.ddit.main.service.CustomMenuService;
import kr.or.ddit.main.service.MainService;
import kr.or.ddit.main.vo.MyBoardVO;
import kr.or.ddit.main.vo.MyPrjctMemVO;
import kr.or.ddit.main.vo.MyProjectVO;
import kr.or.ddit.makeProject.dao.MakeProjectDAO;
import kr.or.ddit.makeProject.vo.MakeProjectVO;
import kr.or.ddit.mypage.vo.MyWorkBkmkVO;
import kr.or.ddit.mypage.vo.MyWorkVO;

@Controller
@SessionAttributes(value = {"pCode", "leftMenuPrt", "chatRoom"})
public class ProjectMainController {
	
	@Inject
	private MainService mainService;
	
	@Inject
	private MainDAO mainDao;
	
	@Inject
	private ChattingDAO chatDao;
	
	@Inject
	private CustomMenuService customService; 
	
	@Inject
	private MakeProjectDAO prtDao;
	 
	@RequestMapping(value="/project/{pCode}/main")
	public String projectMain(
			@PathVariable("pCode") int prjctNo,
			Model model,
			@AuthenticationPrincipal AcceptMemberVOWrapper wrapper
			) throws ParseException {  
		AcceptMemberVO authMember = wrapper.getAdaptee();
		MyPrjctMemVO prjct = new MyPrjctMemVO();
		prjct.setMemId(authMember.getMemId());
		prjct.setMngrAt(authMember.getMngrAt()); 
		prjct.setPrjctNo(prjctNo);   
		MyProjectVO prjctVO = mainService.retrieveMyProject(prjct); 
		List<MyWorkVO> ctgryList = mainService.retrieveMyWorkCtgrys(prjctNo);
		List<MyPrjctMemVO> memList = null;
		
		String endDe = prjctVO.getPrjctEndde();
		System.out.println("endDE : " + endDe);
		boolean flag = checkEndPrt(endDe);
		
		if(flag) {
			memList = mainService.endPrtMemList(prjctNo);
		}else {
			memList = mainService.retrieveMyPrjctMems(prjct);
		}
		
		
		String chatRoom = chatDao.chatRoomNo(prjctNo);
		 
		int workAvg = mainDao.selectWorkAvg(prjctNo);
		
		model.addAttribute("prjct", prjctVO);   
		model.addAttribute("memList", memList);   
		model.addAttribute("ctgryList", ctgryList);   
		model.addAttribute("menu", "outline");     
		model.addAttribute("workAvg", workAvg);     
		
		if(StringUtils.isNotBlank(chatRoom)) {
			model.addAttribute("chatRoom", chatRoom);
		}
		if(prjctVO != null) {
			model.addAttribute("leftMenuPrt", prjctVO);     
		}else {
			MakeProjectVO adminPrjctVO= prtDao.selectProject(prjctNo);
			model.addAttribute("leftMenuPrt", adminPrjctVO);     
			
		}
		model.addAttribute("pCode", prjctNo);
		return "project/projectMain";
	} 
	
	@RequestMapping(value="/project/{pCode}/main", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody  
	public MyWorkVO ajaxWorkTracking(
			@PathVariable("pCode") int prjctNo,
			@RequestParam(value="ctgryCode", required=false) String ctgryCode
			){
		MyWorkVO workVO = new MyWorkVO();
		workVO.setPrjctNo(prjctNo); 
		if(ctgryCode!=null) { 
			workVO.setCtgryCode(ctgryCode); 
		}
		workVO = mainService.retrieveWorkCounts(workVO);
		
		return workVO; 
	}
	
	@RequestMapping(value="/project/{pCode}/main/customWork", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody   
	public List<MyWorkVO> ajaxCustomWork(
			@PathVariable("pCode") int prjctNo,
			@AuthenticationPrincipal AcceptMemberVOWrapper wrapper
			) { 
		AcceptMemberVO authMem = wrapper.getAdaptee();  
		MyWorkVO work = new MyWorkVO(); 
		work.setMemId(authMem.getMemId());
		work.setPrjctNo(prjctNo); 
		List<MyWorkVO> workList = customService.retrieveMyPrjctWorkList(work);
		
		return workList;
	}	
	
	@RequestMapping(value="/project/{pCode}/main/customWorkBkmk", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody   
	public List<MyWorkVO> ajaxCustomWorkBkmk(
			@PathVariable("pCode") int prjctNo,
			@AuthenticationPrincipal AcceptMemberVOWrapper wrapper
			) { 
		AcceptMemberVO authMem = wrapper.getAdaptee();  
		MyWorkBkmkVO bkmk = new MyWorkBkmkVO();  
		bkmk.setMemId(authMem.getMemId());
		bkmk.setPrjctNo(prjctNo);  
		List<MyWorkVO> bkmkList = customService.retrieveMyPrjctWorkBkmkList(bkmk);
		 
		return bkmkList;
	}      
   
	
	@RequestMapping(value="/project/{pCode}/main/customCurNews", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody   
	public MyBoardVO ajaxCustomCurNews(
			@PathVariable("pCode") int prjctNo
			) { 
		MyBoardVO news = customService.retrievePrjctCurNews(prjctNo);
		 
		return news;
	} 
	
	@RequestMapping(value="/project/{pCode}/main/customCurWiki", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody   
	public MyBoardVO ajaxCustomCurWiki(
			@PathVariable("pCode") int prjctNo
			) { 
		MyBoardVO wiki = customService.retrievePrjctCurWiki(prjctNo);
		
		return wiki;
	} 
	
	public boolean checkEndPrt(String endDeStr) throws ParseException {
		
		boolean flag = false;

		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Date now = new Date();
		String nowStr = format.format(now);
		Date nowTime = new Date(format.parse(nowStr).getTime());
		Date endTime = new Date(format.parse(endDeStr).getTime());
		System.out.println(nowTime);
		System.out.println(endTime);
		if(endTime.before(nowTime)) {
			flag = true;
		}
		
		return flag;
	}
}


