package kr.or.ddit.news.controller;

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

import kr.or.ddit.member.vo.PagingVO;
import kr.or.ddit.news.service.NewsService;
import kr.or.ddit.news.vo.NewsVO;
import kr.or.ddit.work.vo.ExtendPagingVO;
import kr.or.ddit.work.vo.ExtendSearchVO;
@Controller
public class RetrieveNewsController {
	@Inject
	private	NewsService service;
	
	@RequestMapping(value="/project/{pCode}/news/list",method=RequestMethod.GET)
	public String newsList(
			@PathVariable(name="pCode") String pCode,
			@RequestParam(name="page",defaultValue="1",required=false) int currentPage,
			@ModelAttribute("simpleSearch") ExtendSearchVO simpleSearch, 
			Model model
			) {
			
		ExtendPagingVO<NewsVO> pagingVO = newsListJson(pCode, currentPage, simpleSearch);
		model.addAttribute("pagingVO" , pagingVO);
		return "news/newsList";
	}
	@RequestMapping(value="/project/{pCode}/news/list",method=RequestMethod.GET ,produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ExtendPagingVO<NewsVO> newsListJson(
			@PathVariable(name="pCode") String pCode,
			@RequestParam(name="page",defaultValue="1",required=false) int currentPage,
			@ModelAttribute("simpleSearch") ExtendSearchVO simpleSearch
			){
		NewsVO newsVO = new NewsVO();
		newsVO.setPrjctNo(pCode);
		ExtendPagingVO<NewsVO> pagingVO = new ExtendPagingVO<>();
		pagingVO.setCurrentPage(currentPage);
		pagingVO.setSimpleSearch(simpleSearch);
		pagingVO.setDetailSearch(newsVO);
		service.retrieveNewsList(pagingVO);
		
		return pagingVO;
		
	}
	
	
	@RequestMapping("/news/newsDetail")
	public String newsDetail() {
		return "news/newsDetail";
	}
}
