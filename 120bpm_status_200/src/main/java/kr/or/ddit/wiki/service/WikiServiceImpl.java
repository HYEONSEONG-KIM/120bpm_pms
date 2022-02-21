package kr.or.ddit.wiki.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.wiki.dao.WikiDAO;
import kr.or.ddit.wiki.vo.BoardVO;
import kr.or.ddit.wiki.vo.WikiPagingVO;

@Service
public class WikiServiceImpl implements WikiService {

	@Inject
	private WikiDAO wikiDAO;
	
	@Override
	public List<BoardVO> retrieveWikiList(WikiPagingVO<BoardVO> pagingVO) {
		return wikiDAO.selectWikiList(pagingVO);
	}

	@Override
	public int retrieveBoardCount(WikiPagingVO<BoardVO> pagingVO) {
		return wikiDAO.selectTotalRecord(pagingVO);
	}


}
