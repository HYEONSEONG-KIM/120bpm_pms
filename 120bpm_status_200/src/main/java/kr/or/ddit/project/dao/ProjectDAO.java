package kr.or.ddit.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.member.vo.PagingVO;
import kr.or.ddit.project.vo.ProjectVO;

@Mapper
public interface ProjectDAO {

	public int selectTotalRecord(PagingVO<ProjectVO> projectPaingInfo);
	
	/**
	 * 프로젝트 목록 조회
	 * @param AceeptMemPagingVO = projectPagingInfo
	 */
	
	public List<ProjectVO> selectProjectList(PagingVO<ProjectVO> projectPaingInfo);
	
	public ProjectVO selectProjectDetail(String prjctNo);
	
}
