package kr.or.ddit.main.service;

import java.util.List;

import kr.or.ddit.main.vo.MyBoardVO;
import kr.or.ddit.main.vo.MyIssueVO;
import kr.or.ddit.mypage.vo.MyWorkBkmkVO;
import kr.or.ddit.mypage.vo.MyWorkVO;

public interface CustomMenuService {
	
	/**
	 * 프로젝트별 내 일감 조회
	 * @param work
	 * @return
	 */
	public List<MyWorkVO> retrieveMyPrjctWorkList(MyWorkVO work);
	
	/**
	 * 프로젝트별 즐겨찾기 일감 조회
	 * @param bkmk
	 * @return
	 */
	public List<MyWorkVO> retrieveMyPrjctWorkBkmkList(MyWorkBkmkVO bkmk);
	
	/**
	 * 프로젝트별 최근 뉴스 조회
	 * @param prjctNo
	 * @return
	 */
	public MyBoardVO retrievePrjctCurNews(int prjctNo);
	
	/**
	 * 프로젝트별 최근 위키 조회
	 * @param prjctNo
	 * @return
	 */
	public MyBoardVO retrievePrjctCurWiki(int prjctNo);

	/** 
	 * 프로젝트별 최근 이슈 조회
	 * @param prjctNo
	 * @return
	 */
	public MyIssueVO retrievePrjctCurIssue(int prjctNo);
}
