package kr.or.ddit.notice.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.member.vo.SearchVO;
import kr.or.ddit.notice.dao.NoticeDAO;
import kr.or.ddit.notice.service.NoticeService;
import kr.or.ddit.notice.vo.NoticePagingVO;
import kr.or.ddit.notice.vo.NoticeVO;


@Controller
public class NoticeRetrieveController {

	@Inject
	private NoticeService service;

	@Inject
	private NoticeDAO dao;

	
	@RequestMapping("/notice/noticeList")
	public String noticeList(
		@RequestParam(value="page", required=false, defaultValue="1") int currentPage,
		@ModelAttribute("simpleSearch") SearchVO simpleSearch,
		Model model
	) {
		
		NoticePagingVO<NoticeVO> noticePagingInfo = listForAjax(currentPage, simpleSearch);
		model.addAttribute("noticePagingInfo", noticePagingInfo);
		model.addAttribute("menu", "notice");  
		return "notice/noticeList"; 
	}

	
	@RequestMapping(value="/notice/noticeList", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public NoticePagingVO<NoticeVO> listForAjax(
		@RequestParam(value="page", required=false, defaultValue="1") int currentPage,
		@ModelAttribute("simpleSearch") SearchVO simpleSearch
	) {
		NoticePagingVO<NoticeVO> noticePagingInfo = new NoticePagingVO<>();
		noticePagingInfo.setCurrentPage(currentPage);
		noticePagingInfo.setSimpleSearch(simpleSearch);
		int totalRecord = service.retriveNoticeCount(noticePagingInfo);
		noticePagingInfo.setTotalRecord(totalRecord);
		List<NoticeVO> boardList = service.retriveNoticeList(noticePagingInfo);
		noticePagingInfo.setDataList(boardList);
		return noticePagingInfo;
	} 
	
	@RequestMapping(value="/notice/detail/{noticeCode}")
	public String noticeView(
		@PathVariable int noticeCode
		, Model model, HttpServletRequest req,HttpServletResponse res
	) {
		//조회수 증가 막기 위함. 저장된 쿠키 불러오기
		Cookie cookies[] = req.getCookies();
		Map map = new HashMap();
		if (req.getCookies() != null) {
			for (int i = 0; i < cookies.length; i++) {
				Cookie obj = cookies[i];
				map.put(obj.getName(), obj.getValue());
			}
		}
		
		// 저장된 쿠키중에 read_count 만 불러오기
		String readCount = (String) map.get("read_count");
		// 저장될 새로운 쿠키값 생성
		String newReadCount = "|" + noticeCode;

		// 저장된 쿠키에 새로운 쿠키값이 존재하는 지 검사
		if (StringUtils.indexOfIgnoreCase(readCount, newReadCount) == -1) {
			// 없을 경우 쿠키 생성
			Cookie cookie = new Cookie("read_count", readCount + newReadCount);
			res.addCookie(cookie);
			dao.incrementHit(noticeCode); // 업데이트 실행
//			Cookie kc = new Cookie("read_count", null);
//			kc.setMaxAge(0);
//			res.addCookie(kc);
		}


		
		NoticeVO notice = service.retriveNotice(noticeCode);
		model.addAttribute("notice", notice);

		return "notice/noticeDetail";
	}
	
}