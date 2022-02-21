package kr.or.ddit.projectSetting.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.accept.vo.AcceptMemberVO;
import kr.or.ddit.accept.vo.ProjectMemVO;
import kr.or.ddit.makeProject.vo.MakeProjectVO;
import kr.or.ddit.projectSetting.vo.TimeLineVO;
import kr.or.ddit.projectSetting.vo.WorkCategoryVO;
import kr.or.ddit.security.vo.AuthorityVO;
import kr.or.ddit.wiki.vo.BoardVO;
import kr.or.ddit.work.vo.WorkVO;

@Mapper
public interface ProjectUpdateDAO {

	/**
	 * 프로젝트 수정 form을 구성하기 위해 조회
	 * @return
	 */
	public MakeProjectVO selectProject(int prtId);

	/**
	 * 프로젝트 기본정보 수정
	 * @param prtVO
	 * @return
	 */
	public int updateBasicInfo(MakeProjectVO prtVO);
	
	/**
	 * 전체 역할 조회
	 * @return
	 */
	public List<AuthorityVO> selectAllRole();
	
	/**
	 * 프로젝트 멤버 리스트 조회
	 * @param prtId
	 * @return
	 */
	public List<ProjectMemVO> projectMemList(int prtId);
	
	/**
	 * 현재 프로젝트의 구성원을 제외한 나머지 회원 조회
	 * @param prtId
	 * @return
	 */
	public List<AcceptMemberVO> memList(int prtId);
	
	/**
	 * 프로젝트 구성원 추가
	 * @param prtMem
	 * @return
	 */
	public int addProjectMem(ProjectMemVO prtMem);
	
	/**
	 * 프로젝트 구성원 삭제
	 * @param prtMem
	 * @return
	 */
	public int deletePrtMem(ProjectMemVO prtMem);
	
	/**
	 * 프로젝트 구성원 상세 정보
	 * @param ptrMem
	 * @return
	 */
	public ProjectMemVO prtMemDetail(ProjectMemVO prtMem);
	
	/**
	 * 한 회원의 일감 등록 갯수 및 일감 진척도 평균을 구하기 위한 일감 조회
	 * @param ptrMem
	 * @return
	 */
	public List<WorkVO> workList(ProjectMemVO prtMem);
	
	/**
	 * 한 회원의 이슈 등록 갯수
	 * @param prtMem
	 * @return
	 */
	public int issueCnt(ProjectMemVO prtMem);

	/**
	 * 한 회원의 게시글 등록 리스트
	 * @param prtMem
	 * @return
	 */
	public List<BoardVO> boardList(ProjectMemVO prtMem);
	
	/**
	 * 한 프로젝트에 해당하는 일감 카테고리 조회
	 * @param prtId
	 * @return
	 */
	public List<WorkCategoryVO> categoryList(int prtId); 
	
	/**
	 * 한 프로젝트의 전체 일감 가져오기
	 * @param prtId
	 * @return
	 */
	public List<WorkVO> projectWorkList(int prtId);
	
	/**
	 * 카테고리 이름 중복 체크
	 * @param prtId
	 * @return
	 */
	public List<String> duplNameCheck(int prtId);
	
	/**
	 * 카테고리 추가
	 * @param category
	 * @return
	 */
	public int addCategory(WorkCategoryVO category);
	
	/**
	 * 카테고리 수정
	 * @param category
	 * @return
	 */
	public int updateCategory(WorkCategoryVO category);
	
	/**
	 * 프로젝트 회원 역할 수정
	 * @param prtMem
	 * @return
	 */
	public int updateMemRole(ProjectMemVO prtMem);
	
	/**
	 * 타임라인 리스트 조회
	 * @param prtId
	 * @return
	 */
	public List<TimeLineVO> timeLineList(int prtId);
	
	/**
	 * 프로젝트 이름 조회
	 * @param prtId
	 * @return
	 */
	public String prtNm(int prtId);
}
