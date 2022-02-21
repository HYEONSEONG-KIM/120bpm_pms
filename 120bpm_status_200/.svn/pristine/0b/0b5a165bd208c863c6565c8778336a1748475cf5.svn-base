package kr.or.ddit.makeProject.service;

import java.util.List;

import kr.or.ddit.accept.vo.AcceptMemPagingVO;
import kr.or.ddit.accept.vo.AcceptMemberVO;
import kr.or.ddit.enumtype.ServiceResult;
import kr.or.ddit.makeProject.vo.MakeProjectPagingVO;
import kr.or.ddit.makeProject.vo.MakeProjectVO;
import kr.or.ddit.project.vo.ProjectVO;

public interface MakeProjectService {
	
	/**
	 * 프로젝트 리스트 조회
	 * @param paging
	 */
	public void retrieveProjectList(MakeProjectPagingVO<MakeProjectVO> paging);
	
	/**
	 * 프로젝트 메뉴별 게시글 갯수 조회
	 * @param prtId
	 * @return
	 */
	public List<Integer> projectMenuCnt(int prtId);
	
	/**
	 * 프로젝트 리스트 조회
	 * @return
	 */
	public List<ProjectVO> projectList();

	/**
	 * 프로젝트 멤버 조회
	 * @return
	 */
	public void memList(AcceptMemPagingVO<AcceptMemberVO> paging);
	
	/**
	 * 프로젝트 생성
	 * @return
	 */
	public ServiceResult createProject(MakeProjectVO prtVO, boolean check);
	
	/**
	 * 자식 프로젝트 리스트
	 * @param prtList
	 * @return
	 */
	public List<MakeProjectVO> childProjectList(int prtId);
	
	/**
	 * 프로젝트 삭제
	 * @param prtId
	 * @return
	 */
	public ServiceResult removeProject(int prtId);
	
}
