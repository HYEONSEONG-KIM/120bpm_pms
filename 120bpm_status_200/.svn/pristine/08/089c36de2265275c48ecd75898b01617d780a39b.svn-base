package kr.or.ddit.issue.dao;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.file.vo.AtchFIleVO;
import kr.or.ddit.issue.vo.IssueFileVO;
import kr.or.ddit.issue.vo.IssueVO;
@Mapper
public interface IssueFileDAO {

	public int updateIssueFile(IssueVO issueVO);
	
	public int insertIssueFiles(IssueVO issueVO);
	//해당하는 파일 attatch에서 삭제
	public int deleteAttatchAll(IssueVO issueVO);
	//선택 파일 삭제
	
	public int deleteAllIssueFile(IssueVO issueVO);
	
	public int deleteIssueFile(IssueVO issueVO);
	
	public int deleteAttatches(IssueVO issueVO);
	public IssueFileVO selectWorkFileInfo(String delFileNo);
}
