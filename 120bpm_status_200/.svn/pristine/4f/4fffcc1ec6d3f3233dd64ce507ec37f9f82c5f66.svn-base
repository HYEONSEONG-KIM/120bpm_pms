package kr.or.ddit.mypage.service;

import kr.or.ddit.enumtype.ServiceResult;
import kr.or.ddit.mypage.vo.MyPagingVO;
import kr.or.ddit.mypage.vo.MyWorkBkmkVO;
import kr.or.ddit.mypage.vo.MyWorkVO;
import kr.or.ddit.pushMsg.vo.PushMsgVO;
import kr.or.ddit.pushMsg.vo.PushPagingVO;

public interface MypageService {
	
	public int retrieveMyProjectCount(String memId);
	
	public int retrieveMyWorkCount(String memId);
	
	public int retrieveDueTodayWork(String memId);
	
	public void retrievemyWorkList(MyPagingVO<MyWorkVO> pagingVO);

	public void retrieveWorkBkmkList(MyPagingVO<MyWorkVO> pagingVO);
	
	public ServiceResult removeBkmks(MyWorkBkmkVO bkmk);
	
	public void myPushList(PushPagingVO<PushMsgVO> paging);
	
	public ServiceResult allRemovePush(String memId);
	
	public ServiceResult oneRemovePush(int pushCode);
}
 