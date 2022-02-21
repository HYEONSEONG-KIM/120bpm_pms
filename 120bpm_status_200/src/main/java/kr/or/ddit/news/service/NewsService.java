package kr.or.ddit.news.service;

import kr.or.ddit.issue.vo.IssueVO;
import kr.or.ddit.news.vo.NewsVO;
import kr.or.ddit.work.vo.ExtendPagingVO;

public interface NewsService {
	public void retrieveNewsList(ExtendPagingVO<NewsVO> pagingVO);

	public void retrieveMyNewsList(ExtendPagingVO<NewsVO> pagingVO);
	
	public String insertNews(NewsVO newsVO);
	public String updatetNews(NewsVO newsVO);
	public String deleteNews(NewsVO newsVO);
	
	public String addLike(NewsVO newsVO);
	public String minusLike(NewsVO newsVO);
	
	
}
