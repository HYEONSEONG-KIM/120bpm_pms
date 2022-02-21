package kr.or.ddit.issue.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.enumtype.ServiceResult;
import kr.or.ddit.issue.dao.IssueRepDAO;
import kr.or.ddit.issue.vo.IssueRepVO;
import kr.or.ddit.work.vo.ExtendPagingVO;
import kr.or.ddit.work.vo.WorkRepVO;
@Service
public class IssueRepServiceImpl implements IssueRepService {
	
	@Inject
	IssueRepDAO dao;
	
	
	@Override
	public void retrieveIssueRepList(ExtendPagingVO<IssueRepVO> pagingVO) {
		 int total = dao.selectIssueRepTotalCount(pagingVO);
		 pagingVO.setTotalRecord(total);
		 pagingVO.setDataList(dao.selectIssueRepList(pagingVO));
	}

 
	
	@Override
	public ServiceResult addIssueRep(IssueRepVO issueRepVO) {
		ServiceResult result = ServiceResult.FAIL;
		int rowcnt = dao.insertIssueRep(issueRepVO);
		if(rowcnt>0)  result = ServiceResult.OK;
		return result;
	}

	@Override
	public String modifyIssueRep(IssueRepVO issueRepVO) {
		 String result = "FAIL";
		 IssueRepVO saved = dao.selectIssueDetail(issueRepVO);
		 if(saved.getMemId().equals(issueRepVO.getMemId())) {
			 int cnt =  dao.updateIssueRep(issueRepVO);
			 if(cnt>0) result = "OK";
		 }else {
			 result = "NOTWRITER";
			}
					return result;
	}

	@Override
	public String removeIssueRep(IssueRepVO issueRepVO) {
		String result = "FAIL";
		 IssueRepVO saved = dao.selectIssueDetail(issueRepVO);
		 if(saved.getMemId().equals(issueRepVO.getMemId())) {
				int cnt = dao.deleteIssueRep(issueRepVO);
				if(cnt>0)  result = "OK";
		}else {
			result = "NOTWRITER";
		}
				return result;
		
	}



}
