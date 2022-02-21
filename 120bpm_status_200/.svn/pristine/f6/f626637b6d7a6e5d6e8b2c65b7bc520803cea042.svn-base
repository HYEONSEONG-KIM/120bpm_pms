package kr.or.ddit.member.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.member.service.MemberService;
import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.member.vo.PagingVO;
import kr.or.ddit.member.vo.SearchVO;



@Controller
public class MemberRetrieveController {

	@Inject
	private MemberService service;

	@RequestMapping(value="/entireMemberList.do", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public PagingVO<MemberVO> listForAjax(
		@RequestParam(value="page", required=false, defaultValue="1") int currentPage,
		@ModelAttribute("simpleSearch") SearchVO simpleSearch
	) {
		PagingVO<MemberVO> memberPagingInfo = new PagingVO<>();
		memberPagingInfo.setCurrentPage(currentPage);
		memberPagingInfo.setSimpleSearch(simpleSearch);
		int totalRecord = service.retrieveTotalCount(memberPagingInfo);
		memberPagingInfo.setTotalRecord(totalRecord);
		List<MemberVO> boardList = service.retrieveMemberList(memberPagingInfo);
		memberPagingInfo.setDataList(boardList);
		return memberPagingInfo;
	} 
	
	
	@RequestMapping("/entireMemberList.do")
	public String memberList(
		@RequestParam(value="page", required=false, defaultValue="1") int currentPage,
		@ModelAttribute("simpleSearch") SearchVO simpleSearch,
		Model model
	) {
		
		PagingVO<MemberVO> memberPagingInfo = listForAjax(currentPage, simpleSearch);
		model.addAttribute("memberPagingInfo", memberPagingInfo);
		
		return "member/entireMemberList";
	}
	


	
}
