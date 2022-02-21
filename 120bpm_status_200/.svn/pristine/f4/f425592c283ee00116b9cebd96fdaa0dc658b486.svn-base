package kr.or.ddit.projectReport.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.projectReport.dao.ProjectReportDAO;
import kr.or.ddit.projectReport.vo.WorkPriorityVO;
import kr.or.ddit.projectSetting.vo.WorkCategoryVO;
import kr.or.ddit.work.vo.WorkVO;

@Service
public class ProjectReportServiceImpl implements ProjectReportService {

	@Inject
	private ProjectReportDAO dao;
	
	@Override
	public List<WorkCategoryVO> prtCategoryReport(int prtId) {
		
		List<WorkCategoryVO> categoryList = dao.category(prtId);
		List<WorkVO> workList = dao.prtWork(prtId);
		
		for(WorkCategoryVO category : categoryList) {
			String cateCode = category.getCtgryCode();
			int em = 0, high = 0, mid = 0, low = 0;
			int sum = 0, cnt = 0;
			for(WorkVO work : workList) {
				if(work.getCtgryCode().equals(cateCode)) {
					sum += work.getWorkPrgsDgreePoint();
					cnt++;
					if(work.getWorkPriortCode().equals("W00201")) {
						em++;
					}else if(work.getWorkPriortCode().equals("W00202")) {
						high++;
					}else if(work.getWorkPriortCode().equals("W00203")) {
						mid++;
					}else if(work.getWorkPriortCode().equals("W00204")) {
						low++;
					}
				}
			}
			if(cnt != 0) {
				int prgsAvg = sum/cnt;
				category.setPrgsAvg(prgsAvg);
			}else {
				category.setPrgsAvg(0);
			}
			category.setWorkCnt(cnt);
			category.setEmergency(em);
			category.setHigh(high);
			category.setMiddle(mid);
			category.setLow(low);
		}
		
		return categoryList;
	}

	
}
