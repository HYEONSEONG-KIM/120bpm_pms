package kr.or.ddit.projectReport.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.makeProject.vo.MakeProjectVO;
import kr.or.ddit.projectSetting.vo.WorkCategoryVO;
import kr.or.ddit.work.vo.WorkVO;

@Mapper
public interface ProjectReportDAO {

	/**
	 * 프로젝트 정보 조회
	 * @return
	 */
	public MakeProjectVO selectProject();
	
	/**
	 * 한프로젝트의 일감 카테고리 조회
	 * @param prtId
	 * @return
	 */
	public List<WorkCategoryVO> category(int prtId);
	
	/**
	 * 한 프로젝트의 모든 일감 조회
	 * @param prtId
	 * @return
	 */
	public List<WorkVO> prtWork(int prtId);

}
