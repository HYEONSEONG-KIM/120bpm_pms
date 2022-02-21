package kr.or.ddit.issue.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.accept.vo.AcceptMemberVO;
import kr.or.ddit.accept.vo.AcceptMemberVOWrapper;
import kr.or.ddit.accept.vo.ProjectMemVO;
import kr.or.ddit.issue.service.IssueService;
import kr.or.ddit.issue.vo.IssueVO;
import kr.or.ddit.work.dao.WorkDAO;
import kr.or.ddit.work.vo.CommonVO;
import kr.or.ddit.work.vo.ExtendPagingVO;
import kr.or.ddit.work.vo.ExtendSearchVO;
import kr.or.ddit.work.vo.WorkAuthVO;
@Controller
public class IssueRetrieveController {
	@Inject
	private IssueService service;
	
	@Inject
	private WorkDAO workDao;
	
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
	
	@RequestMapping("/project/{pCode}/issue/issueList/myList")
	public String myIssueList(
			@PathVariable(name="pCode")String pCode , Model model,
			@RequestParam(value="page",defaultValue="1",required=false) int currentPage,
			@ModelAttribute("simpleSearch") ExtendSearchVO simpleSearch
			,
			@AuthenticationPrincipal AcceptMemberVOWrapper wrapper
			) {
		ExtendPagingVO<IssueVO>	issueList = myIssueListJson(pCode, currentPage, simpleSearch,wrapper);
		model.addAttribute("pagingVO", issueList);
		
		return "issue/myIssueList";
	}
	@RequestMapping(value="/project/{pCode}/issue/issueList/myList" ,produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ExtendPagingVO<IssueVO> myIssueListJson(
			@PathVariable(name="pCode")String pCode , 
			@RequestParam(value="page",defaultValue="1",required=false) int currentPage,
			@ModelAttribute("simpleSearch") ExtendSearchVO simpleSearch,
			@AuthenticationPrincipal AcceptMemberVOWrapper wrapper
			) {
		ExtendPagingVO<IssueVO> pagingVO = new ExtendPagingVO<>(5,5);
		IssueVO issueVO = new IssueVO();
		 AcceptMemberVO authMember = wrapper.getAdaptee();
		issueVO.setMemId(authMember.getMemId());
		issueVO.setPrjctNo(pCode);
		pagingVO.setIssueVO(issueVO);
		pagingVO.setCurrentPage(currentPage);
		pagingVO.setSimpleSearch(simpleSearch);
		service.retrieveMyIssueList(pagingVO);
		System.out.println(pagingVO);
		return pagingVO;
	}
	
	
	
	@RequestMapping("/project/{pCode}/issue/issueList")
	public String issueList(
			@PathVariable(name="pCode")String pCode , Model model,
			@RequestParam(value="page",defaultValue="1",required=false) int currentPage,
			@ModelAttribute("simpleSearch") ExtendSearchVO simpleSearch
			) {
		ExtendPagingVO<IssueVO>	issueList = 	issueListJson(pCode, currentPage, simpleSearch);
		model.addAttribute("pagingVO", issueList);
		
		
		return "issue/issueList";
	}
	@RequestMapping(value="/project/{pCode}/issue/issueList" ,produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ExtendPagingVO<IssueVO> issueListJson(
			@PathVariable(name="pCode")String pCode , 
			@RequestParam(value="page",defaultValue="1",required=false) int currentPage,
			@ModelAttribute("simpleSearch") ExtendSearchVO simpleSearch
			) {
		ExtendPagingVO<IssueVO> pagingVO = new ExtendPagingVO<>(5,5);
		IssueVO issueVO = new IssueVO();
		issueVO.setPrjctNo(pCode);
		pagingVO.setIssueVO(issueVO);
		pagingVO.setCurrentPage(currentPage);
		pagingVO.setSimpleSearch(simpleSearch);
		service.retrieveIssueList(pagingVO);
		System.out.println(pagingVO);
		return pagingVO;
	}
	
	@RequestMapping(value="/project/{pCode}/issue/issueList/percent", produces=MediaType.APPLICATION_JSON_UTF8_VALUE , method=RequestMethod.POST)
	@ResponseBody
	public Map<String , Object> issuePercent(@PathVariable(name="pCode")String pCode){
		Map<String , Object> map =	service.retriveIssuePercent(pCode);
		return map;
	}
	
	@RequestMapping("/project/{pCode}/issue/Detail/{issueNo}")
	public String issueDetail(
			@AuthenticationPrincipal AcceptMemberVOWrapper wrapper ,
			 
			@PathVariable(name="pCode")String pCode
			, @PathVariable(name="issueNo")String issueNo,
			Model model
			) {
		AcceptMemberVO authMember = wrapper.getAdaptee();
		IssueVO issueVO = new IssueVO();
		issueVO.setPrjctNo(pCode);
		issueVO.setIssueNo(issueNo);
		
		IssueVO issue = service.retrieveWorkDetail(issueVO);
		model.addAttribute("issue", issue);
		
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
		
		return "issue/issueDetail";
	}
}
