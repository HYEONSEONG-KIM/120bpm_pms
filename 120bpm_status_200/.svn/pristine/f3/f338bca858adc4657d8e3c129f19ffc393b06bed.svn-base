package kr.or.ddit.news.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.accept.vo.ProjectMemVO;
import kr.or.ddit.commons.exception.DataNotFoundException;
import kr.or.ddit.news.dao.NewsDAO;
import kr.or.ddit.news.dao.NewsFileDAO;
import kr.or.ddit.news.vo.NewsVO;
import kr.or.ddit.work.vo.ExtendPagingVO;
@Service
public class NewsServiceImpl implements NewsService {
	@Inject
	private NewsDAO newsDao;
	
	@Inject 
	private NewsFileDAO newsFileDao;
	
	@Override
	public void retrieveNewsList(ExtendPagingVO<NewsVO> pagingVO) {
			pagingVO.setTotalRecord(newsDao.selectNewsTotalCount(pagingVO));
			pagingVO.setDataList(newsDao.selectNewsList(pagingVO));	
	}

	@Override
	public void retrieveMyNewsList(ExtendPagingVO<NewsVO> pagingVO) {
		 

	}

	@Override
	@Transactional
	public String insertNews(NewsVO newsVO) {
		String result = "FAIL";
		int cnt = 	newsDao.addNews(newsVO);
		if(cnt>0) result="SUCCESS";
		
		return result;
	}

	@Override
	@Transactional
	public String updatetNews(NewsVO newsVO) {
		 NewsVO saved = newsDao.selectNewsDetail(newsVO);
		 if(saved==null) throw new DataNotFoundException(newsVO.getBoNo());
		 String result ="FAIL";
		 List<ProjectMemVO> roles=newsVO.getRoleList();
		 String memRole = "";
		 String pCode =	newsVO.getPrjctNo();
		 
		 for(ProjectMemVO vo :	roles ) {
			 String findPcode=vo.getPrjctNo() +"";
			 if(pCode.equals(findPcode)) {
				 memRole=	vo.getAuthor();
			 }
		 }
		 
		 if(saved.getMemId().equals(newsVO.getMemId())||"ROLE_PM".equals(memRole)) {
			int cnt =  newsDao.updateNews(newsVO);
			if(cnt>0) result = "SUCCESS";
		 }
		 
		 return result;
	}

	@Transactional
	@Override
	public String deleteNews(NewsVO newsVO) {
		 NewsVO saved = newsDao.selectNewsDetail(newsVO);
		 if(saved==null) throw new DataNotFoundException(newsVO.getBoNo());
		 String result ="FAIL";
		 List<ProjectMemVO> roles=newsVO.getRoleList();
		 String memRole = "";
		 String pCode =	newsVO.getPrjctNo();
		 
		 for(ProjectMemVO vo :	roles ) {
			 String findPcode=vo.getPrjctNo() +"";
			 if(pCode.equals(findPcode)) {
				 memRole=	vo.getAuthor();
			 }
		 }
		 
		 if(saved.getMemId().equals(newsVO.getMemId())||"ROLE_PM".equals(memRole)) {
			int cnt =  newsDao.deleteNews(newsVO);
			if(cnt>0) result = "SUCCESS";
		 }
		 
		 return result;
	}

	@Override
	@Transactional
	public String addLike(NewsVO newsVO) {
		String result ="FAIL";
		 NewsVO saved = newsDao.selectNewsDetail(newsVO);
		 if(saved==null) throw new DataNotFoundException(newsVO.getBoNo());
		 int cnt =  newsDao.addHeart(newsVO);
			if(cnt>0) result = "SUCCESS";
		 return result;
	}

	@Override
	@Transactional
	public String minusLike(NewsVO newsVO) {
		String result ="FAIL";
		 NewsVO saved = newsDao.selectNewsDetail(newsVO);
		 if(saved==null) throw new DataNotFoundException(newsVO.getBoNo());
		 int cnt =  newsDao.removeHeart(newsVO);
			if(cnt>0) result = "SUCCESS";
		return result;
	}

}
