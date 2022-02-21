package kr.or.ddit.issue.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.enumtype.ServiceResult;
import kr.or.ddit.issue.service.IssueRepService;
import kr.or.ddit.issue.vo.IssueRepVO;
import kr.or.ddit.validate.groups.DeleteGroup;
import kr.or.ddit.validate.groups.InsertGroup;
import kr.or.ddit.validate.groups.UpdateGroup;
import kr.or.ddit.work.vo.ExtendPagingVO;
@Controller
public class IssueReplyController {
	 @Inject
	private IssueRepService service;
	
	@RequestMapping(value="/project/{pCode}/issue/reply/{issueNo}")
	public String issueReplyInsert(
			@PathVariable(name="pCode" ,required=true)String pCode  
			, @PathVariable(name="issueNo")String issueNo
			) {
		return "issue/issueDetail";
	}
	
	
	@RequestMapping(value="/project/{pCode}/issue/reply/{issueNo}", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ExtendPagingVO<IssueRepVO> issueRepList(
			@PathVariable(name="pCode" ,required=true) String pCode  
			, @PathVariable(name="issueNo")String issueNo
			,@RequestParam(value="page" , required=false, defaultValue="1") int currentPage
			){
		IssueRepVO repVO = new IssueRepVO();
		repVO.setIssueNo(issueNo);
		repVO.setPrjctNo(pCode);
		ExtendPagingVO<IssueRepVO> pagingVO = new ExtendPagingVO<>(5,5);
		pagingVO.setCurrentPage(currentPage);
	 
		pagingVO.setDetailSearch(repVO);
		service.retrieveIssueRepList(pagingVO);
		
				return pagingVO;
		
	}
	
	

	@RequestMapping(value="/project/{pCode}/issue/reply/create", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	 @ResponseBody 
	public ServiceResult InsertissueRep(@PathVariable(name="pCode" ,required=true) String pCode  ,
			@Validated(InsertGroup.class) @ModelAttribute IssueRepVO issueVO, BindingResult errors
			) {
		
		ServiceResult result = ServiceResult.FAIL;
		String message = null ;
		if(!errors.hasErrors()) {
			 result = service.addIssueRep(issueVO);
		}else {
			message = "검증에 걸림";
 		}
		//resultMap.put("result", result);
		return result ;
		
	}
	@RequestMapping(value="/project/{pCode}/issue/reply/modify", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody 
	public String updateissueRep(@PathVariable(name="pCode" ,required=true) String pCode  ,
			@Validated(UpdateGroup.class) @ModelAttribute IssueRepVO issueVO, BindingResult errors
			) {
		
		String result = "FAIL";
		String message = null ;
		if(!errors.hasErrors()) {
			result =service.modifyIssueRep(issueVO);
		}else {
			message = "검증에 걸림";
		}
		 
		return result ;
		
	}
	@RequestMapping(value="/project/{pCode}/issue/reply/remove", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody 
	public String deletessueRep(@PathVariable(name="pCode" ,required=true) String pCode  ,
			@Validated(DeleteGroup.class) @ModelAttribute IssueRepVO issueVO, BindingResult errors
			) {
		
		String result = "FAIL";
		String message = null ;
		if(!errors.hasErrors()) {
			result =service.removeIssueRep(issueVO);
		}else {
			message = "검증에 걸림";
		}
		
		return result ;
		
	}
	
	
}
