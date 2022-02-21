package kr.or.ddit.issue.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.issue.vo.IssueVO;
import kr.or.ddit.work.vo.ExtendPagingVO;
import kr.or.ddit.work.vo.WorkVO;

@Mapper
public interface IssueDAO {
	
	public List<IssueVO> selectMyIssueList(ExtendPagingVO<IssueVO> pagingVO);
	public int selectMyIssueListCount(ExtendPagingVO<IssueVO> pagingVO); 
	
	
	public List<IssueVO> selectIssueList(ExtendPagingVO<IssueVO> pagingVO);
	public int selectIssueListCount(ExtendPagingVO<IssueVO> pagingVO);
	public int selectIssueTotalCount(String pCode);
	public List<IssueVO> selectIssuePercent(String pCode);
	public IssueVO selectIssueDetails(IssueVO issueVO);
	public IssueVO selectIssueForUpdate(IssueVO issueVO);
	
	public List<WorkVO> selectWorkListSearch(IssueVO issueVO);
	public int insertIssue(IssueVO issueVO);
	public int updatetIssue(IssueVO issueVO);
	public int deleteIssue(String issueNo);
	
	
	public int updateSolute(String issueNo);
	
	public WorkVO selectWorkDetailInfo(IssueVO issueVO);
	
}
