package kr.or.ddit.projectSetting.service;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.accept.vo.ProjectMemVO;
import kr.or.ddit.enumtype.ServiceResult;
import kr.or.ddit.makeProject.vo.MakeProjectVO;
import kr.or.ddit.projectSetting.dao.ProjectUpdateDAO;
import kr.or.ddit.projectSetting.vo.TimeLineVO;
import kr.or.ddit.projectSetting.vo.WorkCategoryVO;
import kr.or.ddit.wiki.vo.BoardVO;
import kr.or.ddit.work.vo.WorkVO;

@Service
public class ProjectUpdateServiceImpl implements ProjectUpdateService{

	@Inject
	private ProjectUpdateDAO dao;
	

	@Override
	@Transactional
	public ServiceResult modifyProject(MakeProjectVO prtVO) {
		ServiceResult result = null;
		
		int rowCnt = dao.updateBasicInfo(prtVO);
		
		if(rowCnt > 0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAIL;
		}
		return result;
	}


	@Override
	public ServiceResult addProjectMem(ProjectMemVO prtMem) {

		ServiceResult result = null;
		String prtNm = dao.prtNm(prtMem.getPrjctNo());
		prtMem.setPrjctNm(prtNm);
		
		int rowCnt = dao.addProjectMem(prtMem);
		if(rowCnt > 0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAIL;
		}
		return result;
	}


	@Override
	public ServiceResult removePrtMem(ProjectMemVO prtMem) {
		
		ServiceResult result = null;
		String prtNm = dao.prtNm(prtMem.getPrjctNo());
		prtMem.setPrjctNm(prtNm);
		
		int rowCnt = dao.deletePrtMem(prtMem);
		
		if(rowCnt > 0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAIL;
		}
		
		return result;
	}


	@Override
	public List<Integer> prtMemBoardCnt(ProjectMemVO prtMem) {
		
		List<Integer> boardCnt = new ArrayList<Integer>();
		
		List<WorkVO> workList = dao.workList(prtMem);
		int issueCnt = dao.issueCnt(prtMem);
		List<BoardVO> boardList = dao.boardList(prtMem);
		String[] menuList = {"NE", "WK", "FR"};
		
		boardCnt.add(workList.size());
		boardCnt.add(issueCnt);
		
		for(String menu : menuList) {
			int cnt = 0;
			for(BoardVO board : boardList) {
				if(board.getMenuClCode().equals(menu)) {
					cnt++;
				}
			}
			boardCnt.add(cnt);
		}
		
		return boardCnt;
	}


	@Override
	public int workAvgPrgs(ProjectMemVO prtMem) {
		
		int avg = 0;
		int total = 0;
		List<WorkVO> workList = dao.workList(prtMem);
		if(workList.size() != 0) {
			for(WorkVO work : workList) {
				total += work.getWorkPrgsDgreePoint();
			}
			avg = total/workList.size();
		}
		return avg;
	}


	@Override
	public void categoryGraph(int prtId, List<String> category, List<Integer> com, List<Integer> pro, List<Integer> newWork, List<Integer> carCnt) {
		// 한프로젝트의 일감 리스트 조회
		List<WorkVO> workList = dao.projectWorkList(prtId);
		// 한프로젝트의 카테고리 조회
		List<WorkCategoryVO> categoryList = dao.categoryList(prtId);
		
		String[] workState = {"W00101", "W00102", "W00103"};
		String[] categoryArr = new String[categoryList.size()];
		
		int cnt = 0;
		for(WorkCategoryVO vo : categoryList) {
			String code = vo.getCtgryCode();
			String name = "'" + vo.getCtgryNm() + "'";
			categoryArr[cnt] = code;
			cnt++;
			category.add(name);
		}
		
		for(String cartegoryStr : categoryArr) {
			int complate = 0; int proceed =0; int newWK = 0;
			int cateCnt = 0;
			// 카테고리별 기준 추가
			for(WorkVO work : workList) {
				if(work.getCtgryCode().equals(cartegoryStr)) {
					if(work.getWorkSttusCode().equals("W00101")) {
						newWK++;
					}else if(work.getWorkSttusCode().equals("W00102")) {
						proceed++;
					}else if(work.getWorkSttusCode().equals("W00103")) {
						complate++;
					}
					cateCnt++;
				}
			}
			com.add(complate); pro.add(proceed); newWork.add(newWK);
			carCnt.add(cateCnt);
		}
		
		
	}


	@Override
	public List<WorkCategoryVO> prgsAvgList(int prtId) {
		List<WorkCategoryVO> workCategoryList = dao.categoryList(prtId);
		List<WorkVO> workList = dao.projectWorkList(prtId);
		
		for(WorkCategoryVO category : workCategoryList) {
			int total = 0;
			int size = 0;
			int avg = 0;
			for(WorkVO work : workList) {
				if(work.getCtgryCode().equals(category.getCtgryCode())){
					total += work.getWorkPrgsDgreePoint();
					size++;
				}
			}
			if(size != 0) {
				avg = total/size;
			}
			category.setPrgsAvg(avg);
		}
		
		return workCategoryList;
	}


	@Override
	@Transactional
	public ServiceResult createCategory(WorkCategoryVO categoryVO) {
		
		int rowCnt = dao.addCategory(categoryVO);
		
		ServiceResult result = null;
		
		if(rowCnt > 0) {
			result = ServiceResult.CREATEOK;
		}else {
			result = ServiceResult.FAIL;
		}
		
		return result;
	}


	@Override
	@Transactional
	public ServiceResult modifyCategory(WorkCategoryVO categoryVO) {
		
		int rowCnt = dao.updateCategory(categoryVO);
		
		ServiceResult result = null;
		
		if(rowCnt > 0) {
			result = ServiceResult.MODIFYOK;
		}else {
			result = ServiceResult.FAIL;
		}
		
		return result;
	}


	@Override
	@Transactional
	public ServiceResult modifyMemRole(ProjectMemVO prtMem) {
		
		int rowCnt = dao.updateMemRole(prtMem);
		String prtNm = dao.prtNm(prtMem.getPrjctNo());
		prtMem.setPrjctNm(prtNm);
		
		ServiceResult result = null;
		
		if(rowCnt > 0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAIL;
		}
		
		return result;
	}


	@Override
	public void prtMemActivityAvg(List<String> memList, List<Integer> activityAvg, int prtId) {
		
		List<ProjectMemVO> prtMemList = dao.projectMemList(prtId);
		List<TimeLineVO> timeLineList = dao.timeLineList(prtId);
		
		int size = timeLineList.size();
		
		for(ProjectMemVO prtMem : prtMemList) {
			memList.add("'" + prtMem.getMemName() + "'");
			double total = 0;
			int avg = 0;
			for(TimeLineVO timeline : timeLineList) {
				if(timeline.getMemId().equals(prtMem.getMemId())) {
					total++;
				}
			}
			avg = (int)((total/size) * 100);
			activityAvg.add(avg);
		}
		
		
	}

}
