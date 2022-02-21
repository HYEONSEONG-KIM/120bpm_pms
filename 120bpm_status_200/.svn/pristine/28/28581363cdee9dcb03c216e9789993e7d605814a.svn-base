package kr.or.ddit.work.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.enumtype.ServiceResult;
import kr.or.ddit.work.dao.WorkRepDAO;
import kr.or.ddit.work.vo.ExtendPagingVO;
import kr.or.ddit.work.vo.WorkRepVO;
@Service
public class WorkRepServiceImpl implements WorkRepService {
	@Inject
	private WorkRepDAO repDao;
	
	
	@Override
	public List<WorkRepVO> retrieveWorkRepList(ExtendPagingVO<WorkRepVO> pagingVO) {
		int totalRecord = repDao.selectWorkRepTotal(pagingVO);
		pagingVO.setTotalRecord(totalRecord);
		List<WorkRepVO> repList = repDao.selectWorkRepList(pagingVO);
		pagingVO.setDataList(repList);
		
		return repList;
	}

	 

	@Override
	public ServiceResult createWorkRep(WorkRepVO workRepVO) {
		ServiceResult result = ServiceResult.FAIL;
		int rowcnt = repDao.insertWorkRep(workRepVO);
		if(rowcnt>0)  result = ServiceResult.OK;
		return result;
	}

	//public 
	
	@Override
	public String modifyWorkRep(WorkRepVO workRepVO) {
		String result = "FAIL";
		WorkRepVO saved = 	repDao.selectWorkRepInfo(workRepVO);
		if(saved.getMemId().equals(workRepVO.getMemId())) {
				int cnt = repDao.modifyWorkRep(workRepVO);
				if(cnt>0)  result = "OK";
		}else {
			result = "NOTWRITER";
		}
				return result;
	}

	@Override
	public String removeWorkRep(WorkRepVO workRepVO) {
		String result = "FAIL";
		WorkRepVO saved = 	repDao.selectWorkRepInfo(workRepVO);
		if(saved.getMemId().equals(workRepVO.getMemId())) {
				int cnt = repDao.deleteWorkRep(workRepVO);
				if(cnt>0)  result = "OK";
		}else {
			result = "NOTWRITER";
		}
				return result;
		
	}

}
