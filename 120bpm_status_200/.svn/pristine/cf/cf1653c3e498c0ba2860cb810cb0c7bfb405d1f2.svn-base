package kr.or.ddit.issue.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.accept.vo.AcceptMemberVO;
import kr.or.ddit.accept.vo.AcceptMemberVOWrapper;
import kr.or.ddit.accept.vo.ProjectMemVO;
import kr.or.ddit.issue.service.IssueService;
import kr.or.ddit.issue.vo.IssueVO;
import kr.or.ddit.validate.groups.UpdateGroup;
import kr.or.ddit.work.dao.WorkDAO;
import kr.or.ddit.work.service.WorkService;
import kr.or.ddit.work.vo.CommonVO;
import kr.or.ddit.work.vo.WCartegoryVO;
import kr.or.ddit.work.vo.WorkVO;
@Controller
public class UpdateIssueController {
	
	

	@Inject
	private IssueService service;
	
	@Inject
	private WorkDAO workDao;
	
	@Inject
	private WorkService workService;
	
	@ModelAttribute("command")
	public String addCommand() {
		return "UPDATE";
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
	@RequestMapping(value="/project/{pCode}/issue/modify/result/solut" , method=RequestMethod.POST  , produces="text/plan;charset=utf-8")
	@ResponseBody
	public String issueSolute(
			@PathVariable(name="pCode")String pCode,
			@ModelAttribute("issue") IssueVO issueVO
			,@AuthenticationPrincipal AcceptMemberVOWrapper wrapper
			) {
		String result = null;
		AcceptMemberVO authMember = wrapper.getAdaptee();
		issueVO.setPrjctNo(pCode);
		issueVO.setMemId(authMember.getMemId());
		result=	service.updateSoluteIssue(issueVO);		
		return result;
	}
	
	
	@RequestMapping("/project/{pCode}/issue/modify/{issueNo}")
	public String issueUpdate(
			@PathVariable(name="pCode")String pCode
			, @PathVariable(name="issueNo")String issueNo,
			@ModelAttribute("issue") IssueVO issue
			,@AuthenticationPrincipal AcceptMemberVOWrapper wrapper  ,
			Model model
			) {
		String viewName = null;
		String message = null;
		AcceptMemberVO authMember = wrapper.getAdaptee();
		 
		issue.setPrjctNo(pCode);
		issue.setIssueNo(issueNo);
		issue.setMemId(authMember.getMemId());
		IssueVO issueVO =	service.retrieveWorkForUpdate(issue);
		model.addAttribute("issue", issueVO);
		 
		return "issue/issueForm";
	}
	@RequestMapping(value="/project/{pCode}/issue/modify/{issueNo}" ,method=RequestMethod.POST)
	public String issueUpdate(
			@Validated (UpdateGroup.class) @ModelAttribute("issue") IssueVO issueVO,
			BindingResult errors, Model model , @PathVariable("pCode") String pCode ,
			@AuthenticationPrincipal AcceptMemberVOWrapper wrapper, 
			RedirectAttributes redirectAttributes	
			
			) {
		 String viewName = null;
		 String message = null;
		 AcceptMemberVO authMember = wrapper.getAdaptee();
		 List<ProjectMemVO> list = authMember.getProjectMemRole();
		issueVO.setRoleList(list);
		 String result = null;
		 if(!errors.hasErrors()) {
			  result = service.updateIssue(issueVO);
			 switch(result) {
			 	case "OK" :
			 		viewName =  "redirect:/project/" + pCode+"/issue/Detail/" + issueVO.getIssueNo();
					  
					String success = "이슈 수정 성공";
					redirectAttributes.addFlashAttribute("success", success);
					redirectAttributes.addFlashAttribute("act", "이슈 수정");
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
	
	
	
}
