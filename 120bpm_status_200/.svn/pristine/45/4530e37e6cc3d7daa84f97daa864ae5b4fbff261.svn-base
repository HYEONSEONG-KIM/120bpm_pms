package kr.or.ddit.issue.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.issue.vo.IssueVO;
import kr.or.ddit.work.vo.ExtendPagingVO;

public interface IssueService { 

	public void retrieveIssueList(ExtendPagingVO<IssueVO> pagingVO);
	public void retrieveMyIssueList(ExtendPagingVO<IssueVO> pagingVO);
	/*public int retrieveIssueCount(ExtendPagingVO<IssueVO> pagingVO);*/
	public IssueVO retrieveWorkDetail(IssueVO issueVO);
	public String  deleteAllIssue( IssueVO issueVO);
	public String addIssue(IssueVO issueVO);
	public String updateIssue(IssueVO issueVO);
	public Map<String ,Object> retriveIssuePercent(String pCode);
	
	
	public String updateSoluteIssue(IssueVO issueVO);
	
	public IssueVO retrieveWorkForUpdate(IssueVO issueVO);
	public String deleteIssue(IssueVO issueVO);
}
