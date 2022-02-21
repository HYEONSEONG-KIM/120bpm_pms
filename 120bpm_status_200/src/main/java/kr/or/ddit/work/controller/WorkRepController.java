package kr.or.ddit.work.controller;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.accept.vo.AcceptMemberVO;
import kr.or.ddit.accept.vo.AcceptMemberVOWrapper;
import kr.or.ddit.enumtype.ServiceResult;
import kr.or.ddit.validate.groups.InsertGroup;
import kr.or.ddit.work.service.WorkRepService;
import kr.or.ddit.work.vo.ExtendPagingVO;
import kr.or.ddit.work.vo.WorkRepVO;

@Controller
public class WorkRepController {
	@Inject
	WorkRepService service;
 
	@ResponseBody
	@RequestMapping(value="/project/{pCode}/work/reply", method=RequestMethod.GET,produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ExtendPagingVO<WorkRepVO> repList(
				@PathVariable(name="pCode" )String pCode ,
				@RequestParam("workCode") String workCode 
				,@RequestParam(value="page" , required=false, defaultValue="1") int currentPage
			){
		
			WorkRepVO detailSearch = new WorkRepVO();
			detailSearch.setWorkCode(workCode);
			ExtendPagingVO<WorkRepVO> pagingVO= new ExtendPagingVO<>(5, 5);
			pagingVO.setDetailSearch(detailSearch);
			pagingVO.setCurrentPage(currentPage);
			service.retrieveWorkRepList(pagingVO);
					
			return pagingVO;
		
		
	}
	
	
	
	
	@RequestMapping(value="/project/{pCode}/work/reply/create" , produces=MediaType.APPLICATION_JSON_UTF8_VALUE , method=RequestMethod.POST)
	@ResponseBody
	public ServiceResult insert(
			@PathVariable(name="pCode" )String pCode ,
			@Validated(InsertGroup.class) @ModelAttribute(name="rep") WorkRepVO workRepVO,
			BindingResult errors , @AuthenticationPrincipal AcceptMemberVOWrapper wrapper
			,RedirectAttributes redirectAttribute
			) {
	 	ServiceResult result = ServiceResult.FAIL;
		String message = null ;
		if(!errors.hasErrors()) {
			 result = service.createWorkRep(workRepVO);
		}else {
			message = "검증에 걸림";
			//redirectAttribute.add("message", "검증에 걸렸음.");
		}
		//resultMap.put("result", result);
		return result ;
	}
	
	
	
	
	
	@RequestMapping(value="/project/{pCode}/work/reply/modify",method=RequestMethod.POST,produces="text/plan;charset=utf-8")
	@ResponseBody
	public String moddify(
			@PathVariable(name="pCode" )String pCode ,
			@Validated(InsertGroup.class) @ModelAttribute(name="rep") WorkRepVO workRepVO,
			BindingResult errors,@AuthenticationPrincipal AcceptMemberVOWrapper wrapper
			) {
		String result = null;
		result = service.modifyWorkRep(workRepVO);
		
		
		return result;
	}
	///project/1/work/reply/remove
	@RequestMapping(value="/project/{pCode}/work/reply/remove",method=RequestMethod.POST,produces="text/plan;charset=utf-8")
	@ResponseBody
	public String delete(
			@PathVariable(name="pCode" )String pCode ,
			 @ModelAttribute(name="rep") WorkRepVO workRepVO,
			@AuthenticationPrincipal AcceptMemberVOWrapper wrapper
			) {
		String result = null;
		AcceptMemberVO adaptee = 	wrapper.getAdaptee();
		workRepVO.setMemId(adaptee.getMemId());	 
		result = service.removeWorkRep(workRepVO);
		
		return result;
	}

}
