package kr.or.ddit.free.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
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

import kr.or.ddit.accept.vo.AcceptMemberVOWrapper;
import kr.or.ddit.free.dao.FreeBoardDAO;
import kr.or.ddit.free.service.FreeBoardService;
import kr.or.ddit.free.vo.FreeBoardVO;
import kr.or.ddit.free.vo.FreePagingVO;
import kr.or.ddit.member.vo.SearchVO;

//@Log4j
@Controller
public class RetrieveFreeController {

	@Inject
	private FreeBoardService service;
	
	@Inject
	private FreeBoardDAO dao;
	
	
	@ModelAttribute("command")
	public String workList() {
		return "FREEBOARDLIST";
	}
	
	
	
	@RequestMapping(value="/project/{pCode}/freeboard/list")
	public String freeList(
		@PathVariable(name="pCode" ,required=true)String pCode ,
		@RequestParam(value="page", required=false, defaultValue="1") int currentPage,
		@ModelAttribute("simpleSearch") SearchVO simpleSearch,
		Model model, @AuthenticationPrincipal AcceptMemberVOWrapper wrapper
	) {
		FreeBoardVO freeBoardInfo = new FreeBoardVO();
		FreePagingVO<FreeBoardVO> freePagingInfo = new FreePagingVO<>();
		model.addAttribute("freePagingInfo", freePagingInfo);
		freeBoardInfo.setPrjctNo(pCode);
		freePagingInfo.setFreeInfo(freeBoardInfo);
		freePagingInfo.setSimpleSearch(simpleSearch);
		freePagingInfo.setCurrentPage(currentPage);
		int totalRecord = service.retriveBoardCount(freePagingInfo);
		freePagingInfo.setTotalRecord(totalRecord);
		List<FreeBoardVO> boardList = service.retriveBoardList(freePagingInfo);
		freePagingInfo.setDataList(boardList);
		freePagingInfo.setTotalRecord(totalRecord);
		service.retriveBoardList(freePagingInfo);
		model.addAttribute("freePagingInfo", freePagingInfo);
		return "freeboard/freeList";
		
	}

	@RequestMapping(value="/project/{pCode}/freeboard/list/listJson" ,method=RequestMethod.POST ,produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	private FreePagingVO<FreeBoardVO> listForAjax(
			@PathVariable(name="pCode")String pCode,
			@RequestParam(value="page", required=false, defaultValue="1") int currentPage,
			@ModelAttribute("simpleSearch") SearchVO simpleSearch
		) {
			FreePagingVO<FreeBoardVO> freePagingInfo = new FreePagingVO<>();
		
			
			FreeBoardVO freeBoardInfo = new FreeBoardVO();
			freeBoardInfo.setPrjctNo(pCode);
			freePagingInfo.setFreeInfo(freeBoardInfo);
			freePagingInfo.setCurrentPage(currentPage);
			freePagingInfo.setSimpleSearch(simpleSearch);
			int totalRecord = service.retriveBoardCount(freePagingInfo);
			freePagingInfo.setTotalRecord(totalRecord);
			List<FreeBoardVO> boardList = service.retriveBoardList(freePagingInfo);
			freePagingInfo.setDataList(boardList);
			return freePagingInfo;
		} 


	
	
	@RequestMapping("/project/{pCode}/freeboard/detail/{boNo}")
	public String freeDetail(
			@PathVariable int boNo, 
			Model model, 
			HttpServletRequest req, HttpServletResponse res) {
		// ????????? ?????? ?????? ??????. ????????? ?????? ????????????
		Cookie cookies[] = req.getCookies();
		Map map = new HashMap();
		if (req.getCookies() != null) {
			for (int i = 0; i < cookies.length; i++) {
				Cookie obj = cookies[i];
				map.put(obj.getName(), obj.getValue());
			}
		}

		// ????????? ???????????? read_count ??? ????????????
		String readCount = (String) map.get("read_count");
		// ????????? ????????? ????????? ??????
		String newReadCount = "|" + boNo;

		// ????????? ????????? ????????? ???????????? ???????????? ??? ??????
		if (StringUtils.indexOfIgnoreCase(readCount, newReadCount) == -1) {
			// ?????? ?????? ?????? ??????
			Cookie cookie = new Cookie("read_count", readCount + newReadCount);
			res.addCookie(cookie);
			dao.incrementHit(boNo); // ???????????? ??????
		}

		FreeBoardVO freeBoardInfo = service.retriveBoard(boNo);
		model.addAttribute("freeBoard", freeBoardInfo);

		return "freeboard/freeDetail";
	}
	
	
}
