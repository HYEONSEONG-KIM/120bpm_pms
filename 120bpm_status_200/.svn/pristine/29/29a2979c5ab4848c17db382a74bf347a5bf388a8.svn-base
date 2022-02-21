package kr.or.ddit.projectSetting.service;

import java.util.List;

import kr.or.ddit.accept.vo.ProjectMemVO;
import kr.or.ddit.enumtype.ServiceResult;
import kr.or.ddit.makeProject.vo.MakeProjectVO;
import kr.or.ddit.projectSetting.vo.WorkCategoryVO;

public interface ProjectUpdateService {

	/**
	 * 프로젝트 기본정보 수정
	 * @return
	 */
	public ServiceResult modifyProject(MakeProjectVO prtVO);

	/**
	 * 프로젝트 멤버 추가
	 * @return
	 */
	public ServiceResult addProjectMem(ProjectMemVO prtMem);

	/**
	 * 프로젝트 멤버 삭제
	 * @param prtMem
	 * @return
	 */
	public ServiceResult removePrtMem(ProjectMemVO prtMem);
	
	/**
	 * 한 회원당 프로젝트의 전체 게시글 갯수
	 * @param prtMem
	 * @return
	 */
	public List<Integer> prtMemBoardCnt(ProjectMemVO prtMem);
	
	/**
	 * 한회원 일감의 평균 진척도
	 * @param prtMem
	 * @return
	 */
	public int workAvgPrgs(ProjectMemVO prtMem);
	
	/**
	 * 카테고리별 완료, 진행, 신규에대한 시각화 자료
	 * @param category
	 * @param com
	 * @param pro
	 * @param newWork
	 */
	public void categoryGraph(int prtId ,List<String> category, List<Integer> com, List<Integer> pro, List<Integer> newWork,List<Integer> carCnt);
	
	/**
	 * 일감 카테고리별 진척도 평균
	 * @param prtId
	 * @return
	 */
	public List<WorkCategoryVO> prgsAvgList(int prtId);
	
	/**
	 * 일감 카테고리 생성
	 * @param categoryVO
	 * @return
	 */
	public ServiceResult createCategory(WorkCategoryVO categoryVO);
	
	/**
	 * 일감 카테고리 수정
	 * @param categoryVO
	 * @return
	 */
	public ServiceResult modifyCategory(WorkCategoryVO categoryVO);
	
	/**
	 * 프로젝트 회원 역할 수정
	 * @param prtMem
	 * @return
	 */
	public ServiceResult modifyMemRole(ProjectMemVO prtMem);
	
	/**
	 * 프로젝트 구성원의 활동량
	 * @param memList
	 * @param ActivityAvg
	 */
	public void prtMemActivityAvg(List<String> memList, List<Integer> activityAvg, int prtId);
}
