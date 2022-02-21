package kr.or.ddit.issue.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.issue.vo.IssueRepVO;
import kr.or.ddit.work.vo.ExtendPagingVO;
@Mapper
public interface IssueRepDAO {

	public List<IssueRepVO> selectIssueRepList(ExtendPagingVO<IssueRepVO> issueRepVO);
	public int selectIssueRepTotalCount(ExtendPagingVO<IssueRepVO>  issueRepVO);
	public int insertIssueRep(IssueRepVO issueRepVO);
	public int updateIssueRep(IssueRepVO issueRepVO);
	public int deleteIssueRep(IssueRepVO issueRepVO);
	public IssueRepVO selectIssueDetail(IssueRepVO issueRepVO );
	

}
