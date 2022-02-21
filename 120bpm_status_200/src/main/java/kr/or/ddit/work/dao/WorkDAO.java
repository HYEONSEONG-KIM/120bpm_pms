package kr.or.ddit.work.dao;

import java.util.List;
import java.util.Map;
import java.util.Observer;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.member.vo.PagingVO;
import kr.or.ddit.work.vo.CommonVO;
import kr.or.ddit.work.vo.ExtendPagingVO;
import kr.or.ddit.work.vo.ObserverVO;
import kr.or.ddit.work.vo.WCartegoryVO;
import kr.or.ddit.work.vo.WorkBkmkVO;
import kr.or.ddit.work.vo.WorkAuthVO;
import kr.or.ddit.work.vo.WorkParentVO;
import kr.or.ddit.work.vo.WorkVO;

@Mapper
public interface WorkDAO {
	
	// 각 프로젝트의 모든 일감 리스트
	public List<WorkVO> selectAllWork(PagingVO<WorkVO> pagingVO);
	//숫자  조회
	public int selectWorkCount(PagingVO<WorkVO> pagingVO);
	//카테고리
	public List<WCartegoryVO> selectCartegory(Integer pCode);
	
	//내 일감 조회하기 -- 내 일감의 승인 반려 상태가 나와야 함 
	public List<WorkVO> selectMyWork(PagingVO<WorkVO> pagingVO);
    //내일감의 수 조회
	public int selectMyWorkCount(PagingVO<WorkVO> pagingVO);
	
	//일반 코드 얻는 메서드
	public List<CommonVO> selectCommonCode(String clCode);
	
	public WorkVO selectMyWorkCheck(WorkVO workVO);
	
	//내 일감의 퍼센트 얻는 함수 
	public List<WorkVO> selectMyWorkPercent(WorkVO workVO);
	
	//내 일감의 등록월에 따른 퍼센트 
	
	public List<WorkVO> selectMyWorkPerMonth(WorkVO workVO);
	
	 
	//즐겨찾기 일감
	public List<WorkVO> selecBookMarkWork(PagingVO<WorkVO> pagingVO);
	
	//즐겨찾기 일감 수 
	public int selectBookMarkWorkCount(PagingVO<WorkVO> pagingVO);
	//즐겨찾기 일감 삭제
	public int deleteBookMarkWork(WorkBkmkVO bkmkVO);
	//즐겨찾기 일감 추가
	public int insertBookMarkWork(WorkBkmkVO bkmkVO);
	
	
	public WorkBkmkVO selectBookMarkCheck(WorkBkmkVO bkmkVO);
	
	//일감 디테일 하게 보기 
	public WorkVO selectWorkDetailView(WorkVO workVO);
	//일감 댓글 조회 
	
	public WorkVO selectWorkDetail(WorkVO workVO);
	//일감 트리구조로 조회하기 
	
	public  List<WorkParentVO>  selectUpperWork(WorkVO workVO);
	
	//일감 인서트 
	public int insertWork(WorkVO workVO);
	
	//진척도 수정
	public int updateDegree(WorkVO workVO);
	
	//아이디나 비번 일감 있는지 여부 체크용
	public WorkVO checkWork(String workCode);
	
	public int updateWork(WorkVO workVO);
	
	public List<WorkVO> autoComplete(WorkVO workVO);
	//pm인지 체크
	public WorkAuthVO selectProjectPM(WorkVO workVO);
	
	public List<ObserverVO> selectWorkObserver(WorkVO workVO);
	
	public int updateWorkReqStatus(WorkVO workVO);
	
 	public List<ObserverVO> selectAllProjectMem(WorkVO workVO);
	
 	public int insertAllObserver(@Param(value="observerList")List<ObserverVO> observerList);
 	
 	//게시글 삭제 
 	public int deleteWorkInfo(String workCode);
 	
 	public int deleteAllObserver(WorkVO workVO);
 	
 	
 	//일감요청상태에 따라 확인 
 	public List<WorkVO> selectAllPeqList(ExtendPagingVO<WorkVO> pagingVO);
 	public int selectAllPeqTotal(ExtendPagingVO<WorkVO> pagingVO);
 	public int updateReqStatus(WorkVO workVO);
 	public WorkAuthVO selectWorkManInfo(String workCode);
 	
 	 public int updateAllAccept(WorkVO workVO);
 	//===========================================PM
 	
 	public int selectWorkCountBySttus(WorkVO workVO);
 	
 	
 	
}
