package kr.or.ddit.wiki.service;

import java.util.List;

import kr.or.ddit.wiki.vo.BoardVO;
import kr.or.ddit.wiki.vo.WikiPagingVO;

public interface WikiService {
	
	public int retrieveBoardCount(WikiPagingVO<BoardVO> pagingVO);
	
	public List<BoardVO> retrieveWikiList(WikiPagingVO<BoardVO> pagingVO);
}
