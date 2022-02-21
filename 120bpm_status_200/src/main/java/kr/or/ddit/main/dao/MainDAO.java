package kr.or.ddit.main.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.main.vo.MainNoticeVO;
import kr.or.ddit.main.vo.MyBoardVO;
import kr.or.ddit.main.vo.MyPrjctMemVO;
import kr.or.ddit.main.vo.MyProjectVO;
import kr.or.ddit.mypage.vo.MyWorkVO;

@Mapper
public interface MainDAO {
	//사용자 main 내프로젝트
	public List<MyProjectVO> selectMyProjectList(String memId);
	
	
	//사용자 main 공지사항 
	public List<MainNoticeVO> selectNoticeList();
	
	//프로젝트 main 
	public MyProjectVO selectMyProject(MyPrjctMemVO prjct);
	
	/**
	 * 관리자 메인 월별 프로젝트 등록 수 조회
	 * @return
	 */
	public List<MyProjectVO> selectMyPrjctRegCnts();
	
	/**
	 * 진행 상태별 프로젝트 수 조회
	 * @return
	 */
	public MyProjectVO selectPrjctSttsCount();
	
	/**
	 * 프로젝트 일감유형에 따른 상태별 일감개수
	 * @param work prjctNo, ctgryCode(필수아님)  
	 * @return
	 */
	public MyWorkVO selectWorkCounts(MyWorkVO work);
	
	/**
	 * 상태별 내 일감개수
	 * @param memId
	 * @return
	 */
	public List<MyWorkVO> selectMyWorkCounts(String memId);
	
	/**
	 * 프로젝트 구성원 목록 조회
	 * @param prjct
	 * @return 
	 */
	public List<MyPrjctMemVO> selectMyPrjctMems(MyPrjctMemVO prjct);
	
	/**
	 * 일감 유형 목록 조회
	 * @param prjctNo
	 * @return
	 */
	public List<MyWorkVO> selectMyWorkCtgrys(int prjctNo);
	
	/**
	 * 가장 최근 뉴스 조회
	 * @param prjctNo
	 * @return
	 */
	public MyBoardVO selectCurNews(String memId);
	
	/**
	 * 프로젝트의 일감 평균 진척도
	 * @return
	 */
	public int selectWorkAvg(int prtId);
	
	/**
	 * 프로젝트 회원 리스트
	 * @param prtId
	 * @return
	 */
	public List<MyPrjctMemVO> endPrtMemList(int prtId);
	
	

}
