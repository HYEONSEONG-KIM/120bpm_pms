package kr.or.ddit.free.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.free.vo.FreePagingVO;
import kr.or.ddit.free.vo.FreeReplyVO;

@Mapper
public interface FreeReplyDAO {
	public int insertReply(FreeReplyVO freeReplyInfo);
	public int selectTotalRecord(FreePagingVO<FreeReplyVO> freePagingInfo);
	public List<FreeReplyVO> selectReplyList(FreePagingVO<FreeReplyVO> freePagingInfo);
	public FreeReplyVO selectFreeRepInfo(FreeReplyVO freeReplyInfo);
	public int updateReply(FreeReplyVO freeReplyInfo);
	public int deleteReply(FreeReplyVO freeReplyInfo);
	public String selectRepPass(FreeReplyVO reply);

}
