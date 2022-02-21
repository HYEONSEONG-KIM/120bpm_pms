package kr.or.ddit.news.dao;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.news.vo.NewsFileVO;
import kr.or.ddit.news.vo.NewsVO;

@Mapper
public interface NewsFileDAO {
	//상태 변경
	public int updateNewsFile(NewsVO newsVO);
	
	public int insertNewsFiles(NewsVO newsVO);
	
	//여러개 삭제 시 한 번에 삭제 하나의 게시글에 있는 파일 다 삭제항때 사용
	public int deleteAttatchAll(NewsVO newsVO);
	//뉴스에 들어있는 파일
	public int deleteAllNewsFile(NewsVO newsVO);
	//선택한 게시글 정보 삭제
	public int deleteAttatches(NewsVO newsVO);
	
	public int deleteNewsFile(NewsVO newsVO);
	public NewsFileVO selectNewsFileInfo(String delFileNo);
	
}
