package kr.or.ddit.projectReport.service;

import java.util.List;

import kr.or.ddit.projectReport.vo.WorkPriorityVO;
import kr.or.ddit.projectSetting.vo.WorkCategoryVO;

public interface ProjectReportService {

	/**
	 * 프로젝트 카테고리의 일감우선순위 결과
	 * @param CategoryList
	 * @param priorityVO
	 */
	public List<WorkCategoryVO> prtCategoryReport(int prtId);
}
