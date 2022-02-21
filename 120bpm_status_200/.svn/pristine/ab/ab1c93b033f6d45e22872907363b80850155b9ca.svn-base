package kr.or.ddit.free.service;

import java.util.List;

import javax.inject.Inject;

import org.apache.commons.lang3.StringUtils;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import kr.or.ddit.enumtype.ServiceResult;
import kr.or.ddit.free.dao.FreeReplyDAO;
import kr.or.ddit.free.vo.FreePagingVO;
import kr.or.ddit.free.vo.FreeReplyVO;

@Service
public class FreeReplyServiceImpl implements FreeReplyService {

//	@Inject
//	private FreeReplyDAO repDAO;
//	
	@Inject
	private FreeReplyDAO replyDAO;
	@Inject
	private PasswordEncoder passwordEncoder;

	private void encryptPassword(FreeReplyVO reply) {
	 	String inputPass = reply.getRepPass();
	 	if(StringUtils.isNotBlank(inputPass)) {
	 		reply.setRepPass(passwordEncoder.encode(inputPass));
	 	}
	}
	
	@Override
	public ServiceResult createReply(FreeReplyVO reply) {
		encryptPassword(reply);
		int rowcnt = replyDAO.insertReply(reply);
		return rowcnt > 0 ? ServiceResult.OK : ServiceResult.FAIL;
	}

	@Override
	public List<FreeReplyVO> readReplyList(FreePagingVO<FreeReplyVO> pagingVO) {
		int totalRecord = replyDAO.selectTotalRecord(pagingVO);
		pagingVO.setTotalRecord(totalRecord);
		List<FreeReplyVO> dataList = replyDAO.selectReplyList(pagingVO);
		pagingVO.setDataList(dataList);
		return dataList;
	}

	@Override
	public ServiceResult modifyReply(FreeReplyVO reply) {
		String saved = replyDAO.selectRepPass(reply);
		ServiceResult result = ServiceResult.INVALIDPASSWORD;
		if(passwordEncoder.matches(reply.getRepPass(), saved)) {
			int rowcnt = replyDAO.updateReply(reply);
			result = rowcnt > 0 ? ServiceResult.OK : ServiceResult.INVALIDPASSWORD;
		}
		return result;
	}

	@Override
	public ServiceResult removeReply(FreeReplyVO reply) {
		String saved = replyDAO.selectRepPass(reply);
		ServiceResult result = ServiceResult.INVALIDPASSWORD;
		if(passwordEncoder.matches(reply.getRepPass(), saved)) {
			int rowcnt = replyDAO.deleteReply(reply);
			result = rowcnt > 0 ? ServiceResult.OK : ServiceResult.INVALIDPASSWORD;
		}
		return result;
	}
	
}
	
	
	
	
	
	
	
	
	
	
	
	
	
//	
//	@Override
//	public ServiceResult createReply(FreeReplyVO freeReplyInfo) {
//		ServiceResult result = ServiceResult.FAIL;
//		int rowcnt = repDAO.insertReply(freeReplyInfo);
//		return result;
//	}
//
//	@Override
//	public List<FreeReplyVO> readReplyList(FreePagingVO<FreeReplyVO> freePagingInfo) {
//		int totalRecord = repDAO.selectTotalRecord(freePagingInfo);
//		freePagingInfo.setTotalRecord(totalRecord);
//		List<FreeReplyVO> repList = repDAO.selectReplyList(freePagingInfo);
//		freePagingInfo.setDataList(repList);
//		
//		return repList;
//	}
//
//	@Override
//	public String modifyReply(FreeReplyVO freeReplyInfo) {
//		String result = "FAIL";
//		FreeReplyVO saved = repDAO.selectFreeRepInfo(freeReplyInfo);
//		if(saved.getMemId().equals(freeReplyInfo.getMemId())) {
//				int cnt = repDAO.updateReply(freeReplyInfo);
//				if(cnt>0)  result = "OK";
//		}else {
//			result = "NOTWRITER";
//		}
//				return result;
//	}
//
//	@Override
//	public String removeReply(FreeReplyVO freeReplyInfo) {
//		String result = "FAIL";
//		FreeReplyVO saved = repDAO.selectFreeRepInfo(freeReplyInfo);
//		if(saved.getMemId().equals(freeReplyInfo.getMemId())) {
//			int cnt = repDAO.deleteReply(freeReplyInfo);
//			if(cnt>0)  result = "OK";
//		}else {
//			result = "NOTWRITER";
//		}
//				return result;
//		
//	}		
//
//}
