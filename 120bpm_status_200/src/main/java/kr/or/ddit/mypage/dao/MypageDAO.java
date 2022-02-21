package kr.or.ddit.mypage.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.mypage.vo.MyPagingVO;
import kr.or.ddit.mypage.vo.MyWorkBkmkVO;
import kr.or.ddit.mypage.vo.MyWorkVO;
import kr.or.ddit.pushMsg.vo.PushMsgVO;
import kr.or.ddit.pushMsg.vo.PushPagingVO;

/**
 * @author PC-12
 * 마이페이지 RD 
 */
@Mapper
public interface MypageDAO {
	 
	/** 
	 * 사용자가 참여,진행중인 프로젝트 개수 조회
	 * @param memId
	 * @return  프로젝트 개수
	 */
	public int selectMyProjectCount(String memId);
	
	/**
	 * 사용자가 진행중인 일감 개수 조회
	 * @param memId
	 * @return 일감 개수
	 */
	public int selectMyWorkCount(String memId);
	
	/**
	 * 오늘 마감인 사용자의 일감 개수 조회
	 * @param memId
	 * @return 일감 개수 
	 */
	public int duetodaywork(String memId);
	
	/**
	 * 내 일감의 totalRecord 조회
	 * @param pagingVO
	 * @return totalRecord 수
	 */
	public int selectTotalRecord(MyPagingVO<MyWorkVO> pagingVO);
	 
	/**
	 * 내 일감 목록 조회 (페이징)
	 * @param pagingVO
	 * @return 없으면 size == 0
	 */
	public List<MyWorkVO> selectMyWorkList(MyPagingVO<MyWorkVO> pagingVO);

	/** 내 즐겨찾기 일감의 totalRecord 조회
	 * @param pagingVO
	 * @return  totalRecord 수
	 */
	public int selectTotalRecord2(MyPagingVO<MyWorkVO> pagingVO);
	
	/**
	 * 내 즐겨찾기 일감 목록 조회 (페이징)
	 * @param pagingVO
	 * @return 없으면 size == 0
	 */
	public List<MyWorkVO> selectWorkBkmkList(MyPagingVO<MyWorkVO> pagingVO);
	
	/**
	 * 내 즐겨찾기 일감 삭제 (즐겨찾기 해제)
	 * @param bkmk 사용자Id와 일감코드들을 담은 VO 
	 * @return > 0 성공
	 */
	public int deleteWorkBkmks(MyWorkBkmkVO bkmk);
	
	/**
	 * 푸쉬알림 테이블 전체레코드 조회
	 * @param paging
	 * @return
	 */
	public int totalPushMsgRecord(PushPagingVO<PushMsgVO> paging);
	
	/**
	 * 내 푸시알림 리스트조회
	 * @param memId
	 * @return
	 */
	public List<PushMsgVO> myPushMsgList(PushPagingVO<PushMsgVO> paging);
	
	/**
	 * 내푸쉬알림 전체 삭제
	 * @param memId
	 * @return
	 */
	public int deleteAllPush(String memId);
	
	/**
	 * 내 푸쉬알림 한건 삭제
	 * @param pushCode
	 * @return
	 */
	public int deleteOnePush(int pushCode);

}
