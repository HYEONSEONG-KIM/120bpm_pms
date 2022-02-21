package kr.or.ddit.wiki.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.wiki.dao.WikiDAO;
import kr.or.ddit.wiki.service.WikiService;
import kr.or.ddit.wiki.vo.BoardVO;
import kr.or.ddit.wiki.vo.WikiPagingVO;
import kr.or.ddit.wiki.vo.WikiSearchVO;
import kr.or.ddit.work.vo.ExtendSearchVO;

@Controller
@RequestMapping("/project/{pCode}/wiki")
public class RetrieveWikiController {

	@Inject
	private WikiService service;

	@Inject
	private WikiDAO dao;

	@RequestMapping("/wiki/wikiList")
	public String wikiList() {
		return "";
	}
	
	// 동기
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String wikiBoardList(@PathVariable(name = "pCode") String pCode,
			@RequestParam(value = "page", required = false, defaultValue = "1") int currentPage,
			@ModelAttribute("simpleSearch") WikiSearchVO simpleSearch, 
			Model model) {
		WikiPagingVO<BoardVO> pagingVO = wikiListForAjax(pCode, currentPage, simpleSearch);
		model.addAttribute("pagingVO", pagingVO);

		return "wiki/wikiList";
	}
	
	// 비동기
	@RequestMapping(value = "/project/{pCode}/wikiListJson", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public WikiPagingVO<BoardVO> wikiListForAjax(@PathVariable(name = "pCode") String pCode,
			@RequestParam(value = "page", required = false, defaultValue = "1") int currentPage,
			@ModelAttribute("simpleSearch") WikiSearchVO simpleSearch) {
		WikiPagingVO<BoardVO> pagingVO = new WikiPagingVO<>();
		pagingVO.setCurrentPage(currentPage);
		pagingVO.setSimpleSearch(simpleSearch);
		int totalRecord = service.retrieveBoardCount(pagingVO);
		pagingVO.setTotalRecord(totalRecord);
		List<BoardVO> boardList = service.retrieveWikiList(pagingVO);
		pagingVO.setDataList(boardList);
		return pagingVO;
	}



	@RequestMapping("/wiki/wikiDetail")
	public String wikiDetail() {
		return "";
	}
}
