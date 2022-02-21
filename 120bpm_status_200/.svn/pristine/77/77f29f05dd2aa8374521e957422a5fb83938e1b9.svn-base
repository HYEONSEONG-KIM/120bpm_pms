package kr.or.ddit.main.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.List;

import javax.inject.Inject;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.accept.vo.AcceptMemberVO;
import kr.or.ddit.accept.vo.AcceptMemberVOWrapper;
import kr.or.ddit.main.service.MainService;
import kr.or.ddit.main.vo.MainNoticeVO;
import kr.or.ddit.main.vo.MyBoardVO;
import kr.or.ddit.main.vo.MyProjectVO;
import kr.or.ddit.mypage.vo.MyWorkVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class RetrieveMainListController {
	
	
	@Inject
	private MainService service;
	

	@RequestMapping("/main")
	public String mainPage(
			@AuthenticationPrincipal AcceptMemberVOWrapper wrapper,
			Model model 
			) {
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		List<GrantedAuthority> authorities = (List<GrantedAuthority>) auth.getAuthorities();
		
		authorities.forEach((role)->{
			
			log.info("authInfo : {}", role.getAuthority());
		});
		
		
		String viewName = null;
		AcceptMemberVO authMember = wrapper.getAdaptee();
		
		if(authMember.getMngrAt().equals("0")) {
			viewName = userPage(model, authMember);
		}else if(authMember.getMngrAt().equals("1")) {
			viewName = adminPage(model, authMember);
		}
		
		 
		return viewName;
	}
	
	// 관리자 페이지 이동
	private String adminPage(Model model, AcceptMemberVO authMember) {
		List<MyProjectVO> prjctList = service.retrieveMyPrjctRegCnts(); 
		List<MainNoticeVO> noticeList = service.retrieveNoticeList();
		MyProjectVO prjct = service.retrievePrjctSttsCount();
		model.addAttribute("prjctList", prjctList);  
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("prjct", prjct);
		model.addAttribute("menu", "main");
		return "admin/adminMain";
	}
	
	
	// user페이지로 이동
	private String userPage(Model model, AcceptMemberVO authMember) {
		
		List<MyProjectVO> myProjectList = service.retrieveMyProjectList(authMember.getMemId());
		model.addAttribute("myProjectList", myProjectList); 
		
		List<MainNoticeVO> noticeList = service.retrieveNoticeList();
		model.addAttribute("noticeList", noticeList);
		 
		List<MyWorkVO> myWorkList = service.retrieveMyWorkCounts(authMember.getMemId());
		
		List<String> chartList = new ArrayList<>();
		String[] prjctNms = new String[myWorkList.size()];
		Integer[] newcnts = new Integer[myWorkList.size()];
		Integer[] ingcnts =  new Integer[myWorkList.size()];
		Integer[] donecnts = new Integer[myWorkList.size()];
		int idx = 0;
		for(MyWorkVO wo : myWorkList) {
			prjctNms[idx] = "\""+  wo.getPrjctNm().replaceAll("\"", "'") + "\"";
			newcnts[idx] = wo.getNewcount();
			ingcnts[idx] = wo.getIngcount();
			donecnts[idx] = wo.getDonecount();
			idx++;
		} 
		chartList.add(0, Arrays.toString(prjctNms));
		chartList.add(1, Arrays.toString(newcnts));
		chartList.add(2, Arrays.toString(ingcnts));
		chartList.add(3, Arrays.toString(donecnts));
		model.addAttribute("chartList", chartList);
		
		MyBoardVO news = service.retrieveCurNews(authMember.getMemId());
		model.addAttribute("news", news); 
		return "main/main"; 
	}
	
	
}
