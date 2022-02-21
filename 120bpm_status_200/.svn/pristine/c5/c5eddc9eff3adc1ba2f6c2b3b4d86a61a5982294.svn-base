package kr.or.ddit.main.service;

import java.util.List;

import kr.or.ddit.main.vo.MainNoticeVO;
import kr.or.ddit.main.vo.MyBoardVO;
import kr.or.ddit.main.vo.MyPrjctMemVO;
import kr.or.ddit.main.vo.MyProjectVO;
import kr.or.ddit.mypage.vo.MyWorkVO;


public interface MainService {

	/**
	 * 내 프로젝트 목록 조회
	 * @param memId
	 * @return
	 */
	public List<MyProjectVO> retrieveMyProjectList(String memId);
	
	/**
	 * 공지사항 목록 조회
	 * @return
	 */
	public List<MainNoticeVO> retrieveNoticeList();
	 
	/**
	 * 내 프로젝트 조회
	 * @param prjct
	 * @return
	 */
	public MyProjectVO retrieveMyProject(MyPrjctMemVO prjct);
	
	/**
	 * 프로젝트 일감유형에 따른 상태별 일감개수 조회
	 * @param work
	 * @return
	 */
	public MyWorkVO retrieveWorkCounts(MyWorkVO work);
	
	/**
	 * 상태별 내 일감개수
	 * @param memId
	 * @return
	 */
	public List<MyWorkVO> retrieveMyWorkCounts(String memId);
	
	/**
	 * 프로젝트 구성원 목록 조회
	 * @param prjct
	 * @return
	 */
	public List<MyPrjctMemVO> retrieveMyPrjctMems(MyPrjctMemVO prjct);
	
	/**
	 * 일감 유형 목록 조회
	 * @param prjctNo
	 * @return
	 */
	public List<MyWorkVO> retrieveMyWorkCtgrys(int prjctNo);
	
	/**
	 * 가장 최근 뉴스 조회
	 * @param memId
	 * @return
	 */
	public MyBoardVO retrieveCurNews(String memId);
	
	/**
	 * 관리자 메인 월별 프로젝트 등록 수 조회
	 * @return
	 */
	public List<MyProjectVO> retrieveMyPrjctRegCnts();
	
	/**
	 * 진행 상태별 프로젝트 수 조회
	 * @return
	 */
	public MyProjectVO retrievePrjctSttsCount();
	
	/**
	 * 마감된 프로젝트 회원 조회
	 * @param prtId
	 * @return
	 */
	public List<MyPrjctMemVO> endPrtMemList(int prtId);
}
 