package kr.or.ddit.free.service;

import java.util.List;

import kr.or.ddit.enumtype.ServiceResult;
import kr.or.ddit.free.vo.FreeBoardVO;
import kr.or.ddit.free.vo.FreePagingVO;
import kr.or.ddit.notice.vo.NoticeVO;

public interface FreeBoardService {
	public ServiceResult createBoard(FreeBoardVO freeInfo);
	public int retriveBoardCount(FreePagingVO<FreeBoardVO> FreepagingInfo);
	public List<FreeBoardVO> retriveBoardList(FreePagingVO<FreeBoardVO> FreepagingInfo);
	public FreeBoardVO retriveBoard(int boNo);
	public ServiceResult modifyBoard(FreeBoardVO freeInfo);
	public ServiceResult removeBoard(Integer boNo, FreeBoardVO freeInfo);
	
	public FreeBoardVO selectFreeboard(int boNo);
	/**
	 * 추천수
	 */
	public ServiceResult incrementCount(int boNo);
}
