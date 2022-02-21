package kr.or.ddit.work.controller;

import javax.inject.Inject;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.accept.vo.AcceptMemberVO;
import kr.or.ddit.accept.vo.AcceptMemberVOWrapper;
import kr.or.ddit.work.service.WorkService;
import kr.or.ddit.work.vo.WorkVO;

@Controller
public class WorkDeleteController {
	
	@Inject
	private WorkService service;
	

	@RequestMapping(value="/project/{pCode}/work/remove",method=RequestMethod.POST ,produces="text/plan;charset=utf-8")
	@ResponseBody
	public String delOne(
			@PathVariable(name="pCode")String pCode,
			@RequestParam("workCode") String[] workCode,
			@AuthenticationPrincipal AcceptMemberVOWrapper wrapper 
			){
		
				AcceptMemberVO authMember = wrapper.getAdaptee();
				String result = null;
		 		WorkVO vo = new WorkVO();
		 		vo.setPrjctNo(pCode);
		 		vo.setMemId(authMember.getMemId());
		    
		 		result  =  service.deleteAllWork(workCode, vo);
		return result;
		
		
			}
		
		
		
	 
	
	
}
