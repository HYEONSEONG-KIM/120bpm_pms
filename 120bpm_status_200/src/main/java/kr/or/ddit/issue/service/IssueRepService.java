package kr.or.ddit.issue.service;

import java.util.List;

import kr.or.ddit.enumtype.ServiceResult;
import kr.or.ddit.issue.vo.IssueRepVO;
import kr.or.ddit.work.vo.ExtendPagingVO;

 

public interface IssueRepService {

	public void retrieveIssueRepList(ExtendPagingVO<IssueRepVO>pagingVO);
	public ServiceResult addIssueRep(IssueRepVO issueRepVO);
	public String modifyIssueRep(IssueRepVO issueRepVO);
	public String removeIssueRep(IssueRepVO issueRepVO);
}
