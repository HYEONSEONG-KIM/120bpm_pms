package kr.or.ddit.free.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.free.vo.FreeBoardVO;
import kr.or.ddit.free.vo.FreePagingVO;

@Mapper
public interface FreeBoardDAO {
	public int insertBoard(FreeBoardVO freeboardInfo);
	public int selectTotalRecoard(FreePagingVO<FreeBoardVO> freePagingInfo);
	public List<FreeBoardVO> selectBoardList(FreePagingVO<FreeBoardVO> freePagingInfo);
	public int updateBoard(FreeBoardVO freeboardInfo);
	public int deleteBoard(int boNo);
	public FreeBoardVO selectFreeboard(int boNo);
	public FreeBoardVO selectFreeboardDetailView(FreeBoardVO freeBoardInfo);
	
	/**
	 * 조회수 증가
	 * @param boNo
	 * @return
	 */
	public int incrementHit(int boNo);
	/**
	 * 추천수 증가
	 * @param boNo
	 * @return
	 */
	public int incrementRec(int boNo);


}
