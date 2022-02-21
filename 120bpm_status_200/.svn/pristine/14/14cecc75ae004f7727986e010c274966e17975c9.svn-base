package kr.or.ddit.mypage.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.enumtype.ServiceResult;
import kr.or.ddit.mypage.dao.MypageDAO;
import kr.or.ddit.mypage.vo.MyPagingVO;
import kr.or.ddit.mypage.vo.MyWorkBkmkVO;
import kr.or.ddit.mypage.vo.MyWorkVO;
import kr.or.ddit.pushMsg.vo.PushMsgVO;
import kr.or.ddit.pushMsg.vo.PushPagingVO;

@Service 
public class MypageServiceImpl implements MypageService {
	@Inject
	private MypageDAO dao;
	
	@Override
	public int retrieveMyProjectCount(String memId) {
		int count = dao.selectMyProjectCount(memId);
		return count;
	}

	@Override
	public int retrieveMyWorkCount(String memId) {
		int count = dao.selectMyWorkCount(memId);
		return count;
	}

	@Override
	public int retrieveDueTodayWork(String memId) {
		int count = dao.duetodaywork(memId);
		return count;
	}
 
	@Override
	public void retrievemyWorkList(MyPagingVO<MyWorkVO> pagingVO) {
		int totalRecord = dao.selectTotalRecord(pagingVO);
		pagingVO.setTotalRecord(totalRecord);
		List<MyWorkVO> dataList = dao.selectMyWorkList(pagingVO);
		pagingVO.setDataList(dataList); 
	}

	@Override
	public void retrieveWorkBkmkList(MyPagingVO<MyWorkVO> pagingVO) {
		int totalRecord = dao.selectTotalRecord2(pagingVO);
		pagingVO.setTotalRecord(totalRecord);
		List<MyWorkVO> dataList = dao.selectWorkBkmkList(pagingVO); 
		pagingVO.setDataList(dataList); 
	}

	@Override 
	@Transactional
	public ServiceResult removeBkmks(MyWorkBkmkVO bkmk) {
		ServiceResult result = ServiceResult.FAIL;
		String[] delWorkCodes = bkmk.getDelWorkCodes(); 
		if(delWorkCodes == null || delWorkCodes.length == 0) return result = ServiceResult.OK;
		int cnt = dao.deleteWorkBkmks(bkmk);
		if(cnt > 0) {
			result = ServiceResult.OK;
		} 
		return result;
	}

	@Override
	public void myPushList(PushPagingVO<PushMsgVO> paging) {
		
		int totalRecord = dao.totalPushMsgRecord(paging);
		List<PushMsgVO> pushList = dao.myPushMsgList(paging);
		
		paging.setTotalPage(totalRecord);
		paging.setDataList(pushList);
		
	}

	@Override
	public ServiceResult allRemovePush(String memId) {
		
		ServiceResult result = null;
		
		int rowCnt = dao.deleteAllPush(memId);
		
		if(rowCnt > 0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAIL;
		}
		
		return result;
	}

	@Override
	public ServiceResult oneRemovePush(int pushCode) {
		
		ServiceResult result = null;
		
		int rowCnt = dao.deleteOnePush(pushCode);
		
		if(rowCnt > 0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAIL;
		}
		
		return result;
	}

}
