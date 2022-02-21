package kr.or.ddit.news.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.news.vo.NewsVO;
import kr.or.ddit.work.vo.ExtendPagingVO;

@Mapper
public interface NewsDAO {
	public List<NewsVO> selectNewsList(ExtendPagingVO<NewsVO> pagingVO);
	public int selectNewsTotalCount(ExtendPagingVO<NewsVO> pagingVO);
	
	public List<NewsVO> selectMyNewsList(ExtendPagingVO<NewsVO> pagingVO);
	public int selectNewsMyTotalCount(ExtendPagingVO<NewsVO> pagingVO);
	
	public int addHeart(NewsVO newsVO);
	public int removeHeart(NewsVO newsVO);
	
	public NewsVO selectNewsDetail(NewsVO newsVO);
	public NewsVO selectNewsDetailForUpdate(NewsVO newsVO);
	
	public int addNews(NewsVO newsVO);
	public int updateNews(NewsVO newsVO);
	public int deleteNews(NewsVO newsVO);
}
