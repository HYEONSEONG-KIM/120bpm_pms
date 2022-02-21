package kr.or.ddit.notice.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.commons.exception.UserNotFoundExcpetion;
import kr.or.ddit.enumtype.ServiceResult;
import kr.or.ddit.notice.vo.NoticePagingVO;
import kr.or.ddit.notice.vo.NoticeVO;

public interface NoticeService {

	
	/**
	 * @param notiteCode 
	 * @return 존재하지 않는 경우, {@link UserNotFoundExcpetion}
	 */
	public NoticeVO retriveNoticeById(String noticeCode);

	public int retriveNoticeCount(NoticePagingVO<NoticeVO> noticePagingInfo);

	/**
	 * 
	 * @param 공지사항 목록 조회
	 * @return
	 */
	public List<NoticeVO> retriveNoticeList(NoticePagingVO<NoticeVO> noticePagingInfo);
	
	/**
	 * 
	 * @param noticeInfo
	 * @return 존재하지 않는 경우, {@link UserNotFoundExcpetion},
	 * 			fail
	 */
	public NoticeVO retriveNotice(int noticeCode);
    public  Map<String ,Object>  retrieveNoticeDetail(NoticeVO notice);

	/**
	 * 
	 * @param noticeInfo
	 * @return 존재하지 않는 경우, {@link UserNotFoundExcpetion},
	 * 			Invalidpassword, ok, fail
	 */
	
	public ServiceResult createNotice(NoticeVO noticeInfo);
	
	public ServiceResult modifyNotice(NoticeVO noticeInfo);
	
	public String removeNotice(String[] noticeCode , NoticeVO noticeInfo);
	

	public ServiceResult updateNotice(NoticeVO noticeInfo);

	
}
