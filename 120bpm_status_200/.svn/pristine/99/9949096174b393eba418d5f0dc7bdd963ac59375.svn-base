package kr.or.ddit.notice.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.notice.vo.NoticePagingVO;
import kr.or.ddit.notice.vo.NoticeVO;


@Mapper
public interface NoticeDAO {

	public int selectTotalRecord(NoticePagingVO<NoticeVO> noticePagingInfo);
		
	
	/**
	 * 공지사항목록조회
	 * @param pagingVO  = memberPagingInfo
	 * @return 없으면 size==0
	 */
	public List<NoticeVO> selectNoticeList(NoticePagingVO<NoticeVO> noticePagingInfo);
	public NoticeVO selectNoticeById(String noticeCode);

	
	public int insertNotice(NoticeVO noticeInfo);
	
	

	public NoticeVO selectNoticeDetailView(NoticeVO noticeInfo);
	public NoticeVO selectNotice(int noticeCode);
	
	/**
	 * 조회수 증가
	 * @param noticeRdcnt
	 * @return
	 */
	public int incrementHit(int noticeRdcnt);
	
	public int updateNotice(NoticeVO noticeVO);
	
 	public int deleteNoticeInfo(String noticeCode);
}
