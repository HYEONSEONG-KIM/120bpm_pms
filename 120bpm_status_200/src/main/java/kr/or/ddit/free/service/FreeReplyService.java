package kr.or.ddit.free.service;

import java.util.List;

import kr.or.ddit.enumtype.ServiceResult;
import kr.or.ddit.free.vo.FreePagingVO;
import kr.or.ddit.free.vo.FreeReplyVO;

public interface FreeReplyService {
	public ServiceResult createReply(FreeReplyVO freeReplyInfo);
	public List<FreeReplyVO> readReplyList(FreePagingVO<FreeReplyVO> freePagingInfo);
	public ServiceResult modifyReply(FreeReplyVO freeReplyInfo);
	public ServiceResult removeReply(FreeReplyVO freeReplyInfo);
}
