package kr.or.ddit.mypage.controller;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.accept.vo.AcceptMemberVO;
import kr.or.ddit.accept.vo.AcceptMemberVOWrapper;
import kr.or.ddit.enumtype.ServiceResult;
import kr.or.ddit.mypage.service.MypageService;
import kr.or.ddit.mypage.vo.MyPagingVO;
import kr.or.ddit.mypage.vo.MyWorkBkmkVO;
import kr.or.ddit.mypage.vo.MyWorkVO;

@Controller
public class MyWorkController {
	
	@Inject
	private MypageService service;
	
	//마이페이지 - 내일감,즐겨찾기일감 목록
	@RequestMapping("/mypage")
	public String myWork(Model model, @AuthenticationPrincipal AcceptMemberVOWrapper wrapper) {
		AcceptMemberVO authMember = wrapper.getAdaptee();
		int pjctCount = service.retrieveMyProjectCount(authMember.getMemId());
		int workCount = service.retrieveMyWorkCount(authMember.getMemId()); 
		int duetodayCount = service.retrieveDueTodayWork(authMember.getMemId());
		model.addAttribute("pjctCount", pjctCount); 
		model.addAttribute("workCount", workCount);  
		model.addAttribute("duetodayCount", duetodayCount);  
		return "mypage/mypage";
	}
	 
	@RequestMapping(value="/mypage/myWork", method=RequestMethod.GET, produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody 
	public MyPagingVO<MyWorkVO> myWorkAjax(
			@RequestParam(value="page", required=false, defaultValue="1") int currentPage,
			@ModelAttribute("detailSearch") MyWorkVO detailSearch,
			@AuthenticationPrincipal AcceptMemberVOWrapper wrapper
			){
		AcceptMemberVO authMember = wrapper.getAdaptee();
		MyPagingVO<MyWorkVO> pagingVO = new MyPagingVO<>(5,3);
		pagingVO.setMemId(authMember.getMemId());
		pagingVO.setCurrentPage(currentPage); 
		pagingVO.setDetailSearch(detailSearch);   
		service.retrievemyWorkList(pagingVO); 
		
		return pagingVO;
	}
	
	@RequestMapping(value="/mypage/workBkmk", method=RequestMethod.GET, produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody 
	public MyPagingVO<MyWorkVO> workBkmkAjax(
			@RequestParam(value="page", required=false, defaultValue="1") int currentPage,
			@AuthenticationPrincipal AcceptMemberVOWrapper wrapper
			){
		AcceptMemberVO authMember = wrapper.getAdaptee();
		MyPagingVO<MyWorkVO> pagingVO = new MyPagingVO<>(5,3);
		pagingVO.setMemId(authMember.getMemId());
		pagingVO.setCurrentPage(currentPage); 
		service.retrieveWorkBkmkList(pagingVO); 
		 
		return pagingVO;
	}
	
	
	//마이페이지 즐겨찾기일감 해제(삭제)
	@RequestMapping("/mypage/workBkmk")
	public String removeWorkBkmk(
			@ModelAttribute("bkmk") MyWorkBkmkVO bkmk,
			@AuthenticationPrincipal AcceptMemberVOWrapper wrapper,
			RedirectAttributes redirectAttributes
			) {
		String message = null; 
		AcceptMemberVO authMember = wrapper.getAdaptee();
		bkmk.setMemId(authMember.getMemId()); 
		ServiceResult result = service.removeBkmks(bkmk);
		switch(result) {  
		case OK:  
			message = "OK";
			break;      
		default:    
			message = "ERROR"; 
			break;
		}
		redirectAttributes.addFlashAttribute("delBkmkMessage", message);
		return "redirect:/mypage";
	}
}
