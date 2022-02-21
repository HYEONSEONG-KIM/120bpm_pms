package kr.or.ddit.issue.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.MediaType;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.accept.vo.AcceptMemberVO;
import kr.or.ddit.accept.vo.AcceptMemberVOWrapper;
import kr.or.ddit.accept.vo.ProjectMemVO;
import kr.or.ddit.issue.service.IssueService;
import kr.or.ddit.issue.vo.IssueVO;
@Controller
public class DeleteIssueController {
	@Inject
	IssueService service;
	
	@RequestMapping(value="/project/{pCode}/issue/remove" , method=RequestMethod.POST , produces="text/plan;charset=utf-8")
	@ResponseBody
	public String issueDelete(
			@PathVariable(name="pCode")String pCode
			,@ModelAttribute("issue") IssueVO issueVO
			,@AuthenticationPrincipal AcceptMemberVOWrapper wrapper
			, Model model  
			) {
		
		AcceptMemberVO authMember = wrapper.getAdaptee();
		String result = null;
		issueVO.setPrjctNo(pCode);
		issueVO.setMemId(authMember.getMemId());
		List<ProjectMemVO> list = authMember.getProjectMemRole();
		issueVO.setRoleList(list);
		System.out.println(issueVO);
		result = 	service.deleteAllIssue(issueVO);
		
		return result;
	}
}
