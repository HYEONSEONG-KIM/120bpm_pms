package kr.or.ddit.wiki.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.wiki.vo.BoardVO;
import kr.or.ddit.wiki.vo.WikiPagingVO;

@Mapper
public interface WikiDAO {
	
	//전체 위키 게시글 리스트
	public List<BoardVO> selectWikiList(WikiPagingVO<BoardVO> pagingVO);
	//전체 위키 게시글 수
	public int selectTotalRecord(WikiPagingVO<BoardVO> pagingVO);
	
}
