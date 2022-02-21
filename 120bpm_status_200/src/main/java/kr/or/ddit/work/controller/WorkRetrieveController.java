package kr.or.ddit.work.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.MediaType;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.accept.vo.AcceptMemberVO;
import kr.or.ddit.accept.vo.AcceptMemberVOWrapper;
import kr.or.ddit.accept.vo.ProjectMemVO;
import kr.or.ddit.enumtype.ServiceResult;
import kr.or.ddit.member.service.MailService;
import kr.or.ddit.work.dao.WorkDAO;
import kr.or.ddit.work.service.WorkService;
import kr.or.ddit.work.vo.CommonVO;
import kr.or.ddit.work.vo.ExtendPagingVO;
import kr.or.ddit.work.vo.ExtendSearchVO;
import kr.or.ddit.work.vo.WCartegoryVO;
import kr.or.ddit.work.vo.WorkAuthVO;
import kr.or.ddit.work.vo.WorkParentVO;
import kr.or.ddit.work.vo.WorkVO;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class WorkRetrieveController {
	
	@Inject
	private WorkService service;
	
	@Inject
	private WorkDAO dao;
	
	@ModelAttribute("command")
	public String workList() {
		return "WORKLIST";
	}
 
	@Inject
    private MailService mailService;
 
	
	@Inject
	private PasswordEncoder passwordEncoder;
	
	
	@Value("${email.sendId}")
	String id;
	
/*	@ModelAttribute("pCode")
	public String projectCode(@PathVariable(name="pCode" ,required=true)String pCode ) {
		return pCode;
	}*/
	
	@ModelAttribute("priortList")
	public List<CommonVO> priortList(@PathVariable(name="pCode")String pCode){
		List<CommonVO> commonsLists = dao.selectCommonCode("W002");
		List<CommonVO> list = new ArrayList<>();
			for(CommonVO vo : commonsLists) {
				   if(! "완료".equals((vo.getCodeNm())) ) {
					   list.add(vo);
				   } 
			}
			return list;
			
	}
	
	
	@RequestMapping(value="/project/{pCode}/workList")
	public String workListView(@PathVariable(name="pCode" ,required=true)String pCode , 
			@RequestParam(value="page", required=false, defaultValue="1") int currentPage,
			@ModelAttribute("simpleSearch") ExtendSearchVO simpleSearch,
			Model model , @AuthenticationPrincipal AcceptMemberVOWrapper wrapper
			
			) {
		ExtendPagingVO<WorkVO> pagingVO = new ExtendPagingVO<>();
		 WorkVO workVO = new WorkVO();
		workVO.setPrjctNo(pCode);
		pagingVO.setWorkVO(workVO); 
		pagingVO.setCurrentPage(currentPage);
		pagingVO.setSimpleSearch(simpleSearch);
		
		List<WCartegoryVO> cartegoryList = dao.selectCartegory(Integer.parseInt(pCode));
		 
		AcceptMemberVO authMember = wrapper.getAdaptee();
		List<ProjectMemVO> list = authMember.getProjectMemRole();
		WorkAuthVO authVO = new WorkAuthVO();
		authVO.setPrjctNo(pCode);
		authVO.setMemId(authMember.getMemId());
		for(ProjectMemVO vo :list) {
			String pno = vo.getPrjctNo() +"";
			if(pno.equals(pCode)) {
				authVO.setAuthor(vo.getAuthor());
			}
		}
		 
		int totalRecord = service.retriveWorkCount(pagingVO);
		pagingVO.setTotalRecord(totalRecord);
		service.retriveWorkList(pagingVO);
		model.addAttribute("pagingVO", pagingVO);
		model.addAttribute("cartegoryList", cartegoryList);
		model.addAttribute("authVO" ,authVO );
		return "work/workList";
	}
	
	@RequestMapping(value="/project/{pCode}/work/create/workSearch")
	public String workSearchView(@PathVariable(name="pCode" ,required=true)String pCode , 
			@RequestParam(value="page", required=false, defaultValue="1") int currentPage,
			@ModelAttribute("simpleSearch") ExtendSearchVO simpleSearch,
			Model model , @AuthenticationPrincipal AcceptMemberVOWrapper wrapper
			
			) {
		ExtendPagingVO<WorkVO> pagingVO = new ExtendPagingVO<>(5 , 5);
		WorkVO workVO = new WorkVO();
		workVO.setPrjctNo(pCode);
		pagingVO.setWorkVO(workVO); 
		pagingVO.setCurrentPage(currentPage);
		pagingVO.setSimpleSearch(simpleSearch);
		
		List<WCartegoryVO> cartegoryList = dao.selectCartegory(Integer.parseInt(pCode));
		
		AcceptMemberVO authMember = wrapper.getAdaptee();
		List<ProjectMemVO> list = authMember.getProjectMemRole();
		WorkAuthVO authVO = new WorkAuthVO();
		authVO.setPrjctNo(pCode);
		authVO.setMemId(authMember.getMemId());
		for(ProjectMemVO vo :list) {
			String pno = vo.getPrjctNo() +"";
			if(pno.equals(pCode)) {
				authVO.setAuthor(vo.getAuthor());
			}
		}
		
		int totalRecord = service.retriveWorkCount(pagingVO);
		pagingVO.setTotalRecord(totalRecord);
		service.retriveWorkList(pagingVO);
		model.addAttribute("pagingVO", pagingVO);
		model.addAttribute("cartegoryList", cartegoryList);
		model.addAttribute("authVO" ,authVO );
		return "/work/workSearch";
	}
	
	
		
 
	@RequestMapping(value="/project/{pCode}/workList/workListJson" ,method=RequestMethod.POST ,produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ExtendPagingVO<WorkVO> workList(
			@PathVariable(name="pCode")String pCode,
			@RequestParam(value="page", required=false, defaultValue="1") int currentPage,
			@ModelAttribute(value="simpleSearch") ExtendSearchVO simpleSearch 
			//,Model model
			){
		
		ExtendPagingVO<WorkVO> pagingVO =  new ExtendPagingVO<>();
		WorkVO workVO = new WorkVO();
		workVO.setPrjctNo(pCode);
		pagingVO.setWorkVO(workVO); 
		pagingVO.setCurrentPage(currentPage);
		pagingVO.setSimpleSearch(simpleSearch);
		
		int totalRecord =  service.retriveWorkCount(pagingVO);
		pagingVO.setTotalRecord(totalRecord);
		 
		service.retriveWorkList(pagingVO);
		return pagingVO; //여기서 data 를 리턴
	}
	
	
	@RequestMapping(value="/project/{pCode}/workDetail/{workCode}")
	public String workDetailView(@PathVariable(name="pCode")String pCode
			, @PathVariable(name="workCode")String workCode,
			@AuthenticationPrincipal AcceptMemberVOWrapper wrapper ,
			RedirectAttributes redirectAttributes,
			Model model
			) {
		
		String viewName = null;
		String message = null;
		AcceptMemberVO authMember = wrapper.getAdaptee();
		WorkVO workVO = new WorkVO();
		List<ProjectMemVO> list = authMember.getProjectMemRole();
		WorkAuthVO authVO = new WorkAuthVO();
		
		authVO.setPrjctNo(pCode);
		authVO.setMemId(authMember.getMemId());
		for(ProjectMemVO vo :list) {
			String pno = vo.getPrjctNo() +"";
			if(pno.equals(pCode)) {
				authVO.setAuthor(vo.getAuthor());
			}
		}
		
		
		model.addAttribute("authVO" ,authVO );
		workVO.setPrjctNo(pCode);
		workVO.setWorkCode(workCode);
		workVO.setMemId(authMember.getMemId());
		Map<String, Object> result = service.retrieveWorkDetail(workVO);
		
		if("SUCCESS".equals(result.get("result")) ) {
				WorkVO work= (WorkVO) result.get("work");
				if("1".equals(work.getWorkOthbcAt())) {
					model.addAttribute("work", work);
					 viewName = "work/workDetail";
				}else {
					if(work.getMemId().equals(authMember.getMemId()) || "ROLE_PM".equals(authVO.getAuthor()) ) {
						model.addAttribute("work", work);
					 viewName = "work/workDetail";
					}else {
					viewName = "redirect:/project/"+ pCode +"/workList";
					message = "해당 일감은 비공개일감입니다.";
					
					}
				}
		}else {
			message = "해당 일감을 조회할 수 없습니다";
		}
		redirectAttributes.addFlashAttribute("message", message);
		
		return viewName;
	}
	
 	@RequestMapping(value="/project/{pCode}/work/create/search"  ,method=RequestMethod.GET )
	public String workSearch(@PathVariable(name="pCode")String pCode
			, @PathVariable(name="workCode")String workCode,
			@AuthenticationPrincipal AcceptMemberVOWrapper wrapper ,
			RedirectAttributes redirectAttributes,
			Model model) {
 		
		String viewName = "work/workSearch";
		return viewName;
		
	} 
	
	
	
	
	//////검색일감 폼
	@RequestMapping(value="/project/{pCode}/work/create/search/{workCode}"  ,method=RequestMethod.POST ,produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public WorkVO workSearchDetailView(@PathVariable(name="pCode")String pCode
			, @PathVariable(name="workCode")String workCode,
			@AuthenticationPrincipal AcceptMemberVOWrapper wrapper ,
			RedirectAttributes redirectAttributes,
			Model model
			) {
		String message = null;
		AcceptMemberVO authMember = wrapper.getAdaptee();
		WorkVO workVO = new WorkVO();
		List<ProjectMemVO> list = authMember.getProjectMemRole();
		WorkAuthVO authVO = new WorkAuthVO();
		authVO.setPrjctNo(pCode);
		authVO.setMemId(authMember.getMemId());
		for(ProjectMemVO vo :list) {
			String pno = vo.getPrjctNo() +"";
			if(pno.equals(pCode)) {
				authVO.setAuthor(vo.getAuthor());
			}
		}
	
		model.addAttribute("authVO" ,authVO );
		workVO.setPrjctNo(pCode);
		workVO.setWorkCode(workCode);
		workVO.setMemId(authMember.getMemId());
		Map<String, Object> result = service.retrieveWorkDetail(workVO);
		if("SUCCESS".equals(result.get("result")) ) {
			WorkVO work= (WorkVO) result.get("work");
			if("1".equals(work.getWorkOthbcAt())) {
				 return work;
			}else {
				if(work.getMemId().equals(authMember.getMemId()) || "ROLE_PM".equals(authVO.getAuthor()) ) {
					 return work;
				}else {
					message = "해당 일감은 비공개일감입니다.";
					return null ;
				}
			}
	}else {
				message = "해당 일감을 조회할 수 없습니다";
				return null ;
		}
	}
	
	
	@RequestMapping(value="/project/{pCode}/work/workDetail/parentList" ,method=RequestMethod.POST ,produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public List<WorkParentVO>  selectParentWork(
			@PathVariable(name="pCode")String pCode
			,@RequestParam("workCode") String workCode
			){
		WorkVO workVO = new WorkVO();
		workVO.setPrjctNo(pCode);
		workVO.setWorkCode(workCode);
		List<WorkParentVO> list = service.retrieveWorkParent(workVO);
		//System.out.println("리스트" + list);
		return list;
		
	}
	
	@RequestMapping(value="/project/{pCode}/work/modify/updateDegree",method=RequestMethod.POST ,produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ServiceResult updateDegree(
			@PathVariable(name="pCode")String pCode,
			@ModelAttribute WorkVO workVO , 
			@AuthenticationPrincipal AcceptMemberVOWrapper wrapper
 			){
		 workVO.setPrjctNo(pCode);
		 AcceptMemberVO authMember = wrapper.getAdaptee();
		 workVO.setMemId(authMember.getMemId());	
		 ServiceResult result =	service.updateDegree(workVO);
		 
		 return result;
		 
	}
	
	 
	@RequestMapping(value="/project/{pCode}/work/create/accountCheck",method=RequestMethod.POST ,produces="text/plan;charset=utf-8")
	@ResponseBody
	public String accountCheck(
			@PathVariable(name="pCode")String pCode,
			@RequestParam("memPass") String memPass,
			@RequestParam("memId") String memId,
			@RequestParam("workCode") String workCode,
			@AuthenticationPrincipal AcceptMemberVOWrapper wrapper
			){
		
		AcceptMemberVO authMember = wrapper.getAdaptee();
		String result = null;
		List<ProjectMemVO> list = authMember.getProjectMemRole();
		WorkAuthVO authVO = new WorkAuthVO();
		authVO.setPrjctNo(pCode);
		authVO.setMemId(authMember.getMemId());
		String myRole = "";
	
		if(passwordEncoder.matches(memPass, authMember.getMemPass())) {
			WorkVO vo = service.retrieveSimpleWorkInfo(workCode);
			for(ProjectMemVO pMem :list) {
				String pno = pMem.getPrjctNo() +"";
				if(pno.equals(pCode)) {
					myRole = pMem.getAuthor();
				}
			}
			if(vo.getMemId().equals(authMember.getMemId()) || "ROLE_PM".equals(myRole)) {
					result = "OK";
			}else {
				result="NOTWRITER";
			}
			///////////////////////////////////////////////////
		}else {   
			result = "FAIL";
		}
		
		 
		
		return result;
		 
	}
	 
	 
	@RequestMapping(value="/project/{pCode}/work/create/accountCheckAll",method=RequestMethod.POST ,produces="text/plan;charset=utf-8")
	@ResponseBody
	public String accountCheckAll(
			@PathVariable(name="pCode")String pCode,
			@RequestParam("memPass") String memPass,
			@RequestParam("workCode") String[] workCode,
			@AuthenticationPrincipal AcceptMemberVOWrapper wrapper ,
			@RequestParam("memName") String memName,
			@RequestParam("choice") String choice
			){
		
		AcceptMemberVO authMember = wrapper.getAdaptee();
		String result = null;
		//System.out.println(workCode);
	    System.out.println(choice);
		 		WorkVO vo = new WorkVO();
		 		vo.setPrjctNo(pCode);
		 		vo.setMemId(authMember.getMemId());
		  if(passwordEncoder.matches(memPass, authMember.getMemPass())) {
				 if("req".equals(choice)) {
					 result  = service.checkWorkId(workCode , vo ,memName);
				 }else if("del".equals(choice)){
					 result  =  service.deleteAllWork(workCode, vo);
				 }
			    
		  }else {
			  result = "FAIL";
		  }
			
		return result;
		
	}
	
	
	@RequestMapping(value="/project/{pCode}/work/modify/updateReq",method=RequestMethod.POST , produces="text/plan;charset=utf-8")
	@ResponseBody
	public String accountCheck(
			@PathVariable(name="pCode")String pCode,
			@RequestParam("memName") String memName,
			@RequestParam("workSj") String workSj,
			@RequestParam("workCode") String workCode
			){
		WorkVO	workVO = new WorkVO();
		workVO.setWorkCode(workCode);
		workVO.setWorkReqSttusCode("W00301");
		workVO.setPrjctNo(pCode);
		String result = "SENDFAIL";
		ServiceResult req = 	service.updateReqStatus(workVO);
		if(req ==  ServiceResult.OK) {
			 result = "SEND"; 
		} 
		
		/*String result = "SENDFAIL";
		if(req ==  ServiceResult.OK) {
			WorkAuthVO vo = service.retriveProjectPM(workVO);
			String to = vo.getMemEmail();
			String  subject = memName +"님이 일감 승인을 요청했습니다";
			String text = memName + "님이 " + "일감코드가"  + workCode+"인 '" 
					+ workSj + "' 의 일감을 승인 요청했습니다";
			 boolean cnt = 	mailService.send(subject, text, id, to);
			//log.info("결과 확인" + result);
			 
			 if (cnt == true) {
				 result = "SEND"; 
			   }
		}else {
			result = "UDATEFAIL";
		}*/
		
		return result;
		
	}
	
	
	
	
}
