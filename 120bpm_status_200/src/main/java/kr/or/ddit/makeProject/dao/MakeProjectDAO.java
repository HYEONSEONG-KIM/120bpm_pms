package kr.or.ddit.makeProject.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.accept.vo.AcceptMemPagingVO;
import kr.or.ddit.accept.vo.AcceptMemberVO;
import kr.or.ddit.accept.vo.ProjectMemVO;
import kr.or.ddit.makeProject.vo.MakeProjectPagingVO;
import kr.or.ddit.makeProject.vo.MakeProjectVO;
import kr.or.ddit.project.vo.ProjectVO;
import kr.or.ddit.wiki.vo.BoardVO;
import kr.or.ddit.work.vo.WorkVO;

@Mapper
public interface MakeProjectDAO {
	
	/**
	 * 총 레코드 수 조회
	 * @param paging
	 * @return
	 */
	public int totalRecord(MakeProjectPagingVO<MakeProjectVO> paging);
	
	/**
	 * 프로젝트 리스트 조회
	 * @param paging
	 * @return
	 */
	public List<MakeProjectVO> selectProjectList(MakeProjectPagingVO<MakeProjectVO> paging);
	
	/**
	 * 총 레코드수 조회(검색 조건 회원)
	 * @param paging
	 * @return
	 */
	public int totalRecordFindMem(MakeProjectPagingVO<MakeProjectVO> paging);
	
	/**
	 * 프로젝트 리스트 조회(검색 조건 회원)
	 * @param paging
	 * @return
	 */
	public List<MakeProjectVO> selectProjectListFindMem(MakeProjectPagingVO<MakeProjectVO> paging);
	
	/**
	 * 프로젝트 상세 조회(프로젝트 정보 조회)
	 * @param prtId
	 * @return
	 */
	public MakeProjectVO selectProject(int prtId);
	
	/**
	 * 프로젝트 상세 조회(프로젝트 멤버 조회)
	 * @param prtId
	 * @return
	 */
	public List<ProjectMemVO> selectPrtMem(int prtId);
	
	/**
	 * 한 프로젝트 당 게시글 개수 알아내기 위한 리스트 조회
	 * @return
	 */
	public List<BoardVO> selectBaordList(int prtId);
	
	/**
	 * 한 프로젝트 당 일감 갯수 알아내기 위한 리스트 조회
	 * @return
	 */
	public List<WorkVO> selectWorkList(int prtId);
	
	/**
	 * 
	 * @param prtId
	 * @return
	 */
	public int selectIssueCnt(int prtId);
	
	/**
	 * 프로젝트 리스트 조회
	 * @return
	 */
	public List<ProjectVO> selectProjectListForm();
	
	/**
	 * 회원 레코드수 조회
	 * @param paging
	 * @return
	 */
	public int totlaMemRecord(AcceptMemPagingVO<AcceptMemberVO> paging);
	
	/**
	 * 회원 목록 조회
	 * @return
	 */
	public List<AcceptMemberVO> selectMemList(AcceptMemPagingVO<AcceptMemberVO> paging);
	
	/**
	 * 프로젝트 생성
	 * @param prtVO
	 * @return
	 */
	public int insertProject(MakeProjectVO prtVO);
	
	/**
	 * 프로젝트 생성 후 PM 및 상위 프로젝트 멤버 상속시 추가
	 * @param prtMemVO
	 * @return
	 */
	public int insertProjectMem(List<ProjectMemVO> prtMemVO);
	
	/**
	 * 자식 프로젝트 리스트 조회
	 * @return
	 */
	public List<MakeProjectVO> childProjectList(int prtId);
	
	/**
	 * 프로젝트 삭제
	 * @param prtId
	 * @return
	 */
	public int deleteProject(@Param("prtIdList") List<Integer> prtIdList);
	
	/**
	 * 마감된 프로젝트 회원조회
	 * @param prtId
	 * @return
	 */
	public List<ProjectMemVO> endPrtMemList(int prtId);
	
	
}
