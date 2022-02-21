package kr.or.ddit.main.service;

import java.util.List;

import kr.or.ddit.makeProject.vo.MakeProjectPagingVO;
import kr.or.ddit.makeProject.vo.MakeProjectVO;
import kr.or.ddit.project.vo.ProjectVO;

public interface MyProjectsService {
	
	/**
	 * 프로젝트 리스트 조회
	 * @param paging
	 */
	public void retrieveProjectList(MakeProjectPagingVO<MakeProjectVO> paging);
}
