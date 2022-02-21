package kr.or.ddit.issue.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.accept.vo.AcceptMemberVO;
import kr.or.ddit.accept.vo.AcceptMemberVOWrapper;
import kr.or.ddit.accept.vo.ProjectMemVO;
import kr.or.ddit.issue.service.IssueService;
import kr.or.ddit.issue.vo.IssueVO;
import kr.or.ddit.validate.groups.InsertGroup;
import kr.or.ddit.work.dao.WorkDAO;
import kr.or.ddit.work.service.WorkService;
import kr.or.ddit.work.service.workServiceImpl;
import kr.or.ddit.work.vo.CommonVO;
import kr.or.ddit.work.vo.ExtendPagingVO;
import kr.or.ddit.work.vo.ExtendSearchVO;
import kr.or.ddit.work.vo.ObserverVO;
import kr.or.ddit.work.vo.WCartegoryVO;
import kr.or.ddit.work.vo.WorkAuthVO;
import kr.or.ddit.work.vo.WorkVO;
@Controller

public class InsertIssueController {
	@Inject
	private IssueService service;
	
	@Inject
	private WorkDAO workDao;
	
	@Inject
	private WorkService workService;
	
	@ModelAttribute("command")
	public String addCommand() {
		return "INSERT";
	}
	
	@ModelAttribute("priortList")
	public List<CommonVO> priortList(@PathVariable(name="pCode")String pCode){
		List<CommonVO> commonsLists = workDao.selectCommonCode("I001");
		List<CommonVO> list = new ArrayList<>();
			for(CommonVO vo : commonsLists) {
				   if(! "완료".equals((vo.getCodeNm())) ) {
					   list.add(vo);
				   } 
			}
			return list;
	}
	
	
	@ModelAttribute("cartegoryList") 
	public List<WCartegoryVO> cartegoryList(@PathVariable(name="pCode")String pCode){
		List<WCartegoryVO> cartegoryList = workDao.selectCartegory(Integer.parseInt(pCode));
		return cartegoryList;
	}
 
	@ModelAttribute("commonList")
	public List<CommonVO> commonList(@PathVariable(name="pCode")String pCode ){
		List<CommonVO> commonsLists = workDao.selectCommonCode("W001");
		List<CommonVO> list = new ArrayList<>();
			for(CommonVO vo : commonsLists) {
				   if(! "완료".equals((vo.getCodeNm())) ) {
					   list.add(vo);
				   } 
			}
			return list;
	}
 
	
	@ModelAttribute("issue")
	public IssueVO issue() {
		return new IssueVO();
	}
	
	
	@RequestMapping(value="/project/{pCode}/issue/create" ,method=RequestMethod.GET)
	public String issueInsertForm(
			@PathVariable(name="pCode")String pCode
			) {
		
		return "issue/issueForm";	
	}
	
	@RequestMapping(value="/project/{pCode}/issue/create" ,method=RequestMethod.POST)
	public String issueInsert(
			@Validated (InsertGroup.class) @ModelAttribute("issue") IssueVO issueVO,
			BindingResult errors, Model model , @PathVariable("pCode") String pCode ,
			@AuthenticationPrincipal AcceptMemberVOWrapper wrapper, 
			RedirectAttributes redirectAttributes
			
			) {
		
		 String viewName = null;
		 String message = null;
		 AcceptMemberVO authMember = wrapper.getAdaptee();
		 String result = null;
		 if(!errors.hasErrors()) {
			  result = service.addIssue(issueVO);
			 switch(result) {
			 	case "OK" :
			 		viewName =  "redirect:/project/" + pCode+"/issue/Detail/" + issueVO.getIssueNo();
					  
					String success = "이슈 추가 성공";
					redirectAttributes.addFlashAttribute("success", success);
					redirectAttributes.addFlashAttribute("act", "이슈 추가");
					break;
				case "FILEFAIL":
					 viewName=  "issue/issueForm";	
				message = "파일  추가 실패";
				break;
				
				default:
					 viewName=  "issue/issueForm";	
					message = "서버 오류입니다. 조금 뒤 다시 시도해주세요";
					break;
				}
			
			 
			 
		 }else {
			 String errorsAttrName = BindingResult.class.getName() + ".issue";
			 redirectAttributes.addFlashAttribute(errorsAttrName, errors);
			 redirectAttributes.addFlashAttribute("message", message);
			 
			 viewName=  "issue/issueForm";	
		 }
		 
		 redirectAttributes.addFlashAttribute("message", message);
 
		return viewName;
	}
	
	
	
	
	
	//내 일감 목록 비동기
	@RequestMapping(value="/project/{pCode}/issue/create/myWorkListJson",method=RequestMethod.POST ,produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ExtendPagingVO<WorkVO> mywork(
			@PathVariable(name="pCode")String pCode,
			@AuthenticationPrincipal AcceptMemberVOWrapper wrapper ,
			@RequestParam(value="page", required=false, defaultValue="1") int currentPage,
			@ModelAttribute(value="simpleSearch") ExtendSearchVO simpleSearch 
			,Model model
			){
		
		ExtendPagingVO<WorkVO> pagingVO = new ExtendPagingVO<>(10,5);
		WorkVO workVO = new WorkVO();
		AcceptMemberVO authMember = wrapper.getAdaptee();
		
		workVO.setPrjctNo(pCode);
		workVO.setMemId(authMember.getMemId());
		pagingVO.setWorkVO(workVO);
		
		pagingVO.setCurrentPage(currentPage);
		pagingVO.setSimpleSearch(simpleSearch);

		int totalRecord = workService.retrieveMyWorkCount(pagingVO);
		pagingVO.setTotalRecord(totalRecord);
		workService.retrieveMyWorkList(pagingVO);
		//model.addAttribute("pagingVO" ,pagingVO );
		 
		return pagingVO;
		
	}
	
	
	
 	@RequestMapping(value="/project/{pCode}/issue/create/IssueSearch"  ,method=RequestMethod.GET )
	public String workSearch(@PathVariable(name="pCode")String pCode,
			@AuthenticationPrincipal AcceptMemberVOWrapper wrapper ,
			RedirectAttributes redirectAttributes,
			Model model) {
		String viewName = "/issue/issueSearch";
		return viewName;
		
	} 
	
 	
	//////검색일감 폼
	@RequestMapping(value="/project/{pCode}/issue/create/search/{workCode}"  ,method=RequestMethod.POST ,produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
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
		Map<String, Object> result = workService.retrieveWorkDetail(workVO);
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
}
