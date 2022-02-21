package kr.or.ddit.makeProject.service;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationEventPublisher;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.accept.vo.AcceptMemPagingVO;
import kr.or.ddit.accept.vo.AcceptMemberVO;
import kr.or.ddit.accept.vo.ProjectMemVO;
import kr.or.ddit.enumtype.ServiceResult;
import kr.or.ddit.listener.CustomEventListener;
import kr.or.ddit.listener.customevent.PushMsgCustomEvent;
import kr.or.ddit.makeProject.dao.MakeProjectDAO;
import kr.or.ddit.makeProject.vo.MakeProjectPagingVO;
import kr.or.ddit.makeProject.vo.MakeProjectSearchVO;
import kr.or.ddit.makeProject.vo.MakeProjectVO;
import kr.or.ddit.project.vo.ProjectVO;
import kr.or.ddit.pushMsg.vo.PushMsgVO;
import kr.or.ddit.wiki.vo.BoardVO;
import kr.or.ddit.work.vo.WorkVO;

@Service
public class MakeProjectServiceImpl implements MakeProjectService {

	@Inject
	private MakeProjectDAO dao;
	
	
	@Override
	public void retrieveProjectList(MakeProjectPagingVO<MakeProjectVO> paging) {
		
		int totalRecord = 0;
		List<MakeProjectVO> projectList = null;
		
		MakeProjectSearchVO search = paging.getSimpleSearch();
		System.out.println("check" + search.getSearchWord());
			
			if("name".equals(search.getSearchType()) && !search.getSearchWord().isEmpty()) {
				totalRecord = dao.totalRecordFindMem(paging);
				projectList = dao.selectProjectListFindMem(paging);
			}else {
				totalRecord = dao.totalRecord(paging);
				projectList = dao.selectProjectList(paging);
			}
			paging.setTotalRecord(totalRecord);
			paging.setDataList(projectList);
		
		
	}

	@Override
	public List<Integer> projectMenuCnt(int prtId) {
		List<String> menuCode = new ArrayList<String>();
		menuCode.add("NE");
		menuCode.add("FR");
		menuCode.add("WK");
		
		List<Integer> cntList = new ArrayList<>();
		List<WorkVO> workList = dao.selectWorkList(prtId);
		List<BoardVO> boardList = dao.selectBaordList(prtId);
		int issueCnt = dao.selectIssueCnt(prtId);
		
		cntList.add(workList.size());

		for(String code : menuCode) {
			int cnt = 0;
			
			for(BoardVO board : boardList) {
				if(board.getMenuClCode().equals(code)){
					cnt++;
				}
			}
			cntList.add(cnt);
		}
		cntList.add(issueCnt);
		System.out.println("cntList : " + cntList);
		return cntList;
	}

	@Override
	public List<ProjectVO> projectList() {
		return dao.selectProjectListForm();
	}

	@Override
	public void memList(AcceptMemPagingVO<AcceptMemberVO> paging) {
		
		int totalRecord = dao.totlaMemRecord(paging);
		List<AcceptMemberVO> memList = dao.selectMemList(paging);
		
		paging.setTotalRecord(totalRecord);
		paging.setDataList(memList);
	
	}

	@Override
	@Transactional
	public ServiceResult createProject(MakeProjectVO prtVO, boolean check) {
		
		int rowCnt = dao.insertProject(prtVO);
		
		int ptrId = prtVO.getPrjctNo();
		List<ProjectMemVO> prtMem = new ArrayList<>();
		
		if(check && prtVO.getUpperPrjctNo() != null ) {
			int upperPrtId = prtVO.getUpperPrjctNo();
			List<ProjectMemVO> extendMem = dao.selectPrtMem(upperPrtId);
			if(extendMem != null && extendMem.size() > 0) {
				for(ProjectMemVO mem : extendMem) {
					mem.setPrjctNo(ptrId);
					prtMem.add(mem);
				}	
			}
		}

		String pmId = prtVO.getMemId();
		
		if(pmId != null && StringUtils.isNoneBlank(pmId)) {
			ProjectMemVO pm = new ProjectMemVO();
			pm.setMemId(prtVO.getMemId());
			pm.setAuthor("ROLE_PM");
			pm.setPrjctNo(ptrId);
			
			prtMem.add(pm);
		}
		
		if(prtMem != null && prtMem.size() > 0) {
			rowCnt = dao.insertProjectMem(prtMem);
			prtVO.setExtentMemList(prtMem);
			
		}
		
		ServiceResult result = null;
		
		if(rowCnt > 0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAIL;
		}
		
		return result;
	}

	@Override
	public List<MakeProjectVO> childProjectList(int prtId) {
		
		return dao.childProjectList(prtId);
	}

	@Override
	@Transactional
	public ServiceResult removeProject(int prtId) {
		
		ServiceResult result = null;
		
		List<Integer> deletePrtList = new ArrayList<>();
		List<MakeProjectVO> childPrtList = dao.childProjectList(prtId);
		
		for(MakeProjectVO prt : childPrtList) {
			int childPrtId = prt.getPrjctNo();
			deletePrtList.add(childPrtId);
		}
		
		deletePrtList.add(prtId);
		
		int rowCnt = dao.deleteProject(deletePrtList);
		if(rowCnt >0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAIL;
		}
		
		return result;
	}


}
