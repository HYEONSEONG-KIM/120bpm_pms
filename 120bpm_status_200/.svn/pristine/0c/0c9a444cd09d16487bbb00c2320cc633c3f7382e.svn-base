package kr.or.ddit.accept.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.accept.dao.AcceptDao;
import kr.or.ddit.accept.service.AcceptMemberService;
import kr.or.ddit.accept.vo.AcceptMemberVO;
import kr.or.ddit.makeProject.vo.MakeProjectVO;

@Controller
public class MemberDetailForm {

	@Inject
	private AcceptMemberService service;
	
	@Inject
	private AcceptDao dao;
	
	@RequestMapping(value = "proejct/0/detail/prtForm/{memId}")
	public String projectFormMemDetail(
				@PathVariable String memId,
				Model model
			) {
		AcceptMemberVO memVO = service.retrieveMember(memId);
//		List<MakeProjectVO> memProject = service.memProjectInfo(memId);
		List<MakeProjectVO> memProject = dao.memPrtList(memId);
		
		model.addAttribute("memVO", memVO);
		model.addAttribute("projectList", memProject);
		
		return "find/FormMemDetail";
	}
	
}
